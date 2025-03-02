<%@page import="libreria.modelo.bean.Cliente"%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/customer/layout.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap" rel="stylesheet">
        <style>
            /* Cuadro de inicio de sesión */
            #form-login {
                width: 500px !important;
            }

            #form-login .col {
                padding: 2rem;
                margin: 1rem;
                border: 1px solid #e6e6e6;
                display: flex;
                justify-content: center;
                align-items: center;
                flex-direction: column;
                border-radius: 15px;
            }
            /* Cuadro de inicio de sesión */
        </style>
    </head>
    <body>
        <%
            Cliente c = (Cliente) request.getSession().getAttribute("customer");
            String mensajeError = (String) request.getAttribute("msg");
        %>
        <header>
            <header-top>
            </header-top>
            <header-button>
                <div id="col1">
                    <a href="<%= request.getContextPath()%>" class="logo">
                        <img src="img/tech-office/logo-white-transp.png"
                             alt="logo-generico">
                    </a>
                    <% if (c != null) {%>
                    <div id="group-links">
                        <a href="<%= request.getContextPath()%>/cart" class="nav-link">
                            <div class="cart-icon">
                                <i class="bi bi-cart-fill"></i>
                                <span id="countCart" class="cart-count"></span>
                            </div>
                            <span>Carrito</span>
                        </a>
                        <a href="#" class="nav-link">
                            <i class="bi bi-person-circle"></i>
                            <span>¡Hola, <%=c.getNombre()%>!</span>
                        </a>
                        <a href="logout" class="nav-link">
                            <i class="bi bi-box-arrow-left"></i>
                            <span>Cerrar sesión</span>
                        </a>
                    </div>
                    <% } else {%>
                    <div id="group-links">
                        <a href="<%= request.getContextPath()%>/cart">
                            <div class="cart-icon">
                                <i class="bi bi-cart-fill"></i>
                                <span id="countCart" class="cart-count"></span>
                            </div>
                            <span>Carrito</span>
                        </a>
                        <a href="<%= request.getContextPath()%>/login">
                            <i class="bi bi-person-circle"></i>
                            <span>Iniciar sesión</span>
                        </a>
                    </div>
                    <% }%>
                </div>
            </header-button>
        </header>

        <nav id="nav-principal">
            <c:forEach var="categoria" items="${categorias}">
                <a href="${pageContext.request.contextPath}/categoria/${categoria.slug}">
                    ${categoria.categoria}
                </a>
                <span></span>
            </c:forEach>
        </nav>

        <section>
            <form id="form-login" class="container" action="login" method="post">
                <div class="row">
                    <div class="col">
                        <span style="font-weight: bold; font-size: 2rem;">INICIAR SESIÓN</span>
                        <div class="mb-3">
                            <label for="exampleInputEmail1" class="form-label">Email</label>
                            <input type="email" name="txtemail" class="form-control" id="exampleInputEmail1">
                        </div>
                        <div class="mb-3">
                            <label for="exampleInputPassword1" class="form-label">Contraseña</label>
                            <input type="password" name="txtcontrasena" class="form-control" id="exampleInputPassword1">
                        </div>
                        <div class="mb-3 form-check">
                            <input type="checkbox" class="form-check-input" id="exampleCheck1">
                            <label class="form-check-label" for="exampleCheck1">Recordarme</label>
                        </div>
                        <button type="submit" class="btn btn-primary mb-2">Ingresar</button>
                        <span><%=mensajeError != null ? mensajeError : ""%></span>
                        <span style="display: block;">No tienes una cuenta? <a href="<%= request.getContextPath()%>/signup">Regístrate aquí</a></span>
                    </div>
                </div>
            </form>
        </section>
                    
        <script>
            async function getTotalItems() {
                let response = await fetch("cart?action=count");

                if (response.ok) {
                    let data = await response.json();
                    let element = document.getElementById("countCart");
                    element.textContent = data.count;
                } else {
                    console.error("Error al obtener cantidad de productos del carrito");
                }
            }

            document.addEventListener("DOMContentLoaded", getTotalItems);
        </script>
    </body>
</html>
