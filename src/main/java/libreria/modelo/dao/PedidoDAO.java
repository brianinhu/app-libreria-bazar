package libreria.modelo.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import libreria.conexion.Conexion;
import libreria.helper.InterfaceCRUD;
import libreria.modelo.bean.Pedido;

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
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
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
