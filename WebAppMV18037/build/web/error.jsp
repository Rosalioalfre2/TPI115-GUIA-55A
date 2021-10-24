<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP error de contexto</title>
    </head>
    <body>
        <div Style="background-color: r">
        <h1 style="color: red;">
            <c:choose>
                <c:when test="${param.tipo eq 'contexto'}">
                    Error, intento de ejecutar una jsp, la cual debe estar en un contexto dentro de otra jsp
                </c:when>
                <c:when test="${param.tipo eq 'parametro'}">
                    Error, parametros incorrectos.
                </c:when>                
            </c:choose>
  
        </h1>
        </div>
                  <script>
                setTimeout(function () {
                    location.href = "${param.destino}";
                }, 5000);
            </script>
    </body>
</html>
