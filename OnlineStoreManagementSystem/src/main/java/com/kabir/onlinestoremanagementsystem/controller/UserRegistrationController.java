/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kabir.onlinestoremanagementsystem.controller;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.kabir.onlinestoremanagementsystem.domain.UsersRegistration;
import com.kabir.onlinestoremanagementsystem.service.IUserRegistrationService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.UriComponentsBuilder;

/**
 *
 * @author Kabir
 */
@Controller
@RequestMapping("/userRegist")
public class UserRegistrationController {
    @Autowired
    private IUserRegistrationService iUsersRegistrationService;

    @RequestMapping("/home")
    public String home() {
        return "user_registration";
    }
    @RequestMapping(value = "/userRegistration", method = RequestMethod.GET)
    @JsonIgnore
    public ResponseEntity<List<UsersRegistration>> getAllUsersRegistration() {
        List<UsersRegistration> list = iUsersRegistrationService.getAllObject();
        return new ResponseEntity<List<UsersRegistration>>(list, HttpStatus.OK);
    }

    @RequestMapping(value = "/userRegistration/{id}", method = RequestMethod.GET)
    public ResponseEntity<UsersRegistration> getUsersRegistrationById(@PathVariable("id") Integer id) {
        UsersRegistration usersRegistration = iUsersRegistrationService.getObjectById(id);
        return new ResponseEntity<UsersRegistration>(usersRegistration, HttpStatus.OK);
    }

    @RequestMapping(value = "/userRegistration", method = RequestMethod.POST)
    public ResponseEntity<Void> addPUser(@RequestBody UsersRegistration usersRegistration, UriComponentsBuilder builder) {
        boolean flag = iUsersRegistrationService.addObject(usersRegistration);
        if (flag == false) {
            return new ResponseEntity<Void>(HttpStatus.CONFLICT);
        }
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(builder.path("/userRegistration/{id}").buildAndExpand(usersRegistration.getUserId()).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    }

    @RequestMapping(value = "/userRegistration/{id}", method = RequestMethod.PUT)
    public ResponseEntity<UsersRegistration> updateUser(@RequestBody UsersRegistration usersRegistration) {
        iUsersRegistrationService.updateObject(usersRegistration);
        return new ResponseEntity<UsersRegistration>(usersRegistration, HttpStatus.OK);
    }

    @RequestMapping(value = "/userRegistration/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Void> deleteUser(@PathVariable("id") Integer id) {
        iUsersRegistrationService.deleteObject(id);
        return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
    }
}
