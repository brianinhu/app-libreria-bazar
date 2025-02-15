
package libreria.controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import libreria.modelo.bean.Cliente;
import libreria.modelo.dao.ClienteDAO;

@WebServlet("/signup")
public class SignupController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/signup.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idcliente = request.getParameter("txtidcliente");
        String nombre = request.getParameter("txtnombre");
        String apaterno = request.getParameter("txtapaterno");
        String amaterno = request.getParameter("txtamaterno");
        String telefono = request.getParameter("txttelefono");
        String email = request.getParameter("txtemail");
        String contraseña = request.getParameter("txtcontrasena");
        int idgenero = Integer.parseInt(request.getParameter("txtidgenero"));

        Cliente cliente = new Cliente(idcliente, nombre, apaterno, amaterno, telefono, email, contraseña, idgenero);
        new ClienteDAO().create(cliente);
        request.getSession().setAttribute("customer", cliente);
        request.getSession().setAttribute("cart", new ArrayList<>());
        response.sendRedirect(request.getContextPath() + "/");
    }

}
