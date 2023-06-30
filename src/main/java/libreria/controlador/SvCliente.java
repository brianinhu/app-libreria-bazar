package libreria.controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import libreria.modelo.bean.Cliente;
import libreria.modelo.dao.ClienteDAO;

@WebServlet(name = "SvCliente", urlPatterns = {"/SvCliente", "/viewLogin", "/login", "/logout", "/viewSignup", "/signup"})
public class SvCliente extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String path = request.getServletPath();

        switch (path) {
            case "/viewLogin":
                request.getRequestDispatcher("web/login.jsp").forward(request, response);
                break;
            case "/login":
                loginSession(request, response);
                break;
            case "/viewSignup":
                request.getRequestDispatcher("web/signup.jsp").forward(request, response);
                break;
            case "/signup":
                signup(request, response);
                break;
            case "/logout":
                logoutSession(request, response);
                break;
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void loginSession(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("txtemail");
        String contraseña = request.getParameter("txtcontrasena");
        Cliente cliente = new Cliente();
        cliente.setEmail(email);
        cliente.setContraseña(contraseña);
        cliente = new ClienteDAO().read(cliente);
        if (cliente != null) {
            request.getSession().setAttribute("customer", cliente);
            request.getRequestDispatcher("WEB-INF/customer/main.jsp").forward(request, response);
        } else {
            request.setAttribute("msg", "El inicio de sesión de la cuenta fue incorrecto. Vuelva a intentarlo");
            request.getRequestDispatcher("web/login.jsp").forward(request, response);
        }

    }

    private void signup(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombre = request.getParameter("txtnombre");
        String apaterno = request.getParameter("txtapaterno");
        String amaterno = request.getParameter("txtamaterno");
        String telefono = request.getParameter("txttelefono");
        String email = request.getParameter("txtemail");
        String contraseña = request.getParameter("txtcontrasena");
        int idgenero = Integer.parseInt(request.getParameter("txtidgenero"));

        Cliente cliente = new Cliente(0, nombre, apaterno, amaterno, telefono, email, contraseña, idgenero);
        new ClienteDAO().create(cliente);
        request.setAttribute("flag", true);
        request.getSession().setAttribute("customer", cliente);
        request.getRequestDispatcher("WEB-INF/customer/main.jsp").forward(request, response);
    }

    private void logoutSession(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.getSession().invalidate();
        response.sendRedirect("index.jsp");
    }

}
