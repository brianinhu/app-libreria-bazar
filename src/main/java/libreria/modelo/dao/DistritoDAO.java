package libreria.modelo.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import libreria.conexion.Conexion;
import libreria.helper.InterfaceCRUD;
import libreria.modelo.bean.Distrito;

public class DistritoDAO extends Conexion implements InterfaceCRUD<Distrito>{

    @Override
    public ArrayList<Distrito> toList() {
        ArrayList<Distrito> listaDistrito = new ArrayList<>();
        Distrito distrito;
        String sentence = "select * from distrito";
        try {
            cn = getConnection();
            ps = cn.prepareStatement(sentence);
            rs = ps.executeQuery();
            while (rs.next()) {
                distrito = new Distrito(rs.getInt(1), rs.getString(2));
                listaDistrito.add(distrito);
            }
        } catch (SQLException ex) {
            System.out.println("Error al listar todos los distritos. \nDetalles: " + ex.getMessage());
        } finally {
            close(cn);
            close(ps);
            close(rs);
        }
        return listaDistrito;
    }

    @Override
    public void create(Distrito e) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Distrito read(Distrito e) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Distrito e) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Distrito e) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
