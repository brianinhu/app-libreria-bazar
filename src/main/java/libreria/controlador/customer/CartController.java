package libreria.controlador.customer;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import libreria.modelo.bean.Carrito;
import libreria.modelo.bean.Categoria;
import libreria.modelo.bean.Producto;
import libreria.modelo.dao.CategoriaDAO;
import libreria.modelo.dao.ProductoDAO;

@WebServlet("/cart")
public class CartController extends HttpServlet {

    protected DecimalFormat formato = new DecimalFormat("#.##");

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            ArrayList<Categoria> categorias = new CategoriaDAO().toList();
            request.setAttribute("categorias", categorias);
            request.getRequestDispatcher("cart.jsp").forward(request, response);
            return;
        }

        switch (action) {
            case "count":
                getTotalItems(request, response);
                break;
            case "total":
                getCartTotal(request, response);
                break;
            case "clear":
                clearCart(request, response);
                break;
            default:
                request.getRequestDispatcher("cart.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            response.sendRedirect("cart");
            return;
        }

        switch (action) {
            case "add":
                addItem(request, response);
                break;
            case "remove":
                removeItem(request, response);
                break;
            case "update":
                updateItemQuantity(request, response);
                break;
            default:
                request.getRequestDispatcher("cart.jsp").forward(request, response);
        }
    }

    private void addItem(HttpServletRequest request, HttpServletResponse response) throws IOException {
        ArrayList<Carrito> cart = (ArrayList<Carrito>) request.getSession().getAttribute("cart");
        boolean flag = false;
        JsonObject json = new Gson().fromJson(request.getReader(), JsonObject.class);
        String SKU = json.get("sku").getAsString();
        if (!cart.isEmpty()) {
            for (int i = 0; i < cart.size(); i++) {
                if (cart.get(i).getSKU().equals(SKU)) {
                    cart.get(i).setCantidad(cart.get(i).getCantidad() + 1);
                    BigDecimal subTotal = cart.get(i).getPrecio().multiply(BigDecimal.valueOf(cart.get(i).getCantidad()));
                    cart.get(i).setSubtotal(subTotal);
                    flag = true;
                }
            }
            if (flag == false) {
                Producto p = new Producto();
                p.setSKU(SKU);
                p = new ProductoDAO().read(p);
                BigDecimal subTotal = p.getPrecio();
                Carrito productCart = new Carrito(p.getImagen(), p.getSKU(), p.getNombre(), p.getPrecio(), 1, subTotal);
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

    private void removeItem(HttpServletRequest request, HttpServletResponse response) throws IOException {
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

    private void updateItemQuantity(HttpServletRequest request, HttpServletResponse response) throws IOException {
        ArrayList<Carrito> cart = (ArrayList<Carrito>) request.getSession().getAttribute("cart");
        JsonObject json = new Gson().fromJson(request.getReader(), JsonObject.class);
        String SKU = json.get("sku").getAsString();
        String type = json.get("type").getAsString();
        BigDecimal nuevoSubtotal = BigDecimal.ZERO;

        if (type.equals("increment")) {
            for (int i = 0; i < cart.size(); i++) {
                if (cart.get(i).getSKU().equals(SKU)) {
                    cart.get(i).setCantidad(cart.get(i).getCantidad() + 1);
                    BigDecimal subTotal = cart.get(i).getPrecio().multiply(BigDecimal.valueOf(cart.get(i).getCantidad()));
                    cart.get(i).setSubtotal(subTotal);
                    nuevoSubtotal = cart.get(i).getSubtotal();
                }
            }
        } else {
            for (int i = 0; i < cart.size(); i++) {
                if (cart.get(i).getSKU().equals(SKU)) {
                    cart.get(i).setCantidad(cart.get(i).getCantidad() - 1);
                    BigDecimal subTotal = cart.get(i).getPrecio().multiply(BigDecimal.valueOf(cart.get(i).getCantidad()));
                    cart.get(i).setSubtotal(subTotal);
                    nuevoSubtotal = cart.get(i).getSubtotal();
                }
            }
        }

        HashMap<String, String> responseJson = new HashMap<>();
        responseJson.put("nuevoSubtotal", nuevoSubtotal.setScale(2, RoundingMode.HALF_UP).toString());
        String jsonResponse = new Gson().toJson(responseJson);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonResponse);
    }

    private void clearCart(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getSession().setAttribute("cart", new ArrayList<>());
        response.sendRedirect(request.getContextPath() + "/");
    }

    private void getTotalItems(HttpServletRequest request, HttpServletResponse response) throws IOException {
        if (request.getSession().getAttribute("cart") == null) {
            request.getSession().setAttribute("cart", new ArrayList<Carrito>());
        }
        ArrayList<Carrito> cart = (ArrayList<Carrito>) request.getSession().getAttribute("cart");
        int count = cart.size();

        HashMap<String, Integer> responseJson = new HashMap<>();
        responseJson.put("count", count);
        String jsonResponse = new Gson().toJson(responseJson);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonResponse);
    }

    private void getCartTotal(HttpServletRequest request, HttpServletResponse response) throws IOException {
        ArrayList<Carrito> cart = (ArrayList<Carrito>) request.getSession().getAttribute("cart");
        BigDecimal total = BigDecimal.ZERO;
        for (int i = 0; i < cart.size(); i++) {
            total = total.add(cart.get(i).getSubtotal());
        }

        HashMap<String, String> responseJson = new HashMap<>();
        responseJson.put("total", total.setScale(2, RoundingMode.HALF_UP).toString());
        String jsonResponse = new Gson().toJson(responseJson);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonResponse);
    }

}
