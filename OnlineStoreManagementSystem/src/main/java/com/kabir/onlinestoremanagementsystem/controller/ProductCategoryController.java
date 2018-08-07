/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kabir.onlinestoremanagementsystem.controller;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.kabir.onlinestoremanagementsystem.domain.ProCategory;
import com.kabir.onlinestoremanagementsystem.service.IProductCategoryService;
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
@RequestMapping("/proCategoryList")
public class ProductCategoryController {
  @Autowired
    private IProductCategoryService iProductCategoryService;

    @RequestMapping("/home")
    public String home() {
        //return "product_category";
        return "product_category";
    }
    @RequestMapping(value = "/proCategory", method = RequestMethod.GET)
    @JsonIgnore
    public ResponseEntity<List<ProCategory>> getAllProCategorys() {
        List<ProCategory> list = iProductCategoryService.getAllObject();
        return new ResponseEntity<List<ProCategory>>(list, HttpStatus.OK);
    }

    @RequestMapping(value = "/proCategory/{id}", method = RequestMethod.GET)
    public ResponseEntity<ProCategory> getProCategoryById(@PathVariable("id") Integer id) {
        ProCategory proCategory = iProductCategoryService.getObjectById(id);
        return new ResponseEntity<ProCategory>(proCategory, HttpStatus.OK);
    }

    @RequestMapping(value = "/proCategory", method = RequestMethod.POST)
    public ResponseEntity<Void> addProCategory(@RequestBody ProCategory proCategory, UriComponentsBuilder builder) {
        boolean flag = iProductCategoryService.addObject(proCategory);
        if (flag == false) {
            return new ResponseEntity<Void>(HttpStatus.CONFLICT);
        }
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(builder.path("/proCategory/{id}").buildAndExpand(proCategory.getCategoryId()).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    }

    @RequestMapping(value = "/proCategory/{id}", method = RequestMethod.PUT)
    public ResponseEntity<ProCategory> updateCategory(@RequestBody ProCategory proCategory) {
        iProductCategoryService.updateObject(proCategory);
        return new ResponseEntity<ProCategory>(proCategory, HttpStatus.OK);
    }

    @RequestMapping(value = "/proCategory/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Void> deleteProCategory(@PathVariable("id") Integer id) {
        iProductCategoryService.deleteObject(id);
        return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
    }  
}
