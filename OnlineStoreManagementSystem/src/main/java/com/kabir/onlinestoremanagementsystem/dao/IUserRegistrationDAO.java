/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kabir.onlinestoremanagementsystem.dao;

import com.kabir.onlinestoremanagementsystem.domain.UsersRegistration;
import java.util.List;

/**
 *
 * @author Kabir
 */
public interface IUserRegistrationDAO {
    List<UsersRegistration> getAllObject();

    UsersRegistration getObjectById(int id);

    void addObject(UsersRegistration obj);

    void updateObject(UsersRegistration obj);

    void deleteObject(int id);

    boolean objectExists(String userName, String email);
}
