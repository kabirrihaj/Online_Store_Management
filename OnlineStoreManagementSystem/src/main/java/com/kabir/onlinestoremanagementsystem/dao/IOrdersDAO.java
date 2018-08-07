/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kabir.onlinestoremanagementsystem.dao;

import com.kabir.onlinestoremanagementsystem.domain.Orders;
import java.util.List;

/**
 *
 * @author Kabir
 */
public interface IOrdersDAO {
   List<Orders> getAllObject();

    Orders getObjectById(int id);

    void addObject(Orders obj);

    void updateObject(Orders obj);

    void deleteObject(int id);

//    boolean objectExists(int id); 
}
