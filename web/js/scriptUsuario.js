function validar_correo_clave(e) {

    var correo = $('#frmRegistro #correo').val();
    var correoConfirmar = $('#frmRegistro #correoConfirmar').val();
    var clave = $('#frmRegistro #clave').val();
    var claveConfirmar = $('#frmRegistro #claveConfirmar').val();
    /*if (correo == '' || correoConfirmar == '') {
     alert('Debes introducir tu correo en los dos campos.');
     //document.registro
     e.preventDefault();
     return false;
     }*/
    if (correo != correoConfirmar) {
        //alert("Los correos introducidos no son iguales.");
        alertify.error("Los correos introducidos no son iguales");
        //document.registro
        e.preventDefault();
        return false;
    }
    /*if (clave == '' || claveConfirmar == '') {
     alert('Debes introducir tu clave en los dos campos.');
     //document.registro
     e.preventDefault();
     return false;
     } */
    else {
        if (clave != claveConfirmar) {
            //alert("Las claves introducidas no son iguales");
            alertify.error("Las claves introducidas no son iguales");
            //document.registro
            e.preventDefault();
            return false;
        } else {
            //alert('Registro Exitoso');
            //alertify.success("Registro Exitoso");
            //$('#register-form').trigger('submit');
            return true;
        }
    }

}

$(function () {

    $('#frmRegistro').submit(function (e) {
        validar_correo_clave(e);
    });
});

$(document).ready(function () {

    $("#frmNuevaVenta tr #btnBorrar").click(function () {

        //var correo = $('#frmRegistro #correo').val();
        var idp = $(this).parent().find("#idp").val();
        //var idp = $('#idp').val();

        swal({
            title: "Seguro quieres borrar el registro?",
            //text: "Una vex borrado, no podrás recuperar el registro",
            icon: "warning",
            buttons: true,
            dangerMode: true,
        })
                .then((willDelete) => {
                    if (willDelete) {
                        eliminarVenta(idp);
                        swal("Registro borrado correctamente", {
                            icon: "success",
                        }).then((willDelete) => {
                            if (willDelete) {
                                location.href = "Venta?opcion=ListaTemporal";
                            }
                        });
                    }
                });

    });

    function eliminarVenta(idp) {

        var url = "Venta?opcion=Borrar";
        $.ajax({
            type: 'POST',
            url: url,
            data: "idp=" + idp,
            success: function (data, textStatus, jqXHR) {

            }

        })
    }

    $("#frmNuevaCompra tr #btnBorrar").click(function () {

        //var correo = $('#frmRegistro #correo').val();
        var idp = $(this).parent().find("#idp").val();
        //var idp = $('#idp').val();

        swal({
            title: "Seguro quieres borrar el registro?",
            //text: "Una vex borrado, no podrás recuperar el registro",
            icon: "warning",
            buttons: true,
            dangerMode: true,
        })
                .then((willDelete) => {
                    if (willDelete) {
                        eliminarCompra(idp);
                        swal("Registro borrado correctamente", {
                            icon: "success",
                        }).then((willDelete) => {
                            if (willDelete) {
                                location.href = "Compra?opcion=ListaTemporal";
                            }
                        });
                    }
                });

    });

    function eliminarCompra(idp) {

        var url = "Compra?opcion=Borrar";
        $.ajax({
            type: 'POST',
            url: url,
            data: "idp=" + idp,
            success: function (data, textStatus, jqXHR) {

            }

        })
    }

    $("#frmNuevaVenta tr #Cantidad").click(function () {

        var idp = $(this).parent().find("#idpro").val();
        var cantidad = $(this).parent().find("#Cantidad").val();

        var url = "Venta?opcion=ActualizarCantidad";
        $.ajax({
            type: 'POST',
            url: url,
            data: "idp=" + idp + "&Cantidad=" + cantidad,
            success: function (data, textStatus, jqXHR) {
                location.href = "Venta?opcion=ListaTemporal";
            }

        });

    });

    $("#frmNuevaCompra tr #Cantidad").click(function () {

        var idp = $(this).parent().find("#idpro").val();
        var cantidad = $(this).parent().find("#Cantidad").val();

        var url = "Compra?opcion=ActualizarCantidad";
        $.ajax({
            type: 'POST',
            url: url,
            data: "idp=" + idp + "&Cantidad=" + cantidad,
            
            success: function (data, textStatus, jqXHR) {
                location.href = "Compra?opcion=ListaTemporal1";
            }

        });

    });

});