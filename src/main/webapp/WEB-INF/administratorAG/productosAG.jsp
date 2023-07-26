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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800;900&display=swap"
              rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <link href="CSS/mainAG.css" rel="stylesheet" type="text/css"/>
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
                    <a href="viewAdministradorAG">
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
            <div class="div-panel" id="div-panel">
                <h3>Lista de productos</h3>
                <table class="table">
                    <tr>
                        <th>SKU</th>
                        <th>Nombre</th>
                        <th>Descripcion</th>
                        <th>Marca</th>
                        <th>Precio</th>
                        <th>Stock</th>
                        <th>Imagen</th>
                        <th>Categoria</th>
                        <th colspan="2">
                            <div class="d-grid col-6 mx-auto">
                                <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#staticBackdrop1">
                                    <i class="bi bi-bag-plus-fill"></i>
                                </button>
                            </div>
                        </th>
                    </tr>
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
                        <td><img src="readImage?SKUProducto=<%=producto.getSKU()%>" alt="img" width="100"/></td>
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
                        </td>
                        <td>
                            <div class="d-grid">
                                <a href="#" onclick="deleteProduct('<%=producto.getSKU()%>')" type="button" class="btn btn-danger"><i class="bi bi-trash3-fill"></i></a>
                            </div>
                        </td>
                    </tr>
                    <%}%>
                </table>
            </div>
        </section>

        <!-- Modal añadir producto -->
        <div class="modal fade" id="staticBackdrop1" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog w-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="staticBackdropLabel">Registro de producto</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form action="createProducto" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
                        <div class="modal-body">
                            <input type="hidden" name="txtSKUCreate" id="txtSKUCreate">
                            <p>Nombre</p>
                            <input type="text" name="txtnombre">
                            <p>Descripcion</p>
                            <input type="text" name="txtdescripcion">
                            <p>Marca</p>
                            <select name="cbxMarca">
                                <%
                                    ArrayList<Marca> listaMarcas = new MarcaDAO().tolist();
                                    for (Marca m : listaMarcas) {
                                %>
                                <option value="<%=m.getIdmarca()%>"><%=m.getMarca()%></option>
                                <%}%>
                            </select>
                            <p>Precio</p>
                            <input type="text" name="txtprecio">
                            <p>Stock</p>
                            <input type="text" name="txtstock">
                            <p>Imagen</p>
                            <input type="file" name="fileImagen">
                            <p>Categoria</p>
                            <select name="cbxCategoria">
                                <%
                                    ArrayList<Categoria> listaCategorias = new CategoriaDAO().tolist();
                                    for (Categoria c : listaCategorias) {
                                %>
                                <option value="<%=c.getIdcategoria()%>"><%=c.getCategoria()%></option>
                                <%}%>
                            </select>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" id="btn-agregar" class="btn btn-primary">Agregar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Modal añadir producto -->

        <!-- Modal editar producto -->
        <div class="modal fade" id="staticBackdrop2" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog w-dialog">
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
    </div>
    <!-- Modal editar producto -->
    
    <script src="JS/mainAG.js" type="text/javascript"></script>
    <script src="JS/productosAG.js" type="text/javascript"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" 
    integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
</html>
