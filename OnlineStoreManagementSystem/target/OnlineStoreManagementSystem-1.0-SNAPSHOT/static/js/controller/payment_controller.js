'use strict';

app.factory('OrderItems', ['$resource', function ($resource) {
        return $resource('http://localhost:8080/OnlineStoreManagementSystem/ordersItems/ordersItem/:orderItemsId', {orderItemsId: '@orderItemsId'},
        {
            updateOrderItems: {method: 'PUT'}
        }
        );
    }]);
app.factory('Customer', ['$resource', function ($resource) {
    return $resource('http://localhost:8080/OnlineStoreManagementSystem/customerInfo/customer/:customerId', {customerId: '@customerId'},
	{
		updateCustomer: {method: 'PUT'}
	}
    );
}]);
app.factory('Payment', ['$resource', function ($resource) {
        return $resource('http://localhost:8080/OnlineStoreManagementSystem/paymentInfo/payment/:paymentId', {paymentId: '@paymentId'},
        {
            updatePayment: {method: 'PUT'}
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

app.controller('PaymentController', ['$scope', 'Payment', 'Customer', 'OrderItems', function ($scope, Payment, Customer, OrderItems) {
        var ob = this;
        ob.objArray = [];
        ob.objArray2 = [];
        ob.objArray3 = [];
        ob.obj = new Payment();
	ob.obj2 = new Customer();
        ob.obj3 = new OrderItems();
      
        ob.fetchAllObject = function () {
            ob.objArray = Payment.query();
	     $scope.namess= ob.objArray = Payment.query();
	     $scope.name= ob.objArray2 = Customer.query();
            $scope.names= ob.objArray3 = OrderItems.query();
           
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
            ob.obj = Payment.get({paymentId: id}, function () {
                ob.flag = 'edit';
            });
        };
        ob.updateObjectDetail = function () {
            console.log('Inside update');
            if ($scope.objForm.$valid) {
                ob.obj.$updatePayment(function (object) {
                    console.log(object);
                    ob.updatedId = object.paymentId;
                    ob.reset();
                    ob.flag = 'updated';
                    ob.fetchAllObject();
                });
            }
        };
        ob.deleteObject = function (id) {
            console.log('Inside delete');
            ob.obj = Payment.delete({paymentId: id}, function () {
                ob.reset();
                ob.flag = 'deleted';
                ob.fetchAllObject();
            });
        };
        ob.reset = function () {
            ob.obj = new Payment();
            $scope.objForm.$setPristine();
        };
        ob.cancelUpdate = function (id) {
            ob.obj = new Payment();
            ob.flag = '';
            ob.fetchAllObject();
        };
    }]);


