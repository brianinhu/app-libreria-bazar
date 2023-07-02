package libreria.controlador;

import java.io.IOException;
import java.io.InputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import libreria.modelo.bean.Administrador;
import libreria.modelo.bean.Producto;
import libreria.modelo.dao.AdministradorDAO;
import libreria.modelo.dao.ProductoDAO;

@MultipartConfig
@WebServlet(name = "SvAdministrador", urlPatterns = {"/SvAdministrador", "/loginA", "/logoutA", "/viewProductoAG", "/createProducto", "/readImage"})
public class SvAdministrador extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String path = request.getServletPath();

        switch (path) {
            case "/loginA":
                loginSession(request, response);
                break;
            case "/logoutA":
                logoutSession(request, response);
                break;
            case "/viewProductoAG":
                request.getRequestDispatcher("WEB-INF/administratorAG/productoAG.jsp").forward(request, response);
                break;
            case "/createProducto":
                createProducto(request, response);
                break;
            case "/readImage":
                readImage(request, response);
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
        String user = request.getParameter("txtuser");
        String pass = request.getParameter("txtpass");

        Administrador a = new Administrador();
        a.setUser(user);
        a.setPassword(pass);
        a = new AdministradorDAO().read(a);
        if (a != null) {
            if (a.getEstado() == '1') {
                request.getSession().setAttribute("administrator", a);
                switch (a.getIdrol()) {
                    case 1:
                        request.getRequestDispatcher("WEB-INF/administratorAG/mainAG.jsp").forward(request, response);
                        break;
                    case 2:
                        request.getRequestDispatcher("WEB-INF/administratorAV/mainAV.jsp").forward(request, response);
                        break;
                    case 3:
                        request.getRequestDispatcher("WEB-INF/administratorAC/mainAC.jsp").forward(request, response);
                        break;
                }
            } else {
                request.setAttribute("messageError", "Su cuenta ha sido desactivada. \nContacte con el administrador general para más información");
                request.getRequestDispatcher("loginA.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("messageError", "Credenciales incorrectas. \nInténtelo nuevamente");
            request.getRequestDispatcher("loginA.jsp").forward(request, response);
        }

    }

    private void logoutSession(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.getSession().invalidate();
        response.sendRedirect("loginA.jsp");
    }

    private void createProducto(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String SKU = request.getParameter("txtSKU");
        String nombre = request.getParameter("txtnombre");
        String descripcion = request.getParameter("txtdescripcion");
        int idmarca = Integer.parseInt(request.getParameter("cbxMarca"));
        float precio = Float.parseFloat(request.getParameter("txtprecio"));
        int stock = Integer.parseInt(request.getParameter("txtstock"));
        int idcategoria = Integer.parseInt(request.getParameter("cbxCategoria"));
        Part part = request.getPart("fileImagen");
        InputStream inputStream = part.getInputStream();
        Producto p = new Producto(SKU, nombre, descripcion, idmarca, precio, stock, inputStream, idcategoria);
        new ProductoDAO().create(p);
        request.getRequestDispatcher("WEB-INF/administratorAG/productoAG.jsp").forward(request, response);
    }

    private void readImage(HttpServletRequest request, HttpServletResponse response) {
        String SKU = request.getParameter("SKUProducto");
        new ProductoDAO().readImage(SKU, response);
    }

}
