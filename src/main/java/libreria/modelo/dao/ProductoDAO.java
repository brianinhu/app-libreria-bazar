package libreria.modelo.dao;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.http.HttpServletResponse;
import libreria.conexion.Conexion;
import libreria.helper.InterfaceCRUD;
import libreria.modelo.bean.Producto;

public class ProductoDAO extends Conexion implements InterfaceCRUD<Producto> {

    @Override
    public ArrayList<Producto> tolist() {
        ArrayList<Producto> listaProductos = new ArrayList<>();
        Producto producto;
        String sentence = "select * from producto";
        try {
            cn = getConnection();
            ps = cn.prepareStatement(sentence);
            rs = ps.executeQuery();
            while (rs.next()) {
                producto = new Producto(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getFloat(5), rs.getInt(6), rs.getBinaryStream(7), rs.getInt(8));
                listaProductos.add(producto);
            }
        } catch (SQLException ex) {
            System.out.println("Error al listar todos los productos. \nDetalles: " + ex.getMessage());
        } finally {
            close(cn);
            close(ps);
            close(rs);
        }
        return listaProductos;
    }

    @Override
    public void create(Producto e) {
        String sentence = "insert into producto(SKU, nombre, descripcion, idmarca, precio, stock, imagen, idcategoria) values (?,?,?,?,?,?,?,?)";
        try {
            cn = getConnection();
            ps = cn.prepareStatement(sentence);
            ps.setString(1, e.getSKU());
            ps.setString(2, e.getNombre());
            ps.setString(3, e.getDescripcion());
            ps.setInt(4, e.getIdmarca());
            ps.setFloat(5, e.getPrecio());
            ps.setInt(6, e.getStock());
            ps.setBlob(7, e.getImagen());
            ps.setInt(8, e.getIdcategoria());
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error al crear un producto. \nDetalles: " + ex.getMessage());
        } finally {
            close(cn);
            close(ps);
            close(rs);
        }
    }

    @Override
    public Producto read(Producto e) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Producto e) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Producto e) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public void readImage(String SKU, HttpServletResponse response) {
        String sentence = "select * from producto where SKU = ?";
        InputStream inputStream = null;
        OutputStream outputStream = null;
        BufferedInputStream bufferedInputStream = null;
        BufferedOutputStream bufferedOutputStream = null;
        try {
            outputStream = response.getOutputStream();

            cn = getConnection();
            ps = cn.prepareStatement(sentence);
            ps.setString(1, SKU);
            rs = ps.executeQuery();

            if (rs.next()) {
                inputStream = rs.getBinaryStream(7);
            }

            bufferedInputStream = new BufferedInputStream(inputStream);
            bufferedOutputStream = new BufferedOutputStream(outputStream);

            int i = 0;
            while ((i = bufferedInputStream.read()) != -1) {
                bufferedOutputStream.write(i);
            }
            inputStream.close();
            outputStream.close();
            bufferedInputStream.close();
            bufferedOutputStream.close();
        } catch (SQLException | IOException ex) {
            System.out.println("Error al cargar la imagen del producto. \nDetalles: " + ex.getMessage());
        } finally {
            close(cn);
            close(ps);
            close(rs);
        }
    }
}
