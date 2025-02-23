
package libreria.modelo.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import libreria.conexion.Conexion;
import libreria.helper.InterfaceCRUD;
import libreria.modelo.bean.Entrega;

public class EntregaDAO extends Conexion implements InterfaceCRUD<Entrega>{

    @Override
    public ArrayList<Entrega> toList() {
        ArrayList<Entrega> listaEntrega = new ArrayList<>();
        Entrega entrega;
        String sentence = "select * from entrega";
        try {
            cn = getConnection();
            ps = cn.prepareStatement(sentence);
            rs = ps.executeQuery();
            while (rs.next()) {
                entrega = new Entrega(rs.getInt(1), rs.getString(2));
                listaEntrega.add(entrega);
            }
        } catch (SQLException ex) {
            System.out.println("Error al listar todos los tipos de entrega. \nDetalles: " + ex.getMessage());
        } finally {
            close(cn);
            close(ps);
            close(rs);
        }
        return listaEntrega;
    }

    @Override
    public void create(Entrega e) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Entrega read(Entrega e) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Entrega e) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Entrega e) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
