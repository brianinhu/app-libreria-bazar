$(document).ready(function () {
    $(".input-spinner").inputSpinner();

    // Escuchar el evento de clic en el botón de incremento
    $(document).on("click", ".btn-increment", function () {
        var input = $(this).closest(".input-group").find("input");
        var newQuantity = parseFloat(input.val());
        var SKU = input.closest("tr").find("#txtSKU").val();
        // Realizar acciones adicionales aquí
        window.location.href = "updatetoCart?SKU=" + SKU + "&newQuantity=" + newQuantity;
    });

});

$(document).ready(function () {
    $(".input-spinner").inputSpinner();

    // Escuchar el evento de clic en el botón de decremento
    $(document).on("click", ".btn-decrement", function () {
        var input = $(this).closest(".input-group").find("input");
        var newQuantity = parseFloat(input.val());
        var SKU = input.closest("tr").find("#txtSKU").val();
        // Realizar acciones adicionales aquí
        window.location.href = "updatetoCart?SKU=" + SKU + "&newQuantity=" + newQuantity;
    });

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

var btnfinalizarCompra = document.getElementById("btn-finalizarCompra");
btnfinalizarCompra.addEventListener("click", () => {

    /*****Tabla Pedido*****/
    let codigo_P = codeGenerateWord(4) + codeGenerateNumber(3);

    // Obtén la fecha actual
    var fecha = new Date();

    // Obtiene los componentes de la fecha
    var year = fecha.getFullYear();
    var month = fecha.getMonth() + 1; // Los meses van de 0 a 11, por eso se suma 1
    var day = fecha.getDate();

    // Formatea la fecha con ceros a la izquierda si es necesario
    var formattedDate = year + '-' + ('0' + month).slice(-2) + '-' + ('0' + day).slice(-2);

    // La variable formattedDate ahora contiene la fecha en formato YYYY-MM-DD

    let totalPay = document.getElementById("totalPay").value;

    let idcliente = document.getElementById("idcliente").value;

    console.log(formattedDate);
    console.log(codigo_P);
    console.log(totalPay);
    console.log(idcliente);

    window.location.href = "buytoCart?codigo=" + codigo_P + "&fecha=" + formattedDate + "&total=" + totalPay + "&idcliente=" + idcliente;
});