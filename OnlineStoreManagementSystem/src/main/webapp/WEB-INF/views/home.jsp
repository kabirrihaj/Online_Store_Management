<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="myApp">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="${pageContext.request.contextPath}/static/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/static/css/style.css" rel="stylesheet" type="text/css"/>
        <script src="${pageContext.request.contextPath}/static/js/lib/jquery-1.11.1.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/static/js/lib/angular.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/static/js/lib/bootstrap.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/static/js/lib/angular.min.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/lib/angular-resource.min.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/app.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/controller/users_registration_controller.js"></script>
        

        <style type="text/css">
            .header, .footer-area{
                border: 1px solid #DDD;
                padding: 20px;
                margin-top: 10px;
                box-shadow: 0px 0px 10px #DDD;
            }
            .content-area, .menu{
                margin-top: 10px;
            }
            .sidebar, .content{
                border: 1px solid #DDD;
                padding: 20px;
                box-shadow: 0px 0px 10px #DDD;
            }
            .gggg{border: 1px solid #029241;
            align-content: center;}
            .gg{
                color: red;
            }

        </style>
    </head>
    <body ng-app="myApp" ng-controller="UserRegistrationController as objCtrl">

        <div class="container-fluid">
            <div class="row">


                <div class="header col-md-12">
                    <h1><a href="">RestFul Web Service</a></h1>
                </div>

                <div class="menu col-md-12">
                    <div class="row">
                        <nav class="navbar navbar-default">
                            <div class="container-fluid">
                                <ul class="nav navbar-nav">
                                    <li class="active"><a href="index.jsp">Home</a></li>
                                    <li><a href="product.jsp">Product</a></li>
                                    <li><a href="aboutus.jsp">About Us</a></li>
                                    <li><a href="blog.jsp">Blog</a></li>
                                </ul>
                            </div>
                        </nav>
                    </div>
                </div>
                
                
                <div class="col-md-12 content-area">
                    <div class="row">
                    <div>
                
                        <form name="objForm" method="POST">
                            <table class="gggg">
                    <tr><td colspan="4">
                            <div ng-if="objCtrl.flag != 'edit'">
                                <h3> Add New User </h3> 
                            </div>
                            <div ng-if="objCtrl.flag == 'edit'">
                                <h3> Update User for ID: {{ objCtrl.obj.userId}} </h3> 
                            </div> </td>
                    </tr>
                    
                    <tr>
                        <td>User First Name :</td> 
                        <td> <input type="text" size="30px" name="userFname" ng-model="objCtrl.obj.userFname" required/> 
                            <span ng-show="objForm.userFname.$error.required" class="msg-val">*</span> </td>
                        
                        <td>User Last Name :</td> <td> <input type="text" name="userLname" ng-model="objCtrl.obj.userLname" required/> 
                            <span ng-show="objForm.userLname.$error.required" class="msg-val">*</span> </td>
                    </tr>
                  
		    <tr>
                        <td>User Name :</td> 
                        <td colspan="3"><input type="text" name="userName" ng-model="objCtrl.obj.userName" required/> 
                            <span ng-show="objForm.userName.$error.required" class="msg-val">*</span> </td>
                    </tr>
		    <tr>
                        <td>Email :</td> <td> <input type="email" placeholder="test@example.com" name="email" ng-model="objCtrl.obj.email" required/> 
                            <span ng-show="objForm.email.$error.required" class="msg-val">*</span> </td>
                        
                        <td>Password :</td> <td> <input type="password" name="password" ng-model="objCtrl.obj.password" required/> 
                            <span ng-show="objForm.password.$error.required" class="gg">*</span> </td>
                    </tr>
                   
                    
                    <tr>
                        <td>Date Of Birth :</td> <td> <input type="date" name="dateOfBirth" ng-model="objCtrl.obj.dateOfBirth" required/> 
                            <span ng-show="objForm.dateOfBirth.$error.required" class="msg-val">*</span> </td>
                        
                        <td>Gender :</td> 
                        <td> <input type="radio" value="Male" name="userGender" ng-model="objCtrl.obj.userGender" required/>Male
                       <input type="radio" value="Female" name="userGender" ng-model="objCtrl.obj.userGender" required/>Female
                       <input type="radio" value="Other" name="userGender" ng-model="objCtrl.obj.userGender" required/>Other 
                          <span ng-show="objForm.userGender.$error.required" class="msg-val">*</span> </td>
                    </tr>
                    
                    <tr>
                         <td>Present Address :</td>
                         <td colspan="2"><textarea rows="2" cols="60" name="address1" ng-model="objCtrl.obj.address1" required>
</textarea><span ng-show="objForm.address1.$error.required" class="msg-val">*</span> </td>
                        
<!--                        <td>Present Address :</td> <td> <input type="text" name="address1" ng-model="objCtrl.obj.address1" required/> 
                            <span ng-show="objForm.address1.$error.required" class="msg-val">Present Address is required.</span> </td>-->
                    </tr>
                    <tr>
                       <td>Permanent Address :</td>
                       <td colspan="3"><textarea rows="2" cols="60" name="address2" ng-model="objCtrl.obj.address2" required>
</textarea><span ng-show="objForm.address2.$error.required" class="msg-val">*</span> </td> 
                        
                        
<!--                        <td>Permanent Address :</td> <td> <input type="text" name="address2" ng-model="objCtrl.obj.address2" required/> 
                            <span ng-show="objForm.address2.$error.required" class="msg-val">Permanent Address is required.</span> </td>-->
                    </tr>
                    <tr>
<!--                        <td>State :</td>
                        <td class="input-group" id="state" ng-model="objCtrl.obj.state" required/>
        <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
    <select name="state" class="form-control selectpicker" >
      <option value="state" >Please select your state</option>
      <option>Alabama</option>
      <option>Alaska</option>
      <option >Arizona</option>
      <option >Arkansas</option>
      <option >California</option>
      <option >Colorado</option>
      <option >Connecticut</option>
      <option >Delaware</option>
      <option >District of Columbia</option>
      <option> Florida</option>
      <option >Georgia</option>
      <option >Hawaii</option>
      <option >daho</option>
      <option >Illinois</option>
      <option >Indiana</option>
      <option >Iowa</option>
      <option> Kansas</option>
      <option >Kentucky</option>
      <option >Louisiana</option>
      <option>Maine</option>
      <option >Maryland</option>
      <option> Mass</option>
      <option >Michigan</option>
      <option >Minnesota</option>
      <option>Mississippi</option>
      <option>Missouri</option>
      <option>Montana</option>
      <option>Nebraska</option>
      <option>Nevada</option>
      <option>New Hampshire</option>
      <option>New Jersey</option>
      <option>New Mexico</option>
      <option>New York</option>
      <option>North Carolina</option>
      <option>North Dakota</option>
      <option>Ohio</option>
      <option>Oklahoma</option>
      <option>Oregon</option>
      <option>Pennsylvania</option>
      <option>Rhode Island</option>
      <option>South Carolina</option>
      <option>South Dakota</option>
      <option>Tennessee</option>
      <option>Texas</option>
      <option> Uttah</option>
      <option>Vermont</option>
      <option>Virginia</option>
      <option >Washington</option>
      <option >West Virginia</option>
      <option>Wisconsin</option>
      <option >Wyoming</option>
    </select>
<span ng-show="objForm.state.$error.required" class="msg-val">*</span> 
                        
             </td>           -->
                        
                        
                        <td>State :</td> <td> <input type="text" name="state" ng-model="objCtrl.obj.state" required/> 
                            <span ng-show="objForm.state.$error.required" class="msg-val">*</span> </td>
                    
                        <td>City :</td> <td> <input type="text" name="city" ng-model="objCtrl.obj.city" required/> 
                            <span ng-show="objForm.city.$error.required" class="msg-val">*</span> </td>
                  
                        <td>Zip Code :</td> <td> <input type="text" name="zip" ng-model="objCtrl.obj.zip" required/> 
                            <span ng-show="objForm.zip.$error.required" class="msg-val">*</span> </td>
                    </tr>
                    <tr>
                        <td>Phone Number :</td> <td> <input type="text" placeholder="+8801........7" name="phoneNumber" ng-model="objCtrl.obj.phoneNumber" required/> 
                            <span ng-show="objForm.phoneNumber.$error.required" class="msg-val">*</span> </td>
                   
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
                        
                </div>
                </div>
                </div>

                <div class="col-md-12 content-area">
                    <div class="row">
<!--                        <div class="sidebar col-md-3">
                            <ul class="">
                                <li class="active"><a href="#">Home</a></li>
                                <li><a href="#">Page 1</a></li>
                                <li><a href="#">Page 2</a></li>
                                <li><a href="#">Page 3</a></li>
                            </ul>
                        </div>-->

                        <div>

<!--                            <button data-toggle="modal" data-target="#myModalSave" type="button" class="btn btn-success">Add New product</button>
                            <br/>
                            <br/>
                            <div class="alert alert-success alert-dismissable" ng-show="message">
                                <a href="#" class="close" ng-click="messageClose()">&times;</a>
                                <strong>Success!</strong> {{message}}
                            </div>-->
<!--<table>
    <tr><td colspan="2">
            <div ng-if="objCtrl.flag != 'edit'">
                <h3> Add New User </h3> 
            </div>
            <div ng-if="objCtrl.flag == 'edit'">
                <h3> Update User for ID: {{ objCtrl.obj.userId}} </h3> 
            </div> </td>
    </tr>

</table>-->

                            <table class="table table-striped table-bordered">
                                
                                
                                
                                <thead>
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
                                        <th colspan="2">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr ng-repeat="row in objCtrl.objArray">
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

                                        <td colspan="2"> <input type="button" ng-click="objCtrl.deleteObject(row.userId)" value="Delete"/>
                                            <input type="button" ng-click="objCtrl.editObject(row.userId)" value="Edit"/>
                                            <span ng-if="objCtrl.flag == 'updated' && row.userId == objCtrl.updatedId" class="msg-success">User successfully updated.</span> </td> 
                                    </tr>
                                </tbody>
                            </table>




<!--                             Save Modal 
                            <div id="myModalSave" class="modal fade" role="dialog">
                                <div class="modal-dialog">

                                     Modal content
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Insert Product</h4>
                                        </div>
                                        <div class="modal-body">

                                            <form>
                                                <div class="form-group">
                                                    <label for="pname">Product Name:</label>
                                                    <input ng-model="newProduct.pname" type="text" class="form-control" id="pname">
                                                </div>
                                                <div class="form-group">
                                                    <label for="price">Price:</label>
                                                    <input ng-model="newProduct.price" type="text" class="form-control" id="price">
                                                </div>
                                                <div class="form-group">
                                                    <label for="qty">Quantity: </label>
                                                    <input ng-model="newProduct.qty" type="text" class="form-control" id="qty">
                                                </div>

                                                <button ng-click="saveProduct()" data-dismiss="modal" type="submit" class="btn btn-success">Submit</button>
                                            </form>


                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                        </div>
                                    </div>

                                </div>
                            </div>-->



<!--                             Edit Modal 
                            <div id="myModalEdit" class="modal fade" role="dialog">
                                <div class="modal-dialog">

                                     Modal content
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Update Product</h4>
                                        </div>
                                        <div class="modal-body">

                                            <form>
                                                <div class="form-group">
                                                    <label for="pname">Product Name:</label>
                                                    <input ng-model="clickedProduct.pname" type="text" class="form-control" id="pname">
                                                </div>
                                                <div class="form-group">
                                                    <label for="price">Price:</label>
                                                    <input ng-model="clickedProduct.price" type="text" class="form-control" id="price">
                                                </div>
                                                <div class="form-group">
                                                    <label for="qty">Quantity: </label>
                                                    <input ng-model="clickedProduct.qty" type="text" class="form-control" id="qty">
                                                </div>

                                                <button ng-click="updateProduct()" data-dismiss="modal" type="submit" class="btn btn-success">Submit</button>
                                            </form>


                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                        </div>
                                    </div>

                                </div>
                            </div>-->




<!--                             Delete Modal 
                            <div id="myModalDelete" class="modal fade" role="dialog">
                                <div class="modal-dialog">

                                     Modal content
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Delete Product</h4>
                                        </div>
                                        <div class="modal-body">

                                            You are now delete {{clickedProduct.pname}}

                                        </div>
                                        <div class="modal-footer">
                                            <button ng-click="deleteProduct()" type="button" class="btn btn-success" data-dismiss="modal">Ok</button>
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                        </div>
                                    </div>

                                </div>
                            </div>-->



                        </div>
                    </div>
                </div>

                <div class="col-md-12 footer-area">
                    footer
                </div>





            </div>
        </div>

    </body>
</html>
