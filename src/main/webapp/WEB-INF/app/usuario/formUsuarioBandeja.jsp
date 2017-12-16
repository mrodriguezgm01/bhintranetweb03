<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <c:set var="contextPathUrl" scope="session" value="${pageContext.request.contextPath}"/>
        <title>JSP Page</title>
        <%@include file="../includes/includes.jsp"%>
        <style>
        .modal-header, h4, .close {
            background-color: #337ab7;
            color:white !important;
            text-align: center;
            font-size: 20px;
        }
        .modal-footer {
            background-color: #f9f9f9;
                         
        }
       
        .minusculas{
            text-transform:lowercase;
        }	
        .mayusculas{
            text-transform:uppercase;
        }
        .in.fade.modal {     
            bottom: auto;
        }
        </style>        
    </head>
    <body>
        <div class="container">        
            <div class="row">
                <div class="col-md-12">
                    <%@include file="../includes/menu.jsp" %>
                </div>
            </div>        
            <div class="row">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">Usuarios</h3>
                    </div>      
                    <div class="panel-body">                  
                        <div class='col-md-3'>                    
                            <div class="form-group">                        
                                <div class='input-group date' id='datetimepicker6'>                            
                                    <input type='text' class="form-control" placeholder="Desde" id="txtDesde" value="${fechaDesde}" />
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class='col-md-3'>
                            <div class="form-group">
                                <div class='input-group date' id='datetimepicker7'>
                                    <input type='text' class="form-control" placeholder="Hasta" id="txtHasta" value="${fechaHasta}"/>
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                                </div>
                            </div>
                        </div>

                        <div class='col-md-3'>
                            <select id="selEstado" class="selectpicker" title="Estado">
                                <option value="0">TODOS</option>                 
                            </select>
                        </div>

                        <div class='col-md-3'>
                            <button type="button" class="btn btn-default" id="idBtnBuscar">Buscar</button>
                        </div> 
                    </div>
                </div>
            </div>     

            <div class="row">
                <div id="divErrorMessageConsultarSolicitudAlmancen" class="row divError">
                    <div class="col-xs-12">
                        <label id="etiquetaErrorConsultarSolicitudAlmancen" class="btn-sm"></label>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title" >Lista de Usuarios 
                            <button type="button" class="btn btn-default" style="float: right;" id="idBtnAgregar">Agregar</button>
                        </h3>
                    </div>      
                    <div class="panel-body">                      
                        <div class="col-md-12" id="divPedidosTable">  
                            <div class="table-responsive">
                            <table id="example" class="table table-striped table-bordered datatable" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th>Codigo</th>
                                        <th>Login</th>
                                        <th>Nombres</th>
                                        <th>Apellidos</th>
                                        <th>Estado</th>
                                        <th>Accion</th>
                                        <th>File</th>
                                    </tr>                                
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th>Codigo</th>
                                        <th>Login</th>
                                        <th>Nombres</th>
                                        <th>Apellidos</th>
                                        <th>Estado</th>
                                        <th>Accion</th>
                                        <th>File</th>
                                    </tr>                                  
                                </tfoot>
                                <tbody>
                                    <c:forEach items="${usuarios}" var="p" varStatus="i" >
                                        <tr>
                                            <td> ${p.codusuario} </td>
                                            <td> ${p.loginname} </td>
                                            <td> ${p.nombres} </td>
                                            <td> ${p.apellidos} </td>
                                            <td> ${p.estado} </td>
                                            <td> 
                                               <a href="#" onClick="javascript:wf_editar(${p.codusuario})" > Editar</a>
                                            </td>
                                            <td> FILE</td>
                                        </tr>
                                    </c:forEach>     
                                        
                                        
                                        
                                </tbody>
                            </table>
                            </div>
                            <div id="divPedidosPagerTable" class="jqGridGeneralPagerClass"></div>
                        </div>                        
                    </div>
                </div>
            </div>           

       

        </div>        

                                 
        <!-- Includes -->
        <jsp:include page="../usuario/formUsuarioArchivo.jsp" />
        <jsp:include page="../usuario/formUsuarioRegistro.jsp" />

        


<script type="text/javascript" src="${pageContext.request.contextPath}/js/commonGeneral.js"></script>

<script type="text/javascript">
    var contextPathUrl = "${contextPathUrl}";
    
//======================================
//inicio eventos personalizados
//======================================
//=========================INICIO DE BUSQUEDA DE PERSONAL DELEGADO A======================================
var tablaExample= $('#example').DataTable( {
	"language":"",
	oLanguage : {
		sLengthMenu	: "Mostrar _MENU_ registros",
		sZeroRecords: "No se encontraron resultados",
		sInfo		: "Mostrando del _START_ al _END_ de un total de _TOTAL_ registros",
		sInfoEmpty	: "Registros del 0 al 0 de un total de 0 registros",
		sEmptyTable	: '<i>No hay informacion de Personal</i>',
		sSearch		: "Buscar: ",
		sInfoFiltered: "(filtrado de un total de _MAX_ registros)",
		sLoadingRecords: "Cargando...",
		oPaginate : {
		"sFirst":    "Primero",
        "sLast":     "Ultimo",
        "sNext":     "Siguiente >",
        "sPrevious": "< Anterior"
		},
		oAria: {
			sSortAscending: ": Activar para ordenar la columna de manera ascendente",
			sSortDescending: ": Activar para ordenar la columna de manera descendente"
		}
	},
	columns : [
		{data :	"codusuario"},
		{data :	"loginname"},
		{data :	"nombres"},
		{data :	"apellidos"},
		{data :	"estado"},                
                {render: function ( data, type, row ) {                    
                    return '<a href="#" onClick="javascript:wf_editar(' + row.codusuario + ')">Editar</a>';
                  }   
                },
                {render: function ( data, type, row ) {   
                    //return '<a href="' + contextPathUrl + '/archivos/file1?id=' + row.codusuario + '&idEntidad=ase">File</a>';
                    return '<a href="#" onClick="javascript:wf_subirArchivo(' + row.codusuario + ')">Archivo</a>';
                  }   
                }
	],
	
		ordering			:	false,
		bScrollAutoCss		:	true,
		bStateSave			:	false,
		bAutoWidth			:	false,
		bScrollCollapse		:	false,
		searching			:	true,
		paging				:	true,
		pagingType			:   "full_numbers",
		iDisplayLength		:	7,
		responsive			:	true,
		bLengthChange		: 	false,
		fnDrawCallback		:	function(oSettings) {	
		if (oSettings.fnRecordsTotal() == 0) {
			$('#example_paginate').addClass('hiddenDiv'); //el footer de paginacion siempre tiene como ID "miTablaID_paginate"
                        //no se oculta automaticamente
                        //cuando hay 0 registros, por eso se oculta anadiendo el class .hiddenDiv
        }
		else {
			$('#example_paginate').removeClass('hiddenDiv');
			
			//$('#example td:nth-child('+(5)+')').hide(); //Oculta la columna (4)
			//$('#example td:nth-child('+(6)+')').hide(); //Oculta la columna (5)
		}
    }
	        
}); //Fin de inicializar tabla

//1. wf_buscar
function wf_buscar(){	
	var fechaDesdeText = $("#txtDesde").val();
	var fechaHastaText = $("#txtHasta").val();
	//hideElement("divErrorMessageConsultarSolicitudAlmancen");
	var flagValidacionFormulario = true;
	var errorMessage = "";	
        obtenerDatos();
        
    //
    
}

function obtenerDatos(){
    
        var ajax_data = {"id": "0"};
        $.ajax({
            url: contextPathUrl + "/usuario/listar",
            data: ajax_data,
            type: "post",
            dataType: "json",
            cache: false,
            async: false,
            beforeSend: function () {
                console.log('flagEstadoPagina:e2');
            },
            complete: function () {
                console.log('flagEstadoPagina:e3');
            },
            success: function (respuesta) {                
                console.log(respuesta);                
                if(respuesta.usuarios.length > 0){
                    $('#example').dataTable().fnClearTable(); //limpia registros
                    $('#example').dataTable().fnAddData(respuesta.usuarios); //carga registros en grilla
                    $('#example').dataTable().fnDraw(); //redibuja objeto
                }else{
                    $('#example').dataTable().fnClearTable();
                }
            },
            error: function () {
                console.log('error moises 1');
                
            }
        });
}
	
//1. wf_agregar
    function wf_agregar() {
        $("#id_flagEstadoPagina").val("");
        var flagEstadoPagina = "A";
        var ajax_data = {"id": "0"};
        
        $.ajax({
            url: contextPathUrl + "/usuario/agregar",
            data: ajax_data,
            type: "post",
            dataType: "json",
            cache: false,
            async: false,
            beforeSend: function () {
                console.log('flagEstadoPagina:e2');
            },
            complete: function () {
                console.log('flagEstadoPagina:e3');
            },
            success: function (respuesta) {
                var flagEstadoPagina = respuesta.flagEstadoPagina;
                console.log('flagEstadoPagina:e4');
                
                if (flagEstadoPagina == "A") {                    
                    $("#id_flagEstadoPagina").val("A");
                    $("#id_codusuario").val(respuesta.usuario.codusuario);
                    $("#id_loginname").val(respuesta.usuario.loginname);
                    $("#id_clave").val(respuesta.usuario.clave);
                    $("#id_nombres").val(respuesta.usuario.nombres);
                    $("#id_apellidos").val(respuesta.usuario.apellidos);                    
                    $("#id_sexo").val(respuesta.usuario.sexo);
                    $("#id_tipousuario").val(respuesta.usuario.tipousuario);                    
                    $("#id_estado").val(respuesta.usuario.estado); 
                    $("#id_loginname" ).prop( "disabled", false );
                    //
                    $("#divModalPopupRegistroUsuarioForm").modal("show");
                }
            },
            error: function () {
                console.log('flagEstadoPagina:e5');
                $("#divModalPopupRegistroUsuarioForm").modal("hide");
            }
        });
        //
    }

//1. wf_editar
  function wf_editar(codusuario) {
        $("#id_flagEstadoPagina").val("");
        var flagEstadoPagina = "C";
        console.log('flagEstadoPagina:' + flagEstadoPagina);
        var ajax_data = {"id": codusuario};
        $.ajax({
            url: contextPathUrl + "/usuario/editar",
            data: ajax_data,
            type: "post",
            dataType: "json",
            cache: false,
            async: false,
            beforeSend: function () {
                console.log('flagEstadoPagina:e2');
            },
            complete: function () {
                console.log('flagEstadoPagina:e3');
            },
            success: function (respuesta) {
                var flagEstadoPagina = respuesta.flagEstadoPagina;
                console.log('flagEstadoPagina:e4');
                console.log('respuesta:' + respuesta);

                if (flagEstadoPagina == "E") {   
                    $("#id_flagEstadoPagina").val("E");
                    $("#id_codusuario").val(respuesta.usuario.codusuario);
                    $("#id_loginname").val(respuesta.usuario.loginname);
                    $("#id_clave").val(respuesta.usuario.clave);
                    $("#id_nombres").val(respuesta.usuario.nombres);
                    $("#id_apellidos").val(respuesta.usuario.apellidos);                    
                    $("#id_sexo").val(respuesta.usuario.sexo);
                    $("#id_tipousuario").val(respuesta.usuario.tipousuario);                    
                    $("#id_estado").val(respuesta.usuario.estado); 
                    $("#id_loginname" ).prop( "disabled", true );
                    $("#id_fotousuario").attr("src","${pageContext.request.contextPath}/archivos/download/"+respuesta.usuario.comentario);
                    $("#divModalPopupRegistroUsuarioForm").modal("show");
                }
            },
            error: function () {
                console.log('flagEstadoPagina:e5');
                $("#divModalPopupRegistroUsuarioForm").modal("hide");
            }
        });
        //
    }

//2. wf_confirmar
function wf_confirmar(){
$("#spaMensajeConfirmacionTitulo").html("&iquest;Esta seguro de Guardar los cambios?");
$("#divMensajeConfirmacion").modal("show");
}

//3. wf_guardar
  function wf_guardar() {
    var flagEstadoPagina=$("#id_flagEstadoPagina").val();
    var codusuario=$("#id_codusuario").val();
    var loginname=$("#id_loginname").val();
    var clave=$("#id_clave").val();
    var nombres=$("#id_nombres").val();
    var apellidos=$("#id_apellidos").val();                    
    var sexo=$("#id_sexo").val();
    var tipousuario=$("#id_tipousuario").val();                    
    var estado=$("#id_estado").val();                     
        
    var ajax_data = {"flagEstadoPagina": flagEstadoPagina,
        "codusuario": codusuario,
        "loginname": $.trim(loginname),
        "clave": $.trim(clave),
        "nombres": $.trim(nombres),
        "apellidos": $.trim(apellidos),
        "sexo": sexo,
        "tipousuario": tipousuario,
        "estado":estado };
    
        $.ajax({
            url: contextPathUrl + "/usuario/guardar",
            data: ajax_data,
            type: "post",
            dataType: "json",
            cache: false,
            async: false,
            beforeSend: function () {
                console.log('flagEstadoPagina:e2');
            },
            complete: function () {
                console.log('flagEstadoPagina:e3');
            },
            success: function (respuesta) {
                var flagEstadoPagina = respuesta.flagEstadoPagina;
                console.log('flagEstadoPagina:e4');
                console.log('respuesta:' + respuesta);

                if (flagEstadoPagina == "OK") { 
                    $("#divModalPopupRegistroUsuarioForm").modal("hide");
                    obtenerDatos();
                }
            },
            error: function () {
                console.log('flagEstadoPagina:e5');
                $("#divModalPopupRegistroUsuarioForm").modal("hide");
            }
        });
        //
    }
    
//1. wf_editar
  function wf_subirArchivo(codusuario) {
        $("#id_flagEstadoPagina").val("");
        $("#id_id").val(codusuario);
        $("#id_idEntidad").val("ase");
        $("#divModalPopupArchivoUsuarioForm").modal("show"); 
        //
    }
   
  function wf_guardarArchivo() {
    }        
    
//fin eventos personaliados
//======================================
    $(document).ready(function () {
    
        $(function () {
            $('#datetimepicker6').datetimepicker({
                useCurrent: true, //Important! See issue #1075
                format: 'DD/MM/YYYY'
            });
            $('#datetimepicker7').datetimepicker({
                useCurrent: true, //Important! See issue #1075
                format: 'DD/MM/YYYY'
            });
            $("#datetimepicker6").on("dp.change", function (e) {
                $('#datetimepicker7').data("DateTimePicker").minDate(e.date);
            });
            $("#datetimepicker7").on("dp.change", function (e) {
                $('#datetimepicker6').data("DateTimePicker").maxDate(e.date);
            });
             
            //4. botones
            $("#idBtnBuscar").on('click', function () {
                    wf_buscar();        
            });
            $("#idBtnAgregar").on('click', function () {
                    wf_agregar();        
            });

            $("#idBtnConfirmar").on('click', function () {
                    wf_confirmar();        
            });

            $("#btnSiMensaje").on('click', function () {                    
                $("#divMensajeConfirmacion").modal("hide");
                //$("#idFormRegistro").submit();
                wf_guardar();
            });
            
            $("#idBtnSubirArchivo").on('click', function () {
                    //wf_guardarArchivo();      
                    $("#divModalPopupArchivoUsuarioForm").modal("hide");
                    $("#id_frmsubir").submit();
            });



            $("#btnNoMensaje").on('click', function () {
                    $("#divMensajeConfirmacion").modal("hide");      
            });
            //------------------------------
        });
    });

        </script>                
    </body>
</html>