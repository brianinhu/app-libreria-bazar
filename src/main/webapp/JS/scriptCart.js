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