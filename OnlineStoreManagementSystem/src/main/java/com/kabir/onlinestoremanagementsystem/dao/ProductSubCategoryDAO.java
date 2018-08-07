/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kabir.onlinestoremanagementsystem.dao;

import com.kabir.onlinestoremanagementsystem.domain.ProSubCategory;
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
public class ProductSubCategoryDAO implements IProductSubCategoryDAO{
    @Autowired
    private HibernateTemplate hibernateTemplate;    

    @Override
    public List<ProSubCategory> getAllObject() {
        String hql ="FROM ProSubCategory psc LEFT JOIN FETCH  psc.proCategory ORDER BY psc.subCategoryId";
        return (List<ProSubCategory>) hibernateTemplate.find(hql);
    }

    @Override
    public ProSubCategory getObjectById(int id) {
        return hibernateTemplate.get(ProSubCategory.class, id);
    }

    @Override
    public void addObject(ProSubCategory obj) {
	obj.getProCategory().getCategoryName();
	obj.getProCategory().getDescription();
	ProSubCategory psc=new ProSubCategory();
	psc.setSubCategoryName(obj.getSubCategoryName());
	psc.setDescription(obj.getDescription());
        hibernateTemplate.save(psc);
    }

    @Override
    public void updateObject(ProSubCategory obj) {
//        ProSubCategory psc = getObjectById(obj.getSubCategoryId());
//        psc.setSubCategoryName(obj.getSubCategoryName());
//	psc.setDescription(obj.getDescription());
//	psc.getProCategory();
        hibernateTemplate.update(obj);
    }

    @Override
    public void deleteObject(int id) {
        hibernateTemplate.delete(getObjectById(id));
    }

    @Override
    public boolean objectExists(int catid ,String name) {
        String hql = "FROM ProSubCategory as psc WHERE psc.proCategory.categoryId = ? and psc.subCategoryName = ?";
        List<ProSubCategory> lst = (List<ProSubCategory>) hibernateTemplate.find(hql, catid, name);
        return lst.size() > 0 ? true : false;
    }
}
