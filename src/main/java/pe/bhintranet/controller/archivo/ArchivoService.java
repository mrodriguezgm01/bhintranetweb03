package pe.bhintranet.controller.archivo;

import java.io.File;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.multipart.MultipartFile;

public interface ArchivoService {

    List<File> list(HttpServletRequest request,Long id,String idEntidad);

    void upload(MultipartFile file);
    String uploadSimple(MultipartFile file,Long id, String idEntidad);

    void download(HttpServletResponse response, String file);

}
