package libreria.modelo.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Cliente {

    private int idcliente;
    private String nombre;
    private String apaterno;
    private String amaterno;
    private String telefono;
    private String email;
    private String contraseña;
    private int idgenero;
}
