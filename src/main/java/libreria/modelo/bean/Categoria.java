package libreria.modelo.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Categoria {
    private int idcategoria;
    private String categoria;
    private String slug;
}
