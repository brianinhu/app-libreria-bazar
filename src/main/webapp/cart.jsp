<%@page import="libreria.modelo.bean.Carrito"%>
<%@page import="libreria.modelo.dao.ProductoDAO"%>
<%@page import="libreria.modelo.bean.Producto"%>
<%@page import="java.util.ArrayList"%>
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
            /*Estilo de la tabla*/
            .table tr {
                text-align: center;
            }

            .table td {
                text-align: center;
                vertical-align: middle;
            }
            /*Estilo de la tabla*/

            /* Estilos para los botones y el input */
            .quantity-control {
                display: flex;
                align-items: center;
            }
            .quantity-control button {
                padding: 5px 10px;
                font-size: 16px;
                cursor: pointer;
            }
            .quantity-control input {
                width: 50px;
                text-align: center;
                margin: 0 5px;
                padding: 5px;
                font-size: 16px;
            }
        </style>
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
                                <span class="countCart cart-count"></span>
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
                                <span class="countCart cart-count"></span>
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
            <c:forEach var="categoria" items="${categorias}">
                <a href="${pageContext.request.contextPath}/categoria/${categoria.slug}">
                    ${categoria.categoria}
                </a>
                <span></span>
            </c:forEach>
        </nav>

        <section>
            <div class="container">
                <h3>Carrito de compras</h3>
                <p><span class="countCart"></span> items en el carrito</p>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-8">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Imagen</th>
                                    <th>Nombre</th>
                                    <th>Precio</th>
                                    <th>Cantidad</th>
                                    <th>Subtotal</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    ArrayList<Carrito> listaCarrito = (ArrayList<Carrito>) request.getSession().getAttribute("cart");
                                    for (Carrito product : listaCarrito) {
                                %>
                                <tr>
                                    <td><img src="<%=product.getImagen()%>" alt="img" width="100"/></td>
                                    <td><%=product.getNombre()%></td>
                                    <td><%=product.getPrecio()%></td>
                                    <td>
                                        <div class="quantity-control">
                                            <button class="btn-decrement" data-sku="<%=product.getSKU()%>">-</button>
                                            <input data-sku="<%=product.getSKU()%>" type="number" value="<%=product.getCantidad()%>" min="1" readonly />
                                            <button class="btn-increment" data-sku="<%=product.getSKU()%>">+</button>
                                        </div>
                                    </td> 
                                    <td>
                                        <span data-subtotal="<%=product.getSKU()%>"><%=product.getSubtotal()%></span>
                                    </td>
                                    <td><button class="btn btn-danger btn-delete" data-sku="<%=product.getSKU()%>">Eliminar</button></td>
                                </tr>
                                <%}%>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-4">
                        <div class="card">
                            <div class="card-header text-center">
                                <label class="fw-bold">Boleta</label>
                            </div>
                            <div class="card-body">
                                <label class="label">Subtotal</label>
                                <input type="text" class="totalPay form-control" readonly>
                                <label class="label">Descuento</label>
                                <input type="text" class="form-control" value="S/. 0" readonly>
                                <label class="label">Total a pagar</label>
                                <input type="text" class="totalPay form-control" readonly>
                            </div>
                            <div class="card-footer d-grid gap-2">
                                <a href="<%= request.getContextPath()%>" class="btn btn-success">Seguir comprando</a>
                                <a href="<%= request.getContextPath()%>/checkout" class="btn btn-warning">Finalizar compra</a>
                            </div>
                        </div>
                        <p class="small text-center m-0">${message}</p>
                    </div>
                </div>
            </div>
        </section>

        <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
        <script type="text/javascript">

            async function updateItemQuantity(SKU, tipo) {
                try {
                    let response = await fetch("cart?action=update", {
                        method: "POST",
                        headers: {"Content-Type": "application/json"},
                        body: JSON.stringify({sku: SKU, type: tipo})
                    });

                    if (response.ok) {
                        let data = await response.json();
                        let subtotalElement = document.querySelector('span[data-subtotal="' + SKU + '"]');
                        if (subtotalElement) {
                            subtotalElement.textContent = data.nuevoSubtotal;
                        }
                        getCartTotal();
                    } else {
                        console.error("Error al actualizar la cantidad");
                    }
                } catch (error) {
                    console.error("Error en la solicitud:", error);
                }
            }

            async function removeItem(SKU) {
                try {
                    let response = await fetch("cart?action=remove", {
                        method: "POST",
                        headers: {"Content-Type": "application/json"},
                        body: JSON.stringify({sku: SKU})
                    });

                    if (response.ok) {
                        let data = await response.json();
                        updateCartTable(data.cart);
                        getTotalItems();
                        getCartTotal();
                    } else {
                        console.error("Error al eliminar producto del carrito");
                    }
                } catch (error) {
                    console.error("Error en la solicitud:", error);
                }
            }

            function increment(SKU) {
                let input = document.querySelector('.quantity-control  input[data-sku="' + SKU + '"]');
                let valor = parseInt(input.value) || 0;
                input.value = valor + 1;
                updateItemQuantity(SKU, 'increment');
            }

            function decrement(SKU) {
                let input = document.querySelector('.quantity-control  input[data-sku="' + SKU + '"]');
                let valor = parseInt(input.value) || 0;
                if (valor > 1) {
                    input.value = valor - 1;
                    updateItemQuantity(SKU, 'decrement');
                } else {
                    alert("El valor no puede ser menor a 1");
                }
            }

            function updateCartTable(cart) {
                let tableBody = document.querySelector(".table tbody");
                tableBody.innerHTML = "";
                console.log(cart);
                cart.forEach(product => {
                    tableBody.innerHTML += `
                    <tr>
                            <td><img src="readImage?SKUProducto=\${product.SKU}" alt="img" width="100"/></td>
                        <td>\${product.nombre}</td>
                        <td>\${product.precio}</td>
                        <td>
                            <div class="quantity-control">
                                <button class="btn-decrement" data-sku="\${product.SKU}">-</button>
                                <input data-sku="\${product.SKU}" type="number" value="\${product.cantidad}" min="1" readonly />
                                <button class="btn-increment" data-sku="\${product.SKU}">+</button>
                            </div>
                        </td>
                        <td>
                            <span data-subtotal="\${product.SKU}">\${product.subtotal}</span>
                        </td>
                        <td><button class="btn btn-danger btn-delete" data-sku="\${product.SKU}">Eliminar</button></td>
                    </tr>
                `;
                });
                
                console.log("DOM cargado al actualizar el carrito.");

                document.querySelectorAll('.btn-increment').forEach(button => {
                    button.addEventListener('click', function () {
                        var sku = this.getAttribute('data-sku');
                        increment(sku);
                    });
                });

                document.querySelectorAll('.btn-decrement').forEach(button => {
                    button.addEventListener('click', function () {
                        var sku = this.getAttribute('data-sku');
                        decrement(sku);
                    });
                });

                document.querySelectorAll('.btn-delete').forEach(button => {
                    button.addEventListener('click', function () {
                        var sku = this.getAttribute('data-sku');
                        removeItem(sku);
                    });
                });
            }

            document.addEventListener("DOMContentLoaded", function () {
                console.log("DOM cargado. Listo para eventos.");
                document.querySelectorAll('.btn-increment').forEach(button => {
                    button.addEventListener('click', function () {
                        var sku = this.getAttribute('data-sku');
                        increment(sku);
                    });
                });

                document.querySelectorAll('.btn-decrement').forEach(button => {
                    button.addEventListener('click', function () {
                        var sku = this.getAttribute('data-sku');
                        decrement(sku);
                    });
                });

                document.querySelectorAll('.btn-delete').forEach(button => {
                    button.addEventListener('click', function () {
                        var sku = this.getAttribute('data-sku');
                        removeItem(sku);
                    });
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
                        element.value = 'S/. ' + data.total;
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
