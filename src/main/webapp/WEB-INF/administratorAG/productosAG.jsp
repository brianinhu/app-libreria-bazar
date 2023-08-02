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
        <!-- CSS Bootstrap 5 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <!-- CSS Boxicons -->
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <!-- CSS FontsGoogle -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800;900&display=swap"
              rel="stylesheet">
        <!-- CSS Bootstrap Icons -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <!-- CSS DataTable -->
        <link rel="stylesheet" href="//cdn.datatables.net/1.13.5/css/jquery.dataTables.min.css">
        <!-- CSS mainAG -->
        <link href="CSS/mainAG.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/productosAG.css" rel="stylesheet" type="text/css"/>
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
                        <span class="font-weight-bold"><%=p.getNombre()%> <%=p.getApaterno()%></span>
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
                    <a href="logoutA">
                        <i class='bx bx-log-out-circle'></i>
                        <span class="option">Cerrar sesión</span>
                    </a>
                </div>
            </aside>
        </section>
        <section id="section-2">
            <div class="div-panel panel-add" id="div-panel">
                <div class="card">
                    <div class="card-header">
                        <span class="fw-semibold">Añadir producto</span>
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
            <div class="div-panel" id="div-panel">
                <div class="card">
                    <div class="card-header">
                        <span class="fw-semibold">Listado de productos</span>
                    </div>
                    <div class="card-body">
                        <table id="table">
                            <thead>
                                <tr>
                                    <th>SKU</th>
                                    <th>Nombre</th>
                                    <th>Descripcion</th>
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
                                <tr>
                                    <td><%=producto.getSKU()%></td>
                                    <td><%=producto.getNombre()%></td>
                                    <td><%=producto.getDescripcion()%></td>
                                    <%
                                        Marca marca = new Marca(producto.getIdmarca(), "");
                                        marca = new MarcaDAO().read(marca);
                                    %>
                                    <td><%=marca.getMarca()%></td>
                                    <td><%=producto.getPrecio()%></td>
                                    <td><%=producto.getStock()%></td>
                                    <td><img src="readImage?SKUProducto=<%=producto.getSKU()%>" alt="img" width="100" height="100"/></td>
                                        <%
                                            Categoria categoria = new Categoria(producto.getIdcategoria(), "");
                                            categoria = new CategoriaDAO().read(categoria);
                                        %>
                                    <td><%=categoria.getCategoria()%></td>
                                    <td>
                                        <div class="d-grid">
                                            <button type="button" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#staticBackdrop2" 
                                                    onclick="abrirModal('<%=producto.getSKU()%>', '<%=producto.getNombre()%>', '<%=producto.getDescripcion()%>', '<%=producto.getIdmarca()%>', '<%=producto.getPrecio()%>', '<%=producto.getStock()%>', '<%=producto.getIdcategoria()%>')">
                                                <i class="bi bi-pencil-square"></i>
                                            </button>
                                        </div>
                                        <div class="d-grid">
                                            <a href="#" onclick="deleteProduct('<%=producto.getSKU()%>')" type="button" class="btn btn-danger"><i class="bi bi-trash3-fill"></i></a>
                                        </div>
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
                                <input type="text" name="txtnombre" class="form-control" placeholder="Nombre">
                            </div>
                            <div class="input-group mb-3">
                                <textarea name="txtdescripcion" class="form-control" rows="5" placeholder="Descripción"></textarea>
                            </div>
                            <div class="container-fluid mb-3">
                                <div class="row">
                                    <div class="col-8 p-0 pe-2">
                                        <select name="cbxCategoria" class="form-select">
                                            <option selected disabled>Categoría</option>
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
                                            <input type="text" name="txtprecio" class="form-control" placeholder="Precio">
                                            <span class="input-group-text">.0</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="container-fluid mb-3">
                                <div class="row">
                                    <div class="col-8 p-0 pe-2">
                                        <select name="cbxMarca" class="form-select">
                                            <option selected disabled>Marca</option>
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
                                            <input type="text" name="txtstock" class="form-control" placeholder="Stock">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-2 p-0 pe-2">
                                        <div class="d-flex justify-content-center align-items-center h-100">
                                            <span>Imagen:</span>
                                        </div>
                                    </div>
                                    <div class="col-10 p-0 ps-2">
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
                            <p>SKU</p>
                            <input type="text" name="txtSKUUpdate" id="txtSKUUpdate" readonly>
                            <p>Nombre</p>
                            <input type="text" name="txtnombre" id="txtnombre">
                            <p>Descripcion</p>
                            <input type="text" name="txtdescripcion" id="txtdescripcion">
                            <p>Marca</p>
                            <select name="cbxMarca" id="cbxMarca">
                                <%
                                    ArrayList<Marca> listaMarcas2 = new MarcaDAO().tolist();
                                    for (Marca m : listaMarcas2) {
                                %>
                                <option value="<%=m.getIdmarca()%>"><%=m.getMarca()%></option>
                                <%}%>
                            </select>
                            <p>Precio</p>
                            <input type="text" name="txtprecio" id="txtprecio">
                            <p>Stock</p>
                            <input type="text" name="txtstock" id="txtstock">
                            <p>Imagen</p>
                            <input type="file" name="fileImagen">
                            <p>Categoria</p>
                            <select name="cbxCategoria" id="cbxCategoria">
                                <%
                                    ArrayList<Categoria> listaCategorias2 = new CategoriaDAO().tolist();
                                    for (Categoria c : listaCategorias2) {
                                %>
                                <option value="<%=c.getIdcategoria()%>"><%=c.getCategoria()%></option>
                                <%}%>
                            </select>
                            <div id="div-imagen">
                                <img id="imagen" src="" alt="img" width="300"/>
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
        <script src="//cdn.datatables.net/1.13.5/js/jquery.dataTables.min.js"></script>
        <!-- JavaScript mainAG -->
        <script src="JS/mainAG.js" type="text/javascript"></script>
        <!-- JavaScript productosAG -->
        <script src="JS/productosAG.js" type="text/javascript"></script>
        <!-- JavaScript Bootstrap 5 -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
        <!-- JavaScript Sweetalert -->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    </body>
</html>
