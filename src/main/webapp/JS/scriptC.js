const trunk = "01234567890123456789";
codeGenerate = (length) => {
    let code = "";
    for (let i = 0; i < length; i++) {
        code += trunk.charAt(Math.floor(Math.random() * trunk.length));
    }
    return code;
};

var btnregistrar = document.getElementById("btn-registrar");
btnregistrar.addEventListener("click", () => {
    let nombre = document.getElementById("txtnombre").value;
    let apaterno = document.getElementById("txtapaterno").value;

    let codigo = codeGenerate(3) + nombre.charAt(0).toUpperCase() + apaterno.charAt(0).toUpperCase() + codeGenerate(3);

    var idcliente = document.getElementById("txtidcliente");
    idcliente.value = codigo;
});