/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kabir.onlinestoremanagementsystem.service;

import com.kabir.onlinestoremanagementsystem.dao.IOrderItemsDAO;
import com.kabir.onlinestoremanagementsystem.domain.OrderItems;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Kabir
 */
@Service
public class OrderItemsService implements IOrderItemsService{
    @Autowired
    private IOrderItemsDAO iOrderItemsDAO;

    @Override
    public List<OrderItems> getAllObject() {
        return iOrderItemsDAO.getAllObject();
    }

    @Override
    public OrderItems getObjectById(int id) {
        OrderItems obj = iOrderItemsDAO.getObjectById(id);
        return obj;
    }

    @Override
    public synchronized boolean addObject(OrderItems obj) {
            iOrderItemsDAO.addObject(obj);
            return true;
        }
    
//    @Override
//    public synchronized boolean addObject(OrderItems obj) {
//        if (iOrderItemsDAO.objectExists(obj.getOrderItemsId())) {
//            return false;
//        } else {
//            iOrderItemsDAO.addObject(obj);
//            return true;
//        }
//    }

    @Override
    public void updateObject(OrderItems obj) {
        iOrderItemsDAO.updateObject(obj);
    }

    @Override
    public void deleteObject(int id) {
        iOrderItemsDAO.deleteObject(id);
    }
}
