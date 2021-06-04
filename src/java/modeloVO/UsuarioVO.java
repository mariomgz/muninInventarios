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
public class UsuarioVO {

    public String usuId, usuNombre, usuApellido, usuLogin, usuClave;

    

    public UsuarioVO() {
    }

    public UsuarioVO(String usuId, String usuNombre, String usuApellido, String usuLogin, String usuClave) {
        this.usuId = usuId;
        this.usuNombre = usuNombre;
        this.usuApellido = usuApellido;
        this.usuLogin = usuLogin;
        this.usuClave = usuClave;

    }

    public UsuarioVO(String usuLogin, String usuClave) {
        this.usuLogin = usuLogin;
        this.usuClave = usuClave;
    }

    public UsuarioVO(String usuId, String usuLogin, String usuClave) {
        this.usuId = usuId;
        this.usuLogin = usuLogin;
        this.usuClave = usuClave;
    }
    
    public UsuarioVO(String usuId) {
        this.usuId = usuId;
    }

    public String getUsuId() {
        return usuId;
    }

    public void setUsuId(String usuId) {
        this.usuId = usuId;
    }

    public String getUsuNombre() {
        return usuNombre;
    }

    public void setUsuNombre(String usuNombre) {
        this.usuNombre = usuNombre;
    }

    public String getUsuApellido() {
        return usuApellido;
    }

    public void setUsuApellido(String usuApellido) {
        this.usuApellido = usuApellido;
    }

    public String getUsuLogin() {
        return usuLogin;
    }

    public void setUsuLogin(String usuLogin) {
        this.usuLogin = usuLogin;
    }

    public String getUsuClave() {
        return usuClave;
    }

    public void setUsuClave(String usuClave) {
        this.usuClave = usuClave;
    }

}
