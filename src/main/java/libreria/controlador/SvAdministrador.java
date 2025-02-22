package libreria.controlador;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import libreria.modelo.bean.Administrador;
import libreria.modelo.bean.Personal;
import libreria.modelo.bean.Producto;
import libreria.modelo.dao.AdministradorDAO;
import libreria.modelo.dao.PersonalDAO;
import libreria.modelo.dao.ProductoDAO;

@MultipartConfig
@WebServlet(name = "SvAdministrador", urlPatterns = {"/SvAdministrador", "/loginA", "/logoutA",
    "/viewProductosAG", "/createProducto", "/readImage", "/deleteProducto", "/updateProducto",
    "/viewAdministradoresAG", "/viewClientesAG", "/viewPedidosAG", "/viewPersonalAG", "/verAdminxRol"})
public class SvAdministrador extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String path = request.getServletPath();

        switch (path) {
            /* Inicios de sesión */
            case "/loginA":
                loginSession(request, response);
                break;
            case "/logoutA":
                logoutSession(request, response);
                break;
            /* Inicios de sesión */

 /* Vista productos */
            case "/viewProductosAG":
                request.getRequestDispatcher("WEB-INF/administrator/administratorAG/productosAG.jsp").forward(request, response);
                break;
            case "/createProducto":
                createProducto(request, response);
                break;
            case "/readImage":
                readImage(request, response);
                break;
            case "/deleteProducto":
                deleteProducto(request, response);
                break;
            case "/updateProducto":
                updateProducto(request, response);
                break;
            /* Vista productos */

 /* Vista administradores */
            case "/viewAdministradoresAG":
                request.getRequestDispatcher("WEB-INF/administrator/administratorAG/administradoresAG.jsp").forward(request, response);
                break;
            case "/verAdminxRol":
                verAdminxRol(request, response);
                break;
            /* Vista administradores */

 /* Vista clientes */
            case "/viewClientesAG":
                request.getRequestDispatcher("WEB-INF/administrator/administratorAG/clientesAG.jsp").forward(request, response);
                break;
            /* Vista clientes */

 /* Vista pedidos */
            case "/viewPedidosAG":
                request.getRequestDispatcher("WEB-INF/administrator/administratorAG/pedidosAG.jsp").forward(request, response);
                break;
            /* Vista pedidos */

 /* Vista personal */
            case "/viewPersonalAG":
                request.getRequestDispatcher("WEB-INF/administrator/administratorAG/personalAG.jsp").forward(request, response);
                break;
            /* Vista personal */
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
                        request.getRequestDispatcher("WEB-INF/administrator/administratorAG/mainAG.jsp").forward(request, response);
                        break;
                    case 2:
                        request.getRequestDispatcher("WEB-INF/administrator/administratorAV/mainAV.jsp").forward(request, response);
                        break;
                    case 3:
                        request.getRequestDispatcher("WEB-INF/administrator/administratorAC/mainAC.jsp").forward(request, response);
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
        String SKU = request.getParameter("txtSKUCreate");
        String nombre = request.getParameter("txtnombre");
        String descripcion = request.getParameter("txtdescripcion");
        int idmarca = Integer.parseInt(request.getParameter("cbxMarca"));
        BigDecimal precio = new BigDecimal(request.getParameter("txtprecio"));
        int stock = Integer.parseInt(request.getParameter("txtstock"));
        int idcategoria = Integer.parseInt(request.getParameter("cbxCategoria"));
        Part part = request.getPart("fileImagen");
        InputStream inputStream = part.getInputStream();
        Producto p = new Producto(SKU, nombre, descripcion, idmarca, precio, stock, inputStream, idcategoria);
        new ProductoDAO().create(p);
        request.getRequestDispatcher("WEB-INF/administrator/administratorAG/productosAG.jsp").forward(request, response);
    }

    private void readImage(HttpServletRequest request, HttpServletResponse response) {
        String SKU = request.getParameter("SKUProducto");
        new ProductoDAO().readImage(SKU, response);
    }

    private void deleteProducto(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String SKU = request.getParameter("SKU");
        Producto producto = new Producto();
        producto.setSKU(SKU);
        new ProductoDAO().delete(producto);
        request.getRequestDispatcher("WEB-INF/administrator/administratorAG/productosAG.jsp").forward(request, response);
    }

    private void updateProducto(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String SKU = request.getParameter("txtSKUUpdate");
        String nombre = request.getParameter("txtnombre");
        String descripcion = request.getParameter("txtdescripcion");
        int idmarca = Integer.parseInt(request.getParameter("cbxMarca"));
        BigDecimal precio = new BigDecimal(request.getParameter("txtprecio"));
        int stock = Integer.parseInt(request.getParameter("txtstock"));
        int idcategoria = Integer.parseInt(request.getParameter("cbxCategoria"));
        Part part = request.getPart("fileImagen");
        InputStream inputStream = part.getInputStream();
        Producto p = new Producto(SKU, nombre, descripcion, idmarca, precio, stock, inputStream, idcategoria);
        new ProductoDAO().update(p);
        request.getRequestDispatcher("WEB-INF/administrator/administratorAG/productosAG.jsp").forward(request, response);
    }

    private void verAdminxRol(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int idrol = Integer.parseInt(request.getParameter("idrol"));
        ArrayList<Administrador> listaAdmin;
        StringBuilder htmlTabla = new StringBuilder();
        if (idrol != 4) {
            listaAdmin = new AdministradorDAO().tolistbyIdRol(idrol);
            htmlTabla.append("<table>");
            htmlTabla.append("<tr><th>Personal</th><th>User</th><th>Password</th><th>Estado</th><th>Acciones</th></tr>");
            for (Administrador a : listaAdmin) {
                htmlTabla.append("<tr>");
                Personal p = new Personal();
                p.setIdpersonal(a.getIdpersonal());
                p = new PersonalDAO().read(p);
                htmlTabla.append("<td>").append(p.getNombre()).append(" ").append(p.getApaterno()).append("</td>");
                htmlTabla.append("<td>").append(a.getUser()).append("</td>");
                htmlTabla.append("<td>").append(a.getPassword()).append("</td>");
                if (a.getEstado() == '0') {
                    htmlTabla.append("<td>").append("<span class='badge text-bg-danger'>Inactivo</span>").append("</td>");
                } else {
                    htmlTabla.append("<td>").append("<span class='badge text-bg-success'>Activo</span>").append("</td>");
                }
                htmlTabla.append("<td><button class='btn btn-warning me-1'><i class='bx bxs-edit'></i></button><button class='btn btn-danger'><i class='bx bxs-trash-alt'></i></button></td>");
                htmlTabla.append("</tr>");
            }
            htmlTabla.append("</table>");
        } else {
            listaAdmin = new AdministradorDAO().toList();
            htmlTabla.append("<table>");
            htmlTabla.append("<tr><th>Tipo</th><th>Personal</th><th>User</th><th>Password</th><th>Estado</th><th>Acciones</th></tr>");
            for (Administrador a : listaAdmin) {
                htmlTabla.append("<tr>");
                switch (a.getIdrol()) {
                    case 1:
                        htmlTabla.append("<td>AG</td>");
                        break;
                    case 2:
                        htmlTabla.append("<td>AV</td>");
                        break;
                    default:
                        htmlTabla.append("<td>AC</td>");
                        break;
                }
                Personal p = new Personal();
                p.setIdpersonal(a.getIdpersonal());
                p = new PersonalDAO().read(p);
                htmlTabla.append("<td>").append(p.getNombre()).append(" ").append(p.getApaterno()).append("</td>");
                htmlTabla.append("<td>").append(a.getUser()).append("</td>");
                htmlTabla.append("<td>").append(a.getPassword()).append("</td>");
                if (a.getEstado() == '0') {
                    htmlTabla.append("<td>").append("<span class='badge text-bg-danger'>Inactivo</span>").append("</td>");
                } else {
                    htmlTabla.append("<td>").append("<span class='badge text-bg-success'>Activo</span>").append("</td>");
                }
                htmlTabla.append("<td><button class='btn btn-warning me-1'><i class='bx bxs-edit'></i></button><button class='btn btn-danger'><i class='bx bxs-trash-alt'></i></button></td>");
                htmlTabla.append("</tr>");
            }
            htmlTabla.append("</table>");
        }

        // Devolver la respuesta con el HTML de la tabla
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(htmlTabla.toString());
        out.flush();
    }

}
