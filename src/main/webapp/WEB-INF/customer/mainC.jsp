<%-- 
    Document   : main
    Created on : 18 jun. 2023, 17:03:02
    Author     : Brian
--%>

<%@page import="libreria.modelo.bean.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="CSS/styleC.css"/>
    </head>
    <body>
        <%
            Cliente c = (Cliente) request.getSession().getAttribute("customer");
        %>

        <header>
            LIBRERIA
        </header>
        <nav>
            <span>Bienvenido, <%=c.getNombre()%> <%=c.getApaterno()%></span><span><a href="logout">Cerrar sesión</a></span>
        </nav>
        <section>

        </section>
        <footer>

        </footer>
    </body>
</html>
