<%-- 
    Document   : signup
    Created on : 18 jun. 2023, 12:21:06
    Author     : Brian
--%>

<%@page import="libreria.modelo.dao.GeneroDAO"%>
<%@page import="libreria.modelo.bean.Genero"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="CSS/style.css"/>
    </head>
    <body>
        <header>
            LIBRERÍA
        </header>
        <nav>

        </nav>
        <section>
            <form action="signup" method="post">
                <p>Regístrese</p>
                <input type="hidden" id="txtidcliente" name="txtidcliente">
                <p>Nombre*</p>
                <input type="text" id="txtnombre" name="txtnombre" required>
                <p>Apellido paterno*</p>
                <input type="text" id="txtapaterno" name="txtapaterno" required> 
                <p>Apellido materno</p>
                <input type="text" name="txtamaterno">
                <p>Genero</p>
                <select name="txtidgenero">
                    <option value="0"></option>
                    <%
                        ArrayList<Genero> listaGeneros = new GeneroDAO().tolist();
                        for (Genero g : listaGeneros) {
                    %>
                    <option value = <%=g.getIdgenero()%>><%=g.getGenero()%></option>
                    <%}%>
                </select>
                <p>Telefono</p>
                <input type="text" name="txttelefono">
                <p>Email*</p>
                <input type="email" name="txtemail" required>
                <p>Contraseña*</p>
                <input type="password" name="txtcontrasena" required>
                <p><button id="btn-registrar">Registrar</button></p>
            </form>
        </section>
        <footer>

        </footer>
        <script src="JS/script.js"></script>
    </body>
</html>
