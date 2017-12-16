/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.bhintranet.controller.security;

import java.util.Date;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Alumno
 */
@Controller
public class PrincipalController {

    @RequestMapping(value = "/principal")
    public String cargarPortadaVisitante(Model model) {
        model.addAttribute("mensaje", "Hoy es: " + new Date());
        return "security/principal";
    }

    @RequestMapping(value = "/ventas/principal")
    public String cargarPortadaVentas(Model model) {
        model.addAttribute("mensaje", "Registre sus Ventas");
        return "security/ventas";
    }

    @RequestMapping(value = "/adm/principal")
    public String cargarPortadaAdm(Model model) {
        model.addAttribute("mensaje", "Administración");
        return "security/adm";
    }
}
