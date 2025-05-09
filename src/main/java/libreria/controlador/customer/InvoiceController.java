package libreria.controlador.customer;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import libreria.modelo.bean.Pedido;
import libreria.modelo.dao.PedidoDAO;

@WebServlet("/invoice")
public class InvoiceController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String codigo = request.getParameter("codigo");
        Pedido pedido = new Pedido();
        pedido.setCodigo(codigo);
        if (new PedidoDAO().read(pedido) != null) {
            request.setAttribute("codigo", codigo);
            request.getRequestDispatcher("WEB-INF/customer/views/checkout/success.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("WEB-INF/customer/views/checkout/error.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
