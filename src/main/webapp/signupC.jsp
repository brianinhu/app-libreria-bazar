<%-- 
    Document   : signup
    Created on : 18 jun. 2023, 12:21:06
    Author     : Brian
--%>

<%@page import="libreria.modelo.dao.GeneroDAO"%>
<%@page import="libreria.modelo.bean.Genero"%>
<%@page import="java.util.ArrayList"%>
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
                            <a href="#" class="logo">
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
            <form id="form-singup" class="container" action="signupC" method="post" accept-charset="UTF-8">
                <div class="row">
                    <div class="col">
                        <div style="text-align: left; width: 600px;">
                            <span style="font-weight: bold; font-size: 2rem;">REGÍSTRESE</span>
                        </div>
                        <input type="hidden" id="txtidcliente" name="txtidcliente">
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="txtnombre" name="txtnombre" required="">
                            <label for="txtnombre">Nombre (*)</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="txtapaterno" name="txtapaterno" required="">
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
                                    ArrayList<Genero> listaGeneros = new GeneroDAO().tolist();
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
                            <input type="email" class="form-control" id="txtemail" name="txtemail" required="">
                            <label for="txtemail">Email (*)</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="password" class="form-control" id="txtcontrasena" name="txtcontrasena" required="">
                            <label for="txtcontrasena">Contraseña (*)</label>
                        </div>
                        <div class="d-grid gap-2 col-6 mx-auto">
                            <button id="btn-registrar" class="btn btn-success" type="submit">Registrar</button>
                        </div>
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
        </script>
    </body>
</html>
