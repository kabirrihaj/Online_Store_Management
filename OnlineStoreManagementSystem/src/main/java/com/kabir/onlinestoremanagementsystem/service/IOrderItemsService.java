/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kabir.onlinestoremanagementsystem.service;

import com.kabir.onlinestoremanagementsystem.domain.OrderItems;
import java.util.List;

/**
 *
 * @author Kabir
 */
public interface IOrderItemsService {
    List<OrderItems> getAllObject();

    OrderItems getObjectById(int id);

    boolean addObject(OrderItems obj);

    void updateObject(OrderItems obj);

    void deleteObject(int id);
}
