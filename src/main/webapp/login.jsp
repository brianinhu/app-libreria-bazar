<%-- 
    Document   : login
    Created on : 18 jun. 2023, 12:20:43
    Author     : Brian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800;900&display=swap"
              rel="stylesheet">
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
            String mensajeError = (String) request.getAttribute("msg");
        %>
        <header>
            <header-top>

            </header-top>

            <header-button>
                <div class="container-fluid">
                    <div class="row">
                        <div id="col1" class="col-12">
                            <a href="<%= request.getContextPath()%>" class="logo">
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
                                <a href="#" class="nav-link">
                                    <i class="bi bi-cart-fill"></i>
                                    <span>Carrito</span>
                                </a>
                                <a href="viewLoginC" class="nav-link">
                                    <i class="bi bi-person-circle"></i>
                                    <span>Iniciar sesión</span>
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
                        <a href="#article-1">OFERTAS</a>
                    </div>
                    <span></span>
                    <div id="col2">
                        <a href="#article-2">CATEGORÍAS</a>
                    </div>
                    <span></span>
                    <div id="col3">
                        <a href="#article-3">LO MÁS VENDIDO</a>
                    </div>
                </div>
            </div>
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
    </body>
</html>
