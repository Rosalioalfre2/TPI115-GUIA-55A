<%-- 
    Document   : index
    Created on : 10-22-2021, 11:29:36 PM
    Author     : rosalio
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ include file="fuentedatos.jsp" %>

<c:set var="pageId" value="Index" />
<c:set var="standalone" value="not" />
<%@ include file="seguridad.jsp" %>
<!DOCTYPE html>
<html>
    <%@ include file="bootstrap.jsp" %>
    <body>
        <%@ include file="header.jsp" %>
      
        <div class="main">
            <div class="Ingresar" style="width: 50%; margin-left: 25%;">
                <c:if test="${sessionScope.nivel eq 1}">
                    <div class="contenedor">
                        <h2 style="text-align: center; color: darkolivegreen">Agregar un libro</h2>
                        <form class="px-4 py-3" action="./insert.jsp">
                            <div class="form-group">
                                <label for="text">ISBN:</label>
                                <input type="text" class="form-control" id="isbn" name="isbn">
                            </div>
                            <div class="form-group">
                                <label for="text">TITULO:</label>
                                <input type="text" class="form-control" id="titulo" name="titulo">
                            </div>
                            <div class="form-group">
                                <label for="pwd">AUTOR:</label>
                                <input type="text" class="form-control" id="autor" name="autor">
                            </div>
                            <div class="form-group">
                                <label for="pwd">EDITORIAL:</label>
                                <input type="text" class="form-control" id="editorial" name="editorial">
                            </div>
                            <br>
                            <button type="submit" class="btn btn-primary">Aceptar</button>
                        </form>
                    </div><br>
                    <hr>
                </c:if>
            </div>
        
        <sql:query dataSource = "${fuenteDatos}" var = "result">
            SELECT * from libro;
        </sql:query>
            <div class="container">
                <h2  style="text-align: center;">Registro de la biblioteca</h2><br>
        <table class="table">
            <thead>
                <tr>
                    <th>ID Libro</th>
                    <th>ISBN</th>
                    <th>TITULO</th>
                    <th>AUTOR</th>
                    <th>EDITORIAL</th>
                    <c:if test="${sessionScope.nivel eq 2}">
                        <th>Acción</th>
                    </c:if>
                </tr>
            </thead>

            <c:forEach var = "row" items = "${result.rows}">
                <div id="cuerpoTablaLibros">
                    <tr>
                        <td style="text-align: center;">
                            <c:out value = "${row.id}"/>
                        </td>
                        <td style="text-align: center;"><c:out value = "${row.isbn}"/></td>
                        <td style="text-align: center;">
                            <c:out value = "${row.titulo}"/>
                        </td>
                        <td style="text-align: center;"><c:out value = "${row.autor}"/></td>
                        <td style="text-align: center;"><c:out value = "${row.editorial}"/></td>
                        <c:if test="${sessionScope.nivel eq 2}">
                        <td style="text-align: center; width: 150px;"><a href = "delete.jsp?id=${row.id}"><button type="button" class="btn btn-danger">Eliminar</button></a><br>
                            <a href="frmupdate.jsp?id=${row.id}"><button type="button" class="btn btn-success">Actualizar</button></a></td>
                        </c:if>
                    </tr>
                </div>
            </c:forEach>
        </table>
      </div>

       </div> 

    <div id="controlSesiones">
        <div class="row">
            <div class="col">
                <h2 style="text-align: center; margin-bottom: 1.2em; font-weight: bold; font-family: 'Times New Roman', Times, serif;">Cambiar de usuario</h2>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <p style="padding-left: 15px; font-size: 1.2em;">Usuario de nivel 1 (Insertar)</p>
            </div>
            <div class="col">
                <a href="verificar.jsp?n=1"><button type="button" class="btn btn-info" style="margin-left: 35%;">Iniciar sesion</button></a>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <p style="padding-left: 15px; font-size: 1.2em;">Usuario de nivel 2 (Eliminar y Actualizar)</p>
            </div>
            <div class="col">
                <a href="verificar.jsp?n=2"><button type="button" class="btn btn-info" style="margin-left: 35%;">Iniciar sesion</button></a>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <p style="padding-left: 15px; font-size: 1.2em;">Usuario de nivel 0 (Visualizar)</p>
            </div>
            <div class="col">
                <a href="verificar.jsp?n=0"><button type="button" class="btn btn-info" style="margin-left: 35%;">Iniciar sesion</button></a>
            </div>
        </div>
    </div>

    </body>
</html>
