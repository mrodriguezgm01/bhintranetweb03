/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.bhintranet.service.inf;

import java.util.Collection;
import pe.bhintranet.model.bean.Usuario;

/**
 *
 * @author moises_rodriguez
 */
public interface UsuarioService {
      //personalizado
    public int insertar(Usuario usuario);
    public void actualizar(Usuario usuario);
    public Usuario recuperar(Long codusuario);    
    public Usuario selectByLoginName(String loginName);
    public Collection listar(Usuario record);   
}
