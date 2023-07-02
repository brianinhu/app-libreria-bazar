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
    
    var SKU = document.getElementById("txtSKU");
    SKU.value = codigo;
});