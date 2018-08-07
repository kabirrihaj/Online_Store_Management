/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kabir.onlinestoremanagementsystem.service;

import com.kabir.onlinestoremanagementsystem.dao.IProductSubCategoryDAO;
import com.kabir.onlinestoremanagementsystem.domain.ProSubCategory;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Kabir
 */
@Service
public class ProductSubCategoryService implements IProductSubCategoryService {
    @Autowired
    private IProductSubCategoryDAO iProductSubCategoryDAO;

    @Override
    public List<ProSubCategory> getAllObject() {
        return iProductSubCategoryDAO.getAllObject();
    }

    @Override
    public ProSubCategory getObjectById(int id) {
        ProSubCategory obj = iProductSubCategoryDAO.getObjectById(id);
        return obj;
    }

    @Override
    public synchronized boolean addObject(ProSubCategory obj) {
        if (iProductSubCategoryDAO.objectExists(obj.getProCategory().getCategoryId() ,obj.getSubCategoryName())) {
            return false;
        } else {
            iProductSubCategoryDAO.addObject(obj);
            return true;
        }
    }

    @Override
    public void updateObject(ProSubCategory obj) {
        iProductSubCategoryDAO.updateObject(obj);
    }

    @Override
    public void deleteObject(int id) {
        iProductSubCategoryDAO.deleteObject(id);
    }
}
