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
public class CompraVO {

    public String idProveedor, idProducto, descripcionP, fecha, estadoCompra;

    public Integer id, item, cantidad;

    public Double precio, subtotal, monto;

    public CompraVO() {
    }

    public CompraVO(String idProveedor, String idProducto, String descripcionP, String fecha, String estadoCompra, Integer id, Integer item, Integer cantidad, Double precio, Double subtotal, Double monto) {
        this.idProveedor = idProveedor;
        this.idProducto = idProducto;
        this.descripcionP = descripcionP;
        this.fecha = fecha;
        this.estadoCompra = estadoCompra;
        this.id = id;
        this.item = item;
        this.cantidad = cantidad;
        this.precio = precio;
        this.subtotal = subtotal;
        this.monto = monto;
    }

    public String getIdProveedor() {
        return idProveedor;
    }

    public void setIdProveedor(String idProveedor) {
        this.idProveedor = idProveedor;
    }

    public String getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(String idProducto) {
        this.idProducto = idProducto;
    }

    public String getDescripcionP() {
        return descripcionP;
    }

    public void setDescripcionP(String descripcionP) {
        this.descripcionP = descripcionP;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getEstadoCompra() {
        return estadoCompra;
    }

    public void setEstadoCompra(String estadoVenta) {
        this.estadoCompra = estadoVenta;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getItem() {
        return item;
    }

    public void setItem(Integer item) {
        this.item = item;
    }

    public Integer getCantidad() {
        return cantidad;
    }

    public void setCantidad(Integer cantidad) {
        this.cantidad = cantidad;
    }

    public Double getPrecio() {
        return precio;
    }

    public void setPrecio(Double precio) {
        this.precio = precio;
    }

    public Double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(Double subtotal) {
        this.subtotal = subtotal;
    }

    public Double getMonto() {
        return monto;
    }

    public void setMonto(Double monto) {
        this.monto = monto;
    }

}
