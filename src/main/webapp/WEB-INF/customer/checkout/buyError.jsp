<%-- 
    Document   : buyError
    Created on : 8 jul. 2023, 17:15:57
    Author     : Brian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css-customer/layout-checkout.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    </head>
    <body>
        <div class="container">
            <div class="card">
                <h3 class="card-title">¡Error en la Compra!</h3>
                <p class="card-text">Ha ocurrido un error al procesar tu compra. Por favor, inténtalo de nuevo.
                </p>
                <div class="text-center">
                    <a href="viewMainC" id="home-button">Volver a la página principal</a>
                </div>
            </div>
        </div>
    </body>
</html>
