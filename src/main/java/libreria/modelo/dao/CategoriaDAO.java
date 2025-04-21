package libreria.modelo.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import libreria.conexion.Conexion;
import libreria.helper.InterfaceCRUD;
import libreria.modelo.bean.Categoria;

public class CategoriaDAO extends Conexion implements InterfaceCRUD<Categoria> {

    @Override
    public ArrayList<Categoria> toList() {
        ArrayList<Categoria> listaCategorias = new ArrayList<>();
        Categoria categoria;
        String sentence = "select * from categoria";
        try {
            cn = getConnection();
            ps = cn.prepareStatement(sentence);
            rs = ps.executeQuery();
            while (rs.next()) {
                categoria = new Categoria(rs.getInt(1), rs.getString(2), rs.getString(3));
                listaCategorias.add(categoria);
            }
        } catch (SQLException ex) {
            System.out.println("Error al listar todos las categorias. \nDetalles: " + ex.getMessage());
        } finally {
            close(cn);
            close(ps);
            close(rs);
        }
        return listaCategorias;
    }

    @Override
    public void create(Categoria e) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Categoria read(Categoria e) {
        String sentence = "select * from categoria where idcategoria = ?";
        Categoria categoria = null;
        try {
            cn = getConnection();
            ps = cn.prepareStatement(sentence);
            ps.setInt(1, e.getIdcategoria());
            rs = ps.executeQuery();
            if (rs.next()) {
                categoria = new Categoria(rs.getInt(1), rs.getString(2), rs.getString(3));
            }
        } catch (SQLException ex) {
            System.out.println("Error al leer una categoria. \nDetalles: " + ex.getMessage());
        } finally {
            close(cn);
            close(ps);
            close(rs);
        }
        return categoria;
    }

    @Override
    public void update(Categoria e) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Categoria e) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    public Categoria getBySlug(String slug) {
        String sentence = "SELECT * FROM categoria WHERE categoria.slug = ?";
        Categoria categoria = null;
        try {
            cn = getConnection();
            ps = cn.prepareStatement(sentence);
            ps.setString(1, slug);
            rs = ps.executeQuery();
            if (rs.next()) {
                categoria = new Categoria(rs.getInt(1), rs.getString(2), rs.getString(3));
            }
        } catch (SQLException ex) {
            System.out.println("Error al obtener el slug de la categoría. \nDetalles: " + ex.getMessage());
        } finally {
            close(cn);
        }
        return categoria;
    }

}
