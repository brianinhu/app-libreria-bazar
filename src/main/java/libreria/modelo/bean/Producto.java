package libreria.modelo.bean;

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
    private Marca marca;
    private BigDecimal precio;
    private int stock;
    private String imagen;
    private int idcategoria;
}
