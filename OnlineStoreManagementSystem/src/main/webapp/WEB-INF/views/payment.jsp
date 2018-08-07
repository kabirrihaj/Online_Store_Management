<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en-US">
    <head>
        <meta charset="UTF-8" /> 
        <title> Payment </title>
    </head>
    <body ng-app="myApp">
        <div ng-controller="PaymentController as objCtrl">
            <center><h1> Payment Info </h1></center>
            <form name="objForm" method="POST">
		<center>
                <table>
                    <tr><td colspan="2">
                            <div ng-if="objCtrl.flag != 'edit'">
                                <h3> Add New payment </h3> 
                            </div>
                            <div ng-if="objCtrl.flag == 'edit'">
                                <h3> Update payment for ID: {{ objCtrl.obj.paymentId}} </h3> 
                            </div> </td>
                    </tr>
                    <tr>
                        <td>Customer ID:</td><td><select ng-model="objCtrl.obj.customer" ng-options="x.customerId for x in name" required></select><span ng-show="objForm.delivaryCharge.$error.required" class="msg-val">*</span> </td>
                    </tr>
                    <tr>
                        <td>Customer Name</td><td><select ng-model="objCtrl.obj.customer" ng-options="x.customerUserName for x in name"></select></td>
                    </tr>
                    <tr>
                        <td>Gender</td><td><select ng-model="objCtrl.obj.customer" ng-options="x.customerGender for x in name"></select></td>
                    </tr>
                    <tr>
                        <td>Customer email</td><td><select ng-model="objCtrl.obj.customer" ng-options="x.email for x in name"></select></td>
                    </tr>
                    <tr>
                        <td>City:</td><td><select ng-model="objCtrl.obj.customer" ng-options="x.city for x in name"></select></td>
                    </tr>
                    <tr>
                        <td>Zip Code:</td><td><select ng-model="objCtrl.obj.customer" ng-options="x.zip for x in name"></select></td>
                    </tr>
                    <tr>
                        <td>State:</td><td><select ng-model="objCtrl.obj.customer" ng-options="x.state for x in name"></select></td>
                    </tr>
                    <tr>
                        <td>phone Number</td><td><select ng-model="objCtrl.obj.customer" ng-options="x.phoneNumber for x in name"></select></td>
                    </tr>
                    
                    
                    
                   
                    <tr>
                        <td>product</td><td><select ng-model="objCtrl.obj.orderItems" ng-options="x.product.productName for x in names"></select></td>
                    </tr>
                    <tr>
                        <td>Price</td><td><select ng-model="objCtrl.obj.orderItems" ng-options="x.price for x in names"></select></td>
                    </tr>
                    <tr>
                        <td>Items Quantity</td><td><select ng-model="objCtrl.obj.orderItems" ng-options="x.quantity for x in names"></select></td>
                    </tr>
                    <tr>
                        <td>Total Price</td><td><select ng-model="objCtrl.obj.orderItems" ng-options="x.totalPrice for x in names"></select></td>
                    </tr>
                    <tr>
                        <td>Product Discount</td><td><select ng-model="objCtrl.obj.orderItems" ng-options="x.discountPrice for x in names"></select></td>
                    </tr>
                    <tr>
                        <td>Net Price</td><td><select ng-model="objCtrl.obj.orderItems" ng-options="x.netPrice for x in names"></select></td>
                    </tr>
                     <tr>
                        <td>Delivery Zone </td><td><select ng-model="objCtrl.obj.orderItems" ng-options="x.delivaryZone for x in names"></select></td>
                    </tr>
                    <tr>
                        <td>Delivery Address:</td><td><select ng-model="objCtrl.obj.orderItems" ng-options="x.address for x in names"></select></td>
                    </tr>
                    
                    
                    
                    
                    
		    <tr>
                        <td>payment Type: </td> <td> <input type="text" name="paymentType" ng-model="objCtrl.obj.paymentType" required/> 
                            <span ng-show="objForm.paymentType.$error.required" class="msg-val">Quantity is required.</span> </td>
                    </tr>
                    <tr>
                        <td>Payment Status: </td> <td><input type="text" name="paymentStatus" ng-model="objCtrl.obj.paymentStatus" required/> 
                            <span ng-show="objForm.paymentStatus.$error.required" class="msg-val">Product Name Code is required.</span> </td>
                    </tr>
		    <tr>
                        <td>Payment Date: </td> <td> <input type="date" name="paymentDate" ng-model="objCtrl.obj.paymentDate" required/> 
                            <span ng-show="objForm.paymentDate.$error.required" class="msg-val">sell Price is required.</span> </td>
                    </tr>

                    <tr>
                        <td>discount </td> <td><input type="text" name="discount" ng-model="objCtrl.obj.discount" required/> 
                            <span ng-show="objForm.discount.$error.required" class="msg-val">Manufacture Name is required.</span> </td>
                    </tr>
                    <tr>
                        <td>Delivery Charge: </td> <td> <input type="text" name="delivaryCharge" ng-model="objCtrl.obj.delivaryCharge" required/> 
                            <span ng-show="objForm.delivaryCharge.$error.required" class="msg-val">Quantity is required.</span> </td>
                    </tr>
                    
                    <tr>
                        <td>Total Payment </td><td><select ng-model="objCtrl.obj.payment" ng-options="x.totalPayment for x in namess"></select></td>
                    </tr>
                    
<!--                    		    <tr>
                        <td>Total Payment </td> <td> <input type="text" name="totalPayment" ng-model="objCtrl.obj.totalPayment" required/> 
                            <span ng-show="objForm.totalPayment.$error.required" class="msg-val">sell Price is required.</span> </td>
                    </tr>-->
		    
                    <tr>
                        <td colspan="2"> <span ng-if="objCtrl.flag == 'created'" class="msg-success">payment successfully added.</span>
                            <span ng-if="objCtrl.flag == 'failed'" class="msg-val">payment already exists.</span> </td>
                    </tr>
                    <tr><td colspan="2">
                            <div ng-if="objCtrl.flag != 'edit'">
                                <input  type="submit" ng-click="objCtrl.addObject()" value="Add payment"/> 
                                <input type="button" ng-click="objCtrl.reset()" value="Reset"/>
                            </div>
                            <div ng-if="objCtrl.flag == 'edit'">
                                <input  type="submit" ng-click="objCtrl.updateObjectDetail()" value="Update payment"/> 	
                                <input type="button" ng-click="objCtrl.cancelUpdate()" value="Cancel"/>				   
                            </div> </td>
                    </tr>
                    <tr>
                        <td colspan="2"> <span ng-if="objCtrl.flag == 'deleted'" class="msg-success">payment successfully deleted.</span>
                    </tr>
                </table> 
		    </center>
            </form>
	    <center>
            <table>
		
                <tr><th>Payment ID </th>
		    <th>Customer Name</th>
		    <th>Customer Email</th>
		    <th>Phone</th>
		    <th>Gender</th>
		    <th>Product Price</th>
		    <th>Quantity</th>
		    <th>Total Product Price</th>
		    <th>Product Discount</th>
		    <th>Net Product Price</th>
		    <th>payment Type</th>
                    <th>Payment Status</th> 
                    <th>Payment Date</th>
		    <th>Pay Type discount</th>
                    <th>Total Payment </th>
                    <th colspan="2">Action </th>
                    
                    
		</tr>
                <tr ng-repeat="row in objCtrl.objArray">
                    <td><span ng-bind="row.paymentId"></span></td>
                    <td><span ng-bind="row.customer.customerUserName"></span></td>
                    <td><span ng-bind="row.customer.email"></span></td>
                    <td><span ng-bind="row.customer.phoneNumber"></span></td>
                    <td><span ng-bind="row.customer.customerGender"></span></td>
                    <td><span ng-bind="row.orderItems.price"></span></td>
                    <td><span ng-bind="row.orderItems.quantity"></span></td>
                    <td><span ng-bind="row.orderItems.totalPrice"></span></td>
                    <td><span ng-bind="row.orderItems.discountPrice"></span></td>
                    <td><span ng-bind="row.orderItems.netPrice"></span></td>
                    <td><span ng-bind="row.paymentType"></span></td>
                    <td><span ng-bind="row.paymentStatus"></span></td>
                    <td><span ng-bind="row.paymentDate"></span></td>
                    <td><span ng-bind="row.discount"></span></td>
                    <td><span ng-bind="row.totalPayment"></span></td> 
                    <td>
                        <input type="button" ng-click="objCtrl.deleteObject(row.paymentId)" value="Delete"/>
                        <input type="button" ng-click="objCtrl.editObject(row.paymentId)" value="Edit"/>
                        <span ng-if="objCtrl.flag == 'updated' && row.paymentId == objCtrl.updatedId" class="msg-success">payment successfully updated.</span> </td> 
                </tr>	
<!--                <tr ng-repeat="row in objCtrl.objArray2">
                    <td><span ng-bind="row.tspName"></span></td>
                    
                </tr>-->
            </table>
	    </center>
        </div>
        <script src="${pageContext.request.contextPath}/static/js/lib/angular.min.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/lib/angular-resource.min.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/app.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/controller/payment_controller.js"></script>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css"/>
    </body>
</html> 