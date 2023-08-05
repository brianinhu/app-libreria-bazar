$(document).ready(function () {
    $('#table').DataTable({
        responsive: true,
        pagingType: 'full_numbers',
        lengthMenu: [5, 10, 15, 20],
        pageLength: 5,
        language: {
            url: '//cdn.datatables.net/plug-ins/1.13.6/i18n/es-ES.json'
        }
    });
});

/* Inicio - Evento clic del boton ver más de la descripcion */
$('.btnchange').on('click', function () {
    var textContainer = $(this).prev('.text-container');
    textContainer.toggleClass('active-normal');
    if (textContainer.hasClass('active-normal')) {
        $(this).find('.bi-eye-slash-fill').hide();
        $(this).find('.bi-eye-fill').show();
        $(this).css('background-color', '#D33333');
    } else {
        $(this).find('.bi-eye-slash-fill').show();
        $(this).find('.bi-eye-fill').hide();
        $(this).css('background-color', '');
    }
});
/* Fin - Evento clic del boton ver más de la descripcion */

var aside = document.getElementById("aside");
var menu = document.getElementById("menu");

var divpaneladd = document.getElementById("div-panel-add");
var divpanelview = document.getElementById("div-panel-view");

menu.addEventListener("click", () => {
    aside.classList.toggle("active");
    divpaneladd.classList.toggle("decompressed");
    divpanelview.classList.toggle("decompressed");
});

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
            text: "Esta acción es permanente",
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
            swal("Producto a salvo");
        }
    });
}