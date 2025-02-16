package libreria.modelo.bean;

import java.math.BigDecimal;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PedidoDetalle {

    private int cantidad;
    private BigDecimal subtotal;
    private String codigo;
    private String SKU;
}
