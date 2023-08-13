<%-- 
    Document   : administradorAG
    Created on : 26 jul. 2023, 06:56:58
    Author     : Brian
--%>

<%@page import="libreria.modelo.dao.AdministradorDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="libreria.modelo.dao.RolDAO"%>
<%@page import="libreria.modelo.bean.Rol"%>
<%@page import="libreria.modelo.dao.PersonalDAO"%>
<%@page import="libreria.modelo.bean.Personal"%>
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
        <link href="CSS/mainAG.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/administradoresAG.css" rel="stylesheet" type="text/css"/>
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
            <div class="div-panel" id="div-panel">
                <div class="container">
                    <div class="row">
                        <div class="col d-flex justify-content-center align-items-center mb-4">
                            <div id="panel-tri" class="row m-0">
                                <div class="col p-0">
                                    <div class="card" style="width: 565px; height: 700px; margin-top: 20px;">
                                        <div class="card-header text-center">Tabla de administradores</div>
                                        <div class="card-body">
                                            <fieldset class="border rounded-3 p-3">
                                                <legend class="float-none w-auto m-0 px-2" style="font-size: 13px;">Acciones</legend>
                                                <div class="row">
                                                    <div class="col-6">
                                                        <span>Ver administradores</span>
                                                        <select id="cbxAdministradores" class="form-select mt-2 w-75">
                                                            <option value="1">Generales</option>
                                                            <option value="2">De venta</option>
                                                            <option value="3">De contenido</option>
                                                            <option value="4" selected>Todos</option>
                                                        </select>
                                                    </div>
                                                    <div class="col-6">
                                                        <div class="d-flex justify-content-center align-items-center flex-column">
                                                            <button class="btn btn-sm btn-success mb-1 w-75">+ Administrador</button>
                                                            <button class="btn btn-sm btn-success w-75">+ Personal</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </fieldset>
                                            <table id="tablaAdmi" class="table table-bordered mt-2">
                                                <tr>
                                                    <th>Personal</th>
                                                    <th>User</th>
                                                    <th>Password</th>
                                                    <th>Estado</th>
                                                    <th>Acciones</th>
                                                </tr>
                                                <%
                                                    ArrayList<Administrador> listaAdmin = new AdministradorDAO().tolist();
                                                    for (Administrador admin : listaAdmin) {
                                                        p.setIdpersonal(admin.getIdpersonal());
                                                        p = new PersonalDAO().read(p);
                                                %>
                                                <tr>
                                                    <td><%=p.getNombre() + " " + p.getApaterno()%></td>
                                                    <td><%=admin.getUser()%></td>
                                                    <td><%=admin.getPassword()%></td>
                                                    <%
                                                        if (a.getEstado() == '0') {
                                                    %>
                                                    <td><span class='badge text-bg-danger'>Inactivo</span></td>
                                                    <%
                                                    } else {
                                                    %>
                                                    <td><span class='badge text-bg-success'>Activo</span></td>
                                                    <%
                                                        }

                                                    %>
                                                    <td>
                                                        <button class='btn btn-warning me-1' onclick="openModalEditarAdmin()"><i class='bx bxs-edit'></i></button>
                                                        <button class='btn btn-danger'><i class='bx bxs-trash-alt'></i></button>
                                                    </td>
                                                </tr>
                                                <%                                                    
                                                    }
                                                %>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div class="col p-0">
                                    <div class="row m-0">
                                        <div class="col p-0">
                                            <div class="card" style="width: 565px; height: 340px; margin-top: 20px;">
                                                <div class="card-header text-center">Tabla del personal</div>
                                                <div class="card-body">
                                                    <table class="table table-responsive">
                                                        <tr>
                                                            <th>Header</th>
                                                            <th>Header2</th>
                                                        </tr>
                                                        <tr>
                                                            <td>Cell1</td>
                                                            <td>Cell2</td>
                                                        </tr>
                                                        <tr>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row m-0">
                                        <div class="col p-0">
                                            <div class="card" style="width: 565px; height: 340px; margin-top: 20px;">
                                                <div class="card-header text-center">Gráfico</div>
                                                <div class="card-body">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Modal editar administrador -->
        <div class="modal fade" id="modalEditarAdmin" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog w-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="staticBackdropLabel">Actualizar administrador</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form action="updateAdmin" method="post" accept-charset="UTF-8">
                        <div class="modal-body">
                            <div class="container-fluid p-0">
                                <div class="row m-0 mb-2">
                                    <div class="col p-0">
                                        <div class="input-group" style="width: 30%">
                                            <span class="input-group-text justify-content-center"">ID</span>
                                            <input type="text" id="txtid" name="txtid" class="form-control" readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="row m-0 mb-2">
                                    <div class="col p-0">
                                        <div class="input-group">
                                            <span class="input-group-text">Personal</span>
                                            <input type="text" id="txtpersonal" name="txtpersonal" class="form-control" readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="row m-0">
                                    <div class="col-6 p-0 pe-1">
                                        <div class="row m-0 mb-2">
                                            <div class="col p-0">
                                                <div class="input-group">
                                                    <span class="input-group-text">Rol</span>
                                                    <select id="cbxRol" class="form-select">
                                                        <option value="first">text1</option>
                                                        <option value="second">text2</option>
                                                        <option value="third">text3</option>
                                                    </select>

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
                                                <img id="imagen" class="card-img-bottom w-50" alt="img" src="readImage?SKUProducto=2AXC92C3Z9">
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
        <script src="JS/mainAG.js" type="text/javascript"></script>
        <script src="JS/administradoresAG.js" type="text/javascript"></script>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    </body>
</html>
