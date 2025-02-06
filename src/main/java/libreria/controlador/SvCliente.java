package libreria.controlador;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.sql.Date;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
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
            "/viewCart", "/getCartCount", "/getTotalPay", "/viewMainC", "/addToCart", "/deleteCart", "/updateCart",
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
            case "/getCartCount":
                getCartCount(request, response);
                break;
            case "/viewCart":
                viewCart(request, response);
                break;
            case "/addToCart":
                addToCart(request, response);
                break;
            case "/deleteCart":
                deleteCart(request, response);
                break;
            case "/updateCart":
                updateCart(request, response);
                break;
            case "/getTotalPay":
                getTotalPay(request, response);
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
            request.getSession().setAttribute("cart", new ArrayList<>());
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
        request.getSession().setAttribute("cart", new ArrayList<>());
        request.getRequestDispatcher("WEB-INF/customer/mainC.jsp").forward(request, response);
    }

    private void logoutSession(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.getSession().invalidate();
        response.sendRedirect("index.jsp");
    }

    private void viewMainC(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/customer/mainC.jsp").forward(request, response);
    }

    private void viewCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Carrito> cart = (ArrayList<Carrito>) request.getSession().getAttribute("cart");
        float fullPay = 0;
        String fullPayFormat;
        for (int i = 0; i < cart.size(); i++) {
            fullPay = fullPay + cart.get(i).getSubtotal();
        }
        fullPayFormat = formato.format(fullPay);
        float fullPayFormatFloat = Float.parseFloat(fullPayFormat);
        request.getSession().setAttribute("total", fullPayFormatFloat);
        request.getRequestDispatcher("WEB-INF/customer/cartC.jsp").forward(request, response);
    }

    private void addToCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Carrito> cart = (ArrayList<Carrito>) request.getSession().getAttribute("cart");
        boolean flag = false;
        JsonObject json = new Gson().fromJson(request.getReader(), JsonObject.class);
        String SKU = json.get("sku").getAsString();
        if (!cart.isEmpty()) {
            for (int i = 0; i < cart.size(); i++) {
                if (cart.get(i).getSKU().equals(SKU)) {
                    cart.get(i).setCantidad(cart.get(i).getCantidad() + 1);
                    String subtotalFormat = formato.format(cart.get(i).getCantidad() * cart.get(i).getPrecio());
                    float subtotalFormatFloat = Float.parseFloat(subtotalFormat);
                    cart.get(i).setSubtotal(subtotalFormatFloat);
                    flag = true;
                }
            }
            if (flag == false) {
                Producto p = new Producto();
                p.setSKU(SKU);
                p = new ProductoDAO().read(p);
                String precioFormat = formato.format(p.getPrecio());
                float subTotalFormat = Float.parseFloat(precioFormat);
                Carrito productCart = new Carrito(p.getImagen(), p.getSKU(), p.getNombre(), p.getPrecio(), 1, subTotalFormat);
                cart.add(productCart);
            }
        } else {
            Producto p = new Producto();
            p.setSKU(SKU);
            p = new ProductoDAO().read(p);
            Carrito productCart = new Carrito(p.getImagen(), p.getSKU(), p.getNombre(), p.getPrecio(), 1, p.getPrecio());
            cart.add(productCart);
        }
    }

    private void deleteCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Carrito> cart = (ArrayList<Carrito>) request.getSession().getAttribute("cart");
        JsonObject json = new Gson().fromJson(request.getReader(), JsonObject.class);
        String SKU = json.get("sku").getAsString();
        for (int i = 0; i < cart.size(); i++) {
            if (cart.get(i).getSKU().equals(SKU)) {
                cart.remove(i);
                break;
            }
        }
        
        HashMap<String, ArrayList<Carrito>> responseJson = new HashMap<>();
        responseJson.put("cart", cart);
        String jsonResponse = new Gson().toJson(responseJson);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonResponse);
    }

    private void updateCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
        ArrayList<Carrito> cart = (ArrayList<Carrito>) request.getSession().getAttribute("cart");
        JsonObject json = new Gson().fromJson(request.getReader(), JsonObject.class);
        String SKU = json.get("sku").getAsString();
        String type = json.get("type").getAsString();
        int value = json.get("value").getAsInt();
        float nuevoSubtotal = 0;

        if (type.equals("increment")) {
            for (int i = 0; i < cart.size(); i++) {
                if (cart.get(i).getSKU().equals(SKU)) {
                    cart.get(i).setCantidad(cart.get(i).getCantidad() + 1);
                    String subtotalFormat = formato.format(cart.get(i).getCantidad() * cart.get(i).getPrecio());
                    float subtotalFormatFloat = Float.parseFloat(subtotalFormat);
                    cart.get(i).setSubtotal(subtotalFormatFloat);
                    nuevoSubtotal = cart.get(i).getSubtotal();
                }
            }
        } else {
            for (int i = 0; i < cart.size(); i++) {
                if (cart.get(i).getSKU().equals(SKU)) {
                    cart.get(i).setCantidad(cart.get(i).getCantidad() - 1);
                    String subtotalFormat = formato.format(cart.get(i).getCantidad() * cart.get(i).getPrecio());
                    float subtotalFormatFloat = Float.parseFloat(subtotalFormat);
                    cart.get(i).setSubtotal(subtotalFormatFloat);
                    nuevoSubtotal = cart.get(i).getSubtotal();
                }
            }
        }
        
        HashMap<String, Float> responseJson = new HashMap<>();
        responseJson.put("nuevoSubtotal", nuevoSubtotal);
        String jsonResponse = new Gson().toJson(responseJson);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonResponse);
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

    private void checkBuyComplete(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
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

    private void getCartCount(HttpServletRequest request, HttpServletResponse response) throws IOException {
        ArrayList<Carrito> cart = (ArrayList<Carrito>) request.getSession().getAttribute("cart");
        int count = cart.size();

        HashMap<String, Integer> responseJson = new HashMap<>();
        responseJson.put("count", count);
        String jsonResponse = new Gson().toJson(responseJson);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonResponse);
    }

    private void getTotalPay(HttpServletRequest request, HttpServletResponse response) throws IOException {
        ArrayList<Carrito> cart = (ArrayList<Carrito>) request.getSession().getAttribute("cart");
        float fullPay = 0;
        String fullPayFormat;
        for (int i = 0; i < cart.size(); i++) {
            fullPay = fullPay + cart.get(i).getSubtotal();
        }
        fullPayFormat = formato.format(fullPay);
        float fullPayFormatFloat = Float.parseFloat(fullPayFormat);
        
        HashMap<String, Float> responseJson = new HashMap<>();
        responseJson.put("total", fullPayFormatFloat);
        String jsonResponse = new Gson().toJson(responseJson);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonResponse);
    }
   
}
