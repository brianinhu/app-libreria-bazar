<%-- 
    Document   : buySummary
    Created on : 5 jul. 2023, 18:03:50
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
        <section>
            <div class="container">
                <div class="row">
                    <div class="col-6 text-center">
                        <div class="card"> 
                            <div class="card-header">Datos personales</div>
                            <label>Puede completar los datos faltantes si desea</label>
                            <div class="card-body">
                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control" id="floatingInput1" placeholder="name@example.com" value="<%=c.getNombre()%>" readonly>
                                    <label for="floatingInput1">Nombre</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control" id="floatingInput2" placeholder="name@example.com" value="<%=c.getApaterno()%>" readonly>
                                    <label for="floatingInput2">Apellido paterno</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control" id="floatingInput3" placeholder="name@example.com" value="<%=c.getAmaterno() != null ? c.getAmaterno() : ""%>">
                                    <label for="floatingInput3">Apellido materno</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input type="email" class="form-control" id="floatingInput4" placeholder="name@example.com" value="<%=c.getEmail()%>" readonly>
                                    <label for="floatingInput4">Email</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control" id="floatingInput5" placeholder="name@example.com" value="<%=c.getTelefono() != null ? c.getTelefono() : ""%>">
                                    <label for="floatingInput5">Teléfono</label>
                                </div>
                            </div>
                        </div>
                        <div class="card"> 
                            <div class="card-header">Entrega</div>
                            <label>Puede completar los datos faltantes si desea</label>
                            <div class="card-body">
                                <p>Envio a domicilio</p>
                                <p>Recojo en tienda</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-6 text-center">
                        <div class="card">
                            <div class="card-header">Resumen de compra</div>
                            <div class="card-body">
                                <p>Aplicar descuento</p>
                                <input type="texte" name="name">
                                <p>Resumen de compra</p>
                                <div class="overflow-auto" style="max-height: 300px;">
                                    <div class="card mb-3" style="max-width: 540px;">
                                        <div class="row g-0">
                                            <div class="col-md-3">
                                                <img src="..." class="img-fluid rounded-start" alt="...">
                                            </div>
                                            <div class="col-md-6">
                                                <div class="card-body">
                                                    <p class="m-0 text-start">Nombre: <span></span></p>
                                                    <p class="m-0 text-start">SKU: <span></span></p>
                                                    <p class="m-0 text-start">Precio: <span></span></p>
                                                    <p class="m-0 text-start">Cantidad: <span></span></p>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="card-body w-100 h-100 d-flex justify-content-center align-items-center">
                                                    <span>PRECIO</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
