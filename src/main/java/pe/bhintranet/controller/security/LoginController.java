/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.bhintranet.controller.security;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Alumno
 */
@Controller
public class LoginController {

    @RequestMapping(value = {"login", "/"})
    public String index(@RequestParam(required = false) String error, Model model) {
        System.out.println("entra 3");
        if (error != null) {
            model.addAttribute("loginError", true);
            System.out.println("entra 3.2");
        }
        return "security/login";
    }
}
