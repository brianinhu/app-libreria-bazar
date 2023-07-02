<%-- 
    Document   : main
    Created on : 29 jun. 2023, 19:34:32
    Author     : Brian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="CSS/styleA.css"/>
    </head>
    <body>
        <%
        String messageError = (String) request.getAttribute("messageError");
        %>
        <header>
            ADMINISTRACION
        </header>
        <nav>

        </nav>
        <section>
            <form action="loginA" method="post">
                <p>Usuario</p>
                <p><input type="text" name="txtuser"></p>
                <p>Contraseña</p>
                <p><input type="password" name="txtpass"></p>
                <p><input type="submit" value="Ingresar"></p>
                <p><%=messageError!=null?messageError:""%></p>
            </form>
        </section>
        <footer>

        </footer>
    </body>
</html>
