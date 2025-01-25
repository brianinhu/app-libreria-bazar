<%-- 
    Document   : index
    Created on : 18 jun. 2023, 11:11:41
    Author     : Brian
--%>

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
        <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800;900&display=swap"
              rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>

    <body>
        <header>
            <header-top>
         
            </header-top>

            <header-button>
                <div class="container-fluid">
                    <div class="row">
                        <div id="col1" class="col-12">
                            <a href="" class="logo">
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
                                <a href="" class="nav-link">
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
            <article id="article-1">
                <div class="container-fluid">
                    <div id="row1" class="row">
                        <div id="col1" class="col-12">
                            <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                                <div class="carousel-indicators">
                                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                                </div>
                                <div class="carousel-inner">
                                    <div class="carousel-item active" data-bs-interval="3000">
                                        <img src="img/banners/banner-1.png" class="d-block w-100" alt="">
                                    </div>
                                    <div class="carousel-item" data-bs-interval="3000">
                                        <img src="img/banners/banner-2.png" class="d-block w-100" alt="">
                                    </div>
                                    <div class="carousel-item" data-bs-interval="3000">
                                        <img src="img/banners/banner-3.png" class="d-block w-100" alt="">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </article>

            <article id="article-2">
                <div class="slide-container">
                    <div class="pre-slide-inner">
                        <span>CATEGORÍAS</span>
                        <div class="div-button">
                            <div class="prev-button"><</div>
                            <div class="next-button">></div>
                        </div>
                    </div>
                    <div class="slide-inner">
                        <a class="slide-item" href="">
                            <img src="img/categorias/1.png" alt="">
                            <span>Bolígrafos y lápices</span>
                        </a>
                        <a class="slide-item" href="">
                            <img src="img/categorias/2.png" alt="">
                            <span>Papel y sobres</span>
                        </a>
                        <a class="slide-item" href="">
                            <img src="img/categorias/3.png" alt="">
                            <span>Cuadernos y libretas</span>
                        </a>
                        <a class="slide-item" href="">
                            <img src="img/categorias/4.png" alt="">
                            <span>Manualidades</span>
                        </a>
                        <a class="slide-item" href="">
                            <img src="img/categorias/5.png" alt="">
                            <span>Dibujo y Arte</span>
                        </a>
                        <a class="slide-item" href="">
                            <img src="img/categorias/6.png" alt="">
                            <span>Escolar</span>
                        </a>
                        <a class="slide-item" href="">
                            <img src="img/categorias/7.png" alt="">
                            <span>Oficina</span>
                        </a>
                        <a class="slide-item" href="">
                            <img src="img/categorias/8.png" alt="">
                            <span>Libros</span>
                        </a>
                    </div>
                </div>
            </article>

            <article id="article-3">
                <div class="title-3 pt-5">
                    <span>LO MÁS VENDIDO</span>
                </div>
                <div class="container-fluid p-5">
                    <div class="row g-4 row-cols-1 row-cols-md-3 row-cols-lg-4">
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
                                            <a href="addtoCart?SKU=<%=p.getSKU()%>" class="btn btn-primary btn-sm">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24"
                                                     fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                                     stroke-linejoin="round" class="feather feather-plus">
                                                <line x1="12" y1="5" x2="12" y2="19"></line>
                                                <line x1="5" y1="12" x2="19" y2="12"></line>
                                                </svg> Agregar
                                            </a>
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
        <script src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
        crossorigin="anonymous"></script>
        <script src="js/customer/layout.js"></script>
    </body>
</html>
