package libreria.controlador.customer;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import libreria.modelo.bean.Carrito;
import libreria.modelo.bean.Categoria;
import libreria.modelo.dao.CategoriaDAO;

@WebServlet("/checkout")
public class CheckoutController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Carrito> cart = (ArrayList<Carrito>) request.getSession().getAttribute("cart");
        if (cart == null || cart.isEmpty()) {
            String message = "El carrito está vacío";
            request.setAttribute("message", message);
            ArrayList<Categoria> categorias = new CategoriaDAO().toList();
            request.setAttribute("categorias", categorias);
            request.getRequestDispatcher("cart.jsp").forward(request, response);
            return;
        }
        request.getRequestDispatcher("WEB-INF/customer/views/checkout/checkout.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
