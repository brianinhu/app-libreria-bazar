<%-- 
    Document   : buySuccess
    Created on : 5 jul. 2023, 18:05:37
    Author     : Brian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <style>
            body {
                background-color: #f8f9fa;
            }

            .container {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            .card {
                max-width: 500px;
                padding: 40px;
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            .card-title {
                font-size: 24px;
                margin-bottom: 20px;
            }

            .card-text {
                font-size: 18px;
                margin-bottom: 20px;
            }

            .text-center {
                text-align: center;
            }

            #home-button {
                display: inline-block;
                padding: 10px 20px;
                background-color: #007bff;
                border-radius: 4px;
                color: #fff;
                text-decoration: none;
                transition: background-color 0.3s;
            }

            #home-button:hover {
                background-color: #0069d9;
            }

            #codigo-pedido {
                margin: 0;
            }

            span {
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="card">
                <h3 class="card-title">¡Compra Finalizada!</h3>
                <p class="card-text">Gracias por tu compra. Hemos recibido tu pedido correctamente.</p>
                <p id="codigo-pedido" class="card-text">Código de pedido: <span>${codigo}</span></p>
                <hr>
                <p class="card-text">Recibirás un correo electrónico de confirmación con los detalles de tu compra.</p>
                <div class="text-center">
                    <a href="viewMainC" id="home-button">Volver a la página principal</a>
                </div>
            </div>
        </div>
    </body>
</html>
