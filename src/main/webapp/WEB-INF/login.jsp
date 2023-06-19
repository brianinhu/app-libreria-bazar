<%-- 
    Document   : login
    Created on : 18 jun. 2023, 12:20:43
    Author     : Brian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        String mensajeError = (String) request.getAttribute("msg");
        %>
        <header>
            
        </header>
        <nav>
            
        </nav>
        <section>
            <form action="login" method="post">
                <p>INICIO DE SESIÓN</p>
                <p>Email</p>
                <input type="email" name="txtemail" required>
                <p>Contraseña</p>
                <input type="password" name="txtcontrasena" required>
                <p><input type="submit" value="Ingresar"></p>
                <span><%=mensajeError!=null?mensajeError:""%></span>
                <p>No tienes una cuenta? <a href="viewSignup">Regístrate aquí</a></p>
            </form>
        </section>
        <footer>
            
        </footer>
    </body>
</html>
