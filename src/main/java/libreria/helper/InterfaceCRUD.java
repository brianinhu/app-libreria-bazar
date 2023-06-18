
package libreria.helper;

import java.util.ArrayList;

public interface InterfaceCRUD<E> {

    public ArrayList<E> tolist();
    
    public void create(E e);

    public E read(E e);

    public void update(E e);

    public void delete(E e);
}
