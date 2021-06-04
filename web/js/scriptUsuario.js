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












