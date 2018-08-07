/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kabir.onlinestoremanagementsystem.dao;

import com.kabir.onlinestoremanagementsystem.domain.Orders;
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
public class OrdersDAO implements IOrdersDAO{
   @Autowired
    private HibernateTemplate hibernateTemplate;    

    @Override
    public List<Orders> getAllObject() {
	String hql = "FROM Orders p LEFT JOIN FETCH p.customer LEFT JOIN FETCH p.product ORDER BY p.orderId";
        return (List<Orders>) hibernateTemplate.find(hql);
    }

    @Override
    public Orders getObjectById(int id) {
        return hibernateTemplate.get(Orders.class, id);
    }

    @Override
    public void addObject(Orders obj) {
        hibernateTemplate.save(obj);
    }

    @Override
    public void updateObject(Orders obj) {
        //Orders t = getObjectById(obj.getOrderId());
        
	
	
        hibernateTemplate.update(obj);
    }

    @Override
    public void deleteObject(int id) {
        hibernateTemplate.delete(getObjectById(id));
    }

//    @Override
//    public boolean objectExists(int id) {
//        String hql = "FROM Orders as p WHERE p.orderId = ?";
//        List<Orders> lst = (List<Orders>) hibernateTemplate.find(hql, id);
//        return lst.size() > 0 ? true : false;
//    } 
}
