package libreria.modelo.bean;

import java.math.BigDecimal;
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
    private BigDecimal total;
    private String idcliente;
    private int iddistrito;
    private int idtienda;
    private int identrega;
    private int idpago;
    private String direccion;
    private ArrayList<Carrito> cart;
}
