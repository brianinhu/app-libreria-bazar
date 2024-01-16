<%-- 
    Document   : cartC
    Created on : 3 jul. 2023, 18:01:59
    Author     : Brian
--%>

<%@page import="libreria.modelo.bean.Carrito"%>
<%@page import="libreria.modelo.dao.ProductoDAO"%>
<%@page import="libreria.modelo.bean.Producto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="libreria.modelo.bean.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css-customer/layout.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800;900&display=swap"
              rel="stylesheet">
        <style>
            /*Estilo de la tabla*/
            .table tr {
                text-align: center;
            }

            .table td {
                text-align: center;
                vertical-align: middle;
            }
            /*Estilo de la tabla*/

            /*Estilo del input de cantidad*/
            .input-group {
                width: 150px !important;
                display: inline-flex !important;
            }
            /*Estilo del input de cantidad*/
        </style>
    </head>
    <body>
        <%
            Cliente c = (Cliente) request.getSession().getAttribute("customer");
        %>
        <header>
            <header-top>
                <div class="container-fluid">
                    <div class="row">
                        <div id="col1" class="col-12">
                            <div class="slider">
                                <div class="slide-track">
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-1.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-2.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-3.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-4.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-5.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-6.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-7.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-8.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-9.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-10.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-11.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-12.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-13.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-14.png" alt="">
                                    </div>

                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-1.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-2.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-3.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-4.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-5.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-6.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-7.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-8.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-9.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-10.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-11.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-12.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-13.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-14.png" alt="">
                                    </div>

                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-1.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-2.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-3.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-4.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-5.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-6.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-7.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-8.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-9.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-10.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-11.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-12.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-13.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-14.png" alt="">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </header-top>
            <header-button>
                <div class="container-fluid">
                    <div class="row">
                        <div id="col1" class="col-12">
                            <a href="viewMainC" class="logo">
                                <img src="img/tech-office/logo-white-transp.png"
                                     alt="logo-generico">
                            </a>
                            <form class="d-flex" role="search">
                                <input class="form-control rounded-end-0 shadow-none" type="search"
                                       placeholder="¿Qué desea buscar?">
                                <button class="btn btn-success rounded-start-0" type="submit"><i
                                        class="bi bi-search"></i></button>
                            </form>
                            <nav id="nav-secundario">
                                <a href="viewCart" class="nav-link">
                                    <div class="cart-icon">
                                        <i class="bi bi-cart-fill"></i>
                                        <span class="cart-count">${quantityProductToCart}</span>
                                    </div>
                                    <span>Carrito</span>
                                </a>
                                <a href="#" class="nav-link">
                                    <i class="bi bi-person-circle"></i>
                                    <span><%=c.getNombre()%> <%=c.getApaterno()%></span>
                                </a>
                                <a href="logoutC" class="nav-link">
                                    <i class="bi bi-box-arrow-left"></i>
                                    <span>Cerrar sesión</span>
                                </a>
                            </nav>
                        </div>
                    </div>
                </div>
            </header-button>
        </header>

        <nav id="nav-principal">
            <div class="container-fluid">
                <div class="row">
                    <div id="col1">
                        <a href="#row1">OFERTAS</a>
                    </div>
                    <span></span>
                    <div id="col2">
                        <a href="#row2">CATEGORÍAS</a>
                    </div>
                    <span></span>
                    <div id="col3">
                        <a href="#row3">LO MÁS VENDIDO</a>
                    </div>
                </div>
            </div>
        </nav>

        <section>
            <div class="container">
                <h3>Carrito de compras</h3>
                <p><span id="cantidadItems">${quantityProductToCart}</span> items en el carrito</p>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-8">
                        <table class="table">
                            <tr>
                                <th>Imagen</th>
                                <th>Nombre</th>
                                <th>Precio</th>
                                <th>Cantidad</th>
                                <th>Subtotal</th>
                                <th></th>
                            </tr>
                            <%
                                ArrayList<Carrito> listaCarrito = (ArrayList<Carrito>) request.getAttribute("cart");
                                for (Carrito cp : listaCarrito) {
                            %>
                            <tr>
                                <td><img src="readImage?SKUProducto=<%=cp.getSKU()%>" alt="img" width="100"/></td>
                                <td><%=cp.getNombre()%></td>
                                <td><%=cp.getPrecio()%></td>
                                <td>
                                    <input type="hidden" id="txtSKU" value="<%=cp.getSKU()%>">
                                    <input id="input-cantidad" type="number" value="<%=cp.getCantidad()%>" min="1"/></td>
                                <td><%=cp.getSubtotal()%></td>
                            <input type="hidden" value="<%=cp.getSubtotal()%>" id="subtotal">
                            <td><a class="btn btn-danger" href="deletetoCart?SKU=<%=cp.getSKU()%>">Eliminar</a></td>
                            </tr>
                            <%}%>
                        </table>
                    </div>
                    <div class="col-4">
                        <div class="card">
                            <div class="card-header text-center">
                                <label class="fw-bold">Boleta</label>
                            </div>
                            <div class="card-body">
                                <label class="label">Subtotal</label>
                                <input type="text" class="form-control" value="S/. ${fullPay}" readonly>
                                <label class="label">Descuento</label>
                                <input type="text" class="form-control" value="S/. 0" readonly>
                                <label class="label">Total a pagar</label>
                                <input type="text" class="form-control" value="S/. ${fullPay}" readonly>
                            </div>
                            <div class="card-footer d-grid gap-2">
                                <a href="viewMainC" class="btn btn-success">Seguir comprando</a>
                                <a href="viewBuySummary" class="btn btn-warning">Finalizar compra</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <footer class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <h5>Enlaces</h5>
                        <ul class="list-unstyled">
                            <li><a href="#">Inicio</a></li>
                            <li><a href="#">Productos</a></li>
                            <li><a href="#">Servicios</a></li>
                            <li><a href="#">Contacto</a></li>
                        </ul>
                    </div>
                    <div class="col-md-4">
                        <h5>Contacto</h5>
                        <p>Dirección: Calle Principal, Ciudad</p>
                        <p>Teléfono: 123-456-7890</p>
                        <p>Email: info@example.com</p>
                    </div>
                    <div class="col-md-4">
                        <h5>Síguenos en redes sociales</h5>
                        <ul class="list-inline">
                            <li class="list-inline-item"><a href="#"><i class="fab fa-facebook"></i></a></li>
                            <li class="list-inline-item"><a href="#"><i class="fab fa-twitter"></i></a></li>
                            <li class="list-inline-item"><a href="#"><i class="fab fa-instagram"></i></a></li>
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
        <script src="JS/scriptCart.js" type="text/javascript"></script>
        <script src="JS/bootstrap-input-spinner.js" type="text/javascript"></script>
        <script>
            $("input[type='number']").inputSpinner();
        </script>
    </body>
</html>
