/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kabir.onlinestoremanagementsystem.dao;

import com.kabir.onlinestoremanagementsystem.domain.Payment;
import java.util.List;

/**
 *
 * @author Kabir
 */
public interface IPaymentDAO {
     List<Payment> getAllObject();

    Payment getObjectById(int id);

    void addObject(Payment obj);

    void updateObject(Payment obj);

    void deleteObject(int id);

   // boolean objectExists(int id);
}
