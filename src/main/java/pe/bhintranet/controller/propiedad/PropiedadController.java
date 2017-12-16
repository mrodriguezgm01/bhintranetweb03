package pe.bhintranet.controller.propiedad;

import java.io.File;
import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
//import pe.edu.tecsup.springmvc.model.PreAfiliado;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;


@Controller
@RequestMapping("propiedad")
public class PropiedadController {

    @RequestMapping(method = RequestMethod.GET)
    public String list(Model model) {
        
        Date fechaHasta=new Date();
        Date fechaDesde=new Date();
        //String fechaDesde =  FormatoConstantes.CADENA_VACIA;
        SimpleDateFormat sdf=new SimpleDateFormat("dd/MM/yyyy");
        //model.addAttribute("preafiliados", service.listPreAfiliado());
        model.addAttribute("fechaDesde", sdf.format(fechaDesde));
        model.addAttribute("fechaHasta", sdf.format(fechaHasta));
        //model.addAttribute("estados",service.listEstado());
        //model.addAttribute("preafiliado", new PreAfiliado());
        model.addAttribute("flagEstadoPagina","C");//CONSULTA
        return "propiedad/index";
    }

  

}
