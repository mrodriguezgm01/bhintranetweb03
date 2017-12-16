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
                        <h3 class="panel-title">Propiedades</h3>
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
                        <h3 class="panel-title" >Lista de Propiedades <button type="button" class="btn btn-default" style="float: right;" id="idBtnAgregar">Agregar</button></h3>
                    </div>      
                    <div class="panel-body">                      
                        <div class="col-md-12" id="divPedidosTable">  
                            <table id="example" class="table table-striped table-bordered datatable" cellspacing="0" width="100%">                    
                            </table>
                            <div id="divPedidosPagerTable" class="jqGridGeneralPagerClass"></div>
                        </div>                        
                    </div>
                </div>
            </div>           

       

        </div>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/commonGeneral.js"></script>

<script type="text/javascript">
    var contextPathUrl = "${contextPathUrl}";

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
        });
    });

        </script>                
    </body>
</html>
