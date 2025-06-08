package practica.practias.utils;



import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.net.URL;
import java.net.URLClassLoader;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.tools.Diagnostic;
import javax.tools.DiagnosticCollector;
import javax.tools.JavaCompiler;
import javax.tools.JavaFileObject;
import javax.tools.StandardJavaFileManager;
import javax.tools.ToolProvider;

import org.junit.platform.launcher.Launcher;
import org.junit.platform.launcher.LauncherDiscoveryRequest;
import org.junit.platform.launcher.core.LauncherDiscoveryRequestBuilder;
import org.junit.platform.launcher.core.LauncherFactory;
import org.junit.platform.launcher.listeners.SummaryGeneratingListener;
import org.junit.platform.launcher.listeners.TestExecutionSummary;
import static org.junit.platform.engine.discovery.DiscoverySelectors.selectClass;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;


@Component
public class CodeEvaluator {
      private static final Logger logger = LoggerFactory.getLogger(CodeEvaluator.class);
    
    @Value("${app.evaluation.temp-dir:./temp}")
    private String tempDirPath;
    
    // Timeout para la ejecución de pruebas en milisegundos (default: 5 segundos)
    @Value("${app.evaluation.timeout:5000}")
    private long executionTimeout;
    
    /**
     * Evalúa el código de una solución contra las pruebas proporcionadas.
     * 
     * @param codigo El código de la solución
     * @param pruebas Las pruebas a ejecutar
     * @param errores Lista donde se agregarán los errores encontrados
     * @return true si todas las pruebas pasan, false en caso contrario
     */
    public boolean evaluate(String codigo, String pruebas, List<String> errores) {
        logger.info("Iniciando evaluación de código");
        
        if (codigo == null || codigo.trim().isEmpty()) {
            errores.add("El código está vacío");
            return false;
        }
        
        // Crear directorio temporal único para esta evaluación
        String sessionId = UUID.randomUUID().toString();
        File tempDir = new File(tempDirPath, sessionId);
        if (!tempDir.exists() && !tempDir.mkdirs()) {
            errores.add("No se pudo crear el directorio temporal para la evaluación");
            return false;
        }
        
        try {
            // Extraer nombre de la clase principal del código
            String mainClassName = extractMainClassName(codigo);
            if (mainClassName == null) {
                errores.add("No se pudo identificar la clase principal en el código");
                return false;
            }
            
            // Extraer nombre de la clase de prueba
            String testClassName = extractTestClassName(pruebas);
            if (testClassName == null) {
                errores.add("No se pudo identificar la clase de prueba");
                return false;
            }
            
            // Crear archivos fuente
            File sourceFile = new File(tempDir, mainClassName + ".java");
            File testSourceFile = new File(tempDir, testClassName + ".java");
            
            try (FileWriter writer = new FileWriter(sourceFile)) {
                writer.write(codigo);
            }
            
            try (FileWriter writer = new FileWriter(testSourceFile)) {
                writer.write(pruebas);
            }
            
            // Compilar archivos
            boolean compiled = compileFiles(Arrays.asList(sourceFile, testSourceFile), errores);
            if (!compiled) {
                return false;
            }
            
            // Ejecutar pruebas
            return runTests(tempDir, testClassName, errores);
            
        } catch (Exception e) {
            logger.error("Error al evaluar el código", e);
            StringWriter sw = new StringWriter();
            e.printStackTrace(new PrintWriter(sw));
            errores.add("Error interno durante la evaluación: " + e.getMessage());
            errores.add("Stack trace: " + sw.toString());
            return false;
        } finally {
            // Limpiar archivos temporales
            try {
                deleteDirectory(tempDir);
            } catch (IOException e) {
                logger.warn("No se pudo eliminar el directorio temporal: {}", tempDir, e);
            }
        }
    }
    
    /**
     * Extrae el nombre de la clase principal del código.
     */
    private String extractMainClassName(String code) {
        Pattern pattern = Pattern.compile("\\s*(?:public\\s+)?class\\s+(\\w+)");
        Matcher matcher = pattern.matcher(code);
        if (matcher.find()) {
            return matcher.group(1);
        }
        return null;
    }
    
    /**
     * Extrae el nombre de la clase de prueba.
     */
    private String extractTestClassName(String testCode) {
        Pattern pattern = Pattern.compile("\\s*(?:public\\s+)?class\\s+(\\w+)");
        Matcher matcher = pattern.matcher(testCode);
        if (matcher.find()) {
            return matcher.group(1);
        }
        return null;
    }
    
    /**
     * Compila los archivos fuente.
     */
    private boolean compileFiles(List<File> files, List<String> errores) {
        JavaCompiler compiler = ToolProvider.getSystemJavaCompiler();
        if (compiler == null) {
            errores.add("No se encontró el compilador de Java. Asegúrate de usar un JDK, no un JRE.");
            return false;
        }
        
        DiagnosticCollector<JavaFileObject> diagnostics = new DiagnosticCollector<>();
        StandardJavaFileManager fileManager = compiler.getStandardFileManager(diagnostics, null, StandardCharsets.UTF_8);
        
        Iterable<? extends JavaFileObject> compilationUnits = 
                fileManager.getJavaFileObjectsFromFiles(files);
        
        List<String> options = new ArrayList<>();
        // Añadir classpath actual
        String classpath = System.getProperty("java.class.path");
        options.addAll(Arrays.asList("-classpath", classpath));
        
        JavaCompiler.CompilationTask task = compiler.getTask(
                null, fileManager, diagnostics, options, null, compilationUnits);
        
        boolean success = task.call();
        
        if (!success) {
            for (Diagnostic<? extends JavaFileObject> diagnostic : diagnostics.getDiagnostics()) {
                errores.add(String.format("Error en línea %d, columna %d: %s", 
                        diagnostic.getLineNumber(), 
                        diagnostic.getColumnNumber(), 
                        diagnostic.getMessage(Locale.getDefault())));
            }
        }
        
        try {
            fileManager.close();
        } catch (IOException e) {
            logger.warn("No se pudo cerrar el file manager", e);
        }
        
        return success;
    }
    
    /**
     * Ejecuta las pruebas JUnit 5.
     */
    private boolean runTests(File tempDir, String testClassName, List<String> errores) {
        try {
            // Cargar la clase de prueba
            URL[] urls = new URL[] { tempDir.toURI().toURL() };
            
            try (URLClassLoader classLoader = new URLClassLoader(urls, Thread.currentThread().getContextClassLoader())) {
                Class<?> testClass = classLoader.loadClass(testClassName);
                
                SummaryGeneratingListener listener = new SummaryGeneratingListener();
                
                LauncherDiscoveryRequest request = LauncherDiscoveryRequestBuilder.request()
                    .selectors(selectClass(testClass))
                    .build();
                
                Launcher launcher = LauncherFactory.create();
                launcher.registerTestExecutionListeners(listener);
                
                // Configurar timeout
                final Thread testThread = Thread.currentThread();
                Thread watchdog = new Thread(() -> {
                    try {
                        Thread.sleep(executionTimeout);
                        testThread.interrupt();
                    } catch (InterruptedException e) {
                        // Ignorar
                    }
                });
                watchdog.setDaemon(true);
                watchdog.start();
                
                try {
                    launcher.execute(request);
                    
                    // Test terminó normalmente
                    watchdog.interrupt();
                    
                    // Verificar si fuimos interrumpidos durante la ejecución
                    if (Thread.interrupted()) {
                        errores.add("La ejecución de las pruebas excedió el tiempo máximo permitido (" 
                                + (executionTimeout / 1000) + " segundos)");
                        return false;
                    }
                    
                    TestExecutionSummary summary = listener.getSummary();
                    
                    if (summary.getTestsFailedCount() == 0) {
                        logger.info("Todas las pruebas pasaron correctamente ({} pruebas)", 
                                summary.getTestsSucceededCount());
                        return true;
                    } else {
                        logger.info("Algunas pruebas fallaron: {}/{} pruebas exitosas", 
                                summary.getTestsSucceededCount(), 
                                summary.getTestsFoundCount());
                        
                        summary.getFailures().forEach(failure -> {
                            errores.add(String.format("Test fallido: %s - %s", 
                                    failure.getTestIdentifier().getDisplayName(), 
                                    failure.getException().getMessage()));
                            
                            StringWriter sw = new StringWriter();
                            failure.getException().printStackTrace(new PrintWriter(sw));
                            errores.add("Stack trace: " + sw.toString());
                        });
                        
                        return false;
                    }
                } catch (ThreadDeath e) {
                    errores.add("La ejecución de las pruebas fue terminada forzosamente después de " 
                            + (executionTimeout / 1000) + " segundos");
                    return false;
                } catch (Exception e) {
                    StringWriter sw = new StringWriter();
                    e.printStackTrace(new PrintWriter(sw));
                    errores.add("Error al ejecutar las pruebas: " + e.getMessage());
                    errores.add("Stack trace: " + sw.toString());
                    return false;
                }
            }
        } catch (Exception e) {
            logger.error("Error al cargar la clase de prueba", e);
            errores.add("Error al cargar la clase de prueba: " + e.getMessage());
            return false;
        }
    }
    
    /**
     * Elimina un directorio y todo su contenido.
     */
    private void deleteDirectory(File directory) throws IOException {
        if (!directory.exists()) {
            return;
        }
        
        Files.walk(directory.toPath())
            .sorted((p1, p2) -> -p1.compareTo(p2)) 
            .map(Path::toFile)
            .forEach(File::delete);
    }
}
