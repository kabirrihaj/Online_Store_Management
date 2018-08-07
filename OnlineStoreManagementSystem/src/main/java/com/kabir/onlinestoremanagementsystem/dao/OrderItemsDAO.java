/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kabir.onlinestoremanagementsystem.dao;

import com.kabir.onlinestoremanagementsystem.domain.OrderItems;
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
public class OrderItemsDAO implements IOrderItemsDAO {

    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    public List<OrderItems> getAllObject() {
	String hql = "FROM OrderItems p LEFT JOIN FETCH p.product LEFT JOIN FETCH p.orders ORDER BY p.orderItemsId";
	return (List<OrderItems>) hibernateTemplate.find(hql);
    }

    @Override
    public OrderItems getObjectById(int id) {
	return hibernateTemplate.get(OrderItems.class, id);
    }

    @Override
    public void addObject(OrderItems obj) {
	double price=obj.getProduct().getProductSelPrice();
	double tprice=price*obj.getQuantity();
	double nprice=tprice-obj.getDiscountPrice();
	OrderItems o = new OrderItems();
	o.setOrders(obj.getOrders());
	o.setProduct(obj.getProduct());
	o.setPrice(price);
	o.setQuantity(obj.getQuantity());
	o.setDiscountPrice(obj.getDiscountPrice());
	o.setTotalPrice(tprice);
	o.setNetPrice(nprice);
	o.setDelivaryZone(obj.getDelivaryZone());
	o.setAddress(obj.getAddress());
	o.setCustomer(obj.getCustomer());
	hibernateTemplate.save(o);
    }

    @Override
    public void updateObject(OrderItems obj) {
	double proPrice = obj.getProduct().getProductSelPrice();
	double tPrice = proPrice * obj.getQuantity();
	double netPrices = tPrice - obj.getDiscountPrice();

	OrderItems t = getObjectById(obj.getOrderItemsId());
	t.setPrice(proPrice);
	t.setQuantity(obj.getQuantity());
	t.setDiscountPrice(obj.getDiscountPrice());
	t.setTotalPrice(tPrice);
	t.setNetPrice(netPrices);
	t.setDelivaryZone(obj.getDelivaryZone());
	t.setAddress(obj.getAddress());
	hibernateTemplate.update(t);
    }

    @Override
    public void deleteObject(int id) {
	hibernateTemplate.delete(getObjectById(id));
    }

//    @Override
//    public boolean objectExists(int id) {
//        String hql = "FROM OrderItems as p WHERE p.orderItemsId = ?";
//        List<OrderItems> lst = (List<OrderItems>) hibernateTemplate.find(hql, id);
//        return lst.size() > 0 ? true : false;
//    }
}
