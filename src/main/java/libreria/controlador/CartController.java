package libreria.controlador;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import libreria.modelo.bean.Carrito;
import libreria.modelo.bean.Producto;
import libreria.modelo.dao.ProductoDAO;

@WebServlet("/cart")
public class CartController extends HttpServlet {

    protected DecimalFormat formato = new DecimalFormat("#.##");

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
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
