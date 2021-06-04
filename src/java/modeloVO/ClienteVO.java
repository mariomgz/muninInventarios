/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloVO;

/**
 *
 * @author Beto
 */
public class ClienteVO {

    public String clienteId, clienteTipoDoc, clienteNombre, clienteApellido, clienteCiudad, clienteDireccion, clienteTelefono, clienteEmail, clienteEstado;

    public ClienteVO() {
    }

    public ClienteVO(String clienteId, String clienteTipoDoc, String clienteNombre, String clienteApellido, String clienteCiudad, String clienteDireccion, String clienteTelefono, String clienteEmail, String clienteEstado) {
        this.clienteId = clienteId;
        this.clienteTipoDoc = clienteTipoDoc;
        this.clienteNombre = clienteNombre;
        this.clienteApellido = clienteApellido;
        this.clienteCiudad = clienteCiudad;
        this.clienteTelefono = clienteTelefono;
        this.clienteDireccion = clienteDireccion;
        this.clienteEmail = clienteEmail;
        this.clienteEstado = clienteEstado;

    }

    public String getClienteId() {
        return clienteId;
    }

    public void setClienteId(String clienteId) {
        this.clienteId = clienteId;
    }

    public String getClienteTipoDoc() {
        return clienteTipoDoc;
    }

    public void setClienteTipoDoc(String clienteTipoDoc) {
        this.clienteTipoDoc = clienteTipoDoc;
    }

    public String getClienteNombre() {
        return clienteNombre;
    }

    public void setClienteNombre(String clienteNombre) {
        this.clienteNombre = clienteNombre;
    }

    public String getClienteApellido() {
        return clienteApellido;
    }

    public void setClienteApellido(String clienteApellido) {
        this.clienteApellido = clienteApellido;
    }

    public String getClienteCiudad() {
        return clienteCiudad;
    }

    public void setClienteCiudad(String clienteCiudad) {
        this.clienteCiudad = clienteCiudad;
    }

    public String getClienteTelefono() {
        return clienteTelefono;
    }

    public void setClienteTelefono(String clienteTelefono) {
        this.clienteTelefono = clienteTelefono;
    }

    public String getClienteDireccion() {
        return clienteDireccion;
    }

    public void setClienteDireccion(String clienteDireccion) {
        this.clienteDireccion = clienteDireccion;
    }

    public String getClienteEmail() {
        return clienteEmail;
    }

    public void setClienteEmail(String clienteEmail) {
        this.clienteEmail = clienteEmail;
    }

    public String getClienteEstado() {
        return clienteEstado;
    }

    public void setClienteEstado(String clienteEstado) {
        this.clienteEstado = clienteEstado;
    }

}
