/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kabir.onlinestoremanagementsystem.dao;

import com.kabir.onlinestoremanagementsystem.domain.UsersRegistration;
import java.util.List;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
/**
 *
 * @author Kabir
 */
@Transactional
@Repository
public class UserRegistrationDAO implements IUserRegistrationDAO{
    @Autowired
    private HibernateTemplate hibernateTemplate;    

    @Override
    public List<UsersRegistration> getAllObject() {
        String hql = "FROM UsersRegistration as p ORDER BY p.userId";
        return (List<UsersRegistration>) hibernateTemplate.find(hql);
    }

    @Override
    public UsersRegistration getObjectById(int id) {
        return hibernateTemplate.get(UsersRegistration.class, id);
    }

    @Override
    public void addObject(UsersRegistration obj) {
        hibernateTemplate.save(obj);
    }

    @Override
    public void updateObject(UsersRegistration obj) {
//        UsersRegistration t = getObjectById(obj.getUserId());
//       t.setUserFname(obj.getUserFname());
//       t.setUserLname(obj.getUserLname());
//       t.setUserName(obj.getUserName());
//       t.setPassword(obj.getPassword());
//       t.setEmail(obj.getEmail());
//       t.setDateOfBirth(obj.getDateOfBirth());
//       t.setPhoneNumber(obj.getPhoneNumber());
//       t.setUserGender(obj.getUserGender());
//       t.setAddress1(obj.getAddress1());
//       t.setAddress2(obj.getAddress2());
//       t.setCity(obj.getCity());
//       t.setState(obj.getState());
//       t.setCreateDate(obj.getCreateDate());
//       t.setUserImage(obj.getUserImage());
        hibernateTemplate.update(obj);
    }

    @Override
    public void deleteObject(int id) {
        hibernateTemplate.delete(getObjectById(id));
    }

    @Override
    public boolean objectExists(String userName, String email) {
        String hql = "FROM UsersRegistration as p WHERE p.userName = ? and p.email = ?";
        List<UsersRegistration> lst = (List<UsersRegistration>) hibernateTemplate.find(hql, userName, email);
        return lst.size() > 0 ? true : false;
    }
}
