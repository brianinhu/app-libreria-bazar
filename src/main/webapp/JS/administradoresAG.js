var cbxadministradores = document.getElementById("cbxAdministradores");

cbxadministradores.addEventListener("change", () => {
    var idrol = cbxadministradores.value;
    console.log(idrol);
    $("#tablaAdmi").load("verAdminxRol", {idrol: idrol});
}); 


function openModalEditarAdmin() {
    $('#modalEditarAdmin').modal('show');
}