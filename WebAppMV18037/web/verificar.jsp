
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CAMBIO AUTOMATICO DE USUARIO SIN LOGEO</title>
    </head>
    <body>
        <h1>CAMBIAR DE USUARIO RAPIDO SIN LOGEO</h1>
        <c:choose >
            <c:when test="${param.n eq 1}">
                <c:set var="user" scope="session" value="Digitador"/>
                <c:set var="nivel" scope="session" value="1"/>
                <c:set var="nombre" scope="session" value="Ingresar libro"/>
                <c:set var="clave" scope="session" value="1234"/>
            </c:when>
            <c:when test="${param.n eq 2}">
                <c:set var="user" scope="session" value="Modificador"/>
                <c:set var="nivel" scope="session" value="2"/>
                <c:set var="nombre" scope="session" value="Actualizar o eliminar libro"/>
                <c:set var="clave" scope="session" value="1234"/>
            </c:when>
            <c:when test="${param.n eq 0}">
                <c:set var="user" scope="session" value="Usuario"/>
                <c:set var="nivel" scope="session" value="0"/>
                <c:set var="nombre" scope="session" value="Visualizar libros"/>
                <c:set var="clave" scope="session" value="1234"/>
            </c:when>
        </c:choose>
        <p style="color:red;">
            <br>Dentro de unos segundos sera redirigido a la pagina de INICIO</p>
        <script>
            setTimeout(function () {
                location.href = "index.jsp";
            }, 5000);
        </script>
    </body>
</html>
