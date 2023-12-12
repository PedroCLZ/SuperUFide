package com.Proyecto.service.impl;

import com.Proyecto.dao.ProductoDao;
import com.Proyecto.domain.Producto;
import com.Proyecto.service.ProductoService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ProductoServiceImpl implements ProductoService {

    @Autowired
    private ProductoDao productoDao;

    @Override
    @Transactional(readOnly = true)
    public List<Producto> getProductos(boolean activo) {
        var productos = productoDao.findAll();
        if (activo){
            productos.removeIf(e -> !e.isActivo());
        }
        return productos;
    }

    //Se obtiene una producto segun el id pasado por parametro
    @Transactional(readOnly=true)
    @Override
    public Producto getProducto(Producto producto) {
        return productoDao.findById(producto.getIdProducto()).orElse(null);
    }

    //Se actualiza una producto o se inserta una nueva
    @Override
    public void save(Producto producto) {
        productoDao.save(producto);
    }

    //Se borra una producto segun el id pasado de la producto
    @Override
    public void delete(Producto producto) {
        productoDao.delete(producto);
    }

}
