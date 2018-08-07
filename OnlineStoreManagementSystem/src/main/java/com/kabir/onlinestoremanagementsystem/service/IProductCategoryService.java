/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kabir.onlinestoremanagementsystem.service;

import com.kabir.onlinestoremanagementsystem.domain.ProCategory;
import java.util.List;

/**
 *
 * @author Kabir
 */
public interface IProductCategoryService {
   List<ProCategory> getAllObject();

    ProCategory getObjectById(int id);

    boolean addObject(ProCategory obj);

    void updateObject(ProCategory obj);

    void deleteObject(int id); 
}
