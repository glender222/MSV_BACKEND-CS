package pe.edu.upeu.msvcgestion_usuario.service;

import org.keycloak.representations.idm.UserRepresentation;

import pe.edu.upeu.msvcgestion_usuario.entity.dto.UsuarioRegistroDTO;

public interface KeycloakService {
  // Operaciones específicas de Keycloak
    String createUserInKeycloak(UsuarioRegistroDTO dto);
    
    void updateUserInKeycloak(String keycloakId, UsuarioRegistroDTO dto);
    
    void deleteUserFromKeycloak(String keycloakId);
    
    void assignRoleToUser(String keycloakId, String roleName);
    
    void removeRoleFromUser(String keycloakId, String roleName);
    
    boolean existsUserInKeycloak(String username, String email);
    
    void updateUserPassword(String keycloakId, String newPassword);
    
    void enableDisableUser(String keycloakId, boolean enabled);

// nuevo  para jalar datos del keycloak , analizar me ovlide despues y me dan lapito :()
       UserRepresentation getUserFromKeycloak(String keycloakId);


       // nuevo jwt
void agregarDatabaseIdComoAtributo(String keycloakId, Long databaseId);
  }
