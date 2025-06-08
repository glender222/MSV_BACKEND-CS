package practica.practias.model.Enum;

public enum EstadoSolucion {
  CORRECTO("Solución correcta"),
    FALLIDO("Solución incorrecta"),
    ERROR("Error en la evaluación"),
    EN_PROCESO("Evaluando solución"),
    PENDIENTE("Pendiente de evaluación");
    
    private final String descripcion;
    
    EstadoSolucion(String descripcion) {
        this.descripcion = descripcion;
    }
    
    public String getDescripcion() {
        return descripcion;
    }
}
