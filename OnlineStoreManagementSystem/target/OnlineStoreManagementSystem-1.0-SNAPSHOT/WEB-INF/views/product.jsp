<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-US">
    <head>
        <meta charset="UTF-8" /> 
        <title> Product </title>
    </head>
    <body ng-app="myApp">
        <div ng-controller="ProductController as objCtrl">
	    <center>
            <h1> Product Info </h1>
	    </center>
            <form name="objForm" method="POST">
		<center>
                <table>
                    <tr><td colspan="2">
                            <div ng-if="objCtrl.flag != 'edit'">
                                <h3> Add New Product </h3> 
                            </div>
                            <div ng-if="objCtrl.flag == 'edit'">
                                <h3> Update Product for ID: {{ objCtrl.obj.productId}} </h3> 
                            </div> </td>
                    </tr>
                    <tr>
                        <td>Category Name:</td>
			<td><select ng-model="objCtrl.obj.proCategory" ng-options="x.categoryName for x in names"></select>
			<span ng-show="objForm.categoryName.$error.required" class="msg-val">*</span> </td>
                    </tr>
                    <tr>
                        <td>Category Description:</td>
			<td><select ng-model="objCtrl.obj.proCategory" ng-options="x.description for x in names"></select>
			<span ng-show="objForm.description.$error.required" class="msg-val">*</span> </td>
                    </tr>
                    <tr>
                        <td>Sub Category Name:</td>
			<td><select ng-model="objCtrl.obj.proSubCategory" ng-options="x.subCategoryName for x in name"></select>
			<span ng-show="objForm.subCategoryName.$error.required" class="msg-val">*</span> </td>
                    </tr>
                    <tr>
                        <td>Sub Category Description:</td>
			<td><select ng-model="objCtrl.obj.proSubCategory" ng-options="x.description for x in name"></select>
			<span ng-show="objForm.description.$error.required" class="msg-val">*</span> </td>
                    </tr>
                    <tr>
                        <td>Product Name: </td> <td><input type="text" name="productName" ng-model="objCtrl.obj.productName" required/> 
                            <span ng-show="objForm.productName.$error.required" class="msg-val">Product Name is required.</span> </td>
                    </tr>
		    <tr>
                        <td>Product Description: </td> <td> <input type="text" name="description" ng-model="objCtrl.obj.description" required/> 
                            <span ng-show="objForm.description.$error.required" class="msg-val">Product Description is required.</span> </td>
                    </tr>
		    <tr>
                        <td>Featured: </td> <td> <input type="text" name="featured" ng-model="objCtrl.obj.featured" required/> 
                            <span ng-show="objForm.featured.$error.required" class="msg-val">Product Featured is required.</span> </td>
                    </tr>
                    <tr>
                        <td>Manufacture: </td> <td><input type="text" name="manufacture" ng-model="objCtrl.obj.manufacture" required/> 
                            <span ng-show="objForm.manufacture.$error.required" class="msg-val">Manufacture Name is required.</span> </td>
                    </tr>
                    <tr>
                        <td>Product Quantity: </td> <td> <input type="text" name="productQuantity" ng-model="objCtrl.obj.productQuantity" required/> 
                            <span ng-show="objForm.productQuantity.$error.required" class="msg-val">Quantity is required.</span> </td>
                    </tr>
                    <tr>
                        <td>Product Purchase Price: </td> <td> <input type="text" name="productPurPrice" ng-model="objCtrl.obj.productPurPrice" required/> 
                            <span ng-show="objForm.productPurPrice.$error.required" class="msg-val">Purchase Price is required.</span> </td>
                    </tr>
                    <tr>
                        <td>Product sell Price: </td> <td> <input type="text" name="productSelPrice" ng-model="objCtrl.obj.productSelPrice" required/> 
                            <span ng-show="objForm.productSelPrice.$error.required" class="msg-val">sell Price is required.</span> </td>
                    </tr>
                    
                    <tr>
                        <td>Product Image: </td> <td> <input type="text" name="productImage" ng-model="objCtrl.obj.productImage" required/> 
                            <span ng-show="objForm.productImage.$error.required" class="msg-val">*</span> </td>
                    </tr>
                    
                    <tr>
                        <td>Create Date: </td> <td> <input type="date" name="createDate" ng-model="objCtrl.obj.createDate" required/> 
                            <span ng-show="objForm.createDate.$error.required" class="msg-val">*</span> </td>
                    </tr>


                    <tr>
                        <td colspan="2"> <span ng-if="objCtrl.flag == 'created'" class="msg-success">Product successfully added.</span>
                            <span ng-if="objCtrl.flag == 'failed'" class="msg-val">Product already exists.</span> </td>
                    </tr>
                    <tr><td colspan="2">
                            <div ng-if="objCtrl.flag != 'edit'">
                                <input  type="submit" ng-click="objCtrl.addObject()" value="Add Product"/> 
                                <input type="button" ng-click="objCtrl.reset()" value="Reset"/>
                            </div>
                            <div ng-if="objCtrl.flag == 'edit'">
                                <input  type="submit" ng-click="objCtrl.updateObjectDetail()" value="Update Product"/> 	
                                <input type="button" ng-click="objCtrl.cancelUpdate()" value="Cancel"/>				   
                            </div> </td>
                    </tr>
                    <tr>
                        <td colspan="2"> <span ng-if="objCtrl.flag == 'deleted'" class="msg-success">Product successfully deleted.</span>
                    </tr>
                </table> 
		</center>
            </form>
	    <center>
            <table>
                <tr><th>ID </th> 
                    <th>Category Name</th> 
<!--                    <th>Category Description</th> -->
                    <th>Sub category Name</th> 
<!--                    <th>Sub category Description</th> -->
                    <th>Product Name</th>
                    <th>Product Description</th>
		    <th>Product Featured:</th>
		    <th>Manufacture</th>
                    <th>Product Quantity</th>                   
                    <th>Product Purchase Price</th>
                    <th>Product Sell Price</th>
		    <th>Create Date</th>
		    <th>Product Photo</th>
		</tr>
                <tr ng-repeat="row in objCtrl.objArray">
                    <td><span ng-bind="row.productId"></span></td>
                    <td><span ng-bind="row.proCategory.categoryName"></span></td>
                    <td><span ng-bind="row.proSubCategory.subCategoryName"></span></td>
                    <td><span ng-bind="row.productName"></span></td>
                    <td><span ng-bind="row.description"></span></td>
                    <td><span ng-bind="row.productQuantity"></span></td>
                    <td><span ng-bind="row.manufacture"></span></td>
                    <td><span ng-bind="row.productPurPrice"></span></td>
                    <td><span ng-bind="row.productSelPrice"></span></td>
                    <td><span ng-bind="row.featured"></span></td>
                    
                    <td><span ng-bind="row.createDate"></span></td>
		    <td><span ng-bind="row.productImage"></span></td>
                    <td>
                        <input type="button" ng-click="objCtrl.deleteObject(row.productId)" value="Delete"/>
                        <input type="button" ng-click="objCtrl.editObject(row.productId)" value="Edit"/>
                        <span ng-if="objCtrl.flag == 'updated' && row.productId == objCtrl.updatedId" class="msg-success">Product successfully updated.</span> </td> 
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
        <script src="${pageContext.request.contextPath}/static/js/controller/product_controller.js"></script>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css"/>
    </body>
</html> 