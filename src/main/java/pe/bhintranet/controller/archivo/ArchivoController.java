package pe.bhintranet.controller.archivo;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import pe.bhintranet.model.bean.Usuario;
import pe.bhintranet.service.inf.UsuarioService;

@Controller
@RequestMapping("archivos")
public class ArchivoController {

    @Autowired
    ArchivoService service;
    
    @Autowired
    UsuarioService serviceUsuario;
    
    //@RequestMapping(method = RequestMethod.GET)
    @RequestMapping(value = "file1",method = RequestMethod.GET)    
    public String list(Model model,HttpServletRequest request,@RequestParam Long id,@RequestParam String idEntidad) {
        model.addAttribute("archivos", service.list(request,id,idEntidad));
        model.addAttribute("id",id);
        model.addAttribute("idEntidad",idEntidad);
        return "archivos/index";
    }

    @RequestMapping(value = "upload", method = RequestMethod.POST)
    public String upload(@RequestParam("file") MultipartFile file,
            RedirectAttributes redirectAttributes,@RequestParam("id") Long id,
            @RequestParam("idEntidad") String idEntidad) {

        service.upload(file);
        //return "redirect:/archivos";
        return "redirect:/archivos/file1?id="+id+"&idEntidad="+idEntidad;
    }

    @RequestMapping(value = "uploadSimple", method = RequestMethod.POST)
    public String uploadSimple(@RequestParam("file") MultipartFile file,
            RedirectAttributes redirectAttributes,@RequestParam("id") Long id,
            @RequestParam("idEntidad") String idEntidad) {
        String nombreArchivo="";
        nombreArchivo=service.uploadSimple(file,id,idEntidad);
        Usuario usuario=new Usuario();
        usuario.setCodusuario(id);
        usuario.setComentario(nombreArchivo);
        serviceUsuario.actualizar(usuario);
        //return "redirect:/archivos";
        return "redirect:/usuario";
    }    

    
    @RequestMapping("download/{file:.*}")
    public void download(@PathVariable("file") String file, HttpServletResponse response) throws Exception {

        service.download(response, file);

    }
    
    @RequestMapping(value = "regresar", method = RequestMethod.POST)
    public String regresar() {
        return "redirect:/usuario";
    }

//
}
