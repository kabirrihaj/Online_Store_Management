/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kabir.onlinestoremanagementsystem.controller;

import com.kabir.onlinestoremanagementsystem.domain.Orders;
import com.kabir.onlinestoremanagementsystem.service.IOrdersService;
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
@RequestMapping("/orders")
public class OrdersController {
    @Autowired
    private IOrdersService iOrdersService;

    @RequestMapping("/home")
    public String home() {
        return "order";
    }
    @RequestMapping(value = "/order", method = RequestMethod.GET)
    public ResponseEntity<List<Orders>> getAllorders() {
        List<Orders> list = iOrdersService.getAllObject();
        return new ResponseEntity<List<Orders>>(list, HttpStatus.OK);
    }

    @RequestMapping(value = "/order/{id}", method = RequestMethod.GET)
    public ResponseEntity<Orders> getObjectById(@PathVariable("id") Integer id) {
        Orders ord = iOrdersService.getObjectById(id);
        return new ResponseEntity<Orders>(ord, HttpStatus.OK);
    }

    @RequestMapping(value = "/order", method = RequestMethod.POST)
    public ResponseEntity<Void> addObject(@RequestBody Orders orders, UriComponentsBuilder builder) {
        boolean flag = iOrdersService.addObject(orders);
        if (flag == false) {
            return new ResponseEntity<Void>(HttpStatus.CONFLICT);
        }
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(builder.path("/order/{id}").buildAndExpand(orders.getOrderId()).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    }

    @RequestMapping(value = "/order/{id}", method = RequestMethod.PUT)
    public ResponseEntity<Orders> updateOrder(@RequestBody Orders product) {
        iOrdersService.updateObject(product);
        return new ResponseEntity<Orders>(product, HttpStatus.OK);
    }

    @RequestMapping(value = "/order/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Void> deleteObject(@PathVariable("id") Integer id) {
        iOrdersService.deleteObject(id);
        return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
    }
}
