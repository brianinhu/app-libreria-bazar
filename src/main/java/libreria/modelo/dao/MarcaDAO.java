package libreria.modelo.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import libreria.conexion.Conexion;
import libreria.helper.InterfaceCRUD;
import libreria.modelo.bean.Marca;

public class MarcaDAO extends Conexion implements InterfaceCRUD<Marca> {

    @Override
    public ArrayList<Marca> tolist() {
        ArrayList<Marca> listaMarcas = new ArrayList<>();
        Marca marca;
        String sentence = "select * from marca";
        try {
            cn = getConnection();
            ps = cn.prepareStatement(sentence);
            rs = ps.executeQuery();
            while (rs.next()) {
                marca = new Marca(rs.getInt(1), rs.getString(2));
                listaMarcas.add(marca);
            }
        } catch (SQLException ex) {
            System.out.println("Error al listar todos las marcas. \nDetalles: " + ex.getMessage());
        } finally {
            close(cn);
            close(ps);
            close(rs);
        }
        return listaMarcas;
    }

    @Override
    public void create(Marca e) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Marca read(Marca e) {
        String sentence = "select * from marca where idmarca = ?";
        Marca marca = null;
        try {
            cn = getConnection();
            ps = cn.prepareStatement(sentence);
            ps.setInt(1, e.getIdmarca());
            rs = ps.executeQuery();
            if (rs.next()) {
                marca = new Marca(rs.getInt(1), rs.getString(2));
            }
        } catch (SQLException ex) {
            System.out.println("Error al leer una marca. \nDetalles: " + ex.getMessage());
        } finally {
            close(cn);
            close(ps);
            close(rs);
        }
        return marca;
    }

    @Override
    public void update(Marca e) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Marca e) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
