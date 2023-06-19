package libreria.modelo.dao;

import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import libreria.conexion.Conexion;
import libreria.helper.InterfaceCRUD;
import libreria.modelo.bean.Cliente;

public class ClienteDAO extends Conexion implements InterfaceCRUD<Cliente> {

    @Override
    public ArrayList<Cliente> tolist() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void create(Cliente e) {
        String sentence = "insert into cliente(nombre, apaterno, amaterno, telefono, email, contraseña, idgenero) values (?,?,?,?,?,?,?)";
        try {
            cn = getConnection();
            ps = cn.prepareStatement(sentence);

            ps.setString(1, e.getNombre());
            ps.setString(2, e.getApaterno());

            if (e.getAmaterno().isBlank()) {
                ps.setNull(3, Types.VARCHAR);
            } else {
                ps.setString(3, e.getAmaterno());
            }

            if (e.getTelefono().isBlank()) {
                ps.setNull(4, Types.VARCHAR);
            } else {
                ps.setString(4, e.getTelefono());
            }

            ps.setString(5, e.getEmail());
            ps.setString(6, e.getContraseña());

            if (e.getIdgenero() == 0) {
                ps.setNull(7, Types.INTEGER);
            } else {
                ps.setInt(7, e.getIdgenero());
            }

            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error al crear un cliente. \nDetalles: " + ex.getMessage());
        } finally {
            close(cn);
            close(ps);
            close(rs);
        }
    }

    @Override
    public Cliente read(Cliente e) {
        Cliente cliente = null;
        String sentence = "select * from cliente where email = ? and contraseña = ?";
        try {
            cn = getConnection();
            ps = cn.prepareStatement(sentence);
            ps.setString(1, e.getEmail());
            ps.setString(2, e.getContraseña());
            rs = ps.executeQuery();
            if (rs.next()) {
                cliente = new Cliente(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cliente;
    }

    @Override
    public void update(Cliente e) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Cliente e) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
