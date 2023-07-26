const trunk = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
codeGenerate = (length) => {
    let code = "";
    for (let i = 0; i < length; i++) {
        code += trunk.charAt(Math.floor(Math.random() * trunk.length));
    }
    return code;
};

var btnagregar = document.getElementById("btn-agregar");
btnagregar.addEventListener("click", () => {
    let codigo = codeGenerate(10);

    document.getElementById("txtSKUCreate").value = codigo;
});

function abrirModal(SKU, nombre, descripcion, idmarca, precio, stock, idcategoria) {
    document.getElementById("txtSKUUpdate").value = SKU;
    document.getElementById("txtnombre").value = nombre;
    document.getElementById("txtdescripcion").value = descripcion;
    document.getElementById("cbxMarca").value = idmarca;
    document.getElementById("txtprecio").value = precio;
    document.getElementById("txtstock").value = stock;
    document.getElementById("imagen").src = "readImage?SKUProducto=" + SKU;
    document.getElementById("cbxCategoria").value = idcategoria;

    // Abrir la ventana modal
    $('#staticBackdrop2').modal('show');
}

function confirmDelete() {
    return new Promise((resolve) => {
        swal({
            title: "¿Estás seguro de eliminar el producto?",
            text: "¡Una vez eliminado, no será posible recuperarlo!",
            icon: "warning",
            buttons: true,
            dangerMode: true
        }).then((willDelete) => {
            resolve(willDelete);
        });
    });
}

function deleteProduct(SKU) {
    confirmDelete().then((result) => {
        if (result) {
            swal("¡Producto eliminado correctamente!", {
                icon: "success"
            }).then((result) => {
                if (result) {
                    window.location.href = "deleteProducto?SKU=" + SKU;
                }
            });

        } else {
            swal("Producto a salvo :)");
        }
    });
}