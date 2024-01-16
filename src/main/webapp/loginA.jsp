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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <link href="css-customer/loginA.css" rel="stylesheet" type="text/css"/>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;400;500;700;900&display=swap" rel="stylesheet">
    </head>
    <body>
        <%
            String messageError = (String) request.getAttribute("messageError");
        %>
        <div class="container">
            <div class="row">
                <div id="left" class="col-6">
                    <img src="img/administrator/login-admin.png" alt="login-admin"/>
                </div>
                <div id="right" class="col-6">
                    <form action="loginA" method="post">
                        <div><img src="img/tech-office/logo-white-transp.png" alt="alt" width="150" height="150"/></div>
                        <h3>Administración</h3>
                        <div class="form-floating mb-3 w-50">
                            <input type="text" class="form-control" id="floatingInput" placeholder="name@example.com" name="txtuser" required>
                            <label for="floatingInput">Usuario</label>
                        </div>
                        <div class="form-floating mb-3 w-50">
                            <input type="password" class="form-control" id="floatingInput2" placeholder="name@example.com" name="txtpass" required>
                            <label for="floatingInput2">Contraseña</label>
                        </div>
                        <div class="d-grid w-25">
                            <button class="btn btn-success">Ingresar</button>
                        </div>
                        <p class="m-0 mt-3 text-light"><%=messageError != null ? messageError : ""%></p>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
