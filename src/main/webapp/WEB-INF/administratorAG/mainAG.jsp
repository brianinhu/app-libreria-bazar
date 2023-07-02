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
                                    <li><a href="#">Personal</a></li>
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
                        
                    </div>
                </div>
            </div>
        </section>
        <footer>

        </footer>
    </body>
</html>
