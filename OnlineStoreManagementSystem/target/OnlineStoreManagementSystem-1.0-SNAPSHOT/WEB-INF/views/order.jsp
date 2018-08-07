<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en-US">
    <head>
        <meta charset="UTF-8" /> 
        <title> Orders </title>
    </head>
    <body ng-app="myApp">
        <div ng-controller="OrdersController as objCtrl">
            <h1> Orders Info </h1>
            <form name="objForm" method="POST">
                <table>
                    <tr><td colspan="2">
                            <div ng-if="objCtrl.flag != 'edit'">
                                <h3> Add New Orders </h3> 
                            </div>
                            <div ng-if="objCtrl.flag == 'edit'">
                                <h3> Update Orders for ID: {{ objCtrl.obj.orderId}} </h3> 
                            </div> </td>
                    </tr>
                    <tr>
                        <td>Customer Name</td>
                        <td>
                            <select ng-model="objCtrl.obj.customer" ng-options="x.customerUserName for x in names">
</select>
                        </td>
                    </tr>
                    <tr>
                        <td>product Name</td>
                        <td>
                            <select ng-model="objCtrl.obj.product" ng-options="x.productName for x in name">
</select>
                        </td>
                    </tr>
                    <tr>
                        <td>Order Date: </td> <td><input type="date" name="createDate" ng-model="objCtrl.obj.createDate" required/> 
                            <span ng-show="objForm.createDate.$error.required" class="msg-val">Order Date is required.</span> </td>
                    </tr>
                    
                    <tr>
                        <td>Order Status: </td> <td> <input type="text" name="orderStatus" ng-model="objCtrl.obj.orderStatus" required/> 
                            <span ng-show="objForm.orderStatus.$error.required" class="msg-val">Order Status is required.</span> </td>
                    </tr>
                    <tr>
                        <td>Order Sub Total: </td> <td> <input type="text" name="orderSubTotal" ng-model="objCtrl.obj.orderSubTotal" required/> 
                            <span ng-show="objForm.orderSubTotal.$error.required" class="msg-val">Order Sub is required.</span> </td>
                    </tr>
                    
                    
                    
                    
                    


                    <tr>
                        <td colspan="2"> <span ng-if="objCtrl.flag == 'created'" class="msg-success">Orders successfully added.</span>
                            <span ng-if="objCtrl.flag == 'failed'" class="msg-val">Product already exists.</span> </td>
                    </tr>
                    <tr><td colspan="2">
                            <div ng-if="objCtrl.flag != 'edit'">
                                <input  type="submit" ng-click="objCtrl.addObject()" value="Add Orders"/> 
                                <input type="button" ng-click="objCtrl.reset()" value="Reset"/>
                            </div>
                            <div ng-if="objCtrl.flag == 'edit'">
                                <input  type="submit" ng-click="objCtrl.updateObjectDetail()" value="Update Orders"/> 	
                                <input type="button" ng-click="objCtrl.cancelUpdate()" value="Cancel"/>				   
                            </div> </td>
                    </tr>
                    <tr>
                        <td colspan="2"> <span ng-if="objCtrl.flag == 'deleted'" class="msg-success">Orders successfully deleted.</span>
                    </tr>
                </table>     
            </form>
            <table>
                <tr><th>ID </th> 
                    <th>Customer Name</th> 
                    <th>Product Name</th> 
                    <th>Create Date</th>
        
                    <th>Order Status</th>
                    <th>order sub Total</th>
		</tr>
                <tr ng-repeat="row in objCtrl.objArray">
                    <td><span ng-bind="row.orderId"></span></td>
                    <td><span ng-bind="row.customer.customerUserName"></span></td>
                    <td><span ng-bind="row.product.productName"></span></td>
                    <td><span ng-bind="row.createDate"></span></td>
            
                    <td><span ng-bind="row.orderStatus"></span></td>
                    <td><span ng-bind="row.orderSubTotal"></span></td>
                    
                    <td>
                        <input type="button" ng-click="objCtrl.deleteObject(row.orderId)" value="Delete"/>
                        <input type="button" ng-click="objCtrl.editObject(row.orderId)" value="Edit"/>
                        <span ng-if="objCtrl.flag == 'updated' && row.orderId == objCtrl.updatedId" class="msg-success">Order successfully updated.</span> </td> 
                </tr>	
<!--                <tr ng-repeat="row in objCtrl.objArray2">
                    <td><span ng-bind="row.tspName"></span></td>
                    
                </tr>-->
            </table>
        </div>
        <script src="${pageContext.request.contextPath}/static/js/lib/angular.min.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/lib/angular-resource.min.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/app.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/controller/order_controller.js"></script>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css"/>
    </body>
</html> 