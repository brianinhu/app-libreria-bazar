package libreria.modelo.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import libreria.conexion.Conexion;
import libreria.helper.InterfaceCRUD;
import libreria.modelo.bean.Administrador;

public class AdministradorDAO extends Conexion implements InterfaceCRUD<Administrador> {

    @Override
    public ArrayList<Administrador> tolist() {
        Administrador admin;
        ArrayList<Administrador> listaAdministrador = new ArrayList<>();
        String sentence = "select * from administrador";
        try {
            cn = getConnection();
            ps = cn.prepareStatement(sentence);
            rs = ps.executeQuery();
            while (rs.next()) {                
                admin = new Administrador(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4).charAt(0), rs.getInt(5), rs.getInt(6));
                listaAdministrador.add(admin);
            }
        } catch (SQLException ex) {
            System.out.println("Error al mostrar la lista de administradores. \nDetalles: " + ex.getMessage());
        } finally {
            close(cn);
            close(ps);
            close(rs);
        }
        return listaAdministrador;
    }
    
    public ArrayList<Administrador> tolistbyIdRol(int idrol) {
        Administrador admin;
        ArrayList<Administrador> listaAdministrador = new ArrayList<>();
        String sentence = "select * from administrador where idrol = ?";
        try {
            cn = getConnection();
            ps = cn.prepareStatement(sentence);
            ps.setInt(1, idrol);
            rs = ps.executeQuery();
            while (rs.next()) {                
                admin = new Administrador(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4).charAt(0), rs.getInt(5), rs.getInt(6));
                listaAdministrador.add(admin);
            }
        } catch (SQLException ex) {
            System.out.println("Error al mostrar la lista de administradores por rol. \nDetalles: " + ex.getMessage());
        } finally {
            close(cn);
            close(ps);
            close(rs);
        }
        return listaAdministrador;
    }

    @Override
    public void create(Administrador e) {
        String sentence = "";
    }

    @Override
    public Administrador read(Administrador e) {
        Administrador administrador = null;
        String sentence = "select * from administrador where user = ? and password = ?";
        try {
            cn = getConnection();
            ps = cn.prepareStatement(sentence);
            ps.setString(1, e.getUser());
            ps.setString(2, e.getPassword());
            rs = ps.executeQuery();
            if (rs.next()) {
                administrador = new Administrador(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4).charAt(0), rs.getInt(5), rs.getInt(6));
            }
        } catch (SQLException ex) {
            System.out.println("Error al leer un administrador. \nDetalles: " + ex.getMessage());
        } finally {
            close(cn);
            close(ps);
            close(rs);
        }
        return administrador;
    }

    @Override
    public void update(Administrador e) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Administrador e) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
