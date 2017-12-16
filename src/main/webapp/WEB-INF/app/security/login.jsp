<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE     html     PUBLIC     "-//W3C//DTD     HTML     4.01     Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>SIDETISOFT.pe Spring-Security Login</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <c:set var="contextPathUrl" scope="session" value="${pageContext.request.contextPath}"/>        
        <%@include file="../includes/includes.jsp"%>        
    </head>
    <body>

        <div class="container">        
            <div class="row">
                <div class="col-md-12">
                    <%@include file="../includes/menu.jsp" %>
                </div>
            </div>        
                <div class="row" style="width: 70%; padding-left: 15%;">
                <div class="panel panel-primary" >
                    
                    <div class="panel-heading">
                        <h3 class="panel-title">Login</h3>
                    </div>      
                    <div class="panel-body"> 
                        <div class="col-md-6">
                            
                            <form method="post" name="f" action="j_spring_security_check">
                                <table><c:if test="${loginError}"><tr>
                                            <td    colspan="2"    style="color:    red">Usuario/Clave incorrectos.</td>
                                        </tr>
                                    </c:if> 
                                </table>
                                
                                <div class="form-group">
                                  <label for="j_username">Usuario:</label><input type="text" class="form-control" id="j_username" name="j_username" placeholder="Usuario" value="" onkeyup="javascript:this.value=this.value.toUpperCase();">
                                </div>
                                <div class="form-group">
                                  <label for="j_password">Clave:</label><input type="password" class="form-control" id="j_password" name="j_password" placeholder="Clave" value="" onkeyup="javascript:this.value=this.value.toUpperCase();">
                                </div>
                                
                                <input class="btn btn-primary text-center" type="submit" value="Ingresar"/>                               
                                
                                <c:if test="${pageContext.request.userPrincipal.name != null}">
                                    <h3><a  href="<%=request.getContextPath()%>/js_pring_security_logout">Cerrar sesión</a></h3>  
                                </c:if>
            


                            </form>
                            
                        </div>
                    </div>
                    
                </div>
            </div>   
        </div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/commonGeneral.js"></script>
</body>
</html>