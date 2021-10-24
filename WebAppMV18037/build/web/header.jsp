<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="nav" style="margin: 3% 10% 3% 10%;">
    <div class="container-fluid">
        <div class="row">
            <div class="col" style="text-align: center">
                <h2>SISTEMA DE REGISTRO DE LIBROS</h2>
                <h6>${sessionScope.nombre}</h6>
                <b>${sessionScope.name}</b>
            </div>
            <div class="col" style="text-align: center">
                <c:if test="${not empty sessionScope.user}">
                    <c:if test="${sessionScope.user != 'Anonimo'}">
                        <span>
                            Usuario: ${sessionScope.user}</span><br>
                        <a href="logout.jsp"><button class="btn btn-danger">Cerrar sesion</button></a>
                    </c:if>
                </c:if>
    
    
                <c:if test="${empty sessionScope.user or sessionScope.user eq 'Anonimo'}">
                    <span>
                        <a href="frmlogin.jsp"><button class="btn btn-success">Iniciar sesion</button></a>
                    </span>
                </c:if>
            </div>
        </div>
    </div>
</nav>
