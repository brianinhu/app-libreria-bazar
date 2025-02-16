package libreria.modelo.dao;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.Closeable;
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
                producto = new Producto(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getBigDecimal(5), rs.getInt(6), rs.getBinaryStream(7), rs.getInt(8));
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
            ps.setBigDecimal(5, e.getPrecio());
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
        Producto producto = null;
        String sentence = "select * from producto where SKU = ?";
        try {
            cn = getConnection();
            ps = cn.prepareStatement(sentence);
            ps.setString(1, e.getSKU());
            rs = ps.executeQuery();
            while (rs.next()) {
                producto = new Producto(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getBigDecimal(5), rs.getInt(6), rs.getBinaryStream(7), rs.getInt(8));
            }
        } catch (SQLException ex) {
            System.out.println("Error al leer un producto. \nDetalles: " + ex.getMessage());
        } finally {
            close(cn);
            close(ps);
            close(rs);
        }
        return producto;
    }

    @Override
    public void update(Producto e) {
        String sentence = "update producto set nombre = ?, descripcion = ?, idmarca = ?, precio = ?, stock = ?, imagen = ?, idcategoria = ? where SKU = ?";
        try {
            cn = getConnection();
            ps = cn.prepareStatement(sentence);
            ps.setString(1, e.getNombre());
            ps.setString(2, e.getDescripcion());
            ps.setInt(3, e.getIdmarca());
            ps.setBigDecimal(4, e.getPrecio());
            ps.setInt(5, e.getStock());
            ps.setBlob(6, e.getImagen());
            ps.setInt(7, e.getIdcategoria());
            ps.setString(8, e.getSKU());
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error al actualizar el producto. \nDetalles: " + ex.getMessage());
        } finally {
            close(cn);
            close(ps);
            close(rs);
        }
    }

    @Override
    public void delete(Producto e) {
        String sentence = "delete from producto where SKU = ?";
        try {
            cn = getConnection();
            ps = cn.prepareStatement(sentence);
            ps.setString(1, e.getSKU());
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error al eliminar un producto. \nDetalles: " + ex.getMessage());
        } finally {
            close(cn);
            close(ps);
            close(rs);
        }
    }

    public void readImage(String SKU, HttpServletResponse response) {
        String sentence = "select * from producto where SKU = ?";
        InputStream inputStream = null;
        OutputStream outputStream = null;
        BufferedInputStream bufferedInputStream = null;
        BufferedOutputStream bufferedOutputStream = null;
        try {
            response.setContentType("image/png");

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

            byte[] buffer = new byte[8192];
            int bytesRead;

            while ((bytesRead = bufferedInputStream.read(buffer)) != -1) {
                bufferedOutputStream.write(buffer, 0, bytesRead);
            }
        } catch (SQLException | IOException ex) {
            System.out.println("Error al cargar la imagen del producto. \nDetalles: " + ex.getMessage());
        } finally {
            closeSilently(bufferedOutputStream);
            closeSilently(bufferedInputStream);
            closeSilently(outputStream);
            closeSilently(inputStream);
            close(cn);
            close(ps);
            close(rs);
        }
    }

    private void closeSilently(Closeable closeable) {
        try {
            if (closeable != null) {
                closeable.close();
            }
        } catch (IOException ex) {

        }
    }
}
