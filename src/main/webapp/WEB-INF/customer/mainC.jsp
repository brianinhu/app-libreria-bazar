<%-- 
    Document   : main
    Created on : 18 jun. 2023, 17:03:02
    Author     : Brian
--%>

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
        <link rel="stylesheet" type="text/css" href="CSS/styleC.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    </head>
    <body>
        <%
            Cliente c = (Cliente) request.getSession().getAttribute("customer");
        %>

        <header>
            LIBRERIA
        </header>
        <nav id="nav1">
            <span>Bienvenido, <%=c.getNombre()%> <%=c.getApaterno()%></span><span><a href="logoutC">Cerrar sesión</a></span>
        </nav>
        <nav id="nav2">
            <a href="viewMainC" class="btn btn-info">Home</a>
            <a href="viewCart" class="btn btn-success">
                <div class="cart-icon">
                    <i class="bi bi-cart-fill"></i>
                    <span class="cart-count">${quantityProductToCart}</span>
                </div>
                <span>Carrito</span>
            </a>
        </nav>
        <section>
            <div class="container">
                <div class="row">
                    <%
                        ArrayList<Producto> arrProducts = new ProductoDAO().tolist();
                        for (Producto p : arrProducts) {
                    %>
                    <div class="col-6 col-sm-6 col-md-4 g-3">
                        <div class="card" style="width: 400px;">
                            <div id="div-img">
                                <img src="readImage?SKUProducto=<%=p.getSKU()%>" alt="img" width="250" height="250">
                            </div>
                            <div class="card-body">
                                <h5 class="card-title"><%=p.getNombre()%></h5>
                            </div>
                            <div class="card-footer">
                                <label>S/ <%=p.getPrecio()%></label>
                                <div class="d-grid">
                                    <a href="addtoCart?SKU=<%=p.getSKU()%>" class="btn btn-primary">Agregar al carrito</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%}%>
                </div>
            </div>
        </section>
        <footer>

        </footer>
    </body>
</html>
