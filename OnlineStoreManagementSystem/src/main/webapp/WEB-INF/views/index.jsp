<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
    <script src="<c:url value='/static/js/app.js' />"></script>
    <!--<script src="<c:url value='/static/js/service/user_service.js' />"></script>-->
    <script src="<c:url value='/static/js/controller/user_controller.js' />"></script>
    <body>

        <div ng-app="myApp" ng-controller="myCtrl">

            <select ng-model="selectedName" ng-options="x for x in names">
            </select>

        </div>

        <!--        <script>
                    var app = angular.module('myApp', []);
                    app.controller('myCtrl', function ($scope) {
                        $scope.names = ["Emil", "Tobias", "Linus"];
                    });
                </script>-->

        <p>This example shows how to fill a dropdown list using the ng-options directive.</p>
        <a href="userRegist/home">Go to user Registration</a><br>
        <a href="customerInfo/home">Go to Customer Registration</a><br>
        <a href="proCategoryList/home">Go to Category</a><br>
        <a href="proSubCate/home">Go to Sub Category</a><br>
        <a href="productInfo/home">Go to Product</a><br>
        <a href="orders/home">Go to Orders</a><br>
        <a href="ordersItems/home">Go to orders Items</a><br>
        <a href="paymentInfo/home">Go to Payment</a><br>
    </body>
</html>

