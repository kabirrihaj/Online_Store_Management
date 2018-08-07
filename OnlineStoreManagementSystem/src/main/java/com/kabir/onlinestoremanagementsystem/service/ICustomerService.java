/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kabir.onlinestoremanagementsystem.service;

import com.kabir.onlinestoremanagementsystem.domain.Customer;
import java.util.List;

/**
 *
 * @author Kabir
 */
public interface ICustomerService {
    List<Customer> getAllCustomers();

    Customer getCustomerById(int pid);

    boolean addCustomer(Customer customer);

    void updateCustomer(Customer customer);

    void deleteCustomer(int pid);
}
