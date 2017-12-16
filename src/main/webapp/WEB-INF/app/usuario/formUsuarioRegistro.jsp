<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Modal -->
<div class="container">    
<div class="modal fade" id="divModalPopupRegistroUsuarioForm" role="dialog" data-backdrop="static" data-keyboard="false" aria-hidden="true">
    <div class="modal-dialog" role="document" style="width:100%;height:100%">
        <div class="modal-content">
            <div class="modal-header" >
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">Mantenimiento de Usuario</h4>
            </div>
            <form id="idFormRegistro" action="${pageContext.request.contextPath}/usuario/guardar"method="post" class="form-horizontal" data-toggle="validator">
                <div class="modal-body">
                    <input type="hidden" id="id_flagEstadoPagina" name="flagEstadoPagina" value="" />
                    <input type="hidden" id="id_codusuario" name="codusuario" value="${usuario.codusuario}" />
                    
                    <div class="form-group row">
                        <div class="col-sm-2">
                      <label class="control-label col-sm-2" for="loginname">Login:</label>
                        </div>
                      <div required class="col-sm-10">
                        <input type="input" class="form-control" id="id_loginname" name="loginname" placeholder="Nombre Login" value="${usuario.loginname}" style="text-transform:uppercase;" onkeyup="javascript:this.value=this.value.toUpperCase();" required >
                      </div>
                    </div>
                      
                    <div class="form-group row">
                      <div class="col-sm-2">
                      <label class="control-label col-sm-2" for="clave">Clave:</label>
                      </div>
                      <div required class="col-sm-10">
                        <input type="input" class="form-control" id="id_clave" name="clave" placeholder="clave" value="${usuario.clave}" style="text-transform:uppercase;" onkeyup="javascript:this.value=this.value.toUpperCase();" required >
                      </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-2">
                      <label class="control-label col-sm-2" for="nombres">Nombres:</label>
                        </div>
                      <div required class="col-sm-10">
                          <input type="input" class="form-control" id="id_nombres" name="nombres" placeholder="Nombres" value="${usuario.nombres}" style="text-transform:uppercase;" onkeyup="javascript:this.value=this.value.toUpperCase();" required >
                      </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-2">
                      <label class="control-label col-sm-2" for="apellidos">Apellidos:</label>
                        </div>
                      <div required class="col-sm-10">
                        <input type="input" class="form-control" id="id_apellidos" name="apellidos" placeholder="Apellidos" value="${usuario.apellidos}" style="text-transform:uppercase;" onkeyup="javascript:this.value=this.value.toUpperCase();" required >
                      </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-2">
                      <label class="control-label col-sm-2" for="sexo">Sexo:</label>
                        </div>
                      <div class="col-sm-10">                        
                        <select id="id_sexo" name="sexo" class="form-control">
                            <option value="M" selected="">Masculino</option>
                                <option value="F">Femenino</option>
                        </select>                        
                      </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-2">
                      <label class="control-label col-sm-2" for="tipousuario">Tipo usuario:</label>
                        </div>
                      <div class="col-sm-10">
                        <select id="id_tipousuario" name="tipousuario" class="form-control">
                            <option value="A" selected="">Administrador</option>
                            <option value="I">Intranet</option>
                            <option value="E">Extranet</option>
                        </select>  
                      </div>
                    </div>                      
                    <div class="form-group row">
                        <div class="col-sm-2">
                      <label class="control-label col-sm-2" for="estado">Estado:</label>
                        </div>
                      <div class="col-sm-10">
                          <input type="input" class="form-control" id="id_estado" name="estado" placeholder="Estado" value="REGISTRADO" disabled="true" >
                      </div>
                    </div>  
                    <div class="form-group row">
                          <div class="text-center">
                            <img id="id_fotousuario" src="${pageContext.request.contextPath}/archivos/download/${usuario.comentario}" class="img-thumbnail" alt="Foto Usuario" width="150" height="200"/>
                          </div>
                    </div> 
                    
                </div>

                <div class="modal-footer">
                    <button id="id_btnsalir"  type="button" class="btn btn-secondary" data-dismiss="modal">Salir</button>
                    <button type="button" class="btn btn-secondary" id="idBtnConfirmar">Guardar</button>
                </div>
            </form>
                
            <!-- Modal -->
           
            <div id="divMensajeConfirmacion" class="modal fade" data-keyboard="false" data-backdrop="static" aria-hidden="true">
                    <div class="container verticalAlignCenter">
                        <div class="row verticalAlignCenter">
                            <div class="col-xs-4">
                                <div class="panel panel-primary">
                                        <div class="panel-heading"><span id="spaMensajeConfirmacionTitulo"></span></div>
                                        <div class="panel-body">
                                                <div class="row">
                                                        <div class="text-center">
                                                                <button id="btnSiMensaje" type="button" class="btn btn-primary btn-sm">Si</button>
                                                                <button id="btnNoMensaje" type="button" class="btn btn-primary btn-sm">No</button>
                                                        </div>
                                                </div>
                                        </div>
                                </div>
                            </div>
                        </div>
                    </div>
            </div>
                                                                
        </div>
    </div>
</div>
</div>                      