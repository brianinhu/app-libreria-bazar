var aside = document.getElementById("aside");
var menu = document.getElementById("menu");

var divpanel = document.getElementById("div-panel");

menu.addEventListener("click", ()=>{
    aside.classList.toggle("active");
    divpanel.classList.toggle("decompressed");
});