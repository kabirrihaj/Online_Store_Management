<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-US">
    <head>
        <meta charset="UTF-8" /> 
        <title>Online Store Management + Customer Details</title>
    </head>
    <body ng-app="myApp">
        <div ng-controller="CustomerController as objCtrl">
           
            <form name="objForm" method="POST">
                <fieldset>
                    <legend>Customer Information </legend>
		    <center>
                <table>
                    
                    <tr><td colspan="2">
                            <div ng-if="objCtrl.flag != 'edit'">
                                <h3> Add New Customer </h3> 
                            </div>
                            <div ng-if="objCtrl.flag == 'edit'">
                                <h3> Update Customer for ID: {{ objCtrl.obj.customerId}} </h3> 
                            </div> </td>
                    </tr>
                    
                    <tr>
                        <td>Customer First Name :</td> <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span> <td> <input type="text" name="customerFname" ng-model="objCtrl.obj.customerFname" required/> 
                            <span ng-show="objForm.customerFname.$error.required" class="msg-val">First Name is required.</span> </td>
                    </tr>
		    
                    <tr>
                        <td>Customer Last Name :</td> <td> <input type="text" name="customerLname" ng-model="objCtrl.obj.customerLname" required/> 
                            <span ng-show="objForm.customerLname.$error.required" class="msg-val">Last Name is required.</span> </td>
                    </tr>
		    <tr>
                        <td>Customer Name :</td> <td><input type="text" name="customerUserName" ng-model="objCtrl.obj.customerUserName" required/> 
                            <span ng-show="objForm.customerUserName.$error.required" class="msg-val">Customer Name is required.</span> </td>
                    </tr>
		    <tr>
                        <td>Email :</td> <td> <input type="text" name="email" ng-model="objCtrl.obj.email" required/> 
                            <span ng-show="objForm.email.$error.required" class="msg-val">Email is required.</span> </td>
                    </tr>
                    <tr>
                        <td>Password :</td> <td> <input type="text" name="password" ng-model="objCtrl.obj.password" required/> 
                            <span ng-show="objForm.password.$error.required" class="msg-val">Password is required.</span> </td>
                    </tr>
                    <tr>
                        <td>Gender :</td> <td> <input type="text" name="customerGender" ng-model="objCtrl.obj.customerGender" required/> 
                            <span ng-show="objForm.customerGender.$error.required" class="msg-val">Gender is required.</span> </td>
                    </tr>
                    <tr>
                        <td>Date Of Birth :</td> <td> <input type="text" name="dateOfBirth" ng-model="objCtrl.obj.dateOfBirth" required/> 
                            <span ng-show="objForm.dateOfBirth.$error.required" class="msg-val">Date Of Birth is required.</span> </td>
                    </tr>
                    
                    <tr>
                        <td>Present Address :</td> <td> <input type="text" name="address1" ng-model="objCtrl.obj.address1" required/> 
                            <span ng-show="objForm.address1.$error.required" class="msg-val">Present Address is required.</span> </td>
                    </tr>
                    <tr>
                        <td>Permanent Address :</td> <td> <input type="text" name="address2" ng-model="objCtrl.obj.address2" required/> 
                            <span ng-show="objForm.address2.$error.required" class="msg-val">Parmenent Address is required.</span> </td>
                    </tr>
                    <tr>
                        <td>State :</td> <td> <input type="text" name="state" ng-model="objCtrl.obj.state" required/> 
                            <span ng-show="objForm.state.$error.required" class="msg-val">State is required.</span> </td>
                    </tr>
                    <tr>
                        <td>City :</td> <td> <input type="text" name="city" ng-model="objCtrl.obj.city" required/> 
                            <span ng-show="objForm.city.$error.required" class="msg-val">City is required.</span> </td>
                    </tr>

                    <tr>
                        <td>Zip Code :</td> <td> <input type="text" name="zip" ng-model="objCtrl.obj.zip" required/> 
                            <span ng-show="objForm.zip.$error.required" class="msg-val">Zip Code is required.</span> </td>
                    </tr>
                    <tr>
                        <td>Phone Number :</td> <td> <input type="text" name="phoneNumber" ng-model="objCtrl.obj.phoneNumber" required/> 
                            <span ng-show="objForm.phoneNumber.$error.required" class="msg-val">Phone Number is required.</span> </td>
                    </tr>
                    
                    <tr>
                        <td>User Photo :</td> <td> <input type="text" name="customerImage" ng-model="objCtrl.obj.customerImage" required/> 
                            <span ng-show="objForm.customerImage.$error.required" class="msg-val">Customer Photo is required.</span> </td>
                    </tr>
                    <tr>
                        <td colspan="2"> <span ng-if="objCtrl.flag == 'created'" class="msg-success">Customer Registration successfully added.</span>
                            <span ng-if="objCtrl.flag == 'failed'" class="msg-val">User already exists.</span> </td>
                    </tr>
		    
		    
                    <tr><td colspan="2">
                            <div ng-if="objCtrl.flag != 'edit'">
                                <input  type="submit" ng-click="objCtrl.addObject()" value="Add Customer"/> 
                                <input type="button" ng-click="objCtrl.reset()" value="Reset"/>
                            </div>
                            <div ng-if="objCtrl.flag == 'edit'">
                                <input  type="submit" ng-click="objCtrl.updateObjectDetail()" value="Update Customer"/> 	
                                <input type="button" ng-click="objCtrl.cancelUpdate()" value="Cancel"/>				   
                            </div> </td>
                    </tr>
                    <tr>
                        <td colspan="2"> <span ng-if="objCtrl.flag == 'deleted'" class="msg-success">Customer successfully deleted.</span>
                    </tr>
                </table> 
			</center>
                </fieldset>
            </form>
            <table class="table">
		                <tr><th>ID </th>	    
				    <th>First Name</th> 
				    <th>Last Name </th>
				    <th>Customer Name</th>
				    <th>Email</th>
				    <th>Password</th>
				    <th>Gender</th> 
				    <th>Date of Birth</th>
				    <th>Present Address</th>
				    <th>Permanent Address</th>
				    <th>State</th>
				    <th>City</th>
				    <th>Zip Code</th>
				    <th>Phone Number</th>
				    <th>Photo</th>
				    <th>Action</th>
				</tr>
                <tr ng-repeat="row in objCtrl.objArray">
                    <td><span ng-bind="row.customerId"></span></td>
                    <td><span ng-bind="row.customerFname"></span></td>
                    <td><span ng-bind="row.customerLname"></span></td>
		    <td><span ng-bind="row.customerUserName"></span></td>
		    <td><span ng-bind="row.email"></span></td>
                    <td><span ng-bind="row.password"></span></td>
                    <td><span ng-bind="row.customerGender"></span></td>
                    <td><span ng-bind="row.dateOfBirth"></span></td>
                    <td><span ng-bind="row.address1"></span></td>
                    <td><span ng-bind="row.address2"></span></td>
                    <td><span ng-bind="row.state"></span></td>
                    <td><span ng-bind="row.city"></span></td>
                    <td><span ng-bind="row.zip"></span></td>
                    <td><span ng-bind="row.phoneNumber"></span></td>
                    <td><span ng-bind="row.customerImage"></span></td>
		    <td> <input type="button" ng-click="objCtrl.deleteObject(row.customerId)" value="Delete"/>
		    <input type="button" ng-click="objCtrl.editObject(row.customerId)" value="Edit"/>
		    <span ng-if="objCtrl.flag == 'updated' && row.customerId == objCtrl.updatedId" class="msg-success">Customer successfully updated.</span> </td> 
                </tr>	
            </table>
        </div>
        <script src="${pageContext.request.contextPath}/static/js/lib/angular.min.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/lib/angular-resource.min.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/app.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/controller/customer_controller.js"></script>
<!--        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css"/>
	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bootstrap.css"/>
	  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/app.css"/>-->
    </body>
</html>
