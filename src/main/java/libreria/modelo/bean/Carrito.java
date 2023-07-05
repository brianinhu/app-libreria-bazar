
package libreria.modelo.bean;

import java.io.InputStream;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Carrito {
    private InputStream imagen;
    private String SKU;
    private String nombre;
    private float precio;
    private int cantidad;
    private float subtotal;
}
