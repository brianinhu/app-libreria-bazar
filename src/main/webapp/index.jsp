<%-- 
    Document   : index
    Created on : 18 jun. 2023, 11:11:41
    Author     : Brian
--%>

<%@page import="libreria.modelo.bean.Cliente"%>
<%@page import="libreria.modelo.dao.MarcaDAO"%>
<%@page import="libreria.modelo.bean.Marca"%>
<%@page import="libreria.modelo.dao.ProductoDAO"%>
<%@page import="libreria.modelo.bean.Producto"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/customer/layout.css"/>
        <link rel="stylesheet" href="css/customer/layout-sections.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap" rel="stylesheet">
    </head>

    <body>
        <%
            Cliente c = (Cliente) request.getSession().getAttribute("customer");
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
                    <% } %>
                </div>
            </header-button>
        </header>

        <nav id="nav-principal">
            <a href="">BOLÍGRAFOS Y LÁPICES</a>
            <span></span>
            <a href="">PAPEL Y SOBRES</a>
            <span></span>
            <a href="">CUADERNOS Y LIBRETAS</a>
            <span></span>
            <a href="">MANUALIDADES</a>
            <span></span>
            <a href="">DIBUJO Y ARTE</a>
            <span></span>
            <a href="">ESCOLAR</a>
            <span></span>
            <a href="">OFICINA</a>
            <span></span>
            <a href="">LIBROS</a>
        </nav>

        <section>
            <article id="article-3">
                <div class="title-3 pt-5">
                    <span>LO MÁS VENDIDO</span>
                </div>
                <div class="container-fluid p-5">
                    <div class="row g-4 row-cols-sm-2 row-cols-md-3 row-cols-lg-4">
                        <%
                            ArrayList<Producto> listaProducto = new ProductoDAO().tolist();
                            for (Producto p : listaProducto) {
                        %>
                        <div class="col">
                            <div class="card card-product">
                                <div class="card-body">
                                    <div class="text-center position-relative ">
                                        <div class=" position-absolute top-0 start-0">
                                            <span class="badge bg-success">Stock</span>
                                        </div>
                                        <a href="#">
                                            <img src="readImage?SKUProducto=<%=p.getSKU()%>" class="mb-3" width="150" height="180">
                                        </a>
                                    </div>
                                    <div class="text-small mb-1">
                                        <a href="#" class="text-decoration-none text-muted">
                                            <%
                                                Marca m = new Marca();
                                                m.setIdmarca(p.getIdmarca());
                                                m = new MarcaDAO().read(m);
                                            %>
                                            <small><%=m.getMarca()%></small>
                                        </a>
                                    </div>
                                    <h2 class="fs-6">
                                        <a href="#" class="text-inherit text-decoration-none"><%=p.getNombre()%></a>
                                    </h2>
                                    <div class="text-truncate" style="max-width: 600px;">
                                        <%=p.getDescripcion()%>
                                    </div>
                                    <div class="d-flex justify-content-between align-items-center mt-3">
                                        <div>
                                            <span class="text-dark">S/. <%=p.getPrecio()%></span>
                                        </div>
                                        <div>
                                            <button onclick="addItem('<%=p.getSKU()%>')" class="btn btn-primary btn-sm">
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
                        <%}%>
                    </div>
                </div>
            </article>
        </section>

        <footer class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <h5>Enlaces</h5>
                        <ul class="list-unstyled">
                            <li><a href="#">Inicio</a></li>
                            <li><a href="#">Productos</a></li>
                            <li><a href="#">Contacto</a></li>
                        </ul>
                    </div>
                    <div class="col-md-4">
                        <h5>Contacto</h5>
                        <p>Dirección: Av. Los Héroes 115, Lima, Perú</p>
                        <p>Teléfono: +51 987 654 321</p>
                        <p>Email: techoffice@gmail.com</p>
                    </div>
                    <div class="col-md-4">
                        <h5>Síguenos en redes sociales</h5>
                        <ul class="list-inline">
                            <li class="list-inline-item"><a href="#"><a href="#" class="fa fa-facebook"></a></li>
                            <li class="list-inline-item"><a href="#"><a href="#" class="fa fa-twitter"></a></li>
                            <li class="list-inline-item"><a href="#"><a href="#" class="fa fa-instagram"></a></li>
                        </ul>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 text-center">
                        <p>&copy; 2023 Todos los derechos reservados</p>
                    </div>
                </div>
            </div>
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
        crossorigin="anonymous"></script>
        <script>
            async function addItem(SKU) {
                let response = await fetch("cart?action=add", {
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
