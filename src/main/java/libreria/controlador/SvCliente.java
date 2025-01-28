package libreria.controlador;

import java.io.IOException;
import java.sql.Date;
import java.text.DecimalFormat;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import libreria.modelo.bean.Carrito;
import libreria.modelo.bean.Cliente;
import libreria.modelo.bean.Pedido;
import libreria.modelo.bean.Producto;
import libreria.modelo.dao.ClienteDAO;
import libreria.modelo.dao.PedidoDAO;
import libreria.modelo.dao.ProductoDAO;

@WebServlet(name = "SvCliente", urlPatterns
        = {"/SvCliente", "/viewLoginC", "/loginC", "/logoutC", "/viewSignupC", "/signupC",
            "/viewCart", "/viewMainC", "/addtoCart", "/deletetoCart", "/updatetoCart",
            "/viewBuySummary", "/buyComplete", "/checkBuyComplete"})
public class SvCliente extends HttpServlet {

    protected ArrayList<Carrito> listCart = new ArrayList<>();
    protected int quantity = 1;
    protected DecimalFormat formato = new DecimalFormat("#.##");

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String path = request.getServletPath();

        switch (path) {
            case "/viewLoginC":
                request.getRequestDispatcher("loginC.jsp").forward(request, response);
                break;
            case "/loginC":
                loginSession(request, response);
                break;
            case "/viewSignupC":
                request.getRequestDispatcher("signupC.jsp").forward(request, response);
                break;
            case "/signupC":
                signupC(request, response);
                break;
            case "/logoutC":
                logoutSession(request, response);
                break;
            case "/viewMainC":
                viewMainC(request, response);
                break;
            case "/viewCart":
                viewCart(request, response);
                break;
            case "/addtoCart":
                addtoCart(request, response);
                break;
            case "/deletetoCart":
                deletetoCart(request, response);
                break;
            case "/updatetoCart":
                updatetoCart(request, response);
                break;
            case "/viewBuySummary":
                viewBuySummary(request, response);
                break;
            case "/buyComplete":
                buyComplete(request, response);
                break;
            case "/checkBuyComplete":
                checkBuyComplete(request, response);
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
            request.setAttribute("quantityProductToCart", listCart.size());
            request.getRequestDispatcher("WEB-INF/customer/mainC.jsp").forward(request, response);
        } else {
            request.setAttribute("msg", "El inicio de sesión de la cuenta fue incorrecto. Vuelva a intentarlo");
            request.getRequestDispatcher("loginC.jsp").forward(request, response);
        }

    }

    private void signupC(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
        request.getSession().setAttribute("quantityProductToCart", 0);
        request.getRequestDispatcher("WEB-INF/customer/mainC.jsp").forward(request, response);
    }

    private void logoutSession(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.getSession().invalidate();
        response.sendRedirect("index.jsp");
    }

    private void viewMainC(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("quantityProductToCart", listCart.size());
        request.getRequestDispatcher("WEB-INF/customer/mainC.jsp").forward(request, response);
    }

    private void viewCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float fullPay = 0;
        String stringFormat;
        for (int i = 0; i < listCart.size(); i++) {
            fullPay = fullPay + listCart.get(i).getSubtotal();
        }
        stringFormat = formato.format(fullPay);
        fullPay = Float.parseFloat(stringFormat);
        request.setAttribute("fullPay", fullPay);
        request.setAttribute("quantityProductToCart", listCart.size());
        request.setAttribute("cart", listCart);
        request.getRequestDispatcher("WEB-INF/customer/cartC.jsp").forward(request, response);
    }

    private void addtoCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        boolean flag = false;
        String SKU = request.getParameter("SKU");
        if (!listCart.isEmpty()) {
            for (int i = 0; i < listCart.size(); i++) {
                if (listCart.get(i).getSKU().equals(SKU)) {
                    listCart.get(i).setCantidad(listCart.get(i).getCantidad() + 1);
                    String numeroFormateado = formato.format(listCart.get(i).getCantidad() * listCart.get(i).getPrecio());
                    float subTotalFormat = Float.parseFloat(numeroFormateado);
                    listCart.get(i).setSubtotal(subTotalFormat);
                    flag = true;
                }
            }
            if (flag == false) {
                Producto p = new Producto();
                p.setSKU(SKU);
                p = new ProductoDAO().read(p);
                String numeroFormateado = formato.format(quantity * p.getPrecio());
                float subTotalFormat = Float.parseFloat(numeroFormateado);
                Carrito cart = new Carrito(p.getImagen(), p.getSKU(), p.getNombre(), p.getPrecio(), quantity, subTotalFormat);
                listCart.add(cart);
            }
        } else {
            Producto p = new Producto();
            p.setSKU(SKU);
            p = new ProductoDAO().read(p);
            Carrito cart = new Carrito(p.getImagen(), p.getSKU(), p.getNombre(), p.getPrecio(), quantity, quantity * p.getPrecio());
            listCart.add(cart);
        }
        request.setAttribute("quantityProductToCart", listCart.size());
        request.getRequestDispatcher("WEB-INF/customer/mainC.jsp").forward(request, response);
    }

    private void deletetoCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String SKU = request.getParameter("SKU");
        for (int i = 0; i < listCart.size(); i++) {
            if (listCart.get(i).getSKU().equals(SKU)) {
                listCart.remove(i);
                break;
            }
        }
        request.setAttribute("cart", listCart);
        request.setAttribute("quantityProductToCart", listCart.size());
        response.sendRedirect("viewCart");
    }

    private void updatetoCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String SKU = request.getParameter("SKU");
        int newQuantity = Integer.parseInt(request.getParameter("newQuantity"));
        float subTotalFormat;
        String numeroFormateado;
        for (int i = 0; i < listCart.size(); i++) {
            if (listCart.get(i).getSKU().equals(SKU)) {
                listCart.get(i).setCantidad(newQuantity);
                numeroFormateado = formato.format(listCart.get(i).getCantidad() * listCart.get(i).getPrecio());
                subTotalFormat = Float.parseFloat(numeroFormateado);
                listCart.get(i).setSubtotal(subTotalFormat);
            }
        }
        response.sendRedirect("viewCart");
    }

    private void viewBuySummary(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float fullPay = 0;
        String stringFormat;
        for (int i = 0; i < listCart.size(); i++) {
            fullPay = fullPay + listCart.get(i).getSubtotal();
        }
        stringFormat = formato.format(fullPay);
        fullPay = Float.parseFloat(stringFormat);
        request.setAttribute("fullPay", fullPay);
        request.setAttribute("quantityProductToCart", listCart.size());
        request.setAttribute("cart", listCart);
        request.getRequestDispatcher("WEB-INF/customer/checkout/buySummary.jsp").forward(request, response);
    }

    private void buyComplete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String codigo = request.getParameter("codigo");
        Date fecha = Date.valueOf(request.getParameter("fecha"));
        float total = Float.parseFloat(request.getParameter("total"));
        String idcliente = request.getParameter("idcliente");
        int iddistrito = Integer.parseInt(request.getParameter("iddistrito"));
        int idtienda = Integer.parseInt(request.getParameter("idtienda"));
        int identrega = Integer.parseInt(request.getParameter("identrega"));
        int idpago = Integer.parseInt(request.getParameter("idpago"));
        String direccion = request.getParameter("direccion");
        ArrayList<Carrito> listCartBuy = listCart;
        if (listCart.isEmpty() || identrega == 0 || idpago == 0) {
        } else {
            Pedido pedido = new Pedido(codigo, fecha, total, idcliente, iddistrito, idtienda, identrega, idpago, direccion, listCartBuy);
            new PedidoDAO().create(pedido);
        }
    }

    private void checkBuyComplete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String codigo = request.getParameter("codigo");
        Pedido pedido = new Pedido();
        pedido.setCodigo(codigo);
        if (new PedidoDAO().read(pedido) != null) {
            request.setAttribute("codigo", codigo);
            request.getRequestDispatcher("WEB-INF/customer/checkout/buySuccess.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("WEB-INF/customer/checkout/buyError.jsp").forward(request, response);
        }
    }
}
