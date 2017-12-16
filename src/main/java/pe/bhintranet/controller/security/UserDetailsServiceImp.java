/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.bhintranet.controller.security;

import java.util.ArrayList;
import java.util.Collection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pe.bhintranet.model.dao.UsuarioDAO;
import pe.bhintranet.model.bean.Usuario;

/**
 *
 * @author Alumno
 */
@Service("userDetailsService")
@Transactional(readOnly = true)
public class UserDetailsServiceImp implements UserDetailsService {

    @Autowired 
    private   UsuarioDAO usuarioDAO;

    @Override
    public  UserDetails loadUserByUsername(String string) throws UsernameNotFoundException {
        System.out.println("entra 1.0"); 
        Usuario usuario=null;
        try{
            usuario = usuarioDAO.selectByLoginName(string);
        }catch(DataAccessException de){
            System.out.println("entra 1.0.3"); 
            de.printStackTrace();
        }catch(Exception ex){
            System.out.println("entra 1.0.2"); 
            ex.printStackTrace();
    }
        
        
        //Usuario usuario = new Usuario(Long.valueOf("1"),string,"1234","ALBERTO");
        System.out.println("entra 1.1");
        if (usuario == null) {
            System.out.println("entra 1.2");
            throw new UsernameNotFoundException("Usuario no encontrado");
        }
        System.out.println("entra 1.3");
        String username =usuario.getLoginname();
        String password =usuario.getClave();
        Collection<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
        authorities.add(new SimpleGrantedAuthority(usuario.getRol()));
        //authorities.add(new SimpleGrantedAuthority("ASESOR"));
        System.out.println("entra 1.4");
        return new User(username, password, authorities);
    }
}
