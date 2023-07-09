var btntienda = document.getElementById("btn-tienda");
var btndelivery = document.getElementById("btn-delivery");

let divtienda = document.getElementById("div-tienda");
let divdireccion = document.getElementById("div-direccion");

btntienda.style.background = '#f2f2f2';
btndelivery.style.background = '#f2f2f2';

var iddistrito = 0;
var idtienda = 0;
var identrega = 0;
var idpago = 0;
var direccion = "";

btntienda.addEventListener("click", () => {
    btntienda.style.background = '#00e600';
    btntienda.style.color = '#fff';
    btndelivery.style.color = '#000';
    btndelivery.style.background = '#f2f2f2';

    divtienda.style.display = 'block';
    document.getElementById("cbxDistrito").value = '';
    document.getElementById("txtdireccion").value = '';
    divdireccion.style.display = 'none';

    identrega = 1;
});

btndelivery.addEventListener("click", () => {
    btntienda.style.background = '#f2f2f2';
    btntienda.style.color = '#000';
    btndelivery.style.color = '#fff';
    btndelivery.style.background = '#00e600';

    document.getElementById("cbxTienda").value = '';
    divtienda.style.display = 'none';
    divdireccion.style.display = 'block';

    identrega = 2;
});

const trunkNumber = "01234567890123456789";
codeGenerateNumber = (length) => {
    let code = "";
    for (let i = 0; i < length; i++) {
        code += trunkNumber.charAt(Math.floor(Math.random() * trunkNumber.length));
    }
    return code;
};

const trunkWord = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
codeGenerateWord = (length) => {
    let code = "";
    for (let i = 0; i < length; i++) {
        code += trunkWord.charAt(Math.floor(Math.random() * trunkWord.length));
    }
    return code;
};

var btngenerarcompra = document.getElementById("btn-generarcompra");
btngenerarcompra.addEventListener("click", () => {

    /*****Tabla Pedido*****/
    let codigo_Pedido = codeGenerateWord(4) + codeGenerateNumber(3);

    // Obtén la fecha actual
    var fecha = new Date();

    // Obtiene los componentes de la fecha
    var year = fecha.getFullYear();
    var month = fecha.getMonth() + 1; // Los meses van de 0 a 11, por eso se suma 1
    var day = fecha.getDate();

    // Formatea la fecha con ceros a la izquierda si es necesario
    var formattedDate = year + '-' + ('0' + month).slice(-2) + '-' + ('0' + day).slice(-2);

    // La variable formattedDate ahora contiene la fecha en formato YYYY-MM-DD

    var totalPay = document.getElementById("totalPay").value;
    var idcliente = document.getElementById("idcliente").value;

    if (identrega === 1) {
        idtienda = document.getElementById("cbxTienda").value;
    } else {
        iddistrito = document.getElementById("cbxDistrito").value;
        direccion = document.getElementById("txtdireccion").value;
    }

    idpago = document.getElementById("cbxPago").value;

    console.log(codigo_Pedido);
    console.log(formattedDate);
    console.log(totalPay);
    console.log(idcliente);
    console.log(iddistrito);
    console.log(idtienda);
    console.log(identrega);
    console.log(idpago);
    console.log(direccion);

    $.ajax({
        url: "buyComplete",
        type: "POST",
        data: {
            codigo: codigo_Pedido,
            fecha: formattedDate,
            total: totalPay,
            idcliente: idcliente,
            iddistrito: iddistrito,
            idtienda: idtienda,
            identrega: identrega,
            idpago: idpago,
            direccion: direccion
        },
        success: function (response) {
            window.location.href = "checkBuyComplete?codigo=" + codigo_Pedido;
        },
        error: function (error) {
            window.location.href = "checkBuyComplete?codigo=" + codigo_Pedido;
        }
    });
});