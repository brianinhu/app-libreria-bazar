package libreria.controlador.customer;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import libreria.modelo.bean.Producto;
import libreria.modelo.dao.ProductoDAO;

@WebServlet("/producto/*")
public class ProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pathInfo = request.getPathInfo();

        if (pathInfo == null || pathInfo.equals("/")) {
            response.sendRedirect(request.getContextPath() + "/");
            return;
        }

        String productoSlug = pathInfo.substring(1);
        Producto producto = new ProductoDAO().getBySlug(productoSlug);
        
        System.out.println(productoSlug);

        if (producto == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        request.setAttribute("producto", producto);
        request.getRequestDispatcher("/product.jsp").forward(request, response);
    }
}
