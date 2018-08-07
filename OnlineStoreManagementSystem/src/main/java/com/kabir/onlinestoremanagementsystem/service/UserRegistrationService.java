/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kabir.onlinestoremanagementsystem.service;

import com.kabir.onlinestoremanagementsystem.dao.IUserRegistrationDAO;
import com.kabir.onlinestoremanagementsystem.domain.UsersRegistration;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Kabir
 */
@Service
public class UserRegistrationService implements IUserRegistrationService{
 @Autowired
    private IUserRegistrationDAO iUsersRegistrationDAO;

    @Override
    public List<UsersRegistration> getAllObject() {
        return iUsersRegistrationDAO.getAllObject();
    }

    @Override
    public UsersRegistration getObjectById(int id) {
        UsersRegistration obj = iUsersRegistrationDAO.getObjectById(id);
        return obj;
    }

    @Override
    public synchronized boolean addObject(UsersRegistration obj) {
        if (iUsersRegistrationDAO.objectExists(obj.getUserName(), obj.getEmail())) {
            return false;
        } else {
            iUsersRegistrationDAO.addObject(obj);
            return true;
        }
    }

    @Override
    public void updateObject(UsersRegistration obj) {
        iUsersRegistrationDAO.updateObject(obj);
    }

    @Override
    public void deleteObject(int id) {
        iUsersRegistrationDAO.deleteObject(id);
    }   
}
