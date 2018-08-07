/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kabir.onlinestoremanagementsystem.service;

import com.kabir.onlinestoremanagementsystem.dao.IProductCategoryDAO;
import com.kabir.onlinestoremanagementsystem.domain.ProCategory;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Kabir
 */
@Service
public class ProductCategoryService implements IProductCategoryService{
    @Autowired
    private IProductCategoryDAO iProductCategoryDAO;

    @Override
    public List<ProCategory> getAllObject() {
        return iProductCategoryDAO.getAllObject();
    }

    @Override
    public ProCategory getObjectById(int id) {
        ProCategory obj = iProductCategoryDAO.getObjectById(id);
        return obj;
    }

    @Override
    public synchronized boolean addObject(ProCategory obj) {
        if (iProductCategoryDAO.objectExists(obj.getCategoryName())) {
            return false;
        } else {
            iProductCategoryDAO.addObject(obj);
            return true;
        }
    }

    @Override
    public void updateObject(ProCategory obj) {
        iProductCategoryDAO.updateObject(obj);
    }

    @Override
    public void deleteObject(int id) {
        iProductCategoryDAO.deleteObject(id);
    }
}
