package libreria.modelo.bean;

import java.io.InputStream;
import java.math.BigDecimal;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Producto {

    private String SKU;
    private String nombre;
    private String descripcion;
    private int idmarca;
    private BigDecimal precio;
    private int stock;
    private InputStream imagen;
    private int idcategoria;
}
