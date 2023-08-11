package libreria.modelo.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import libreria.conexion.Conexion;
import libreria.helper.InterfaceCRUD;
import libreria.modelo.bean.Rol;

public class RolDAO extends Conexion implements InterfaceCRUD<Rol>{

    @Override
    public ArrayList<Rol> tolist() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void create(Rol e) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Rol read(Rol e) {
        String sentence = "select * from rol where idrol = ?";
        Rol rol = null;
        try {
            cn = getConnection();
            ps = cn.prepareStatement(sentence);
            ps.setInt(1, e.getIdrol());
            rs = ps.executeQuery();
            if (rs.next()) {
                rol = new Rol(rs.getInt(1), rs.getString(2));
            }
        } catch (SQLException ex) {
            System.out.println("Error al leer un rol. \nDetalles: " + ex.getMessage());
        } finally {
            close(cn);
            close(ps);
            close(rs);
        }
        return rol;
    }

    @Override
    public void update(Rol e) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Rol e) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
