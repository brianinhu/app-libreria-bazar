<%@page import="libreria.modelo.bean.Cliente"%>
<%@page import="libreria.modelo.dao.GeneroDAO"%>
<%@page import="libreria.modelo.bean.Genero"%>
<%@page import="java.util.ArrayList"%>
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
            /* Cuadro de registro*/
            #form-singup {
                width: 700px !important;
            }

            #form-singup .col {
                padding: 2rem;
                margin: 1rem;
                border: 1px solid #e6e6e6;
                display: flex;
                flex-direction: column;
                border-radius: 15px;
            }

            #form-singup input {
                width: 600px;
            }

            #txtidgenero, #txttelefono {
                width: 300px !important;
            }

            #btn-registrar {
                width: 300px;
            }
            /* Cuadro de registro*/
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
            <form id="form-singup" autocomplete="off" class="container" action="signup" method="post" accept-charset="UTF-8">
                <div class="row">
                    <div class="col">
                        <div style="text-align: left; width: 600px;">
                            <span style="font-weight: bold; font-size: 2rem;">REGÍSTRESE</span>
                        </div>
                        <input type="hidden" id="txtidcliente" name="txtidcliente">
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="txtnombre" name="txtnombre" required>
                            <label for="txtnombre">Nombre (*)</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="txtapaterno" name="txtapaterno" required>
                            <label for="txtapaterno">Apellido paterno (*)</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="txtamaterno" name="txtamaterno">
                            <label for="txtamaterno">Apellido materno</label>
                        </div>
                        <div class="form-floating mb-3">
                            <select class="form-select" name="txtidgenero" id="txtidgenero">
                                <option value="0"></option>
                                <%
                                    ArrayList<Genero> listaGeneros = new GeneroDAO().toList();
                                    for (Genero g : listaGeneros) {
                                %>
                                <option value = <%=g.getIdgenero()%>><%=g.getGenero()%></option>
                                <%}%>
                            </select>
                            <label for="txtidgenero">Género</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="txttelefono" name="txttelefono">
                            <label for="txttelefono">Teléfono</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="email" class="form-control" id="txtemail" name="txtemail" required>
                            <label for="txtemail">Email (*)</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="password" class="form-control" id="txtcontrasena" name="txtcontrasena" autocomplete="new-password" required>
                            <label for="txtcontrasena">Contraseña (*)</label>
                        </div>
                        <div class="d-grid gap-2 col-6 mx-auto">
                            <button id="btn-registrar" class="btn btn-success" type="submit">Registrar</button>
                        </div>
                    </div>
                </div>
            </form>
        </section>

        <script>
            const trunk = "01234567890123456789";
            codeGenerate = (length) => {
                let code = "";
                for (let i = 0; i < length; i++) {
                    code += trunk.charAt(Math.floor(Math.random() * trunk.length));
                }
                return code;
            };

            var btnregistrar = document.getElementById("btn-registrar");
            btnregistrar.addEventListener("click", () => {
                let nombre = document.getElementById("txtnombre").value;
                let apaterno = document.getElementById("txtapaterno").value;

                let codigo = codeGenerate(3) + nombre.charAt(0).toUpperCase() + apaterno.charAt(0).toUpperCase() + codeGenerate(3);

                var idcliente = document.getElementById("txtidcliente");
                idcliente.value = codigo;
            });

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
