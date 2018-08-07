'use strict';


app.factory('Customer', ['$resource', function ($resource) {
    return $resource('http://localhost:8080/OnlineStoreManagementSystem/customerInfo/customer/:customerId', {customerId: '@customerId'},
	{
		updateCustomer: {method: 'PUT'}
	}
    );
}]);

app.factory('Product', ['$resource', function ($resource) {
        return $resource('http://localhost:8080/OnlineStoreManagementSystem/productInfo/product/:productId', {productId: '@productId'},
        {
            updateProduct: {method: 'PUT'}
        }
        );
    }]);

app.factory('Orders', ['$resource', function ($resource) {
        return $resource('http://localhost:8080/OnlineStoreManagementSystem/orders/order/:orderId', {orderId: '@orderId'},
        {
            updateOrder: {method: 'PUT'}
        }
        );
    }]);

app.factory('OrderItems', ['$resource', function ($resource) {
        return $resource('http://localhost:8080/OnlineStoreManagementSystem/ordersItems/ordersItem/:orderItemsId', {orderItemsId: '@orderItemsId'},
        {
            updateOrderItems: {method: 'PUT'}
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

app.controller('OrderItemsController', ['$scope', 'OrderItems', 'Customer', 'Product','Orders', function ($scope, OrderItems, Customer, Product, Orders) {
        var ob = this;
        ob.objArray = [];
        ob.objArray1 = [];
        ob.objArray2 = [];
        ob.objArray3 = [];
        ob.obj = new OrderItems();
        ob.obj1 = new Customer();
	ob.obj2 = new Product();
        ob.obj3 = new Orders();
        ob.fetchAllObject = function () {
            ob.objArray = OrderItems.query();
            $scope.names1= ob.objArray1 = Customer.query();
            $scope.names= ob.objArray2 = Product.query();
            $scope.name= ob.objArray3 = Orders.query();
        };
        //$scope.names = ob.objArray2;
        console.log($scope.names1+"hello");
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
            ob.obj = OrderItems.get({orderItemsId: id}, function () {
                ob.flag = 'edit';
            });
        };
        ob.updateObjectDetail = function () {
            console.log('Inside update');
            if ($scope.objForm.$valid) {
                ob.obj.$updateOrderItems(function (object) {
                    console.log(object);
                    ob.updatedId = object.orderItemsId;
                    ob.reset();
                    ob.flag = 'updated';
                    ob.fetchAllObject();
                });
            }
        };
        ob.deleteObject = function (id) {
            console.log('Inside delete');
            ob.obj = OrderItems.delete({orderItemsId: id}, function () {
                ob.reset();
                ob.flag = 'deleted';
                ob.fetchAllObject();
            });
        };
        ob.reset = function () {
            ob.obj = new OrderItems();
            $scope.objForm.$setPristine();
        };
        ob.cancelUpdate = function (id) {
            ob.obj = new OrderItems();
            ob.flag = '';
            ob.fetchAllObject();
        };
    }]);


