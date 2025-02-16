package libreria.modelo.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import libreria.conexion.Conexion;
import libreria.helper.InterfaceCRUD;
import libreria.modelo.bean.PedidoDetalle;

public class PedidoDetalleDAO extends Conexion implements InterfaceCRUD<PedidoDetalle> {

    @Override
    public ArrayList<PedidoDetalle> tolist() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void create(PedidoDetalle e) {
        String sentence = "insert into pedido_detalle(cantidad, subtotal, codigo, SKU) values (?,?,?,?)";
        try {
            cn = getConnection();
            ps = cn.prepareStatement(sentence);
            ps.setInt(1, e.getCantidad());
            ps.setBigDecimal(2, e.getSubtotal());
            ps.setString(3, e.getCodigo());
            ps.setString(4, e.getSKU());
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error al crear un pedido detalle. \nDetalles: " + ex.getMessage());
        } finally {
            close(cn);
            close(ps);
            close(rs);
        }
    }

    @Override
    public PedidoDetalle read(PedidoDetalle e) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(PedidoDetalle e) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(PedidoDetalle e) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
