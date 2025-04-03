package libreria.controlador.customer;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import libreria.modelo.bean.Categoria;
import libreria.modelo.dao.CategoriaDAO;

@WebServlet("")
public class HomeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        ArrayList<Categoria> categorias = new CategoriaDAO().toList();
        request.getSession().setAttribute("categorias", categorias);

        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
