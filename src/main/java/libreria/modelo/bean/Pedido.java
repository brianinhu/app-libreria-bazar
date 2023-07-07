package libreria.modelo.bean;

import java.sql.Date;
import java.util.ArrayList;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Pedido {

    private String codigo;
    private Date fecha;
    private float total;
    private String idcliente;
    private ArrayList<Carrito> listCartBuy;
}
