/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kabir.onlinestoremanagementsystem.dao;

import com.kabir.onlinestoremanagementsystem.domain.Product;
import java.util.List;

/**
 *
 * @author Kabir
 */
public interface IProductDAO {
    List<Product> getAllObject();

    Product getObjectById(int id);

    void addObject(Product obj);

    void updateObject(Product obj);

    void deleteObject(int id);

    boolean objectExists(String name);
}
