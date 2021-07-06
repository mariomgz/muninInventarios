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
public class BodegaVO {

    private String bodegaId, nombreBodega, ubicacion;

    public BodegaVO(String bodegaId, String nombreBodega, String ubicacion) {
        this.bodegaId = bodegaId;
        this.nombreBodega = nombreBodega;
        this.ubicacion = ubicacion;
    }

    public BodegaVO(String bodegaId, String nombreBodega) {
        this.bodegaId = bodegaId;
        this.nombreBodega = nombreBodega;
    }

    public BodegaVO() {
    }

    public String getBodegaId() {
        return bodegaId;
    }

    public void setBodegaId(String bodegaId) {
        this.bodegaId = bodegaId;
    }

    public String getNombreBodega() {
        return nombreBodega;
    }

    public void setNombreBodega(String nombreBodega) {
        this.nombreBodega = nombreBodega;
    }

    public String getUbicacion() {
        return ubicacion;
    }

    public void setUbicacion(String ubicacion) {
        this.ubicacion = ubicacion;
    }

}
