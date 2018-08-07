<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en-US">
    <head>
        <meta charset="UTF-8" /> 
        <title> Order Items </title>
    </head>
    <body ng-app="myApp">
        <div ng-controller="OrderItemsController as objCtrl">
	    <center>  <h1> Order Items Info </h1></center>
            <form name="objForm" method="POST">
		<center>
		    <table>
			<tr><td colspan="2">
				<div ng-if="objCtrl.flag != 'edit'">
				    <h3> Add New Order Items </h3> 
				</div>
				<div ng-if="objCtrl.flag == 'edit'">
				    <h3> Update Order Items for ID: {{ objCtrl.obj.orderItemsId}} </h3> 
				</div> </td>
			</tr>
			<tr>
			    <td>order Status Name</td>
			    <td>
				<select ng-model="objCtrl.obj.orders" ng-options="x.orderStatus for x in name">
				</select>
			    </td>
			</tr>
			<tr>
			    <td>Customer  Name</td>
			    <td>
				<select ng-model="objCtrl.obj.customer" ng-options="x.customerUserName for x in names1">
				</select>
			    </td>
			</tr>
			<tr>
			    <td>product Name</td>
			    <td>
				<select ng-model="objCtrl.obj.product" ng-options="x.productName for x in names">
				</select>
			    </td>
			</tr>


			<tr>
			    <td>Price: </td> <td><select ng-model="objCtrl.obj.product" ng-options="x.productSelPrice for x in names">
				</select></td>
			</tr>
			<tr>
			    <td>Quantity: </td> <td><input type="test" name="quantity" ng-model="objCtrl.obj.quantity" required/> 
				<span ng-show="objForm.quantity.$error.required" class="msg-val">Order Update Date is required.</span> </td>
			</tr>

			<!--                    <tr>
						<td>total Price: </td> <td> <input type="text" name="totalPrice" ng-model="objCtrl.obj.totalPrice" required/> 
						    <span ng-show="objForm.totalPrice.$error.required" class="msg-val">Order Sub is required.</span> </td>
					    </tr>-->
			<tr>
			    <td>discount Price: </td> <td> <input type="text" name="discountPrice" ng-model="objCtrl.obj.discountPrice" required/> 
				<span ng-show="objForm.discountPrice.$error.required" class="msg-val">Order Status is required.</span> </td>
			</tr>
			<!--                    <tr>
						<td>net Price: </td> <td> <input type="text" name="netPrice" ng-model="objCtrl.obj.netPrice" required/> 
						    <span ng-show="objForm.netPrice.$error.required" class="msg-val">Order Sub is required.</span> </td>
					    </tr>-->
			<tr>
			    <td>delivery Zone: </td> <td> <input type="text" name="delivaryZone" ng-model="objCtrl.obj.delivaryZone" required/> 
				<span ng-show="objForm.delivaryZone.$error.required" class="msg-val">Order Sub is required.</span> </td>
			</tr>
			<tr>
			    <td>address: </td> <td> <input type="text" name="address" ng-model="objCtrl.obj.address" required/> 
				<span ng-show="objForm.address.$error.required" class="msg-val">Order Sub is required.</span> </td>
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
		</center>
            </form>
	    <center>
		<table>
		    <tr><th>ID </th> 
			<th>Customer Name</th> 
			<th>Product Name</th> 
			<th>Order Status</th> 
			<th>Price</th>
			<th>Quantity</th>
			<th>total Price</th>
			<th>discount Price</th>
			<th>net Price</th>
			<th>delivery Zone</th>
			<th>address</th>
		    </tr>
		    <tr ng-repeat="row in objCtrl.objArray">
			<td><span ng-bind="row.orderItemsId"></span></td>
			<td><span ng-bind="row.customer.customerUserName"></span></td>
			<td><span ng-bind="row.product.productName"></span></td>
			<td><span ng-bind="row.orders.orderStatus"></span></td>
			<td><span ng-bind="row.price"></span></td>
			<td><span ng-bind="row.quantity"></span></td>
			<td><span ng-bind="row.totalPrice"></span></td>
			<td><span ng-bind="row.discountPrice"></span></td>
			<td><span ng-bind="row.netPrice"></span></td>
			<td><span ng-bind="row.delivaryZone"></span></td>
			<td><span ng-bind="row.address"></span></td>

			<td>
			    <input type="button" ng-click="objCtrl.deleteObject(row.orderItemsId)" value="Delete"/>
			    <input type="button" ng-click="objCtrl.editObject(row.orderItemsId)" value="Edit"/>
			    <span ng-if="objCtrl.flag == 'updated' && row.orderItemsId == objCtrl.updatedId" class="msg-success">Order successfully updated.</span> </td> 
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
        <script src="${pageContext.request.contextPath}/static/js/controller/order_items_controller.js"></script>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css"/>
    </body>
</html> 