<%@page import="libreria.modelo.bean.Cliente"%>
<%@page import="libreria.modelo.dao.MarcaDAO"%>
<%@page import="libreria.modelo.bean.Marca"%>
<%@page import="libreria.modelo.dao.ProductoDAO"%>
<%@page import="libreria.modelo.bean.Producto"%>
<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/customer/layout.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap" rel="stylesheet">
    </head>

    <body>
        <header>
            <%
                Cliente c = (Cliente) request.getSession().getAttribute("customer");
            %>
            <header-top>
            </header-top>
            <header-button>
                <div id="col1">
                    <a href="<%= request.getContextPath()%>" class="logo">
                        <img src="<%= request.getContextPath()%>/img/tech-office/logo-white-transp.png"
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

        <main>
            <section id="index-section-1">
                EN MANTENIMIENTO
                <br>
                Hola: ${baseURLServlet}
            </section>

            <p> Contenido creado para la rama test-2</p>
        </main>

        <footer>FOOTER</footer>

        <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
        crossorigin="anonymous"></script>
        <script>
            async function addItem(SKU) {
                let response = await fetch(`${baseURLServlet}/cart?action=add`, {
                    method: "POST",
                    headers: {"Content-Type": "application/json"},
                    body: JSON.stringify({sku: SKU})
                });

                if (response.ok) {
                    getTotalItems();
                } else {
                    console.error("Error al agregar producto al carrito");
                }
            }

            async function getTotalItems() {
                let response = await fetch(`${baseURLServlet}/cart?action=count`);

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
