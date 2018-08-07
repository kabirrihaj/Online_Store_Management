/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kabir.onlinestoremanagementsystem.service;

import com.kabir.onlinestoremanagementsystem.domain.Payment;
import java.util.List;

/**
 *
 * @author Kabir
 */
public interface IPaymentService {
   List<Payment> getAllObject();

    Payment getObjectById(int id);

    boolean addObject(Payment obj);

    void updateObject(Payment obj);

    void deleteObject(int id); 
}
