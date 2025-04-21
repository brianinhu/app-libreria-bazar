<%@page import="libreria.modelo.dao.MarcaDAO"%>
<%@page import="libreria.modelo.bean.Marca"%>
<%@page import="libreria.modelo.bean.Cliente"%>
<%@ page import="java.util.ArrayList, libreria.modelo.bean.Producto, libreria.modelo.bean.Categoria" %>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${categoria.categoria} - Tienda</title>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/customer/layout.css"/>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/customer/layout-category.css"/>
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
                        <a href="<%= request.getContextPath()%>/logout" class="nav-link">
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

        <main class="container-fluid">
            <p>${categoria.categoria}</p>
            <div class="row m-0">
                <section id="category-section-1" class="col-3">
                    <span>Búsqueda por filtrado</span>
                </section>
                <section id="category-section-2" class="col-9 container p-5">
                    <div class="row row-cols-sm-2 row-cols-md-3 row-cols-lg-4">
                        <c:forEach var="producto" items="${productos}">
                            <div class="col p-0 product-col">
                                <div class="card card-product rounded-0 border-0">
                                    <div class="card-body p-2">
                                        <div class="text-center position-relative div-img">
                                            <div class=" position-absolute top-0 start-0">
                                                <span class="badge bg-success">Stock</span>
                                            </div>
                                            <a href="${pageContext.request.contextPath}/producto/${producto.slug}">
                                                <img src="${pageContext.request.contextPath}/${producto.imagen}" loading="lazy">
                                            </a>
                                        </div>
                                        <div class="mb-1">
                                            <a href="#" class="text-decoration-none text-muted">
                                                <small class="text-uppercase">${producto.marca.marca}</small>
                                            </a>
                                        </div>
                                        <small class="product-name">
                                            <a href="#" class="text-decoration-none text-dark text-uppercase">${producto.nombre}</a>
                                        </small>
                                        <div class="d-flex justify-content-between align-items-center">
                                            <div>
                                                <span class="text-dark product-price">S/ ${producto.precio}</span>
                                            </div>
                                            <div>
                                                <button onclick="addItem('${producto.SKU}')" class="btn btn-primary btn-sm product-button-add">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24"
                                                         fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                                         stroke-linejoin="round" class="feather feather-plus">
                                                    <line x1="12" y1="5" x2="12" y2="19"></line>
                                                    <line x1="5" y1="12" x2="19" y2="12"></line>
                                                    </svg> Agregar
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </section>
            </div>
        </main>

        <footer>FOOTER</footer>

        <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
        crossorigin="anonymous"></script>
        <script>
                                                    const baseUrl = "<%= request.getContextPath()%>";

                                                    async function addItem(SKU) {
                                                        let response = await fetch(`\${baseUrl}/cart?action=add`, {
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
                                                        let response = await fetch(`\${baseUrl}/cart?action=count`);

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