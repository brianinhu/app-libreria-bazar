<%-- 
    Document   : personalAG
    Created on : 26 jul. 2023, 07:01:23
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
            <div class="div-panel" id="div-panel">
                <p>Personal</p>
            </div>
        </section>
        <script src="JS/mainAG.js" type="text/javascript"></script>
    </body>
</html>
