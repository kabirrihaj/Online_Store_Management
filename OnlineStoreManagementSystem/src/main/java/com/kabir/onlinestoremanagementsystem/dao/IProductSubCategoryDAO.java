/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kabir.onlinestoremanagementsystem.dao;

import com.kabir.onlinestoremanagementsystem.domain.ProSubCategory;
import java.util.List;

/**
 *
 * @author Kabir
 */
public interface IProductSubCategoryDAO {
   List<ProSubCategory> getAllObject();

    ProSubCategory getObjectById(int id);

    void addObject(ProSubCategory obj);

    void updateObject(ProSubCategory obj);

    void deleteObject(int id);

    boolean objectExists(int catid, String name); 
}
