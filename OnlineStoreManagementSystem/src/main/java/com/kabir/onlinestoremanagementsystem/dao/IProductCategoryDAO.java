/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kabir.onlinestoremanagementsystem.dao;

import com.kabir.onlinestoremanagementsystem.domain.ProCategory;
import java.util.List;

/**
 *
 * @author Kabir
 */
public interface IProductCategoryDAO {
    List<ProCategory> getAllObject();

    ProCategory getObjectById(int id);

    void addObject(ProCategory obj);

    void updateObject(ProCategory obj);

    void deleteObject(int id);

    boolean objectExists(String catName);
}
