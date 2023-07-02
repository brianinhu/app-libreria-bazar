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
        <link rel="stylesheet" type="text/css" href="CSS/styleA.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
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
        <header>
            ADMINISTRACION
        </header>
        <nav id="nav1">
            <span>Bienvenido <%=p.getNombre()%> <%=p.getApaterno()%></span><span>Área <%=r.getRol()%></span><span><a href="logoutA">Cerrar sesión</a></span>
        </nav>
        <section>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-2 p-0">
                        <ul id="ul1">
                            <li><a href="url">Administracion</a>
                                <ul>
                                    <li><a href="url">Personal</a></li>
                                    <li><a href="url">Administradores</a></li>
                                </ul>
                            </li>
                            <li><a href="url">Ventas</a>
                                <ul>
                                    <li><a href="url">Clientes</a></li>
                                    <li><a href="viewProductoAG">Productos</a></li>
                                    <li><a href="url">Categorias</a></li>
                                    <li><a href="url">Pedidos</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="col-10 p-0">
                        <form class="container" action="createProducto" method="post" enctype="multipart/form-data">
                            <h3>Registro de productos</h3>
                            <input type="hidden" name="txtSKU" id="txtSKU">
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
                            <p></p>
                            <button id="btn-agregar" type="submit">Agregar</button>
                        </form>
                        <div>
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
                                </tr>
                                <%
                                    ArrayList<Producto> listaProductos = new ProductoDAO().tolist();
                                    for (Producto producto : listaProductos) {
                                %>
                                <tr>
                                    <td><%=producto.getSKU()%></td>
                                    <td><%=producto.getNombre()%></td>
                                    <td><%=producto.getDescripcion()%></td>
                                    <td><%=producto.getIdmarca()%></td>
                                    <td><%=producto.getPrecio()%></td>
                                    <td><%=producto.getStock()%></td>
                                    <td><img src="readImage?SKUProducto=<%=producto.getSKU()%>" alt="img" width="240" height="300"/></td>
                                    <td><%=producto.getIdcategoria()%></td>
                                </tr>
                                <%}%>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <footer>

        </footer>
        <script type="text/javascript" src="JS/scriptA.js"></script>
    </body>
</html>
