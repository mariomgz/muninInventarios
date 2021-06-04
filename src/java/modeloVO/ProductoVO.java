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
public class ProductoVO {

    public String productoId, productoNombre, idCategoria, idBodega, productoPrecioVenta, productoPrecioCompra,
            stock, estadoProducto;

    public ProductoVO() {
    }

    public ProductoVO(String productoId, String productoNombre, String idCategoria, String idBodega, String productoPrecioVenta, String productoPrecioCompra, String stock, String estadoProducto) {
        this.productoId = productoId;
        this.productoNombre = productoNombre;
        this.idCategoria = idCategoria;
        this.idBodega = idBodega;
        this.productoPrecioVenta = productoPrecioVenta;
        this.productoPrecioCompra = productoPrecioCompra;
        this.stock = stock;
        this.estadoProducto = estadoProducto;
    }

    public String getProductoId() {
        return productoId;
    }

    public void setProductoId(String productoId) {
        this.productoId = productoId;
    }

    public String getProductoNombre() {
        return productoNombre;
    }

    public void setProductoNombre(String productoNombre) {
        this.productoNombre = productoNombre;
    }

    public String getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(String idCategoria) {
        this.idCategoria = idCategoria;
    }

    public String getIdBodega() {
        return idBodega;
    }

    public void setIdBodega(String idBodega) {
        this.idBodega = idBodega;
    }

    public String getProductoPrecioVenta() {
        return productoPrecioVenta;
    }

    public void setProductoPrecioVenta(String productoPrecioVenta) {
        this.productoPrecioVenta = productoPrecioVenta;
    }

    public String getProductoPrecioCompra() {
        return productoPrecioCompra;
    }

    public void setProductoPrecioCompra(String productoPrecioCompra) {
        this.productoPrecioCompra = productoPrecioCompra;
    }

    public String getStock() {
        return stock;
    }

    public void setStock(String stock) {
        this.stock = stock;
    }

    public String getEstadoProducto() {
        return estadoProducto;
    }

    public void setEstadoProducto(String estadoProducto) {
        this.estadoProducto = estadoProducto;
    }

}
