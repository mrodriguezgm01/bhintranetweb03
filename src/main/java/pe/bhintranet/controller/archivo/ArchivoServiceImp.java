package pe.bhintranet.controller.archivo;

import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.Closeable;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class ArchivoServiceImp implements ArchivoService {
    //windows
    private String rootLocation = "C:/filebhintranet\\archivos";
    private String rootLocation0 = "C:/filebhintranet\\archivos";
    //linux
    //private String rootLocation = "/home/tomcat/filesidetitaxi/archivos";
    //private String rootLocation0 = "/home/tomcat/filesidetitaxi/archivos";    
    
    private String idCodigo;
    private String idEntidad;

    @Override
    public List<File> list(HttpServletRequest request,Long id, String idEntidad) {        
    //
    //String directoryName = PATH.append(this.getClassName());  
    idCodigo=id.toString().trim();
    this.idEntidad=idEntidad.trim();
    //String directoryName = rootLocation0+"/"+id.toString().trim()+"foto";
    String directoryName = rootLocation0+"\\"+id.toString().trim()+"foto";
    //File file  = new File(String.valueOf(fileName));

    File directory = new File(String.valueOf(directoryName));

    //rootLocation=directoryName;
    
    System.out.println("MOISES:user.home:"+System.getProperty("user.home"));
         
    System.out.println("rootLocation1:"+rootLocation);

     if(!directory.exists()){
                 directory.mkdir();             
                 //directory.mkdirs();             
                 rootLocation=directoryName; 
    }else{
         rootLocation=directoryName; 
     }
    //
            final File folder = new File(rootLocation);
            List<File> archivos = new ArrayList();
            
            try{
                for (File file : folder.listFiles()) {
                    if (!file.isDirectory()) {
                        archivos.add(file);
                    }
                }

                return archivos;                
            }catch(Exception e) {
                e.printStackTrace();
        }
 
        return null;

    }

    @Override
    public void upload(MultipartFile file) {

        try {
            
            System.out.println("rootLocation2:"+rootLocation);
            
            Path path = Paths.get(this.rootLocation);
            //path.resolve(idEntidad+idCodigo+"img_"+file.getOriginalFilename())
            Files.copy(
                    file.getInputStream(),
                    path.resolve(idEntidad+idCodigo+"img"+file.getOriginalFilename().trim())                    
            );

        } catch (IOException ex) {
            ex.printStackTrace();
        }

    }
    
        @Override
    public String uploadSimple(MultipartFile file,Long id, String idEntidad) {
        String nombreArchivo="";
        try {
            
            System.out.println("rootLocation2:"+rootLocation);
            
            Path path = Paths.get(this.rootLocation);
            //path.resolve(idEntidad+idCodigo+"img_"+file.getOriginalFilename())
            nombreArchivo=idEntidad+id+"img"+file.getOriginalFilename().trim();
            Files.copy(
                    file.getInputStream(),                    
                    path.resolve(idEntidad+id+"img"+file.getOriginalFilename().trim())                   
            );

        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return nombreArchivo;
    }

    @Override
    public void download(HttpServletResponse response, String file) {
        try {
            
            
            
            File filex = new File(rootLocation + "/" + file);

            if (!filex.exists()) {

            }

            response.reset();
            response.setBufferSize(1024 * 16);
            response.setContentType("application/octet-stream");
            response.setHeader("Content-Disposition", "inline; filename=\"" + file + "\"");

            BufferedInputStream input = null;
            BufferedOutputStream output = null;

            try {

                input = new BufferedInputStream(new FileInputStream(filex), 1024 * 16);
                output = new BufferedOutputStream(response.getOutputStream(), 1024 * 16);
                IOUtils.copy(input, output);
                response.flushBuffer();

            } finally {

                close(output);
                close(input);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static void close(Closeable resource) {
        if (resource != null) {
            try {
                resource.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

}
