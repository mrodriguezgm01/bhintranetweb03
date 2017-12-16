<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Modal -->
<div class="modal fade" id="divModalPopupArchivoUsuarioForm" role="dialog" data-backdrop="static" data-keyboard="false" aria-hidden="true">
  <div class="modal-dialog" style="width:100%;height:100%">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Fotografia del Usuario</h4>
      </div>
      <div class="modal-body">
        <form id="id_frmsubir" method="POST" enctype="multipart/form-data" action="${pageContext.request.contextPath}/archivos/uploadSimple">
            <input type="hidden" id="id_id" name="id"/>
            <input type="hidden" id="id_idEntidad" name="idEntidad" />
            File to upload:</td><td><input id="id_file" type="file" name="file" /> <br/>            
            <button type="button" class="btn btn-secondary" id="idBtnSubirArchivo">Subir Archivo</button>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        
      </div>
    </div>

  </div>
</div>   