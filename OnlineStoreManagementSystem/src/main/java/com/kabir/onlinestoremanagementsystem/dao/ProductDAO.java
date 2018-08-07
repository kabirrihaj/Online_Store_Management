/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kabir.onlinestoremanagementsystem.dao;

import com.kabir.onlinestoremanagementsystem.domain.Product;
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
public class ProductDAO implements IProductDAO{
    @Autowired
    private HibernateTemplate hibernateTemplate;    

    @Override
    public List<Product> getAllObject() {
     String hql = "FROM Product p LEFT JOIN FETCH p.proCategory LEFT JOIN FETCH p.proSubCategory ORDER BY p.productId";
        return (List<Product>) hibernateTemplate.find(hql);
    }

    @Override
    public Product getObjectById(int id) {
        return hibernateTemplate.get(Product.class, id);
    }

    @Override
    public void addObject(Product obj) {
	obj.getProCategory().getCategoryName();
	obj.getProCategory().getDescription();
	obj.getProSubCategory().getSubCategoryName();
	obj.getProSubCategory().getDescription();
	
	Product p =new Product();
	
	p.setProductName(obj.getProductName());
	p.setDescription(obj.getDescription());
	p.setFeatured(obj.getFeatured());
	p.setManufacture(obj.getManufacture());
	p.setProductQuantity(obj.getProductQuantity());
	p.setProductPurPrice(obj.getProductPurPrice());
	p.setProductSelPrice(obj.getProductSelPrice());
	p.setProductImage(obj.getProductImage());
	p.setCreateDate(obj.getCreateDate());
        hibernateTemplate.save(p);
    }

    @Override
    public void updateObject(Product obj) {
//        Product t = getObjectById(obj.getProductId());
//        t.setProductName(obj.getProductName());
//	t.setManufacture(obj.getManufacture());
//	t.setProductQuantity(obj.getProductQuantity());
//	t.setDescription(obj.getDescription());
//	t.setProductPurPrice(obj.getProductPurPrice());
//	t.setProductSelPrice(obj.getProductSelPrice());
//	t.setFeatured(obj.getFeatured());
//	t.setCreateDate(obj.getCreateDate());
	
	
        hibernateTemplate.update(obj);
    }

    @Override
    public void deleteObject(int id) {
        hibernateTemplate.delete(getObjectById(id));
    }

    @Override
    public boolean objectExists(String name) {
        String hql = "FROM Product as p WHERE p.productName = ?";
        List<Product> lst = (List<Product>) hibernateTemplate.find(hql, name);
        return lst.size() > 0 ? true : false;
    }
}
