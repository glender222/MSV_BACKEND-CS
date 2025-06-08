package practica.practias.utils;

import java.time.LocalDateTime;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import practica.practias.model.Exercises;
import practica.practias.repository.RepositoryExercises;

@Component
public class DataInitializer implements CommandLineRunner{
    

private static final Logger logger = LoggerFactory.getLogger(DataInitializer.class);
    private final RepositoryExercises repositoryExercises;
    
    
    public DataInitializer(RepositoryExercises repositoryExercises) {
        this.repositoryExercises = repositoryExercises;
    }
    
    @Override
    public void run(String... args) throws Exception {
        // Solo carga datos si la BD está vacía
        if (repositoryExercises.count() == 0) {
            logger.info("Cargando datos de ejercicios iniciales...");
            
            loadAccumulateExercise();
            loadAcronymExercise();
            loadAffineCipherExercise();
            loadAllergiesExercise();
            loadAlphameticsExercise();
            loadBaseConverterExercise();
            
            logger.info("Ejercicios cargados correctamente: {}", repositoryExercises.count());
        }
    }
    
   
    private void loadAccumulateExercise() {
        Exercises exercise = new Exercises();
        exercise.setNombre("Accumulate");
        exercise.setDescripcion("Implementa una función genérica que aplique una operación a cada elemento de una lista y devuelva una nueva lista con los resultados.\n\n"
                + "La firma de la función debe ser:\n"
                + "```java\n"
                + "public static <T, U> List<U> accumulate(List<T> list, Function<T, U> operation)\n"
                + "```\n\n"
                + "Por ejemplo, si se llama a `accumulate([1, 2, 3], x -> x * x)` debería devolver `[1, 4, 9]`.");
        exercise.setTiempoCreacion(LocalDateTime.now());
        
        // Plantilla con la estructura básica que el usuario debe completar
        exercise.setPlantilla(
                "import java.util.List;\n" +
                "import java.util.ArrayList;\n" +
                "import java.util.function.Function;\n\n" +
                "class Accumulate {\n\n" +
                "    public static <T, U> List<U> accumulate(List<T> list, Function<T, U> operation) {\n" +
                "        // Tu implementación aquí\n" +
                "        return null;\n" +
                "    }\n" +
                "}\n");
        
        // Pruebas unitarias para verificar la implementación
        exercise.setPruebas(
                "import org.junit.Test;\n" +
                "import static org.junit.Assert.*;\n" +
                "import java.util.Arrays;\n" +
                "import java.util.Collections;\n" +
                "import java.util.List;\n" +
                "import java.util.function.Function;\n\n" +
                "public class AccumulateTest {\n\n" +
                "    @Test\n" +
                "    public void emptyAccumulation() {\n" +
                "        List<Integer> input = Collections.emptyList();\n" +
                "        List<Integer> expected = Collections.emptyList();\n" +
                "        assertEquals(expected, Accumulate.accumulate(input, x -> x * x));\n" +
                "    }\n\n" +
                "    @Test\n" +
                "    public void accumulateSquares() {\n" +
                "        List<Integer> input = Arrays.asList(1, 2, 3, 4);\n" +
                "        List<Integer> expected = Arrays.asList(1, 4, 9, 16);\n" +
                "        assertEquals(expected, Accumulate.accumulate(input, x -> x * x));\n" +
                "    }\n\n" +
                "    @Test\n" +
                "    public void accumulateUpperCase() {\n" +
                "        List<String> input = Arrays.asList(\"hello\", \"world\");\n" +
                "        List<String> expected = Arrays.asList(\"HELLO\", \"WORLD\");\n" +
                "        assertEquals(expected, Accumulate.accumulate(input, String::toUpperCase));\n" +
                "    }\n\n" +
                "    @Test\n" +
                "    public void accumulateReversedStrings() {\n" +
                "        List<String> input = Arrays.asList(\"the\", \"quick\", \"brown\", \"fox\", \"etc\");\n" +
                "        List<String> expected = Arrays.asList(\"eht\", \"kciuq\", \"nworb\", \"xof\", \"cte\");\n" +
                "        assertEquals(expected, Accumulate.accumulate(input, s -> new StringBuilder(s).reverse().toString()));\n" +
                "    }\n" +
                "}\n");
        
        repositoryExercises.save(exercise);
    }
    
    private void loadAcronymExercise() {
        Exercises exercise = new Exercises();
        exercise.setNombre("Acronym");
        exercise.setDescripcion("Convierte una frase en su acrónimo.\n\n" +
                "Los acrónimos deben estar formados por la primera letra de cada palabra en mayúsculas.\n" +
                "Las palabras pueden estar separadas por espacios, guiones, comas o signos de puntuación.\n\n" +
                "Ejemplos:\n" +
                "- \"Portable Network Graphics\" -> \"PNG\"\n" +
                "- \"Ruby on Rails\" -> \"ROR\"\n" +
                "- \"First In, First Out\" -> \"FIFO\"\n" +
                "- \"GNU Image Manipulation Program\" -> \"GIMP\"\n" +
                "- \"Complementary metal-oxide semiconductor\" -> \"CMOS\"");
        exercise.setTiempoCreacion(LocalDateTime.now());
        
        // Plantilla con la estructura básica que el usuario debe completar
        exercise.setPlantilla(
                "class Acronym {\n\n" +
                "    private String acronym;\n\n" +
                "    Acronym(String phrase) {\n" +
                "        // Tu implementación aquí\n" +
                "    }\n\n" +
                "    String get() {\n" +
                "        return acronym;\n" +
                "    }\n" +
                "}\n");
        
        // Pruebas unitarias para verificar la implementación
        exercise.setPruebas("import org.junit.jupiter.api.Test;\n" +
                "import static org.assertj.core.api.Assertions.assertThat;\n\n" +
                "public class AcronymTest {\n\n" +
                "    @Test\n" +
                "    public void basic() {\n" +
                "        assertThat(new Acronym(\"Portable Network Graphics\").get())\n" +
                "                .isEqualTo(\"PNG\");\n" +
                "    }\n\n" +
                "    @Test\n" +
                "    public void lowercaseWords() {\n" +
                "        assertThat(new Acronym(\"Ruby on Rails\").get())\n" +
                "                .isEqualTo(\"ROR\");\n" +
                "    }\n\n" +
                "    @Test\n" +
                "    public void punctuation() {\n" +
                "        assertThat(new Acronym(\"First In, First Out\").get())\n" +
                "                .isEqualTo(\"FIFO\");\n" +
                "    }\n\n" +
                "    @Test\n" +
                "    public void nonAcronymAllCapsWord() {\n" +
                "        assertThat(new Acronym(\"GNU Image Manipulation Program\").get())\n" +
                "                .isEqualTo(\"GIMP\");\n" +
                "    }\n\n" +
                "    @Test\n" +
                "    public void punctuationWithoutWhitespace() {\n" +
                "        assertThat(new Acronym(\"Complementary metal-oxide semiconductor\").get())\n" +
                "                .isEqualTo(\"CMOS\");\n" +
                "    }\n" +
                "}\n");
        
        repositoryExercises.save(exercise);
    }
    
    private void loadAffineCipherExercise() {
        Exercises exercise = new Exercises();
        exercise.setNombre("AffineCipher");
        exercise.setDescripcion("Implementa un cifrado afín para codificar y decodificar mensajes.\n\n" +
                "El cifrado afín es un tipo de cifrado de sustitución monoalfabético donde cada letra del alfabeto se mapea a su equivalente numérico, se le aplica una función matemática, y luego se convierte de nuevo a una letra.\n\n" +
                "La función de cifrado es: `E(x) = (ax + b) mod m`\n" +
                "- Donde `a` y `b` son las claves del cifrado\n" +
                "- `m` es el tamaño del alfabeto (26 para inglés)\n" +
                "- `x` es el valor numérico de la letra (a=0, b=1, etc.)\n\n" +
                "La función de descifrado es: `D(y) = a^-1(y - b) mod m`\n" +
                "- Donde `a^-1` es el inverso multiplicativo de `a` en el módulo `m`\n\n" +
                "Requisitos:\n" +
                "1. El texto cifrado debe agruparse en bloques de 5 letras\n" +
                "2. Solo letras y números deben ser codificados\n" +
                "3. `a` y `m` deben ser coprimos (su MCD debe ser 1)");
        exercise.setTiempoCreacion(LocalDateTime.now());
        
        // Plantilla con la estructura básica que el usuario debe completar
        exercise.setPlantilla(
                "public class AffineCipher {\n\n" +
                "    public String encode(String text, int coefficient1, int coefficient2) {\n" +
                "        // Tu implementación aquí\n" +
                "        return null;\n" +
                "    }\n\n" +
                "    public String decode(String text, int coefficient1, int coefficient2) {\n" +
                "        // Tu implementación aquí\n" +
                "        return null;\n" +
                "    }\n" +
                "}\n");
        
        // Pruebas unitarias para verificar la implementación
        exercise.setPruebas("import org.junit.jupiter.api.Test;\n" +
                "import static org.assertj.core.api.Assertions.assertThat;\n" +
                "import static org.assertj.core.api.Assertions.assertThatExceptionOfType;\n\n" +
                "public class AffineCipherTest {\n\n" +
                "    private AffineCipher affineCipher = new AffineCipher();\n\n" +
                "    @Test\n" +
                "    public void testEncodeYes() {\n" +
                "        assertThat(affineCipher.encode(\"yes\", 5, 7)).isEqualTo(\"xbt\");\n" +
                "    }\n\n" +
                "    @Test\n" +
                "    public void testEncodeNo() {\n" +
                "        assertThat(affineCipher.encode(\"no\", 15, 18)).isEqualTo(\"fu\");\n" +
                "    }\n\n" +
                "    @Test\n" +
                "    public void testEncodeMindBlowingly() {\n" +
                "        assertThat(affineCipher.encode(\"mindblowingly\", 11, 15)).isEqualTo(\"rzcwa gnxzc dgt\");\n" +
                "    }\n\n" +
                "    @Test\n" +
                "    public void testEncodeThrowsMeaningfulException() {\n" +
                "        assertThatExceptionOfType(IllegalArgumentException.class)\n" +
                "            .isThrownBy(() -> affineCipher.encode(\"This is a test\", 6, 17))\n" +
                "            .withMessage(\"Error: keyA and alphabet size must be coprime.\");\n" +
                "    }\n\n" +
                "    @Test\n" +
                "    public void testDecodeExercism() {\n" +
                "        assertThat(affineCipher.decode(\"tytgn fjr\", 3, 7))\n" +
                "                .isEqualTo(\"exercism\");\n" +
                "    }\n" +
                "}\n");
        
        repositoryExercises.save(exercise);
    }
    
    private void loadAllergiesExercise() {
        Exercises exercise = new Exercises();
        exercise.setNombre("Allergies");
        exercise.setDescripcion("Dada una puntuación de alergia, determina si una persona es alérgica a un elemento en particular y a cuáles elementos es alérgica.\n\n" +
                "Las puntuaciones de alergia se asignan de la siguiente manera:\n\n" +
                "- 1: Huevos\n" +
                "- 2: Cacahuetes\n" +
                "- 4: Mariscos\n" +
                "- 8: Fresas\n" +
                "- 16: Tomates\n" +
                "- 32: Chocolate\n" +
                "- 64: Polen\n" +
                "- 128: Gatos\n\n" +
                "Si la puntuación de alergia de Tom es 34, está alérgico al chocolate y a los cacahuetes (32 + 2).\n\n" +
                "Debes implementar:\n" +
                "1. Determinar si una persona es alérgica a un alérgeno específico\n" +
                "2. Listar todos los alérgenos a los que una persona es alérgica");
        exercise.setTiempoCreacion(LocalDateTime.now());
        
        // Plantilla con la estructura básica que el usuario debe completar
        exercise.setPlantilla(
                "import java.util.List;\n\n" +
                "enum Allergen {\n" +
                "    EGGS(1),\n" +
                "    PEANUTS(2),\n" +
                "    SHELLFISH(4),\n" +
                "    STRAWBERRIES(8),\n" +
                "    TOMATOES(16),\n" +
                "    CHOCOLATE(32),\n" +
                "    POLLEN(64),\n" +
                "    CATS(128);\n\n" +
                "    private final int score;\n\n" +
                "    Allergen(int score) {\n" +
                "        this.score = score;\n" +
                "    }\n\n" +
                "    int getScore() {\n" +
                "        return score;\n" +
                "    }\n" +
                "}\n\n" +
                "class Allergies {\n" +
                "    private int score;\n" +
                "    \n" +
                "    Allergies(int score) {\n" +
                "        // Tu implementación aquí\n" +
                "    }\n\n" +
                "    boolean isAllergicTo(Allergen allergen) {\n" +
                "        // Tu implementación aquí\n" +
                "        return false;\n" +
                "    }\n\n" +
                "    List<Allergen> getList() {\n" +
                "        // Tu implementación aquí\n" +
                "        return null;\n" +
                "    }\n" +
                "}\n");
        
        // Pruebas unitarias para verificar la implementación
        exercise.setPruebas("import org.junit.jupiter.api.Test;\n" +
                "import static org.assertj.core.api.Assertions.assertThat;\n" +
                "\n" +
                "public class AllergiesTest {\n" +
                "    @Test\n" +
                "    public void eggsNotAllergicToAnything() {\n" +
                "        Allergies allergies = new Allergies(0);\n" +
                "\n" +
                "        assertThat(allergies.isAllergicTo(Allergen.EGGS)).isFalse();\n" +
                "    }\n" +
                "\n" +
                "    @Test\n" +
                "    public void eggsAllergicOnlyToEggs() {\n" +
                "        Allergies allergies = new Allergies(1);\n" +
                "\n" +
                "        assertThat(allergies.isAllergicTo(Allergen.EGGS)).isTrue();\n" +
                "    }\n" +
                "\n" +
                "    @Test\n" +
                "    public void listNoAllergies() {\n" +
                "        Allergies allergies = new Allergies(0);\n" +
                "\n" +
                "        assertThat(allergies.getList().size()).isEqualTo(0);\n" +
                "    }\n" +
                "\n" +
                "    @Test\n" +
                "    public void listJustEggs() {\n" +
                "        Allergies allergies = new Allergies(1);\n" +
                "\n" +
                "        assertThat(allergies.getList())\n" +
                "                .containsExactly(Allergen.EGGS);\n" +
                "    }\n" +
                "\n" +
                "    @Test\n" +
                "    public void listManyAllergies() {\n" +
                "        Allergies allergies = new Allergies(248);\n" +
                "\n" +
                "        assertThat(allergies.getList())\n" +
                "                .containsExactly(\n" +
                "                        Allergen.STRAWBERRIES,\n" +
                "                        Allergen.TOMATOES,\n" +
                "                        Allergen.CHOCOLATE,\n" +
                "                        Allergen.POLLEN,\n" +
                "                        Allergen.CATS);\n" +
                "    }\n" +
                "}\n");
        
        repositoryExercises.save(exercise);
    }
    
    private void loadAlphameticsExercise() {
        Exercises exercise = new Exercises();
        exercise.setNombre("Alphametics");
        exercise.setDescripcion("Resuelve un rompecabezas alfamético.\n\n" +
                "Un rompecabezas alfamético es un rompecabezas matemático donde las letras de las palabras representan dígitos, y una simple suma de palabras es igual a otra palabra.\n\n" +
                "Por ejemplo: `SEND + MORE = MONEY`\n\n" +
                "El objetivo es asignar dígitos a las letras de manera que la suma sea matemáticamente correcta.\n\n" +
                "Reglas:\n" +
                "- Cada letra representa un dígito distinto\n" +
                "- Ninguna letra puede representar más de un dígito\n" +
                "- Ningún dígito puede ser representado por más de una letra\n" +
                "- Ninguna letra inicial de una palabra multicifra puede ser cero\n\n" +
                "La solución para `SEND + MORE = MONEY` es:\n" +
                "```\n" +
                "  S=9, E=5, N=6, D=7, M=1, O=0, R=8, Y=2\n" +
                "```");
        exercise.setTiempoCreacion(LocalDateTime.now());
        
        // Plantilla con la estructura básica que el usuario debe completar
        exercise.setPlantilla(
                "import java.util.Map;\n\n" +
                "class Alphametics {\n" +
                "    private String puzzle;\n\n" +
                "    Alphametics(String puzzle) {\n" +
                "        this.puzzle = puzzle;\n" +
                "    }\n\n" +
                "    Map<Character, Integer> solve() throws UnsolvablePuzzleException {\n" +
                "        // Tu implementación aquí\n" +
                "        return null;\n" +
                "    }\n" +
                "}\n\n" +
                "class UnsolvablePuzzleException extends Exception {\n" +
                "}\n");
        
        // Pruebas unitarias para verificar la implementación
        exercise.setPruebas("import org.junit.jupiter.api.Test;\n" +
                "import static java.util.Map.entry;\n" +
                "import static org.assertj.core.api.Assertions.assertThat;\n" +
                "import static org.assertj.core.api.Assertions.assertThatExceptionOfType;\n\n" +
                "public class AlphameticsTest {\n\n" +
                "    @Test\n" +
                "    public void testThreeLetters() throws UnsolvablePuzzleException {\n" +
                "        assertThat(new Alphametics(\"I + BB == ILL\").solve())\n" +
                "                .containsOnly(\n" +
                "                        entry('I', 1),\n" +
                "                        entry('B', 9),\n" +
                "                        entry('L', 0));\n" +
                "    }\n\n" +
                "    @Test\n" +
                "    public void testUniqueValue() {\n" +
                "        Alphametics alphametics = new Alphametics(\"A == B\");\n" +
                "\n" +
                "        assertThatExceptionOfType(UnsolvablePuzzleException.class)\n" +
                "            .isThrownBy(alphametics::solve);\n" +
                "    }\n\n" +
                "    @Test\n" +
                "    public void testEightLetters() throws UnsolvablePuzzleException {\n" +
                "        assertThat(new Alphametics(\"SEND + MORE == MONEY\").solve())\n" +
                "                .containsOnly(\n" +
                "                        entry('S', 9),\n" +
                "                        entry('E', 5),\n" +
                "                        entry('N', 6),\n" +
                "                        entry('D', 7),\n" +
                "                        entry('M', 1),\n" +
                "                        entry('O', 0),\n" +
                "                        entry('R', 8),\n" +
                "                        entry('Y', 2));\n" +
                "    }\n" +
                "}\n");
        
        repositoryExercises.save(exercise);
    }
    
    private void loadBaseConverterExercise() {
        Exercises exercise = new Exercises();
        exercise.setNombre("BaseConverter");
        exercise.setDescripcion("Implementa un conversor de números entre diferentes bases.\n\n" +
                "Dada una entrada en una base y la base de destino, tu código debe poder convertir un número de una base a otra.\n\n" +
                "Ejemplo 1: Convertir 1 (en base 2) a base 10\n" +
                "  1 (en base 2) = 1 (en base 10)\n\n" +
                "Ejemplo 2: Convertir 101 (en base 2) a base 10\n" +
                "  101 (en base 2) = 5 (en base 10)\n\n" +
                "Ejemplo 3: Convertir 1120 (en base 3) a base 10\n" +
                "  1120 (en base 3) = 42 (en base 10)\n\n" +
                "Restricciones:\n" +
                "- El valor mínimo para una base es 2\n" +
                "- Los dígitos en una entrada no pueden ser negativos\n" +
                "- Todos los dígitos deben ser estrictamente menores que la base\n" +
                "- El número resultante debe estar en su forma normalizada (sin ceros iniciales)");
        exercise.setTiempoCreacion(LocalDateTime.now());
        
        // Plantilla con la estructura básica que el usuario debe completar
        exercise.setPlantilla(
                "class BaseConverter {\n" +
                "    private int originalBase;\n" +
                "    private int[] originalDigits;\n\n" +
                "    BaseConverter(int originalBase, int[] originalDigits) {\n" +
                "        // Tu implementación aquí\n" +
                "    }\n\n" +
                "    int[] convertToBase(int newBase) {\n" +
                "        // Tu implementación aquí\n" +
                "        return null;\n" +
                "    }\n" +
                "}\n");
        
        // Pruebas unitarias para verificar la implementación
        exercise.setPruebas("import org.junit.jupiter.api.Test;\n" +
                "import static org.assertj.core.api.Assertions.assertThat;\n" +
                "import static org.assertj.core.api.Assertions.assertThatExceptionOfType;\n\n" +
                "public class BaseConverterTest {\n\n" +
                "    @Test\n" +
                "    public void testSingleBitOneToDecimal() {\n" +
                "        BaseConverter baseConverter = new BaseConverter(2, new int[]{1});\n\n" +
                "        assertThat(baseConverter.convertToBase(10))\n" +
                "                .containsExactly(1);\n" +
                "    }\n\n" +
                "    @Test\n" +
                "    public void testBinaryToSingleDecimal() {\n" +
                "        BaseConverter baseConverter = new BaseConverter(2, new int[]{1, 0, 1});\n\n" +
                "        assertThat(baseConverter.convertToBase(10))\n" +
                "                .containsExactly(5);\n" +
                "    }\n\n" +
                "    @Test\n" +
                "    public void testFirstBaseIsOne() {\n" +
                "        assertThatExceptionOfType(IllegalArgumentException.class)\n" +
                "            .isThrownBy(() -> new BaseConverter(1, new int[]{1}))\n" +
                "            .withMessage(\"Bases must be at least 2.\");\n" +
                "    }\n\n" +
                "    @Test\n" +
                "    public void testNegativeDigit() {\n" +
                "        assertThatExceptionOfType(IllegalArgumentException.class)\n" +
                "            .isThrownBy(() -> new BaseConverter(2, new int[]{1, -1, 1, 0, 1, 0}))\n" +
                "            .withMessage(\"Digits may not be negative.\");\n" +
                "    }\n" +
                "}\n");
        
        repositoryExercises.save(exercise);
    }
}
