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
    </head>
    <%
        Boolean flag = (Boolean) request.getAttribute("flag");
        if (flag != null && flag.booleanValue()) {
    %>
    <script>
        alert("Su registro ha sido realizado correctamente");
    </script>
    <%
        }
    %>
    <body>
        <%
            Cliente c = (Cliente) request.getSession().getAttribute("customer");
        %>

        <header>
            LIBRERIA
        </header>
        <nav>
            <span>Bienvenido, <%=c.getNombre()%> <%=c.getApaterno()%> <%=c.getAmaterno()%></span><span><a href="logout">Cerrar sesión</a></span>
        </nav>
        <section>

        </section>
        <footer>

        </footer>
    </body>
</html>
