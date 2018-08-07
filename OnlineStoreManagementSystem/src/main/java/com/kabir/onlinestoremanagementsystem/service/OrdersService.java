/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kabir.onlinestoremanagementsystem.service;

import com.kabir.onlinestoremanagementsystem.dao.IOrdersDAO;
import com.kabir.onlinestoremanagementsystem.domain.Orders;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Kabir
 */
@Service
public class OrdersService implements IOrdersService {

    @Autowired
    private IOrdersDAO iOrdersDAO;

    @Override
    public List<Orders> getAllObject() {
	return iOrdersDAO.getAllObject();
    }

    @Override
    public Orders getObjectById(int id) {
	Orders obj = iOrdersDAO.getObjectById(id);
	return obj;
    }

    @Override
    public synchronized boolean addObject(Orders obj) {
	iOrdersDAO.addObject(obj);
	return true;
    }

//@Override
//    public synchronized boolean addObject(Orders obj) {
//        if (iOrdersDAO.objectExists(obj.getOrderId())) {
//            return false;
//        } else {
//            iOrdersDAO.addObject(obj);
//            return true;
//        }
//    }

	@Override
	public void updateObject(Orders obj) {
        iOrdersDAO.updateObject(obj);
    }

    @Override
	public void deleteObject(int id) {
        iOrdersDAO.deleteObject(id);
    } 
}
