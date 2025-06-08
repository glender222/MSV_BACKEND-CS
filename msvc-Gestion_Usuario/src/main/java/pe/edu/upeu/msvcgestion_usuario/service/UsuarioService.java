package pe.edu.upeu.msvcgestion_usuario.service;

import org.keycloak.representations.idm.UserRepresentation;

import pe.edu.upeu.msvcgestion_usuario.entity.Usuario;
import pe.edu.upeu.msvcgestion_usuario.entity.dto.UsuarioCompletoDTO;
import pe.edu.upeu.msvcgestion_usuario.entity.dto.UsuarioRegistroDTO;
import pe.edu.upeu.msvcgestion_usuario.entity.dto.UsuarioResponseDTO;



public interface UsuarioService extends GenericService <Usuario, Long> {

   // Métodos específicos del usuario
    UsuarioResponseDTO registrarUsuario(UsuarioRegistroDTO dto);
    
    UsuarioCompletoDTO obtenerUsuarioCompleto(String keycloakId);
    
    UsuarioResponseDTO findByKeycloakId(String keycloakId);
    
    void actualizarUltimoLogin(String keycloakId);
    
    long countUsuariosActivos();


}
