package libreria.modelo.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Administrador {
    private int idadministrador;
    private String user;
    private String password;
    private char estado;
    private int idrol;
    private int idpersonal;
}
