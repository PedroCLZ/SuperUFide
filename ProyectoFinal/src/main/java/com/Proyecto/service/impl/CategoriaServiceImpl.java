package com.Proyecto.service.impl;

import com.Proyecto.dao.CategoriaDao;
import com.Proyecto.domain.Categoria;
import com.Proyecto.service.CategoriaService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CategoriaServiceImpl implements CategoriaService {

    @Autowired
    private CategoriaDao categoriaDao;

    @Override
    @Transactional(readOnly = true)
    public List<Categoria> getCategorias(boolean activo) {
        var categorias = categoriaDao.findAll();
        if (activo){
            categorias.removeIf(e -> !e.isActivo());
        }
        return categorias;
    }

    //Se obtiene una categoria segun el id pasado por parametro
    @Transactional(readOnly = true)
    public Categoria getCategoria(Categoria categoria) {
        return categoriaDao.findById(categoria.getIdCategoria()).orElse(null);
    }

    //Se actualiza una categoria o se inserta una nueva
    @Override
    public void save(Categoria categoria) {
        categoriaDao.save(categoria);
    }

    //Se borra una categoria segun el id pasado de la categoria
    @Override
    public void delete(Categoria categoria) {
        categoriaDao.delete(categoria);
    }

}
