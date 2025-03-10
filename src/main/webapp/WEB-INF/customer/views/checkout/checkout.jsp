<%-- 
    Document   : buySummary
    Created on : 5 jul. 2023, 18:03:50
    Author     : Brian
--%>

<%@page import="libreria.modelo.bean.Carrito"%>
<%@page import="libreria.modelo.bean.Pago"%>
<%@page import="libreria.modelo.dao.PagoDAO"%>
<%@page import="libreria.modelo.dao.DistritoDAO"%>
<%@page import="libreria.modelo.bean.Distrito"%>
<%@page import="libreria.modelo.dao.TiendaDAO"%>
<%@page import="libreria.modelo.bean.Tienda"%>
<%@page import="libreria.modelo.bean.Entrega"%>
<%@page import="libreria.modelo.dao.EntregaDAO"%>
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <style>
            body {
                min-height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            section {
                width: 1200px;
                height: 600px;
            }

            .nav-link {
                margin: 0;
                width: 100%;
            }

            #myTab {
                padding: 0;
            }

            .classtienda {
                padding: 1rem !important;
                border-radius: 15px !important;
                width: 200px !important;
                font-weight: bold !important;
            }

            #divizq, #divder {
                padding: 1rem;
            }

            #btn-tienda, #btn-delivery {
                background-color: #f2f2f2;
            }
        </style>
    </head>
    <body>
        <%
            Cliente c = (Cliente) request.getSession().getAttribute("customer");
        %>
        <section>
            <div class="container">
                <div class="row">
                    <div class="col-6" id="divizq">
                        <ul class="nav nav-tabs justify-content-center container" id="myTab" role="tablist">
                            <li class="nav-item col-4"  role="presentation">
                                <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab">Datos</button>
                            </li>
                            <li class="nav-item col-4" role="presentation">
                                <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab">Entrega</button>
                            </li>
                            <li class="nav-item col-4" role="presentation">
                                <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact-tab-pane" type="button" role="tab">Pago</button>
                            </li>
                        </ul>
                        <div class="tab-content" id="myTabContent">

                            <!-- DATOS PERSONALES -->
                            <div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">
                                <label>DATOS PERSONALES</label>

                                <table class="table">
                                    <tr>
                                        <td>Email:</td>
                                        <td><%=c.getEmail()%></td>
                                    </tr>
                                    <tr>
                                        <td>Nombre:</td>
                                        <td><%=c.getNombre()%></td>
                                    </tr>
                                    <tr>
                                        <td>Apellido paterno:</td>
                                        <td><%=c.getApaterno()%></td>
                                    </tr>
                                    <tr>
                                        <td>Apellido materno:</td>
                                        <td><%=c.getAmaterno() != null ? c.getAmaterno() : "-"%></td>
                                    </tr>
                                    <tr>
                                        <td>Teléfono:</td>
                                        <td><%=c.getTelefono() != null ? c.getTelefono() : "-"%></td>
                                    </tr>
                                </table>
                            </div>
                            <!-- DATOS PERSONALES -->

                            <!-- TIPO DE ENTREGA -->
                            <div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">
                                <p>Seleccione:</p>
                                <div class="row justify-content-center">
                                    <button id="btn-tienda" class="btn col-6 me-2 classtienda">
                                        <i class="bi bi-shop"></i>
                                        Recojo en tienda
                                    </button>
                                    <button id="btn-delivery" class="btn col-6 ms-2 classtienda">
                                        <i class="bi bi-truck"></i>
                                        Delivery
                                    </button>
                                </div>
                                <div id="div-direccion" style="display: none;">
                                    <p>Seleccione su distrito:</p>
                                    <select id="cbxDistrito" name="cbxDistrito">
                                        <option value="" selected></option>
                                        <%
                                            ArrayList<Distrito> listaDistrito = new DistritoDAO().toList();
                                            for (Distrito d : listaDistrito) {
                                        %>
                                        <option value="<%=d.getIddistrito()%>"><%=d.getDistrito()%></option>
                                        <%}%>
                                    </select>

                                    <p>Escriba su dirección:</p>
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" id="txtdireccion" placeholder="name@example.com">
                                        <label for="txtdireccion">Dirección</label>
                                    </div>
                                </div>
                                <div id="div-tienda" style="display: none;">
                                    <p>Seleccione tienda:</p>
                                    <select id="cbxTienda" name="cbxTienda">
                                        <option value="" selected></option>
                                        <%
                                            ArrayList<Tienda> listaTienda = new TiendaDAO().toList();
                                            for (Tienda t : listaTienda) {
                                        %>
                                        <option value="<%=t.getIdtienda()%>"><%=t.getTienda()%></option>
                                        <%}%>
                                    </select>
                                </div>
                            </div>
                            <!-- TIPO DE ENTREGA --> 

                            <!-- MEDIO DE PAGO -->               
                            <div class="tab-pane fade" id="contact-tab-pane" role="tabpanel" aria-labelledby="contact-tab" tabindex="0">
                                <p>Seleccione medio de pago</p>
                                <select id="cbxPago" name="cbxPago">
                                    <option value="" selected></option>
                                    <%
                                        ArrayList<Pago> listaPago = new PagoDAO().toList();
                                        for (Pago p : listaPago) {
                                    %>
                                    <option value="<%=p.getIdpago()%>"><%=p.getPago()%></option>
                                    <%}%>
                                </select>
                            </div>
                            <!-- MEDIO DE PAGO -->

                        </div>
                    </div>
                    <div class="col-6" id="divder">
                        <p>Resumen de compra</p>
                        <p><span class="countCart"></span> productos</p>
                        <div class="overflow-auto" style="max-height: 300px;">
                            <div class="card mb-3" style="max-width: 540px;">
                                <div class="row g-0">
                                    <%
                                        ArrayList<Carrito> cart = (ArrayList<Carrito>) request.getSession().getAttribute("cart");
                                        for (Carrito product : cart) {
                                    %>
                                    <div class="col-md-3">
                                        <img src="<%=product.getImagen()%>" class="img-fluid rounded-start" alt="img" width="100">
                                    </div>
                                    <div class="col-md-6">
                                        <div class="card-body">
                                            <p class="m-0 text-start">Nombre: <span><%=product.getNombre()%></span></p>
                                            <p class="m-0 text-start">SKU: <span><%=product.getSKU()%></span></p>
                                            <p class="m-0 text-start">Precio: <span><%=product.getPrecio()%></span></p>
                                            <p class="m-0 text-start">Cantidad: <span></span><%=product.getCantidad()%></p>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="card-body w-100 h-100 d-flex justify-content-center align-items-center">
                                            <span>S/. <%=product.getSubtotal()%></span>
                                        </div>
                                    </div>
                                    <%}%>
                                </div>
                            </div>
                        </div>
                        <p>TOTAL: S/. <input style="border: none; outline: none; background: transparent;" class="totalPay" readonly></input></p>
                        <div class="d-grid">
                            <input type="hidden" class="totalPay">
                            <input type="hidden" value="<%=c.getIdcliente()%>" id="idcliente">
                            <button class="btn btn-success btn-lg" id="btn-generarcompra">GENERAR COMPRA</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
        <script>

            let btntienda = document.getElementById("btn-tienda");
            let btndelivery = document.getElementById("btn-delivery");
            let divtienda = document.getElementById("div-tienda");
            let divdireccion = document.getElementById("div-direccion");

            let iddistrito = 0;
            let idtienda = 0;
            let identrega = 0;
            let idpago = 0;
            let direccion = "";

            btntienda.addEventListener("click", () => {
                btntienda.style.background = '#00e600';
                btntienda.style.color = '#fff';
                btndelivery.style.color = '#000';
                btndelivery.style.background = '#f2f2f2';

                divtienda.style.display = 'block';
                document.getElementById("cbxDistrito").value = '';
                document.getElementById("txtdireccion").value = '';
                divdireccion.style.display = 'none';

                identrega = 1;
            });

            btndelivery.addEventListener("click", () => {
                btntienda.style.background = '#f2f2f2';
                btntienda.style.color = '#000';
                btndelivery.style.color = '#fff';
                btndelivery.style.background = '#00e600';

                document.getElementById("cbxTienda").value = '';
                divtienda.style.display = 'none';
                divdireccion.style.display = 'block';

                identrega = 2;
            });

            const trunkNumber = "01234567890123456789";
            codeGenerateNumber = (length) => {
                let code = "";
                for (let i = 0; i < length; i++) {
                    code += trunkNumber.charAt(Math.floor(Math.random() * trunkNumber.length));
                }
                return code;
            };

            const trunkWord = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            codeGenerateWord = (length) => {
                let code = "";
                for (let i = 0; i < length; i++) {
                    code += trunkWord.charAt(Math.floor(Math.random() * trunkWord.length));
                }
                return code;
            };

            let btngenerarcompra = document.getElementById("btn-generarcompra");
            btngenerarcompra.addEventListener("click", () => {

                /*****Tabla Pedido*****/
                let codigo_Pedido = codeGenerateWord(4) + codeGenerateNumber(3);

                // Obtén la fecha actual
                let fecha = new Date();

                // Obtiene los componentes de la fecha
                let year = fecha.getFullYear();
                let month = fecha.getMonth() + 1; // Los meses van de 0 a 11, por eso se suma 1
                let day = fecha.getDate();

                // Formatea la fecha con ceros a la izquierda si es necesario
                let formattedDate = year + '-' + ('0' + month).slice(-2) + '-' + ('0' + day).slice(-2);

                // La variable formattedDate ahora contiene la fecha en formato YYYY-MM-DD

                let countElements = document.getElementsByClassName("totalPay");
                let totalPay = 0;
                Array.from(countElements).forEach(element => {
                    totalPay = element.value;
                });

                let idcliente = document.getElementById("idcliente").value;

                if (identrega === 1) {
                    idtienda = document.getElementById("cbxTienda").value;
                } else {
                    iddistrito = document.getElementById("cbxDistrito").value;
                    direccion = document.getElementById("txtdireccion").value;
                }

                idpago = document.getElementById("cbxPago").value;

                console.log(codigo_Pedido);
                console.log(formattedDate);
                console.log(totalPay);
                console.log(idcliente);
                console.log(iddistrito);
                console.log(idtienda);
                console.log(identrega);
                console.log(idpago);
                console.log(direccion);

                $.ajax({
                    url: "confirmation",
                    type: "POST",
                    data: {
                        codigo: codigo_Pedido,
                        fecha: formattedDate,
                        total: totalPay,
                        idcliente: idcliente,
                        iddistrito: iddistrito,
                        idtienda: idtienda,
                        identrega: identrega,
                        idpago: idpago,
                        direccion: direccion
                    },
                    success: function (response) {
                        window.location.href = "invoice?codigo=" + codigo_Pedido;
                    },
                    error: function (error) {
                        alert("Ocurrió un error.");
                    }
                });
            });

            async function getTotalItems() {
                let response = await fetch("cart?action=count");

                if (response.ok) {
                    let data = await response.json();
                    let countElements = document.getElementsByClassName("countCart");
                    Array.from(countElements).forEach(element => {
                        element.textContent = data.count;
                    });
                } else {
                    console.error("Error al obtener cantidad de productos del carrito");
                }
            }

            async function getCartTotal() {
                let response = await fetch("cart?action=total");

                if (response.ok) {
                    let data = await response.json();
                    let countElements = document.getElementsByClassName("totalPay");
                    Array.from(countElements).forEach(element => {
                        element.value = data.total;
                    });
                } else {
                    console.error("Error al obtener el pago total del carrito");
                }
            }

            document.addEventListener("DOMContentLoaded", getTotalItems);
            document.addEventListener("DOMContentLoaded", getCartTotal);
        </script>
    </body>
</html>
