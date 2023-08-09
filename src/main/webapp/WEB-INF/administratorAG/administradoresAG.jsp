<%-- 
    Document   : administradorAG
    Created on : 26 jul. 2023, 06:56:58
    Author     : Brian
--%>

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
                        <div class="col d-flex justify-content-center mt-4">
                            <div class="card" style="width: 1000px; height: 200px;">
                                <div class="card-header">
                                    Acciones
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col">
                                            <span class="mb-3">Ver administradores</span>
                                            <select id="id" class="form-select mt-2">
                                                <option value="1">Generales</option>
                                                <option value="2">De contenido</option>
                                                <option value="3">De venta</option>
                                                <option value="4">Todos</option>
                                            </select>
                                        </div>
                                        <div class="col d-flex justify-content-center align-items-center flex-column">
                                            <button class="btn btn-success mb-1">+ Administrador</button>
                                            <button class="btn btn-success mb-1">+ Rol</button>
                                            <button class="btn btn-success">+ Personal</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col d-flex justify-content-center align-items-center mb-4">
                            <div id="panel-tri" class="row m-0">
                                <div class="col p-0">
                                    <div class="card" style="width: 490px; height: 700px; margin-top: 20px;">
                                        <div class="card-header text-center">Administración</div>
                                        <div class="card-body">
                                            <table class="table">
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
                                <div class="col p-0">
                                    <div class="row m-0">
                                        <div class="col p-0">
                                            <div class="card" style="width: 490px; height: 340px; margin-top: 20px;">
                                                <div class="card-header text-center">Personal</div>
                                                <div class="card-body">
                                                    <table class="table">
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
                                            <div class="card" style="width: 490px; height: 340px; margin-top: 20px;">
                                                <div class="card-header text-center">Roles</div>
                                                <div class="card-body">
                                                    <table class="table">
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
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script src="JS/mainAG.js" type="text/javascript"></script>
    </body>
</html>
