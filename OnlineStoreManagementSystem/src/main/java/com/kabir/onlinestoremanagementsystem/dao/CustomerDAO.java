/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kabir.onlinestoremanagementsystem.dao;

import com.kabir.onlinestoremanagementsystem.domain.Customer;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Kabir
 */
@Transactional
@Repository
public class CustomerDAO implements ICustomerDAO{
   @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    public Customer getCustomerById(int cid) {
        return hibernateTemplate.get(Customer.class, cid);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Customer> getAllCustomers() {
        String hql = "FROM Customer as c ORDER BY c.customerId";
        return (List<Customer>) hibernateTemplate.find(hql);
    }

    @Override
    public void addCustomer(Customer customer) {
        hibernateTemplate.save(customer);
    }

    @Override
    public void updateCustomer(Customer customer) {
//        Customer c = getCustomerById(customer.getCustomerId());
//        c.setCustomerFname(customer.getCustomerFname());
//        c.setCustomerLname(customer.getCustomerLname());
//        c.setCustomerGender(customer.getCustomerGender());
//        c.setCustomerUserName(customer.getCustomerUserName());
//        c.setDateOfBirth(customer.getDateOfBirth());
//        c.setEmail(customer.getEmail());
//        c.setAddress1(customer.getAddress1());
//        c.setAddress2(customer.getAddress2());
//        c.setCity(customer.getCity());
//        c.setState(customer.getState());
//        c.setZip(customer.getZip());
//        c.setPassword(customer.getPassword());
//        c.setPhoneNumber(customer.getPhoneNumber());
//        c.setCustomerImage(customer.getCustomerImage());
        hibernateTemplate.update(customer);
    }

    @Override
    public void deleteCustomer(int cid) {
        hibernateTemplate.delete(getCustomerById(cid));
    }

    @SuppressWarnings("unchecked")
    @Override
    public boolean customerExists(String customerUserName, String email) {
        String hql = "FROM Customer as c WHERE c.customerUserName = ? and c.email = ?";
        List<Customer> customers = (List<Customer>) hibernateTemplate.find(hql, customerUserName, email);
        return customers.size() > 0 ? true : false;
    } 
}
