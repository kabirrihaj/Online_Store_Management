/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kabir.onlinestoremanagementsystem.dao;

import com.kabir.onlinestoremanagementsystem.domain.OrderItems;
import java.util.List;

/**
 *
 * @author Kabir
 */
public interface IOrderItemsDAO {
    List<OrderItems> getAllObject();

    OrderItems getObjectById(int id);

    void addObject(OrderItems obj);

    void updateObject(OrderItems obj);

    void deleteObject(int id);

   // boolean objectExists(int id);
}
