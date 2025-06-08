package practica.practias.model.Enum;

public enum EstadoEjercicio {
 DISPONIBLE("Disponible para resolver"),
    COMPLETADO("Ya completado, puede repetirse"),
    BLOQUEADO("Requiere suscripción Premium");
    
    private final String descripcion;
    
    EstadoEjercicio(String descripcion) {
        this.descripcion = descripcion;
    }
    
    public String getDescripcion() {
        return descripcion;
    }
}
