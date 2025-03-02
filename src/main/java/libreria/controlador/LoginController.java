package libreria.controlador;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import libreria.modelo.bean.Carrito;
import libreria.modelo.bean.Categoria;
import libreria.modelo.bean.Cliente;
import libreria.modelo.dao.CategoriaDAO;
import libreria.modelo.dao.ClienteDAO;

@WebServlet("/login")
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Categoria> categorias = new CategoriaDAO().toList();
        request.setAttribute("categorias", categorias);
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("txtemail");
        String contraseña = request.getParameter("txtcontrasena");
        Cliente cliente = new Cliente();
        cliente.setEmail(email);
        cliente.setContraseña(contraseña);
        cliente = new ClienteDAO().read(cliente);
        if (cliente != null) {
            request.getSession().setAttribute("customer", cliente);
            request.getSession().setAttribute("cart", new ArrayList<Carrito>());
            response.sendRedirect(request.getContextPath() + "/");
        } else {
            request.setAttribute("msg", "El inicio de sesión de la cuenta fue incorrecto. Vuelva a intentarlo");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
