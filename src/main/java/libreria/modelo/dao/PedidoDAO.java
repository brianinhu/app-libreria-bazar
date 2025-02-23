package libreria.modelo.dao;

import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import libreria.conexion.Conexion;
import libreria.helper.InterfaceCRUD;
import libreria.modelo.bean.Carrito;
import libreria.modelo.bean.Pedido;
import libreria.modelo.bean.PedidoDetalle;

public class PedidoDAO extends Conexion implements InterfaceCRUD<Pedido> {

    @Override
    public ArrayList<Pedido> toList() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void create(Pedido e) {
        String sentence = "insert into pedido(codigo, fecha, total, idcliente, iddistrito, idtienda, identrega, idpago, direccion) values (?,?,?,?,?,?,?,?,?)";
        try {
            cn = getConnection();
            ps = cn.prepareStatement(sentence);
            ps.setString(1, e.getCodigo());
            ps.setDate(2, e.getFecha());
            ps.setBigDecimal(3, e.getTotal());
            ps.setString(4, e.getIdcliente());
            if (e.getIddistrito() == 0) {
                ps.setNull(5, Types.INTEGER);
            } else {
                ps.setInt(5, e.getIddistrito());
            }
            if (e.getIdtienda() == 0) {
                ps.setNull(6, Types.INTEGER);
            } else {
                ps.setInt(6, e.getIdtienda());
            }
            ps.setInt(7, e.getIdentrega());
            ps.setInt(8, e.getIdpago());
            if (e.getDireccion().isBlank()) {
                ps.setNull(9, Types.VARCHAR);
            } else {
                ps.setString(9, e.getDireccion());
            }
            ps.executeUpdate();

            String codigo = e.getCodigo();
            for (Carrito list : e.getCart()) {
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
                pedido = new Pedido(rs.getString(1), rs.getDate(2), rs.getBigDecimal(3), rs.getString(4), rs.getInt(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getString(9), null);
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
