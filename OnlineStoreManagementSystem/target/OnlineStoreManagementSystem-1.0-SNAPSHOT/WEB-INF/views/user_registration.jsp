<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-US">
    <head>
        <meta charset="UTF-8" /> 
        <title>Users Information</title>
    </head>
    <body ng-app="myApp">
        <div ng-controller="UserRegistrationController as objCtrl">
            <h1> User Information </h1>
            <form name="objForm" method="POST">
                <table>
                    <tr><td colspan="2">
                            <div ng-if="objCtrl.flag != 'edit'">
                                <h3> Add New User </h3> 
                            </div>
                            <div ng-if="objCtrl.flag == 'edit'">
                                <h3> Update User for ID: {{ objCtrl.obj.userId}} </h3> 
                            </div> </td>
                    </tr>
                    
                    <tr>
                        <td>User First Name :</td> <td> <input type="text" name="userFname" ng-model="objCtrl.obj.userFname" required/> 
                            <span ng-show="objForm.userFname.$error.required" class="msg-val">*</span> </td>
                    </tr>
                    <tr>
                        <td>User Last Name :</td> <td> <input type="text" name="userLname" ng-model="objCtrl.obj.userLname" required/> 
                            <span ng-show="objForm.userLname.$error.required" class="msg-val">*</span> </td>
                    </tr>
		    <tr>
                        <td>User Name :</td> <td><input type="text" name="userName" ng-model="objCtrl.obj.userName" required/> 
                            <span ng-show="objForm.userName.$error.required" class="msg-val">*</span> </td>
                    </tr>
		    <tr>
                        <td>Email :</td> <td> <input type="email" placeholder="test@example.com" name="email" ng-model="objCtrl.obj.email" required/> 
                            <span ng-show="objForm.email.$error.required" class="msg-val">*</span> </td>
                    </tr>
                    <tr>
                        <td>Password :</td> <td> <input type="password" name="password" ng-model="objCtrl.obj.password" required/> 
                            <span ng-show="objForm.password.$error.required" class="msg-val">*</span> </td>
                    </tr>
 
                    
                    <tr>
                        <td>Date Of Birth :</td> <td> <input type="date" name="dateOfBirth" ng-model="objCtrl.obj.dateOfBirth" required/> 
                            <span ng-show="objForm.dateOfBirth.$error.required" class="msg-val">*</span> </td>
                    </tr>
                    <tr>
                        <td>Gender :</td> 
                        <td> <input type="radio" value="Male" name="userGender" ng-model="objCtrl.obj.userGender" required/>Male
                       <input type="radio" value="Female" name="userGender" ng-model="objCtrl.obj.userGender" required/>Female
                       <input type="radio" value="Other" name="userGender" ng-model="objCtrl.obj.userGender" required/>Other 
                          <span ng-show="objForm.userGender.$error.required" class="msg-val">*</span> </td>
                    </tr>
                    <tr>
                         <td>Present Address :</td>
                        <td><textarea rows="3" cols="16" name="address1" ng-model="objCtrl.obj.address1" required>
</textarea><span ng-show="objForm.address1.$error.required" class="msg-val">*</span> </td>
                        
<!--                        <td>Present Address :</td> <td> <input type="text" name="address1" ng-model="objCtrl.obj.address1" required/> 
                            <span ng-show="objForm.address1.$error.required" class="msg-val">Present Address is required.</span> </td>-->
                    </tr>
                    <tr>
                       <td>Permanent Address :</td>
                        <td><textarea rows="3" cols="16" name="address2" ng-model="objCtrl.obj.address2" required>
</textarea><span ng-show="objForm.address2.$error.required" class="msg-val">*</span> </td> 
                        
                        
<!--                        <td>Permanent Address :</td> <td> <input type="text" name="address2" ng-model="objCtrl.obj.address2" required/> 
                            <span ng-show="objForm.address2.$error.required" class="msg-val">Permanent Address is required.</span> </td>-->
                    </tr>
                    <tr>
                        <td>State :</td> <td> <input type="text" name="state" ng-model="objCtrl.obj.state" required/> 
                            <span ng-show="objForm.state.$error.required" class="msg-val">*</span> </td>
                    </tr>
                    <tr>
                        <td>City :</td> <td> <input type="text" name="city" ng-model="objCtrl.obj.city" required/> 
                            <span ng-show="objForm.city.$error.required" class="msg-val">*</span> </td>
                    </tr>

                    <tr>
                        <td>Zip Code :</td> <td> <input type="text" name="zip" ng-model="objCtrl.obj.zip" required/> 
                            <span ng-show="objForm.zip.$error.required" class="msg-val">*</span> </td>
                    </tr>
                    <tr>
                        <td>Phone Number :</td> <td> <input type="text" placeholder="+8801........7" name="phoneNumber" ng-model="objCtrl.obj.phoneNumber" required/> 
                            <span ng-show="objForm.phoneNumber.$error.required" class="msg-val">*</span> </td>
                    </tr>
                    <tr>
                        <td>Create Date :</td> <td> <input type="date" name="createDate" ng-model="objCtrl.obj.createDate" required/> 
                            <span ng-show="objForm.createDate.$error.required" class="msg-val">*</span> </td>
                    </tr>
                    <tr>
                        <td>User Photo :</td> <td> <input type="text" name="userImage" ng-model="objCtrl.obj.userImage" required/> 
                            <span ng-show="objForm.userImage.$error.required" class="msg-val">User Photo is required.</span> </td>
                    </tr>
                    <tr>
                        <td colspan="2"> <span ng-if="objCtrl.flag == 'created'" class="msg-success">User Registration successfully added.</span>
                            <span ng-if="objCtrl.flag == 'failed'" class="msg-val">User already exists.</span> </td>
                    </tr>


                    <tr><td colspan="2">
                            <div ng-if="objCtrl.flag != 'edit'">
                                <input  type="submit" ng-click="objCtrl.addObject()" value="Add User"/> 
                                <input type="button" ng-click="objCtrl.reset()" value="Reset"/>
                            </div>
                            <div ng-if="objCtrl.flag == 'edit'">
                                <input  type="submit" ng-click="objCtrl.updateObjectDetail()" value="Update User"/> 	
                                <input type="button" ng-click="objCtrl.cancelUpdate()" value="Cancel"/>				   
                            </div> </td>
                    </tr>
                    <tr>
                        <td colspan="2"> <span ng-if="objCtrl.flag == 'deleted'" class="msg-success">User successfully deleted.</span>
                    </tr>
                </table>     
            </form>
            <table class="table">
		<tr><th>ID </th>
		  
		    <th>First Name</th>
		    <th>Last Name </th>
		      <th>User Name</th>
		    <th>Gender</th>
		    <th>Date of Birth</th>
		    <th>Email</th>
		    <th>Password</th>
		    <th>Present Address</th>
		    <th>Permanent Address</th>
		    <th>State</th>
		    <th>City</th>
		    <th>Zip Code</th>
		    <th>Phone Number</th>
		    <th>Create Date</th>
		    <th>User Photo</th>
		    <th>Action</th>
		</tr>
                <tr class="fa-info" ng-repeat="row in objCtrl.objArray">
                    <td><span ng-bind="row.userId"></span></td>                   
                    <td><span ng-bind="row.userFname"></span></td>
                    <td><span ng-bind="row.userLname"></span></td>
		     <td><span ng-bind="row.userName"></span></td>
                    <td><span ng-bind="row.userGender"></span></td>
                    <td><span ng-bind="row.dateOfBirth"></span></td>
                    <td><span ng-bind="row.email"></span></td>
                    <td><span ng-bind="row.password"></span></td>
                    <td><span ng-bind="row.address1"></span></td>
                    <td><span ng-bind="row.address2"></span></td>
                    <td><span ng-bind="row.state"></span></td>
                    <td><span ng-bind="row.city"></span></td>
                    <td><span ng-bind="row.zip"></span></td>
                    <td><span ng-bind="row.phoneNumber"></span></td>
                    <td><span ng-bind="row.createDate"></span></td>
                    <td><span ng-bind="row.userImage"></span></td>

		    <td colspan="2"> <input type="button" class="btn-danger" ng-click="objCtrl.deleteObject(row.userId)" value="Delete"/>
			<input type="button"  class="btn-danger" ng-click="objCtrl.editObject(row.userId)" value="Edit"/>
			<span ng-if="objCtrl.flag == 'updated' && row.userId == objCtrl.updatedId" class="msg-success">User successfully updated.</span> </td> 
                </tr>	
            </table>
        </div>
        <script src="${pageContext.request.contextPath}/static/js/lib/angular.min.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/lib/angular-resource.min.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/app.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/controller/users_registration_controller.js"></script>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css"/>
    </body>
</html>
