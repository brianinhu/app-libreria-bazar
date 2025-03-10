
package libreria.modelo.bean;

import java.io.InputStream;
import java.math.BigDecimal;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Carrito {
    private String imagen;
    private String SKU;
    private String nombre;
    private BigDecimal precio;
    private int cantidad;
    private BigDecimal subtotal;
}
