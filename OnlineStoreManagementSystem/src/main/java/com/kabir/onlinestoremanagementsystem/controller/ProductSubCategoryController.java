/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.kabir.onlinestoremanagementsystem.controller;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.kabir.onlinestoremanagementsystem.domain.ProSubCategory;
import com.kabir.onlinestoremanagementsystem.service.IProductSubCategoryService;
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
@RequestMapping("/proSubCate")
public class ProductSubCategoryController {
    @Autowired
    private IProductSubCategoryService iProductSubCategoryService;

    @RequestMapping("/home")
    public String home() {
        return "product_sub_category";
    }
    @RequestMapping(value = "/proSubCatagory", method = RequestMethod.GET)
    @JsonIgnore
    public ResponseEntity<List<ProSubCategory>> getAllProSubCatagorys() {
        List<ProSubCategory> list = iProductSubCategoryService.getAllObject();
        return new ResponseEntity<List<ProSubCategory>>(list, HttpStatus.OK);
    }

    @RequestMapping(value = "/proSubCatagory/{id}", method = RequestMethod.GET)
    public ResponseEntity<ProSubCategory> getProSubCatagoryById(@PathVariable("id") Integer id) {
        ProSubCategory proSubCatagory = iProductSubCategoryService.getObjectById(id);
        return new ResponseEntity<ProSubCategory>(proSubCatagory, HttpStatus.OK);
    }

    @RequestMapping(value = "/proSubCatagory", method = RequestMethod.POST)
    public ResponseEntity<Void> addProSubCatagory(@RequestBody ProSubCategory proSubCatagory, UriComponentsBuilder builder) {
        boolean flag = iProductSubCategoryService.addObject(proSubCatagory);
        if (flag == false) {
            return new ResponseEntity<Void>(HttpStatus.CONFLICT);
        }
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(builder.path("/proSubCatagory/{id}").buildAndExpand(proSubCatagory.getSubCategoryId()).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    }

    @RequestMapping(value = "/proSubCatagory/{id}", method = RequestMethod.PUT)
    public ResponseEntity<ProSubCategory> updateProSubCatagory(@RequestBody ProSubCategory proCategory) {
        iProductSubCategoryService.updateObject(proCategory);
        return new ResponseEntity<ProSubCategory>(proCategory, HttpStatus.OK);
    }

    @RequestMapping(value = "/proSubCatagory/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Void> deleteProSubCatagory(@PathVariable("id") Integer id) {
        iProductSubCategoryService.deleteObject(id);
        return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
    }
}
