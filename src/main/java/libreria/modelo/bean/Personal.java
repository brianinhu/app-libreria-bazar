package libreria.modelo.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Personal {

    private int idpersonal;
    private String nombre;
    private String apaterno;
    private String amaterno;
    private String telefono;
    private int edad;
    private String profesion;
}
