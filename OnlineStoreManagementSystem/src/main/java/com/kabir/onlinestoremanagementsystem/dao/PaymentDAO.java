/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kabir.onlinestoremanagementsystem.dao;

import com.kabir.onlinestoremanagementsystem.domain.Payment;
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
public class PaymentDAO implements IPaymentDAO {

    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    public List<Payment> getAllObject() {
        //String hql = "FROM Product p  LEFT JOIN FETCH p.category LEFT JOIN FETCH p.subCategory ORDER BY p.productId";
	String hql = "FROM Payment p LEFT JOIN FETCH p.customer LEFT JOIN FETCH p.orderItems ORDER BY p.paymentId";

	return (List<Payment>) hibernateTemplate.find(hql);
    }

    @Override
    public Payment getObjectById(int id) {
	return hibernateTemplate.get(Payment.class, id);
    }

    @Override
    public void addObject(Payment obj) {
	obj.getCustomer().getCustomerUserName();
	obj.getOrderItems().getDelivaryZone();
	
double tprice=obj.getOrderItems().getNetPrice()+obj.getDelivaryCharge()-obj.getDiscount();
	Payment pa = new Payment();
	
	
	pa.setPaymentStatus(obj.getPaymentStatus());
	
	pa.setCustomer(obj.getCustomer());
	pa.setOrderItems(obj.getOrderItems());
	pa.setPaymentType(obj.getPaymentType());
	pa.setPaymentDate(obj.getPaymentDate());
	pa.setDiscount(obj.getDiscount());
	pa.setDelivaryCharge(obj.getDelivaryCharge());
pa.setTotalPayment(tprice);
	
	
	
	
	hibernateTemplate.save(pa);
    }

    @Override
    public void updateObject(Payment obj) {
	
	
	
	//Payment t = getObjectById(obj.getPaymentId());

	hibernateTemplate.update(obj);
    }

    @Override
    public void deleteObject(int id) {
	hibernateTemplate.delete(getObjectById(id));
    }

//    @Override
//    public boolean objectExists(int id) {
//        String hql = "FROM Payment as p WHERE p.paymentId = ?";
//        List<Payment> lst = (List<Payment>) hibernateTemplate.find(hql, id);
//        return lst.size() > 0 ? true : false;
//    }  
}
