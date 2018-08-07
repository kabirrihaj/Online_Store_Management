/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kabir.onlinestoremanagementsystem.dao;

import com.kabir.onlinestoremanagementsystem.domain.ProCategory;
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
public class ProductCategoryDAO implements IProductCategoryDAO{
 @Autowired
    private HibernateTemplate hibernateTemplate;    

    @Override
    public List<ProCategory> getAllObject() {
        String hql = "FROM ProCategory as p ORDER BY p.categoryId";
        return (List<ProCategory>) hibernateTemplate.find(hql);
    }

    @Override
    public ProCategory getObjectById(int id) {
        return hibernateTemplate.get(ProCategory.class, id);
    }

    @Override
    public void addObject(ProCategory obj) {
        hibernateTemplate.save(obj);
    }

    @Override
    public void updateObject(ProCategory obj) {
//        ProCategory pc = getObjectById(obj.getCategoryId());
//        pc.setCategoryName(obj.getCategoryName());
//	pc.setDescription(obj.getDescription());
        hibernateTemplate.update(obj);
    }

    @Override
    public void deleteObject(int id) {
        hibernateTemplate.delete(getObjectById(id));
    }

    @Override
    public boolean objectExists(String catName) {
        String hql = "FROM ProCategory as p WHERE p.categoryName = ?";
        List<ProCategory> lst = (List<ProCategory>) hibernateTemplate.find(hql, catName);
        return lst.size() > 0 ? true : false;
    }   
}
