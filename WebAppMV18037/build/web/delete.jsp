<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ include file="fuentedatos.jsp" %>

<c:set var="pageId" value="Delete" />
<c:set var="standalone" value="not" />
<%@ include file="seguridad.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ELIMINAR UN LIBRO DE LA TABLA</title>
            <!--Inicio de codigo de bootstrap-->
    <!-- Codigo CSS bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- Codigo JS bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
    crossorigin="anonymous"></script>
<!--Fin de codigo de bootstrap-->
    </head>    
    <body>
        <%@include file="header.jsp"%>
        <div style="background-color: lightpink; margin: 2% 20% 2% 20%;">
            <h1 style="text-align: center; padding: 3% 0 3% 0;">Libro eliminado correctamente</h1>
            <a href="index.jsp"><button class="btn btn-secondary" style="margin: 1% 1% 1% 1%;">Volver</button></a>
        </div>
        
        <sql:query dataSource = "${fuenteDatos}" var = "result">
            SELECT * from libro where id=?;
            <sql:param value="${param.id}"/>
        </sql:query>
        <c:if test="${empty param.id}">
            <c:redirect url="error.jsp">
                <c:param name="tipo" value="parametro"/>
                <c:param name="destino" value="index.jsp"/>
            </c:redirect>
        </c:if>
        <c:if test="${empty result.rows}">
            <c:redirect url="error.jsp">
                <c:param name="tipo" value="parametro"/>
                <c:param name="destino" value="index.jsp"/>
            </c:redirect>
        </c:if>
        <c:forEach var = "row" items = "${result.rows}">
        <c:set var = "libroId" value = "${param.id}"/>
        <div style="width: 50%;margin-left: 25%;">
        <table class="table table-bordered">
            <thead ><h4>Libro eliminado:</h4></thead>
            <tr>
                <th>ID:</th>
                <th><c:out value = "${row.id}"/></th>
            </tr>
            <tr>
                <th>ISBN:</th>
                <th><c:out value = "${row.isbn}"/></th>
            </tr>
            <tr>
                <th>TITULO:</th>
                <th><c:out value = "${row.titulo}"/></th>
            </tr>
            <tr>
                <th>AUTOR:</th>
                <th><c:out value = "${row.autor}"/></th>
            </tr>
            <tr>
                <th>EDITORIAL:</th>
                <th><c:out value = "${row.editorial}"/></th>
            </tr>
        </table>
            </div>
            </c:forEach>
        <sql:update dataSource = "${fuenteDatos}" var = "count">
            DELETE from libro WHERE  id=?
            <sql:param value = "${libroId}" />
        </sql:update>
            
    </body>
</html>
