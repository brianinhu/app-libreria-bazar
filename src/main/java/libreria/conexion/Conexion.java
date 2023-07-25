package libreria.conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Conexion {

    protected final String URL = "jdbc:mysql://localhost/dblibreriabazar";
    protected final String USER = "root";
    protected final String PASS = "12345"; /*Contraseña de su gestor MYSQL*/
    protected Connection cn;
    protected PreparedStatement ps;
    protected ResultSet rs;

    public Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            cn = DriverManager.getConnection(URL, USER, PASS);
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println("Error al realizar la conexión. \nDetalles: " + ex.getMessage());
        }
        return cn;
    }

    protected void close(Connection cn) {
        try {
            if (cn != null && !cn.isClosed()) {
                cn.close();
            }
        } catch (SQLException ex) {
            System.out.println("Error al cerrar la conexión. \nMotivo: " + ex.getMessage());
        }
    }

    protected void close(PreparedStatement ps) {
        try {
            if (ps != null && !ps.isClosed()) {
                ps.close();
            }
        } catch (SQLException ex) {
            System.out.println("Error al cerrar la preparación de la consulta. \nMotivo: " + ex.getMessage());
        }
    }

    protected void close(ResultSet rs) {
        try {
            if (rs != null && !rs.isClosed()) {
                rs.close();
            }
        } catch (SQLException ex) {
            System.out.println("Error al cerrar los resultados de la consulta. \nMotivo: " + ex.getMessage());
        }
    }

}
