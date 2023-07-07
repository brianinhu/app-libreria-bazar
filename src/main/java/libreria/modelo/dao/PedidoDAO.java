package libreria.modelo.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import libreria.conexion.Conexion;
import libreria.helper.InterfaceCRUD;
import libreria.modelo.bean.Carrito;
import libreria.modelo.bean.Pedido;
import libreria.modelo.bean.PedidoDetalle;

public class PedidoDAO extends Conexion implements InterfaceCRUD<Pedido> {

    @Override
    public ArrayList<Pedido> tolist() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void create(Pedido e) {
        String sentence = "insert into pedido(codigo, fecha, total, idcliente) values (?,?,?,?)";
        try {
            cn = getConnection();
            ps = cn.prepareStatement(sentence);
            ps.setString(1, e.getCodigo());
            ps.setDate(2, e.getFecha());
            ps.setFloat(3, e.getTotal());
            ps.setString(4, e.getIdcliente());
            ps.executeUpdate();

            String codigo = e.getCodigo();
            for (Carrito list : e.getListCartBuy()) {
                PedidoDetalle pedidodetalle = new PedidoDetalle(list.getCantidad(), list.getSubtotal(), codigo, list.getSKU());
                new PedidoDetalleDAO().create(pedidodetalle);
            }
        } catch (SQLException ex) {
            System.out.println("Error al crear un pedido. \nDetalles: " + ex.getMessage());
        } finally {
            close(cn);
            close(ps);
            close(rs);
        }
    }

    @Override
    public Pedido read(Pedido e) {
        Pedido pedido = null;
        String sentence = "select * from pedido where codigo = ?";
        try {
            cn = getConnection();
            ps = cn.prepareStatement(sentence);
            ps.setString(1, e.getCodigo());
            rs = ps.executeQuery();
            if (rs.next()) {
                pedido = new Pedido(rs.getString(1), rs.getDate(2), rs.getFloat(3), rs.getString(4), null);
            }
        } catch (SQLException ex) {
            System.out.println("Error al leer un pedido. \nDetalles: " + ex.getMessage());
        } finally {
            close(cn);
            close(ps);
            close(rs);
        }
        return pedido;
    }

    @Override
    public void update(Pedido e) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Pedido e) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
