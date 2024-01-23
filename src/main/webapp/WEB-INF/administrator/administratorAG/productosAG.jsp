<%@page import="libreria.modelo.dao.ProductoDAO"%>
<%@page import="libreria.modelo.bean.Producto"%>
<%@page import="libreria.modelo.dao.CategoriaDAO"%>
<%@page import="libreria.modelo.bean.Categoria"%>
<%@page import="libreria.modelo.dao.MarcaDAO"%>
<%@page import="libreria.modelo.bean.Marca"%>
<%@page import="java.util.ArrayList"%>
<%@page import="libreria.modelo.dao.RolDAO"%>
<%@page import="libreria.modelo.bean.Rol"%>
<%@page import="libreria.modelo.bean.Personal"%>
<%@page import="libreria.modelo.dao.PersonalDAO"%>
<%@page import="libreria.modelo.bean.Administrador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- CSS Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <!-- CSS Bootstrap Icons -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <!-- CSS Boxicons -->
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <!-- CSS FontsGoogle -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800;900&display=swap"
              rel="stylesheet">
        <!-- CSS DataTable -->
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.5/css/jquery.dataTables.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.3.0/css/responsive.bootstrap5.min.css"/>
        <!-- CSS layout -->
        <link rel="stylesheet" href="css-admin/layout.css"/>
        <style>
            #div-panel-add {
                padding: 2rem;
            }

            #div-panel-view {
                padding-left: 2rem;
                padding-right: 2rem;
                padding-bottom: 2rem;
            }

            #section-2, #section-3 {
                font-size: 0.8rem;
            }

            #table tbody{
                text-align: center;
                vertical-align: middle;
            }

            #table thead th {
                text-align: center;
            }

            .panel-add {
                width: 300px;
            }

            .w-dialog {
                max-width: 850px !important;
                width: 100%;
            }

            .modal-body{
                margin: 1rem;
                padding: 2rem;
                border: 1px solid #f2f2f2;
                border-radius: 15px;
            }

            /* Estilos para el boton ver más */
            .more-less {
                position: relative;
                width: 25px;
                height: 25px;
                background-color: #0D6EFD;
                border-radius: 50%;
                border: 3px solid #fff;
                color: #fff;
                cursor: pointer;
                box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.2);
            }
            /* Estilos para el boton ver más */

            /* Estilos para el icono */
            td .bi {
                display: flex;
                justify-content: center;
                align-items: center;
                font-size: 10px;
                color: #fff;
            }
            /* Estilos para el icono */

            /* Estilos del boton bootstrap */
            td .btn {
                width: 30px !important;
                height: 30px !important;
                padding: 0 !important;
                box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.2);
            }
            /* Estilos del boton bootstrap */

            /* Tienen que estar juntos ambas clases antagonicas */
            .text-container {
                overflow: hidden;
                text-overflow: ellipsis;
                white-space: nowrap;
                max-width: 180px;
            }

            .active-normal {
                white-space: normal;
            }

            .td-container {
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 150px;
            }
            /* La clase predominante tiene que estar debajo de la otra clase */
        </style>
    </head>
    <body>
        <%
            Administrador a = (Administrador) request.getSession().getAttribute("administrator");
            // Leer al personal
            Personal p = new Personal();
            p.setIdpersonal(a.getIdpersonal());
            p = new PersonalDAO().read(p);

            // Leer el rol
            Rol r = new Rol();
            r.setIdrol(a.getIdrol());
            r = new RolDAO().read(r);
        %>
        <section id="section-1">
            <aside class="aside" id="aside">
                <div class="head">
                    <div class="profile">
                        <img src="Images/administrator/imagen-admi.png" alt="alt"/>
                        <div>
                            <div id="div-nombre"><%=p.getNombre()%> <%=p.getApaterno()%></div>
                            <div id="div-rol"><%=r.getRol()%></div>
                        </div>
                    </div>
                    <i class='bx bx-menu' id="menu"></i>
                </div>
                <div class="options">
                    <a href="viewAdministradoresAG">
                        <i class="bx bxs-briefcase"></i>
                        <span class="option">Administradores</span>
                    </a>
                    <a href="viewPersonalAG">
                        <i class="bx bx-sitemap"></i>
                        <span class="option">Personal</span>
                    </a>
                    <a href="viewClientesAG">
                        <i class="bx bx-user"></i>
                        <span class="option">Clientes</span>
                    </a>
                    <a href="viewPedidosAG">
                        <i class='bx bxs-shopping-bags'></i>
                        <span class="option">Pedidos</span>
                    </a>
                    <a href="viewProductosAG">
                        <i class='bx bxs-store'></i>
                        <span class="option">Productos</span>
                    </a>
                    <a id="a-logout" href="logoutA">
                        <i class='bx bx-log-out-circle'></i>
                        <span class="option">Cerrar sesión</span>
                    </a>
                </div>
            </aside>
        </section>
        <section id="section-2">
            <div class="div-panel panel-add" id="div-panel-add">
                <div class="card">
                    <div class="card-header">
                        <span class="fw-semibold fs-6">Añadir producto</span>
                    </div>
                    <div class="card-body">
                        <div class="d-grid col-6 mx-auto">
                            <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#staticBackdrop1">
                                <i class="bi bi-bag-plus-fill"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section id="section-3">
            <div class="div-panel" id="div-panel-view">
                <div class="card">
                    <div class="card-header">
                        <span class="fw-semibold fs-6">Listado de productos</span>
                    </div>
                    <div class="card-body">
                        <table id="table" style="width:100%">
                            <thead>
                                <tr>
                                    <th style="width: 60px;">SKU</th>
                                    <th>Nombre</th>
                                    <th style="width: 100px;">Descripcion</th>
                                    <th>Marca</th>
                                    <th>Precio</th>
                                    <th>Stock</th>
                                    <th>Imagen</th>
                                    <th>Categoria</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    ArrayList<Producto> listaProductos = new ProductoDAO().tolist();
                                    for (Producto producto : listaProductos) {
                                %>
                                <tr style="min-height: 150px;">
                                    <td><%=producto.getSKU()%></td>
                                    <td><%=producto.getNombre()%></td>
                                    <td class="td-container">
                                        <div class="text-container">
                                            <%=producto.getDescripcion()%>
                                        </div>
                                        <button class="btnchange more-less">
                                            <i class="bi bi-eye-slash-fill"></i>
                                            <i class="bi bi-eye-fill" style="display: none;"></i>
                                        </button>
                                    </td>
                                    <%
                                        Marca marca = new Marca(producto.getIdmarca(), "");
                                        marca = new MarcaDAO().read(marca);
                                    %>
                                    <td><%=marca.getMarca()%></td>
                                    <td><%=producto.getPrecio()%></td>
                                    <td><%=producto.getStock()%></td>
                                    <td><img style="width: 90px;" src="readImage?SKUProducto=<%=producto.getSKU()%>" alt="img"/></td>
                                        <%
                                            Categoria categoria = new Categoria(producto.getIdcategoria(), "");
                                            categoria = new CategoriaDAO().read(categoria);
                                        %>
                                    <td><%=categoria.getCategoria()%></td>
                                    <td>
                                        <button class="btn btn-info" data-bs-toggle="modal" data-bs-target="#staticBackdrop2" 
                                                onclick="abrirModal('<%=producto.getSKU()%>', '<%=producto.getNombre()%>', '<%=producto.getDescripcion()%>', '<%=producto.getIdmarca()%>', '<%=producto.getPrecio()%>', '<%=producto.getStock()%>', '<%=producto.getIdcategoria()%>')">
                                            <i class="bi bi-pencil-square"></i>
                                        </button>
                                        <button onclick="deleteProduct('<%=producto.getSKU()%>')" class="btn btn-danger">
                                            <i class="bi bi-trash3-fill"></i>
                                        </button>
                                    </td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </section>

        <!-- Modal añadir producto -->
        <div class="modal fade" id="staticBackdrop1" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog w-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="staticBackdropLabel">Registro de producto</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form action="createProducto" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
                        <div class="modal-body">
                            <input type="hidden" name="txtSKUCreate" id="txtSKUCreate">
                            <div class="input-group mb-3">
                                <span class="input-group-text"><i class='bx bx-package'></i></span>
                                <input type="text" name="txtnombre" class="form-control" placeholder="Nombre" required>
                            </div>
                            <div class="input-group mb-3">
                                <textarea name="txtdescripcion" class="form-control" rows="5" placeholder="Descripción"></textarea>
                            </div>
                            <div class="container-fluid mb-3">
                                <div class="row">
                                    <div class="col-2 p-0 pe-2">
                                        <div class="d-flex justify-content-center align-items-center h-100">
                                            <span>Categoría</span>
                                        </div>
                                    </div>
                                    <div class="col-6 p-0 pe-2">
                                        <select name="cbxCategoria" class="form-select" required>
                                            <option selected hidden>Seleccione</option>
                                            <%
                                                ArrayList<Categoria> listaCategorias = new CategoriaDAO().tolist();
                                                for (Categoria c : listaCategorias) {
                                            %>
                                            <option value="<%=c.getIdcategoria()%>"><%=c.getCategoria()%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                    <div class="col-4 p-0 ps-2">
                                        <div class="input-group">
                                            <span class="input-group-text"><i class='bx bx-dollar'></i></span>
                                            <input type="text" name="txtprecio" class="form-control" placeholder="Precio" required>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="container-fluid mb-3">
                                <div class="row">
                                    <div class="col-2 p-0 pe-2">
                                        <div class="d-flex justify-content-center align-items-center h-100">
                                            <span>Marca</span>
                                        </div>
                                    </div>
                                    <div class="col-6 p-0 pe-2">
                                        <select name="cbxMarca" class="form-select" required>
                                            <option selected hidden>Seleccione</option>
                                            <%
                                                ArrayList<Marca> listaMarcas = new MarcaDAO().tolist();
                                                for (Marca m : listaMarcas) {
                                            %>
                                            <option value="<%=m.getIdmarca()%>"><%=m.getMarca()%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                    <div class="col-4 p-0 ps-2">
                                        <div class="input-group">
                                            <span class="input-group-text"><i class='bx bxs-component'></i></span>
                                            <input type="text" name="txtstock" class="form-control" placeholder="Stock" required>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-2 p-0 pe-2">
                                        <div class="d-flex justify-content-center align-items-center h-100">
                                            <span>Imagen</span>
                                        </div>
                                    </div>
                                    <div class="col-10 p-0">
                                        <div class="input-group">
                                            <input class="form-control" name="fileImagen" type="file" id="formFile">
                                            <label class="input-group-text" for="formFile"><i class='bx bx-image-add'></i></label>
                                        </div>
                                    </div>
                                </div>
                            </div>                      
                        </div>
                        <div class="modal-footer">
                            <div class="d-flex align-items-center justify-content-center w-100">
                                <button type="submit" id="btn-agregar" class="btn btn-primary w-50">Agregar</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Modal añadir producto -->

        <!-- Modal editar producto -->
        <div class="modal fade" id="staticBackdrop2" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog w-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="staticBackdropLabel">Actualización de datos del producto</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form action="updateProducto" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
                        <div class="modal-body">
                            <div class="container-fluid p-0">
                                <div class="row m-0 mb-2">
                                    <div class="col p-0">
                                        <div class="input-group" style="width: 30%">
                                            <span class="input-group-text justify-content-center" style="width: 90.28px;">SKU</span>
                                            <input type="text" id="txtSKUUpdate" name="txtSKUUpdate" class="form-control" readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="row m-0 mb-2">
                                    <div class="col p-0">
                                        <div class="input-group">
                                            <span class="input-group-text">Nombre</span>
                                            <input type="text" id="txtnombre" name="txtnombre" class="form-control" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="row m-0">
                                    <div class="col-6 p-0 pe-1">
                                        <div class="row m-0 mb-2">
                                            <div class="col p-0">
                                                <div class="input-group">
                                                    <span class="input-group-text">Descripción</span>
                                                    <textarea id="txtdescripcion" name="txtdescripcion" class="form-control" rows="5"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row m-0 mb-2">
                                            <div class="col p-0">
                                                <div class="input-group">
                                                    <span class="input-group-text">Categoría</span>
                                                    <select id="cbxCategoria" name="cbxCategoria" class="form-select" required>
                                                        <option selected hidden>Seleccione</option>
                                                        <%
                                                            for (Categoria c : listaCategorias) {
                                                        %>
                                                        <option value="<%=c.getIdcategoria()%>"><%=c.getCategoria()%></option>
                                                        <%}%>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row m-0 mb-2">
                                            <div class="col p-0">
                                                <div class="input-group">
                                                    <span style="width: 106.3px" class="input-group-text justify-content-center">Marca</span>
                                                    <select id="cbxMarca" name="cbxMarca" class="form-select" required>
                                                        <option selected hidden>Seleccione</option>
                                                        <%
                                                            for (Marca m : listaMarcas) {
                                                        %>
                                                        <option value="<%=m.getIdmarca()%>"><%=m.getMarca()%></option>
                                                        <%}%>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row m-0 mb-2">
                                            <div class="col p-0">
                                                <div class="row m-0">
                                                    <div class="col-6 p-0 pe-2">
                                                        <div class="input-group">
                                                            <span class="input-group-text"><i class='bx bx-dollar'></i></span>
                                                            <input type="text" id="txtprecio" name="txtprecio" class="form-control" required>
                                                        </div>
                                                    </div>
                                                    <div class="col-6 p-0 ps-2">
                                                        <div class="input-group">
                                                            <span class="input-group-text"><i class='bx bxs-component'></i></span>
                                                            <input type="text" id="txtstock" name="txtstock" class="form-control" required>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row m-0">
                                            <div class="col p-0">
                                                <div class="input-group">
                                                    <input class="form-control" name="fileImagen" type="file" id="formFile">
                                                    <label class="input-group-text" for="formFile"><i class='bx bx-image-add'></i></label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-6 p-0 ps-1">
                                        <div class="card">
                                            <div class="card-header">
                                                <p class="text-center m-0">Imagen</p>
                                            </div>
                                            <div style="width: 371.4px; height: 275.2px" class="d-flex justify-content-center align-items-center">
                                                <img id="imagen" class="card-img-bottom w-50" alt="img">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">Guardar cambios</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Modal editar producto -->

        <!-- JavaScript JQuery -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
        <!-- JavaScript DataTable -->
        <script src="https://cdn.datatables.net/1.13.5/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/responsive/2.3.0/js/dataTables.responsive.min.js"></script>
        <script src="https://cdn.datatables.net/responsive/2.3.0/js/responsive.bootstrap5.min.js"></script>
        <!-- JavaScript Bootstrap 5 -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
        <!-- JavaScript productosAG -->
        <script src="JS/productosAG.js" type="text/javascript"></script>
        <!-- JavaScript Sweetalert -->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    </body>
</html>
