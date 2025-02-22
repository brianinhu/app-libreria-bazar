package libreria.modelo.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import libreria.conexion.Conexion;
import libreria.helper.InterfaceCRUD;
import libreria.modelo.bean.Genero;

public class GeneroDAO extends Conexion implements InterfaceCRUD<Genero> {

    @Override
    public ArrayList<Genero> toList() {
        String sentence = "select * from genero";
        ArrayList<Genero> listaGeneros = new ArrayList<>();
        Genero genero;
        try {
            cn = getConnection();
            ps = cn.prepareStatement(sentence);
            rs = ps.executeQuery();
            while (rs.next()) {                
                genero = new Genero(rs.getInt(1), rs.getString(2));
                listaGeneros.add(genero);
            }
        } catch (SQLException ex) {
            System.out.println("Error al listar todos los generos. \nDetalles: " + ex.getMessage());
        } finally {
            close(cn);
            close(ps);
            close(rs);
        }
        return listaGeneros;
    }

    @Override
    public void create(Genero e) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Genero read(Genero e) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Genero e) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Genero e) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
