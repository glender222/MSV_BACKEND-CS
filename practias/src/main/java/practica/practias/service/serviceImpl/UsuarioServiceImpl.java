package practica.practias.service.serviceImpl;

import org.springframework.stereotype.Service;

import practica.practias.model.Usuario;
import practica.practias.service.UsuarioService;

@Service
public class UsuarioServiceImpl implements UsuarioService{

    @Override
    public boolean validarUsuario(String usuarioId) {
       
    // Mock: simular que todos los usuarios son válidos
        return true;
         
    }

    @Override
    public Usuario getUsuarioDetails(String usuarioId) {
      
  // Mock: crear un usuario ficticio para desarrollo
        Usuario mockUser = new Usuario();
        mockUser.setId(1L);
        mockUser.setUsuario(usuarioId);
        mockUser.setCorreo(usuarioId + "@example.com");
        mockUser.setEstado("ACTIVO");
        return mockUser;

    }

}
