package libreria.modelo.dao;

import java.io.Closeable;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import libreria.conexion.Conexion;
import libreria.helper.InterfaceCRUD;
import libreria.modelo.bean.Marca;
import libreria.modelo.bean.Producto;

public class ProductoDAO extends Conexion implements InterfaceCRUD<Producto> {

    @Override
    public ArrayList<Producto> toList() {
        ArrayList<Producto> listaProductos = new ArrayList<>();
        Producto producto;
        String sentence = "select * from producto";
        try {
            cn = getConnection();
            ps = cn.prepareStatement(sentence);
            rs = ps.executeQuery();
            while (rs.next()) {
                producto = new Producto(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), null, rs.getBigDecimal(6), rs.getInt(7), rs.getString(8), rs.getInt(9));
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
            ps.setBigDecimal(5, e.getPrecio());
            ps.setInt(6, e.getStock());
            ps.setString(7, e.getImagen());
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
                producto = new Producto(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), null, rs.getBigDecimal(6), rs.getInt(7), rs.getString(8), rs.getInt(9));
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
            ps.setBigDecimal(4, e.getPrecio());
            ps.setInt(5, e.getStock());
            ps.setString(6, e.getImagen());
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

    public ArrayList<Producto> getProductosByCategoria(int idCategoria) {
        ArrayList<Producto> productos = new ArrayList<>();
        String sentence = "SELECT p.*, m.marca AS nombre_marca FROM producto p INNER JOIN marca m ON p.idmarca = m.idmarca WHERE p.idcategoria = ?";
        Producto producto;
        try {
            cn = getConnection();
            ps = cn.prepareStatement(sentence);
            ps.setInt(1, idCategoria);
            rs = ps.executeQuery();
            while (rs.next()) {
                producto = new Producto();
                producto.setSKU(rs.getString("SKU"));
                producto.setNombre(rs.getString("nombre"));
                producto.setSlug(rs.getString("slug"));
                producto.setPrecio(rs.getBigDecimal("precio"));
                producto.setImagen(rs.getString("imagen"));
                Marca marca = new Marca();
                marca.setIdmarca(rs.getInt("idmarca"));
                marca.setMarca(rs.getString("nombre_marca"));
                producto.setMarca(marca);

                productos.add(producto);
            }
        } catch (SQLException ex) {
            System.out.println("Error al obtener los productos por categoría. \nDetalles: " + ex.getMessage());
        } finally {
            close(cn);
            close(ps);
            close(rs);
        }
        return productos;
    }

    public Producto getBySlug(String slug) {
        String sentence = "SELECT p.*, m.marca AS nombre_marca FROM producto p INNER JOIN marca m ON p.idmarca = m.idmarca WHERE p.slug = ?";
        Producto producto = null;
        try {
            cn = getConnection();
            ps = cn.prepareStatement(sentence);
            ps.setString(1, slug);
            rs = ps.executeQuery();
            while (rs.next()) {
                producto = new Producto();
                producto.setSKU(rs.getString("SKU"));
                producto.setNombre(rs.getString("nombre"));
                producto.setSlug(rs.getString("slug"));
                producto.setDescripcion(rs.getString("descripcion"));
                producto.setPrecio(rs.getBigDecimal("precio"));
                Marca marca = new Marca();
                marca.setIdmarca(rs.getInt("idmarca"));
                marca.setMarca(rs.getString("nombre_marca"));
                producto.setMarca(marca);
                producto.setStock(rs.getInt("stock"));
                producto.setImagen(rs.getString("imagen"));
            }
        } catch (SQLException ex) {
            System.out.println("Error al obtener el producto por slug. \nDetalles: " + ex.getMessage());
        } finally {
            close(cn);
            close(ps);
            close(rs);
        }
        return producto;
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
