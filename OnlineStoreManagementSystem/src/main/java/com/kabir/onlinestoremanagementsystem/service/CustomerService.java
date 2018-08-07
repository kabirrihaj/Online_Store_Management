/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kabir.onlinestoremanagementsystem.service;

import com.kabir.onlinestoremanagementsystem.dao.ICustomerDAO;
import com.kabir.onlinestoremanagementsystem.domain.Customer;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Kabir
 */
@Service
public class CustomerService implements ICustomerService {
   
     @Autowired
    private ICustomerDAO icustomerDAO;

    @Override
    public Customer getCustomerById(int cid) {
        Customer obj = icustomerDAO.getCustomerById(cid);
        return obj;
    }

    @Override
    public List<Customer> getAllCustomers() {
        return icustomerDAO.getAllCustomers();
    }

    @Override
    public synchronized boolean addCustomer(Customer customer) {
        if (icustomerDAO.customerExists(customer.getCustomerUserName(), customer.getEmail())) {
            return false;
        } else {
            icustomerDAO.addCustomer(customer);
            return true;
        }
    }

    @Override
    public void updateCustomer(Customer customer) {
        icustomerDAO.updateCustomer(customer);
    }

    @Override
    public void deleteCustomer(int pid) {
        icustomerDAO.deleteCustomer(pid);
    }
}
