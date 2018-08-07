/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kabir.onlinestoremanagementsystem.service;

import com.kabir.onlinestoremanagementsystem.dao.IProductDAO;
import com.kabir.onlinestoremanagementsystem.domain.Product;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Kabir
 */
@Service
public class ProductService implements IProductService{
   @Autowired
    private IProductDAO iProductDAO;

    @Override
    public List<Product> getAllObject() {
        return iProductDAO.getAllObject();
    }

    @Override
    public Product getObjectById(int id) {
        Product obj = iProductDAO.getObjectById(id);
        return obj;
    }

    @Override
    public synchronized boolean addObject(Product obj) {
        if (iProductDAO.objectExists(obj.getProductName())) {
            return false;
        } else {
            iProductDAO.addObject(obj);
            return true;
        }
    }

    @Override
    public void updateObject(Product obj) {
        iProductDAO.updateObject(obj);
    }

    @Override
    public void deleteObject(int id) {
        iProductDAO.deleteObject(id);
    } 
}
