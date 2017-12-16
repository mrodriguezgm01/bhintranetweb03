/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.bhintranet.controller.security;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;
import pe.bhintranet.model.dao.UsuarioDAO;
import pe.bhintranet.model.bean.Usuario;

/**
 *
 * @author Alumno
 */
@Component
public class LoginSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {

    @Autowired
    private   UsuarioDAO usuarioDAO;

    @Override
    public  void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication a) throws IOException, ServletException {
        System.out.println("entra 2.1");
         Usuario autenticado = usuarioDAO.selectByLoginName(a.getName());
        //Usuario autenticado =new Usuario(Long.valueOf("1"),a.getName(),"1234","ALBERTO");
        request.getSession().setAttribute("USUARIO_AUTENTICADO",autenticado);
        System.out.println("entra 2.2");
        setDefaultTargetUrl("/usuario");
        super.onAuthenticationSuccess(request, response, a);
    }
}
