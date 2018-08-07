'use strict';

app.factory('ProCategory', ['$resource', function ($resource) {
        return $resource('http://localhost:8080/OnlineStoreManagementSystem/proCategoryList/proCategory/:categoryId', {categoryId: '@categoryId'},
        {
            updateCategory: {method: 'PUT'}
        }
        );
    }]);
app.factory('ProSubCategory', ['$resource', function ($resource) {
        return $resource('http://localhost:8080/OnlineStoreManagementSystem/proSubCate/proSubCatagory/:subCategoryId', {subCategoryId: '@subCategoryId'},
        {
            updateSubCategory: {method: 'PUT'}
        }
        );
    }]);
//var app = angular.module('myApp.services', ['ngResource']);
//app.factory('TspFaculty', ['$resource', function ($resource) {
//        return {
//            faculty: $resource('http://localhost:8080/ProjectStarter/faculty/facultylist/:facultyId', {facultyId: '@facultyId'}, {
//                query: {method: 'GET', params: {}, isArray: false},
//                updateFaculty: {method: 'PUT'}
//            }),
//            tsp: $resource('http://localhost:8080/ProjectStarter/tsp/tsplist/:tspId', {tspId: '@tspId'}, {
//                query: {method: 'GET', params: {}, isArray: false},
//                updateTsp: {method: 'PUT'}
//            })
//        };
//    }]);

//  https://stackoverflow.com/questions/17160771/angularjs-a-service-that-serves-multiple-resource-urls-data-sources

app.controller('ProductSubCategoryController', ['$scope', 'ProSubCategory', 'ProCategory', function ($scope, ProSubCategory, ProCategory) {
        var ob = this;
        ob.objArray = [];
        ob.objArray2 = [];
        ob.obj = new ProSubCategory();
        ob.obj2 = new ProCategory();
        ob.fetchAllObject = function () {
            ob.objArray = ProSubCategory.query();
            $scope.names= ob.objArray2 = ProCategory.query();
        };
        //$scope.names = ob.objArray2;
        console.log($scope.names+"hello");
        ob.fetchAllObject();
        ob.addObject = function () {
            console.log('Inside save');
            if ($scope.objForm.$valid) {
                //ob.obj.tspInfo= ob.obj2;
                ob.obj.$save(function (object) {
                    console.log(object);
                    ob.flag = 'created';
                    ob.reset();
                    ob.fetchAllObject();
                },
                        function (err) {
                            console.log(err.status);
                            ob.flag = 'failed';
                        }
                );
            }
        };
        ob.editObject = function (id) {
            console.log('Inside edit');
            ob.obj = ProSubCategory.get({subCategoryId: id}, function () {
                ob.flag = 'edit';
            });
        };
        ob.updateObjectDetail = function () {
            console.log('Inside update');
            if ($scope.objForm.$valid) {
                ob.obj.$updateSubCategory(function (object) {
                    console.log(object);
                    ob.updatedId = object.subCategoryId;
                    ob.reset();
                    ob.flag = 'updated';
                    ob.fetchAllObject();
                });
            }
        };
        ob.deleteObject = function (id) {
            console.log('Inside delete');
            ob.obj = ProSubCategory.delete({subCategoryId: id}, function () {
                ob.reset();
                ob.flag = 'deleted';
                ob.fetchAllObject();
            });
        };
        ob.reset = function () {
            ob.obj = new ProSubCategory();
            $scope.objForm.$setPristine();
        };
        ob.cancelUpdate = function (id) {
            ob.obj = new ProSubCategory();
            ob.flag = '';
            ob.fetchAllObject();
        };
    }]);


