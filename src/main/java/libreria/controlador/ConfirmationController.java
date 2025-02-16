package libreria.controlador;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import libreria.modelo.bean.Carrito;
import libreria.modelo.bean.Pedido;
import libreria.modelo.dao.PedidoDAO;

@WebServlet("/confirmation")
public class ConfirmationController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String codigo = request.getParameter("codigo");
        Date fecha = Date.valueOf(request.getParameter("fecha"));
        BigDecimal total = new BigDecimal(request.getParameter("total"));
        String idcliente = request.getParameter("idcliente");
        int iddistrito = Integer.parseInt(request.getParameter("iddistrito"));
        int idtienda = Integer.parseInt(request.getParameter("idtienda"));
        int identrega = Integer.parseInt(request.getParameter("identrega"));
        int idpago = Integer.parseInt(request.getParameter("idpago"));
        String direccion = request.getParameter("direccion");
        ArrayList<Carrito> cart = (ArrayList<Carrito>) request.getSession().getAttribute("cart");
        if (cart.isEmpty() || identrega == 0 || idpago == 0) {
        } else {
            Pedido pedido = new Pedido(codigo, fecha, total, idcliente, iddistrito, idtienda, identrega, idpago, direccion, cart);
            new PedidoDAO().create(pedido);
        }
    }

}
