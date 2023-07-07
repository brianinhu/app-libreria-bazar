package libreria.modelo.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PedidoDetalle {

    private int cantidad;
    private float subtotal;
    private String codigo;
    private String SKU;
}
