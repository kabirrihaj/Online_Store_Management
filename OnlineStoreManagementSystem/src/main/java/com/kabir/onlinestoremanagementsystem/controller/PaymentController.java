/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kabir.onlinestoremanagementsystem.controller;

import com.kabir.onlinestoremanagementsystem.domain.Payment;
import com.kabir.onlinestoremanagementsystem.service.IPaymentService;
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
@RequestMapping("/paymentInfo")
public class PaymentController {
   @Autowired
    private IPaymentService iPaymentService;

    @RequestMapping("/home")
    public String home() {
        return "payment";
    }
    @RequestMapping(value = "/payment", method = RequestMethod.GET)
    public ResponseEntity<List<Payment>> getAllPaymentLists() {
        List<Payment> list = iPaymentService.getAllObject();
        return new ResponseEntity<List<Payment>>(list, HttpStatus.OK);
    }

    @RequestMapping(value = "/payment/{id}", method = RequestMethod.GET)
    public ResponseEntity<Payment> getObjectById(@PathVariable("id") Integer id) {
        Payment payment = iPaymentService.getObjectById(id);
        return new ResponseEntity<Payment>(payment, HttpStatus.OK);
    }

    @RequestMapping(value = "/payment", method = RequestMethod.POST)
    public ResponseEntity<Void> addObject(@RequestBody Payment payment, UriComponentsBuilder builder) {
        boolean flag = iPaymentService.addObject(payment);
        if (flag == false) {
            return new ResponseEntity<Void>(HttpStatus.CONFLICT);
        }
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(builder.path("/payment/{id}").buildAndExpand(payment.getPaymentId()).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    }

    @RequestMapping(value = "/payment/{id}", method = RequestMethod.PUT)
    public ResponseEntity<Payment> updatePayment(@RequestBody Payment customerInf) {
        iPaymentService.updateObject(customerInf);
        return new ResponseEntity<Payment>(customerInf, HttpStatus.OK);
    }

    @RequestMapping(value = "/payment/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Void> deleteObject(@PathVariable("id") Integer id) {
        iPaymentService.deleteObject(id);
        return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
    } 
}
