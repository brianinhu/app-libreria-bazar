<%-- 
    Document   : categoria
    Created on : 19 feb. 2025, 19:23:33
    Author     : diego
--%>

<%@ page import="java.util.ArrayList, libreria.modelo.bean.Producto, libreria.modelo.bean.Categoria" %>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>${categoria.categoria} - Tienda</title>
    </head>
    <body>
        <h1>${categoria.idcategoria} </h1>
        <c:forEach var="producto" items="${productos}">
            <p>${producto.SKU}</p>
            <p>${producto.nombre}</p>
        </c:forEach>
        <a href="<%=request.getContextPath()%>">Ir al inicio</a>
    </body>
</html>