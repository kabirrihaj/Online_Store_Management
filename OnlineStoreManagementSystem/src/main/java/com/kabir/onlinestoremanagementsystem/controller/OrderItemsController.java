/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kabir.onlinestoremanagementsystem.controller;

import com.kabir.onlinestoremanagementsystem.domain.OrderItems;
import com.kabir.onlinestoremanagementsystem.service.IOrderItemsService;
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
@RequestMapping("/ordersItems")
public class OrderItemsController {
    @Autowired
    private IOrderItemsService iOrderItemsService;

    @RequestMapping("/home")
    public String home() {
        return "order_items";
    }
    @RequestMapping(value = "/ordersItem", method = RequestMethod.GET)
    public ResponseEntity<List<OrderItems>> getAllOrders() {
        List<OrderItems> list = iOrderItemsService.getAllObject();
        return new ResponseEntity<List<OrderItems>>(list, HttpStatus.OK);
    }

    @RequestMapping(value = "/ordersItem/{id}", method = RequestMethod.GET)
    public ResponseEntity<OrderItems> getObjectById(@PathVariable("id") Integer id) {
        OrderItems orderItem = iOrderItemsService.getObjectById(id);
        return new ResponseEntity<OrderItems>(orderItem, HttpStatus.OK);
    }

    @RequestMapping(value = "/ordersItem", method = RequestMethod.POST)
    public ResponseEntity<Void> addObject(@RequestBody OrderItems orderItems, UriComponentsBuilder builder) {
        boolean flag = iOrderItemsService.addObject(orderItems);
        if (flag == false) {
            return new ResponseEntity<Void>(HttpStatus.CONFLICT);
        }
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(builder.path("/ordersItem/{id}").buildAndExpand(orderItems.getOrderItemsId()).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    }

    @RequestMapping(value = "/ordersItem/{id}", method = RequestMethod.PUT)
    public ResponseEntity<OrderItems> updateOrderItems(@RequestBody OrderItems orders) {
        iOrderItemsService.updateObject(orders);
        return new ResponseEntity<OrderItems>(orders, HttpStatus.OK);
    }

    @RequestMapping(value = "/ordersItem/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Void> deleteObject(@PathVariable("id") Integer id) {
        iOrderItemsService.deleteObject(id);
        return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
    }
}
