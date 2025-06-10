package pe.edu.upeu.msvcgestion_usuario.serviceImpl;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import pe.edu.upeu.msvcgestion_usuario.entity.dto.UsuarioRegistroDTO;
import pe.edu.upeu.msvcgestion_usuario.service.KeycloakService;

import org.keycloak.admin.client.Keycloak;
import org.keycloak.admin.client.resource.UsersResource;
import org.keycloak.representations.idm.UserRepresentation;
import org.keycloak.representations.idm.CredentialRepresentation;
import org.keycloak.representations.idm.RoleRepresentation;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import jakarta.ws.rs.core.Response;


import java.util.*;

@Slf4j
@Service
@RequiredArgsConstructor
public class KeycloakServiceImpl implements KeycloakService{


private final Keycloak keycloak;

    
    @Value("${keycloak.realm}")
    private String realm;
    
    @Override
    public String createUserInKeycloak(UsuarioRegistroDTO dto) {
        log.info("Creating user in Keycloak: {}", dto.getUsername());
        
        // 1. Verificar si existe
        if (existsUserInKeycloak(dto.getUsername(), dto.getEmail())) {
            throw new RuntimeException("Usuario ya existe en Keycloak");
        }
        
        // 2. Crear UserRepresentation
        UserRepresentation user = buildUserRepresentation(dto);
        
        // 3. Crear en Keycloak
        UsersResource users = keycloak.realm(realm).users();
        Response response = users.create(user);
        
        if (response.getStatus() != 201) {
            throw new RuntimeException("Error creating user: " + response.getStatusInfo());
        }
        
        // 4. Extraer ID
        String keycloakId = extractKeycloakId(response);
        
        // 5. Establecer password
        setUserPassword(keycloakId, dto.getPassword());
        
        // 6. Asignar rol por defecto
        assignRoleToUser(keycloakId, "USUARIO");
        
        log.info("User created successfully in Keycloak with ID: {}", keycloakId);
        return keycloakId;
    }
    
    @Override
    public void updateUserInKeycloak(String keycloakId, UsuarioRegistroDTO dto) {
        log.info("Updating user in Keycloak: {}", keycloakId);
        
        try {
            UsersResource users = keycloak.realm(realm).users();
            UserRepresentation user = users.get(keycloakId).toRepresentation();
            
            // Actualizar datos básicos
            user.setEmail(dto.getEmail());
            
            // Actualizar atributos
            Map<String, List<String>> attributes = user.getAttributes();
            if (attributes == null) {
                attributes = new HashMap<>();
            }
            
            attributes.put("nombre", Arrays.asList(dto.getNombre()));
            attributes.put("apellido", Arrays.asList(dto.getApellido()));
            if (dto.getPais() != null) {
                attributes.put("pais", Arrays.asList(dto.getPais()));
            }
            if (dto.getFechaNacimiento() != null) {
                attributes.put("fechaNacimiento", Arrays.asList(dto.getFechaNacimiento().toString()));
            }
            user.setAttributes(attributes);
            
            users.get(keycloakId).update(user);
            
        } catch (Exception e) {
            log.error("Error updating user in Keycloak: {}", e.getMessage());
            throw new RuntimeException("Error updating user: " + e.getMessage());
        }
    }
    
    @Override
    public void deleteUserFromKeycloak(String keycloakId) {
        log.info("Deleting user from Keycloak: {}", keycloakId);
        
        try {
            UsersResource users = keycloak.realm(realm).users();
            users.get(keycloakId).remove();
            
        } catch (Exception e) {
            log.error("Error deleting user from Keycloak: {}", e.getMessage());
            throw new RuntimeException("Error deleting user: " + e.getMessage());
        }
    }
    
    @Override
    public void assignRoleToUser(String keycloakId, String roleName) {
        log.info("Assigning role {} to user {}", roleName, keycloakId);
        
        try {
            UsersResource users = keycloak.realm(realm).users();
            RoleRepresentation role = keycloak.realm(realm)
                .roles()
                .get(roleName)
                .toRepresentation();
                
            users.get(keycloakId)
                .roles()
                .realmLevel()
                .add(Arrays.asList(role));
                
        } catch (Exception e) {
            log.error("Error assigning role to user: {}", e.getMessage());
            throw new RuntimeException("Error assigning role: " + e.getMessage());
        }
    }
    
    @Override
    public void removeRoleFromUser(String keycloakId, String roleName) {
        log.info("Removing role {} from user {}", roleName, keycloakId);
        
        try {
            UsersResource users = keycloak.realm(realm).users();
            RoleRepresentation role = keycloak.realm(realm)
                .roles()
                .get(roleName)
                .toRepresentation();
                
            users.get(keycloakId)
                .roles()
                .realmLevel()
                .remove(Arrays.asList(role));
                
        } catch (Exception e) {
            log.error("Error removing role from user: {}", e.getMessage());
            throw new RuntimeException("Error removing role: " + e.getMessage());
        }
    }
    
    @Override
    public boolean existsUserInKeycloak(String username, String email) {
        try {
            UsersResource users = keycloak.realm(realm).users();
            
            // Buscar por username
            List<UserRepresentation> usersByUsername = users.search(username, true);
            if (!usersByUsername.isEmpty()) {
                return true;
            }
            
            // Buscar por email
            List<UserRepresentation> usersByEmail = users.searchByEmail(email, true);
            return !usersByEmail.isEmpty();
            
        } catch (Exception e) {
            log.error("Error checking if user exists: {}", e.getMessage());
            return false;
        }
    }
    
    @Override
    public void updateUserPassword(String keycloakId, String newPassword) {
        log.info("Updating password for user: {}", keycloakId);
        setUserPassword(keycloakId, newPassword);
    }
    
    @Override
    public void enableDisableUser(String keycloakId, boolean enabled) {
        log.info("Setting user {} enabled status to: {}", keycloakId, enabled);
        
        try {
            UsersResource users = keycloak.realm(realm).users();
            UserRepresentation user = users.get(keycloakId).toRepresentation();
            user.setEnabled(enabled);
            users.get(keycloakId).update(user);
            
        } catch (Exception e) {
            log.error("Error updating user enabled status: {}", e.getMessage());
            throw new RuntimeException("Error updating user status: " + e.getMessage());
        }
    }
    
    // NUEVO METODO

 @Override
    public UserRepresentation getUserFromKeycloak(String keycloakId) {
        log.info("Getting user from Keycloak: {}", keycloakId);
        
        try {
            UsersResource users = keycloak.realm(realm).users();
            UserRepresentation user = users.get(keycloakId).toRepresentation();
            
            if (user == null) {
                throw new RuntimeException("Usuario no encontrado en Keycloak");
            }
            
            return user;
            
        } catch (Exception e) {
            log.error("Error getting user from Keycloak: {}", e.getMessage());
            throw new RuntimeException("Error obteniendo datos de Keycloak: " + e.getMessage());
        }
    }
    


// nuevo id para jwt

public void agregarDatabaseIdComoAtributo(String keycloakId, Long databaseId) {
    log.info("Agregando database_id {} al usuario Keycloak: {}", databaseId, keycloakId);
    
    try {
        UsersResource users = keycloak.realm(realm).users();
        UserRepresentation user = users.get(keycloakId).toRepresentation();
        
        Map<String, List<String>> attributes = user.getAttributes();
        if (attributes == null) {
            attributes = new HashMap<>();
        }
        
        // Agregar el ID de la BD como atributo
        attributes.put("database_id", Arrays.asList(databaseId.toString()));
        user.setAttributes(attributes);
        
        users.get(keycloakId).update(user);
        
        log.info("Database ID agregado exitosamente a Keycloak");
        
    } catch (Exception e) {
        log.error("Error agregando database_id a Keycloak: {}", e.getMessage());
        throw new RuntimeException("Error agregando database_id: " + e.getMessage());
    }


}










    // ===== MÉTODOS AUXILIARES PRIVADOS =====
    
    private UserRepresentation buildUserRepresentation(UsuarioRegistroDTO dto) {
        UserRepresentation user = new UserRepresentation();
        user.setUsername(dto.getUsername());
        user.setEmail(dto.getEmail());
        user.setEnabled(true);
        user.setEmailVerified(false);
        
        // Atributos personalizados
        Map<String, List<String>> attributes = new HashMap<>();
        attributes.put("nombre", Arrays.asList(dto.getNombre()));
        attributes.put("apellido", Arrays.asList(dto.getApellido()));
        if (dto.getPais() != null) {
            attributes.put("pais", Arrays.asList(dto.getPais()));
        }
        if (dto.getFechaNacimiento() != null) {
            attributes.put("fechaNacimiento", Arrays.asList(dto.getFechaNacimiento().toString()));
        }
        user.setAttributes(attributes);
        
        return user;
    }
    
    private void setUserPassword(String keycloakId, String password) {
        try {
            UsersResource users = keycloak.realm(realm).users();
            
            // Crear credencial de password
            CredentialRepresentation credential = new CredentialRepresentation();
            credential.setType(CredentialRepresentation.PASSWORD);
            credential.setValue(password);
            credential.setTemporary(false); // No es temporal
            
            users.get(keycloakId).resetPassword(credential);
            
        } catch (Exception e) {
            log.error("Error setting user password: {}", e.getMessage());
            throw new RuntimeException("Error setting password: " + e.getMessage());
        }
    }
    
    private String extractKeycloakId(Response response) {
        String location = response.getHeaderString("Location");
        return location.substring(location.lastIndexOf("/") + 1);
    }
}
