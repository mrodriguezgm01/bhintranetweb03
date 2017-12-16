<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="../includes/includes.jsp"%>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h1> Cargar Archivo </h1>

                    <form id="frmsubir" method="POST" enctype="multipart/form-data" action="${pageContext.request.contextPath}/archivos/upload">
                        <input type="hidden" name="id" value="${id}"/>
                        <input type="hidden" name="idEntidad" value="${idEntidad}"/>
                        File to upload:</td><td><input type="file" name="file" /> <br/>
                            <input type="submit" value="Subir Archivo" />

                    </form>
                </div>
            </div>

            <hr/> 
            <div class="row">
                <div class="col-md-12">
                    <h1> Archivos </h1>
                    <table class="table table-striped"> <tr>
                        </tr>
                        <c:forEach items="${archivos}" var="a" varStatus="i" >
                            <tr>
                                <td> ${a} </td> 

                                <td>  
                                    <a href="${pageContext.request.contextPath}/archivos/download/${a.getName()}"> 
                                        Descargar
                                    </a>
                                </td>  
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
            <hr/>
            <div class="row">
                <div class="col-md-6">
                    <form id="frmregresar" method="POST" action="${pageContext.request.contextPath}/archivos/regresar">
                            <input type="submit" value="Regresar" />
                    </form>
                </div>
            </div>

        </div>





    </body>
</html>
