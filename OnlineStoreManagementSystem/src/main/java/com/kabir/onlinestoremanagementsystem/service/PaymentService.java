/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kabir.onlinestoremanagementsystem.service;

import com.kabir.onlinestoremanagementsystem.dao.IPaymentDAO;
import com.kabir.onlinestoremanagementsystem.domain.Payment;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Kabir
 */
@Service
public class PaymentService implements IPaymentService{
    @Autowired
    private IPaymentDAO iPaymentDAO;

    @Override
    public List<Payment> getAllObject() {
        return iPaymentDAO.getAllObject();
    }

    @Override
    public Payment getObjectById(int id) {
        Payment obj = iPaymentDAO.getObjectById(id);
        return obj;
    }

    @Override
    public synchronized boolean addObject(Payment obj) {
            iPaymentDAO.addObject(obj);
            return true; 
    }
//    @Override
//    public synchronized boolean addObject(Payment obj) {
//        if (iPaymentDAO.objectExists(obj.getPaymentId())) {
//            return false;
//        } else {
//            iPaymentDAO.addObject(obj);
//            return true;
//        }
//    }

    @Override
    public void updateObject(Payment obj) {
        iPaymentDAO.updateObject(obj);
    }

    @Override
    public void deleteObject(int id) {
        iPaymentDAO.deleteObject(id);
    }
}
