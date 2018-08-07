/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kabir.onlinestoremanagementsystem.dao;

import com.kabir.onlinestoremanagementsystem.domain.Customer;
import java.util.List;

/**
 *
 * @author Kabir
 */
public interface ICustomerDAO {
   List<Customer> getAllCustomers();

    Customer getCustomerById(int cid);

    void addCustomer(Customer customer);

    void updateCustomer(Customer customer);

    void deleteCustomer(int cid);

    boolean customerExists(String customerUserName, String email); 
}
