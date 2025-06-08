package practica.practias.service;

import practica.practias.model.Usuario;

public interface UsuarioService {
    
    /**
     * Valida si un usuario existe y está activo
     * @param usuarioId Identificador del usuario
     * @return true si el usuario existe y está activo
     */
    boolean validarUsuario(String usuarioId);
    
    /**
     * Obtiene información detallada de un usuario
     * @param usuarioId Identificador del usuario
     * @return Objeto con los detalles del usuario
     */
    Usuario getUsuarioDetails(String usuarioId);
}


