package libreria.controlador;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import libreria.modelo.bean.Categoria;
import libreria.modelo.bean.Producto;
import libreria.modelo.dao.CategoriaDAO;
import libreria.modelo.dao.ProductoDAO;

@WebServlet("/categoria/*")
public class CategoryController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathInfo = request.getPathInfo();

        if (pathInfo == null || pathInfo.equals("/")) {
            response.sendRedirect(request.getContextPath() + "/");
            return;
        }

        String categorySlug = pathInfo.substring(1);
        Categoria categoria = new CategoriaDAO().getBySlug(categorySlug);

        if (categoria == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        ArrayList<Producto> productos = new ProductoDAO().getProductosByCategoria(categoria.getIdcategoria());

        request.setAttribute("categoria", categoria);
        request.setAttribute("productos", productos);
        request.getRequestDispatcher("/WEB-INF/customer/views/categoria.jsp").forward(request, response);
    }
}
