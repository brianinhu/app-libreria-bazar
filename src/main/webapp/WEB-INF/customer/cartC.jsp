<%-- 
    Document   : cartC
    Created on : 3 jul. 2023, 18:01:59
    Author     : Brian
--%>

<%@page import="libreria.modelo.bean.Carrito"%>
<%@page import="libreria.modelo.dao.ProductoDAO"%>
<%@page import="libreria.modelo.bean.Producto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="libreria.modelo.bean.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/customer/layout.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800;900&display=swap"
              rel="stylesheet">
        <style>
            /*Estilo de la tabla*/
            .table tr {
                text-align: center;
            }

            .table td {
                text-align: center;
                vertical-align: middle;
            }
            /*Estilo de la tabla*/

            /*Estilo del input de cantidad*/
            .input-group {
                width: 150px !important;
                display: inline-flex !important;
            }
            /*Estilo del input de cantidad*/
        </style>
    </head>
    <body>
        <%
            Cliente c = (Cliente) request.getSession().getAttribute("customer");
        %>
        <header>
            <header-top>
                <div class="container-fluid">
                    <div class="row">
                        <div id="col1" class="col-12">
                            <div class="slider">
                                <div class="slide-track">
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-1.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-2.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-3.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-4.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-5.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-6.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-7.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-8.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-9.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-10.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-11.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-12.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-13.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-14.png" alt="">
                                    </div>

                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-1.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-2.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-3.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-4.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-5.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-6.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-7.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-8.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-9.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-10.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-11.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-12.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-13.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-14.png" alt="">
                                    </div>

                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-1.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-2.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-3.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-4.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-5.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-6.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-7.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-8.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-9.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-10.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-11.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-12.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-13.png" alt="">
                                    </div>
                                    <div class="slide">
                                        <img src="img/marcas/b3-marcas-14.png" alt="">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </header-top>
            <header-button>
                <div class="container-fluid">
                    <div class="row">
                        <div id="col1" class="col-12">
                            <a href="viewMainC" class="logo">
                                <img src="img/tech-office/logo-white-transp.png"
                                     alt="logo-generico">
                            </a>
                            <form class="d-flex" role="search">
                                <input class="form-control rounded-end-0 shadow-none" type="search"
                                       placeholder="¿Qué desea buscar?">
                                <button class="btn btn-success rounded-start-0" type="submit"><i
                                        class="bi bi-search"></i></button>
                            </form>
                            <nav id="nav-secundario">
                                <a href="viewCart" class="nav-link">
                                    <div class="cart-icon">
                                        <i class="bi bi-cart-fill"></i>
                                        <span class="cart-count">${quantityProductToCart}</span>
                                    </div>
                                    <span>Carrito</span>
                                </a>
                                <a href="#" class="nav-link">
                                    <i class="bi bi-person-circle"></i>
                                    <span><%=c.getNombre()%> <%=c.getApaterno()%></span>
                                </a>
                                <a href="logoutC" class="nav-link">
                                    <i class="bi bi-box-arrow-left"></i>
                                    <span>Cerrar sesión</span>
                                </a>
                            </nav>
                        </div>
                    </div>
                </div>
            </header-button>
        </header>

        <nav id="nav-principal">
            <div class="container-fluid">
                <div class="row">
                    <div id="col1">
                        <a href="#row1">OFERTAS</a>
                    </div>
                    <span></span>
                    <div id="col2">
                        <a href="#row2">CATEGORÍAS</a>
                    </div>
                    <span></span>
                    <div id="col3">
                        <a href="#row3">LO MÁS VENDIDO</a>
                    </div>
                </div>
            </div>
        </nav>

        <section>
            <div class="container">
                <h3>Carrito de compras</h3>
                <p><span id="cantidadItems">${quantityProductToCart}</span> items en el carrito</p>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-8">
                        <table class="table">
                            <tr>
                                <th>Imagen</th>
                                <th>Nombre</th>
                                <th>Precio</th>
                                <th>Cantidad</th>
                                <th>Subtotal</th>
                                <th></th>
                            </tr>
                            <%
                                ArrayList<Carrito> listaCarrito = (ArrayList<Carrito>) request.getAttribute("cart");
                                for (Carrito cp : listaCarrito) {
                            %>
                            <tr>
                                <td><img src="readImage?SKUProducto=<%=cp.getSKU()%>" alt="img" width="100"/></td>
                                <td><%=cp.getNombre()%></td>
                                <td><%=cp.getPrecio()%></td>
                                <td>
                                    <input type="hidden" id="txtSKU" value="<%=cp.getSKU()%>">
                                    <input id="input-cantidad" type="number" value="<%=cp.getCantidad()%>" min="1"/></td>
                                <td><%=cp.getSubtotal()%></td>
                            <input type="hidden" value="<%=cp.getSubtotal()%>" id="subtotal">
                            <td><a class="btn btn-danger" href="deletetoCart?SKU=<%=cp.getSKU()%>">Eliminar</a></td>
                            </tr>
                            <%}%>
                        </table>
                    </div>
                    <div class="col-4">
                        <div class="card">
                            <div class="card-header text-center">
                                <label class="fw-bold">Boleta</label>
                            </div>
                            <div class="card-body">
                                <label class="label">Subtotal</label>
                                <input type="text" class="form-control" value="S/. ${fullPay}" readonly>
                                <label class="label">Descuento</label>
                                <input type="text" class="form-control" value="S/. 0" readonly>
                                <label class="label">Total a pagar</label>
                                <input type="text" class="form-control" value="S/. ${fullPay}" readonly>
                            </div>
                            <div class="card-footer d-grid gap-2">
                                <a href="viewMainC" class="btn btn-success">Seguir comprando</a>
                                <a href="viewBuySummary" class="btn btn-warning">Finalizar compra</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <footer class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <h5>Enlaces</h5>
                        <ul class="list-unstyled">
                            <li><a href="#">Inicio</a></li>
                            <li><a href="#">Productos</a></li>
                            <li><a href="#">Servicios</a></li>
                            <li><a href="#">Contacto</a></li>
                        </ul>
                    </div>
                    <div class="col-md-4">
                        <h5>Contacto</h5>
                        <p>Dirección: Calle Principal, Ciudad</p>
                        <p>Teléfono: 123-456-7890</p>
                        <p>Email: info@example.com</p>
                    </div>
                    <div class="col-md-4">
                        <h5>Síguenos en redes sociales</h5>
                        <ul class="list-inline">
                            <li class="list-inline-item"><a href="#"><i class="fab fa-facebook"></i></a></li>
                            <li class="list-inline-item"><a href="#"><i class="fab fa-twitter"></i></a></li>
                            <li class="list-inline-item"><a href="#"><i class="fab fa-instagram"></i></a></li>
                        </ul>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 text-center">
                        <p>&copy; 2023 Todos los derechos reservados</p>
                    </div>
                </div>
            </div>
        </footer>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
        <script src="js/customer/input-spinner.js" type="text/javascript"></script>
        <script>
            $("input[type='number']").inputSpinner();

            ;
            (function ($) {
                "use strict";

                // the default editor for parsing and rendering
                const I18nEditor = function (props, element) {
                    const locale = props.locale || "en-US";

                    this.parse = function (customFormat) {
                        const numberFormat = new Intl.NumberFormat(locale);
                        const thousandSeparator = numberFormat.format(11111).replace(/1/g, '') || '.';
                        const decimalSeparator = numberFormat.format(1.1).replace(/1/g, '');
                        return parseFloat(customFormat
                                .replace(new RegExp(' ', 'g'), '')
                                .replace(new RegExp('\\' + thousandSeparator, 'g'), '')
                                .replace(new RegExp('\\' + decimalSeparator), '.')
                                );
                    };

                    this.render = function (number) {
                        const decimals = parseInt(element.getAttribute("data-decimals")) || 0
                        const digitGrouping = !(element.getAttribute("data-digit-grouping") === "false")
                        const numberFormat = new Intl.NumberFormat(locale, {
                            minimumFractionDigits: decimals,
                            maximumFractionDigits: decimals,
                            useGrouping: digitGrouping
                        })
                        return numberFormat.format(number)
                    }
                }

                let triggerKeyPressed = false
                const originalVal = $.fn.val
                $.fn.val = function (value) {
                    if (arguments.length >= 1) {
                        for (let i = 0; i < this.length; i++) {
                            if (this[i]["bootstrap-input-spinner"] && this[i].setValue) {
                                const element = this[i]
                                setTimeout(function () {
                                    element.setValue(value)
                                })
                            }
                        }
                    }
                    return originalVal.apply(this, arguments)
                }

                $.fn.inputSpinner = function (methodOrProps) {

                    if (methodOrProps === "destroy") {
                        this.each(function () {
                            if (this["bootstrap-input-spinner"]) {
                                this.destroyInputSpinner()
                            } else {
                                console.warn("element", this, "is no bootstrap-input-spinner")
                            }
                        })
                        return this
                    }

                    const props = {
                        decrementButton: "<strong>&minus;</strong>", // button text
                        incrementButton: "<strong>&plus;</strong>", // ..
                        groupClass: "", // css class of the resulting input-group
                        buttonsClass: "btn-outline-secondary",
                        buttonsWidth: "2.5rem",
                        textAlign: "center", // alignment of the entered number
                        autoDelay: 500, // ms threshold before auto value change
                        autoInterval: 50, // speed of auto value change, set to `undefined` to disable auto-change
                        buttonsOnly: false, // set this `true` to disable the possibility to enter or paste the number via keyboard
                        keyboardStepping: true, // set this to `false` to disallow the use of the up and down arrow keys to step
                        locale: navigator.language, // the locale, per default detected automatically from the browser
                        editor: I18nEditor, // the editor (parsing and rendering of the input)
                        template: // the template of the input
                                '<div class="input-group ${groupClass}">' +
                                '<button style="min-width: ${buttonsWidth}" class="btn btn-decrement ${buttonsClass} btn-minus" type="button">${decrementButton}</button>' +
                                '<input type="text" inputmode="decimal" style="text-align: ${textAlign}" class="form-control form-control-text-input"/>' +
                                '<button style="min-width: ${buttonsWidth}" class="btn btn-increment ${buttonsClass} btn-plus" type="button">${incrementButton}</button>' +
                                '</div>'
                    }

                    for (let option in methodOrProps) {
                        // noinspection JSUnfilteredForInLoop
                        props[option] = methodOrProps[option]
                    }

                    const html = props.template
                            .replace(/\${groupClass}/g, props.groupClass)
                            .replace(/\${buttonsWidth}/g, props.buttonsWidth)
                            .replace(/\${buttonsClass}/g, props.buttonsClass)
                            .replace(/\${decrementButton}/g, props.decrementButton)
                            .replace(/\${incrementButton}/g, props.incrementButton)
                            .replace(/\${textAlign}/g, props.textAlign)

                    this.each(function () {

                        if (this["bootstrap-input-spinner"]) {
                            console.warn("element", this, "is already a bootstrap-input-spinner")
                        } else {

                            var $original = $(this)
                            $original[0]["bootstrap-input-spinner"] = true
                            $original.hide()
                            $original[0].inputSpinnerEditor = new props.editor(props, this)

                            var autoDelayHandler = null
                            var autoIntervalHandler = null

                            var $inputGroup = $(html)
                            var $buttonDecrement = $inputGroup.find(".btn-decrement")
                            var $buttonIncrement = $inputGroup.find(".btn-increment")
                            var $input = $inputGroup.find("input")
                            var $label = $("label[for='" + $original.attr("id") + "']")
                            if (!$label[0]) {
                                $label = $original.closest("label")
                            }

                            var min = null
                            var max = null
                            var step = null

                            updateAttributes()

                            var value = parseFloat($original[0].value)
                            let pointerState = false

                            const prefix = $original.attr("data-prefix") || ""
                            const suffix = $original.attr("data-suffix") || ""

                            if (prefix) {
                                const prefixElement = $('<span class="input-group-text">' + prefix + '</span>')
                                $inputGroup.find("input").before(prefixElement)
                            }
                            if (suffix) {
                                const suffixElement = $('<span class="input-group-text">' + suffix + '</span>')
                                $inputGroup.find("input").after(suffixElement)
                            }

                            $original[0].setValue = function (newValue) {
                                setValue(newValue)
                            }
                            $original[0].destroyInputSpinner = function () {
                                destroy()
                            }

                            var observer = new MutationObserver(function () {
                                updateAttributes()
                                setValue(value, true)
                            })
                            observer.observe($original[0], {attributes: true})

                            $original.after($inputGroup)

                            setValue(value)

                            $input.on("paste input change focusout", function (event) {
                                let newValue = $input[0].value
                                const focusOut = event.type === "focusout"
                                newValue = $original[0].inputSpinnerEditor.parse(newValue)
                                setValue(newValue, focusOut)
                                dispatchEvent($original, event.type)
                                if (props.keyboardStepping && focusOut) { // stop stepping
                                    resetTimer()
                                }
                            }).on("keydown", function (event) {
                                if (props.keyboardStepping) {
                                    if (event.which === 38) { // up arrow pressed
                                        event.preventDefault()
                                        if (!$buttonDecrement.prop("disabled")) {
                                            stepHandling(step)
                                        }
                                    } else if (event.which === 40) { // down arrow pressed
                                        event.preventDefault()
                                        if (!$buttonIncrement.prop("disabled")) {
                                            stepHandling(-step)
                                        }
                                    }
                                }
                            }).on("keyup", function (event) {
                                // up/down arrow released
                                if (props.keyboardStepping && (event.which === 38 || event.which === 40)) {
                                    event.preventDefault()
                                    resetTimer()
                                }
                            })

                            // decrement button
                            onPointerDown($buttonDecrement[0], function () {
                                if (!$buttonDecrement.prop("disabled")) {
                                    pointerState = true
                                    stepHandling(-step)
                                }
                            })
                            // increment button
                            onPointerDown($buttonIncrement[0], function () {
                                if (!$buttonIncrement.prop("disabled")) {
                                    pointerState = true
                                    stepHandling(step)
                                }
                            })
                            onPointerUp(document.body, function () {
                                if (pointerState === true) {
                                    resetTimer()
                                    dispatchEvent($original, "change")
                                    pointerState = false
                                }
                            })
                        }

                        function setValue(newValue, updateInput) {
                            if (updateInput === undefined) {
                                updateInput = true
                            }
                            if (isNaN(newValue) || newValue === "") {
                                $original[0].value = ""
                                if (updateInput) {
                                    $input[0].value = ""
                                }
                                value = NaN
                            } else {
                                newValue = parseFloat(newValue)
                                newValue = Math.min(Math.max(newValue, min), max)
                                $original[0].value = newValue
                                if (updateInput) {
                                    $input[0].value = $original[0].inputSpinnerEditor.render(newValue)
                                }
                                value = newValue
                            }
                        }

                        function destroy() {
                            $original.prop("required", $input.prop("required"))
                            observer.disconnect()
                            resetTimer()
                            $input.off("paste input change focusout")
                            $inputGroup.remove()
                            $original.show()
                            $original[0]["bootstrap-input-spinner"] = undefined
                            if ($label[0]) {
                                $label.attr("for", $original.attr("id"))
                            }
                        }

                        function dispatchEvent($element, type) {
                            if (type) {
                                setTimeout(function () {
                                    let event
                                    if (typeof (Event) === 'function') {
                                        event = new Event(type, {bubbles: true})
                                    } else { // IE
                                        event = document.createEvent('Event')
                                        event.initEvent(type, true, true)
                                    }
                                    $element[0].dispatchEvent(event)
                                })
                            }
                        }

                        function stepHandling(step) {
                            calcStep(step)
                            resetTimer()
                            if (props.autoInterval !== undefined) {
                                autoDelayHandler = setTimeout(function () {
                                    autoIntervalHandler = setInterval(function () {
                                        calcStep(step)
                                    }, props.autoInterval)
                                }, props.autoDelay)
                            }
                        }

                        function calcStep(step) {
                            if (isNaN(value)) {
                                value = 0
                            }
                            setValue(Math.round(value / step) * step + step)
                            dispatchEvent($original, "input")
                        }

                        function resetTimer() {
                            clearTimeout(autoDelayHandler)
                            clearTimeout(autoIntervalHandler)
                        }

                        function updateAttributes() {
                            // copy properties from original to the new input
                            if ($original.prop("required")) {
                                $input.prop("required", $original.prop("required"))
                                $original.removeAttr('required')
                            }
                            $input.prop("placeholder", $original.prop("placeholder"))
                            $input.attr("inputmode", $original.attr("inputmode") || "decimal")
                            const disabled = $original.prop("disabled")
                            const readonly = $original.prop("readonly")
                            $input.prop("disabled", disabled)
                            $input.prop("readonly", readonly || props.buttonsOnly)
                            $buttonIncrement.prop("disabled", disabled || readonly)
                            $buttonDecrement.prop("disabled", disabled || readonly)
                            if (disabled || readonly) {
                                resetTimer()
                            }
                            const originalClass = $original.prop("class")
                            let groupClass = ""
                            // sizing
                            if (/form-control-sm/g.test(originalClass)) {
                                groupClass = "input-group-sm"
                            } else if (/form-control-lg/g.test(originalClass)) {
                                groupClass = "input-group-lg"
                            }
                            const inputClass = originalClass.replace(/form-control(-(sm|lg))?/g, "")
                            $inputGroup.prop("class", "input-group " + groupClass + " " + props.groupClass)
                            $input.prop("class", "form-control " + inputClass)

                            // update the main attributes
                            min = isNaN($original.prop("min")) || $original.prop("min") === "" ? -Infinity : parseFloat($original.prop("min"))
                            max = isNaN($original.prop("max")) || $original.prop("max") === "" ? Infinity : parseFloat($original.prop("max"))
                            step = parseFloat($original.prop("step")) || 1
                            if ($original.attr("hidden")) {
                                $inputGroup.attr("hidden", $original.attr("hidden"))
                            } else {
                                $inputGroup.removeAttr("hidden")
                            }
                            if ($original.attr("id")) {
                                $input.attr("id", $original.attr("id") + ":input_spinner") // give the spinner a unique id...
                                if ($label[0]) {
                                    $label.attr("for", $input.attr("id")) // ...to rewire the label
                                }
                            }
                        }
                    })

                    return this
                }

                function onPointerUp(element, callback) {
                    element.addEventListener("mouseup", function (e) {
                        callback(e)
                    })
                    element.addEventListener("touchend", function (e) {
                        callback(e)
                    })
                    element.addEventListener("keyup", function (e) {
                        if ((e.keyCode === 32 || e.keyCode === 13)) {
                            triggerKeyPressed = false
                            callback(e)
                        }
                    })
                }

                function onPointerDown(element, callback) {
                    element.addEventListener("mousedown", function (e) {
                        if (e.button === 0) {
                            e.preventDefault()
                            callback(e)
                        }
                    })
                    element.addEventListener("touchstart", function (e) {
                        if (e.cancelable) {
                            e.preventDefault()
                        }
                        callback(e)
                    }, {passive: false})
                    element.addEventListener("keydown", function (e) {
                        if ((e.keyCode === 32 || e.keyCode === 13) && !triggerKeyPressed) {
                            triggerKeyPressed = true
                            callback(e)
                        }
                    })
                }

            }(jQuery))

            $(document).ready(function () {

                // Escuchar el evento de clic en el botón de incremento
                $(document).on("click", ".btn-increment", function () {
                    var input = $(this).closest(".input-group").find("input");
                    var newQuantity = parseFloat(input.val());
                    var SKU = input.closest("tr").find("#txtSKU").val();
                    // Realizar acciones adicionales aquí
                    window.location.href = "updatetoCart?SKU=" + SKU + "&newQuantity=" + newQuantity;
                });

                // Escuchar el evento de clic en el botón de decremento
                $(document).on("click", ".btn-decrement", function () {
                    var input = $(this).closest(".input-group").find("input");
                    var newQuantity = parseFloat(input.val());
                    var SKU = input.closest("tr").find("#txtSKU").val();
                    // Realizar acciones adicionales aquí
                    window.location.href = "updatetoCart?SKU=" + SKU + "&newQuantity=" + newQuantity;
                });

            });
        </script>
    </body>
</html>
