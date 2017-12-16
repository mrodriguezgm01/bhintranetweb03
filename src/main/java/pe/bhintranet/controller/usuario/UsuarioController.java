package pe.bhintranet.controller.usuario;

import java.io.File;
import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
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
import pe.bhintranet.model.bean.Usuario;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;
import pe.bhintranet.model.dao.UsuarioDAO;
import pe.bhintranet.model.bean.Usuario;
import pe.bhintranet.service.inf.UsuarioService;

@Controller
@RequestMapping("usuario")
public class UsuarioController {
    
    @Autowired
    UsuarioService service;
    
    @RequestMapping(method = RequestMethod.GET)
    public String list(Model model) {
        System.out.println("entra 5.1");
        Date fechaHasta=new Date();
        Date fechaDesde=new Date();
        
        Collection<Usuario> usuarios = new ArrayList<Usuario>(); 
        Usuario usuario=new Usuario();
        usuario.setLoginname("prueba");
        
        
        try {
            
            usuarios=service.listar(usuario);
            //usuarios=usuarioDAO.listar(usuario);
            
            //List<Usuario> usuarios = (List<Usuario>) usuarioDAO.listar(usuario);

                
        } 
        catch (Exception ex) {
                   
                   ex.printStackTrace();
        }
        finally {
                
        }
        
        /*
        List<Usuario> usuarios = new ArrayList<Usuario>();
        Usuario usuario1=new Usuario(Long.valueOf("1"),"MRODRIGUEZ1","123","MOISES","RODRIGUEZ","REGISTRADO");
        Usuario usuario2=new Usuario(Long.valueOf("2"),"MRODRIGUEZ2","123","MOISES","RODRIGUEZ","REGISTRADO");
        Usuario usuario3=new Usuario(Long.valueOf("3"),"MRODRIGUEZ3","123","MOISES","RODRIGUEZ","REGISTRADO");
        Usuario usuario4=new Usuario(Long.valueOf("4"),"MRODRIGUEZ4","123","MOISES","RODRIGUEZ","REGISTRADO");
        Usuario usuario5=new Usuario(Long.valueOf("5"),"MRODRIGUEZ5","123","MOISES","RODRIGUEZ","REGISTRADO");
        Usuario usuario6=new Usuario(Long.valueOf("6"),"MRODRIGUEZ6","123","MOISES","RODRIGUEZ","REGISTRADO");
        
        usuarios.add(usuario1);
        usuarios.add(usuario2);
        usuarios.add(usuario3);
        usuarios.add(usuario4);
        usuarios.add(usuario5);
        usuarios.add(usuario6);
        */
        //String fechaDesde =  FormatoConstantes.CADENA_VACIA;
        SimpleDateFormat sdf=new SimpleDateFormat("dd/MM/yyyy");
        model.addAttribute("usuarios", usuarios);
        model.addAttribute("fechaDesde", sdf.format(fechaDesde));
        model.addAttribute("fechaHasta", sdf.format(fechaHasta));
        //model.addAttribute("estados",service.listEstado());
        //model.addAttribute("preafiliado", new PreAfiliado());
        model.addAttribute("flagEstadoPagina","C");//CONSULTA
        return "usuario/formUsuarioBandeja";
    }

    @RequestMapping("listar")
    public @ResponseBody Map<String, Object> lista(Model model,HttpServletRequest request) {
        
        ModelAndView view = null;
        Map<String, Object> respuesta = new HashMap<String, Object>();
        Map<String, Object> parm = new HashMap<String, Object>();
        String codEstadoPedido;
        String fechaDesde;
        String fechaHasta;
        System.out.println("listar:paso listar"); 
      
        
        respuesta.put("usuarios", service.listar(new Usuario()));        
        respuesta.put("flagEstadoPagina","C");//CONSULTA
        
        return respuesta;
    }
    
    @RequestMapping("agregar")
    public @ResponseBody Map<String, Object> agregar(Model model,HttpServletRequest request) {
        ModelAndView view = null;
        Map<String, Object> respuesta = new HashMap<String, Object>();
        System.out.println("flagEstadoPagina:paso 0");
        Usuario usuario=new Usuario();
        usuario.setEstado("REGISTRADO");
        respuesta.put("usuario",usuario);       
        respuesta.put("flagEstadoPagina","A");//agregar
        return respuesta;
    }
    
    @RequestMapping("editar")
    public @ResponseBody Map<String, Object> editar(@RequestParam Long id, Model model,HttpServletRequest request) {
        ModelAndView view = null;
        Map<String, Object> respuesta = new HashMap<String, Object>();
        respuesta.put("usuario", service.recuperar(id));     
        respuesta.put("flagEstadoPagina","E");//EDICION
        System.out.println("flagEstadoPagina:paso 1");
        
        //view = new ModelAndView("",respuesta);
	//return view;
        return respuesta;
    }
    
    @RequestMapping("guardar")
    public @ResponseBody Map<String, Object> guardar(Usuario usuario,HttpServletRequest request) {
        Long codNull=null;
        
        String flagEstadoPagina=request.getParameter("flagEstadoPagina").trim();
        Map<String, Object> respuesta = new HashMap<String, Object>();
        System.out.println("guardar:paso 1"); 
        System.out.println("codusuario:"+usuario.getCodusuario()); 
        
        if (flagEstadoPagina.equals("A")){
            System.out.println("guardar:paso INSERTAR"); 
            usuario.setCodusuario(codNull);
            usuario.setCodfranquicia(1);
            service.insertar(usuario);
        }else{
            System.out.println("guardar:paso ACTUALIZAR"); 
            service.actualizar(usuario);
        }        
        respuesta.put("flagEstadoPagina","OK");
        return respuesta;
        //return "redirect:/usuario";
    }

}