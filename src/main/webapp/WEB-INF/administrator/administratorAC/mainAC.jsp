<%-- 
    Document   : mainAC
    Created on : 30 jun. 2023, 19:01:33
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
        <nav>
            <span>Bienvenido <%=p.getNombre()%> <%=p.getApaterno()%></span><span>Área <%=r.getRol()%></span><span><a href="logoutA">Cerrar sesión</a></span>
        </nav>
        <section>
            
        </section>
        <footer>
            
        </footer>
    </body>
</html>
