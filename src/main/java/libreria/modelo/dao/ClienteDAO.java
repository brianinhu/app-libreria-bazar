package libreria.modelo.dao;

import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
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
        String sentence = "insert into cliente(idcliente, nombre, apaterno, amaterno, telefono, email, contraseña, idgenero) values (?,?,?,?,?,?,?,?)";
        try {
            cn = getConnection();
            ps = cn.prepareStatement(sentence);
            
            ps.setString(1, e.getIdcliente());
            ps.setString(2, e.getNombre());
            ps.setString(3, e.getApaterno());

            if (e.getAmaterno().isBlank()) {
                ps.setNull(4, Types.VARCHAR);
            } else {
                ps.setString(4, e.getAmaterno());
            }

            if (e.getTelefono().isBlank()) {
                ps.setNull(5, Types.VARCHAR);
            } else {
                ps.setString(5, e.getTelefono());
            }

            ps.setString(6, e.getEmail());
            ps.setString(7, e.getContraseña());

            if (e.getIdgenero() == 0) {
                ps.setNull(8, Types.INTEGER);
            } else {
                ps.setInt(8, e.getIdgenero());
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
                cliente = new Cliente(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8));
            }
        } catch (SQLException ex) {
            System.out.println("Error al leer un cliente. \nDetalles: " + ex.getMessage());
        } finally {
            close(cn);
            close(ps);
            close(rs);
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
