<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en-US">
    <head>
        <meta charset="UTF-8" /> 
        <title> Spring MVC 4 REST + AngularJS </title>
    </head>
    <body ng-app="myApp">
        <div ng-controller="ProductCategoryController as objCtrl">
	    <center> <h1> Product Category Info </h1></center>
            <form name="objForm" method="POST">
		<center>
                <table>
                    <tr><td colspan="2">
                            <div ng-if="objCtrl.flag != 'edit'">
                                <h3> Add New Product Category </h3> 
                            </div>
                            <div ng-if="objCtrl.flag == 'edit'">
                                <h3> Update Product Category for ID: {{ objCtrl.obj.categoryId}} </h3> 
                            </div> </td>
                    </tr>
                    <tr>
                        <td>Category Name : </td> <td><input type="text" name="categoryName" ng-model="objCtrl.obj.categoryName" required/> 
                            <span ng-show="objForm.categoryName.$error.required" class="msg-val">Category Name is required.</span> </td>
                    </tr>
                    <tr>
                        <td>Description :</td> <td> <input type="text" name="description" ng-model="objCtrl.obj.description" required/> 
                            <span ng-show="objForm.description.$error.required" class="msg-val">Description is required.</span> </td>
                    </tr>
                    
                    
                    
                    <tr>
                        <td colspan="2"> <span ng-if="objCtrl.flag == 'created'" class="msg-success">Category successfully added.</span>
                            <span ng-if="objCtrl.flag == 'failed'" class="msg-val">Category already exists.</span> </td>
                    </tr>
                    <tr><td colspan="2">
                            <div ng-if="objCtrl.flag != 'edit'">
                                <input  type="submit" ng-click="objCtrl.addObject()" value="Add Category"/> 
                                <input type="button" ng-click="objCtrl.reset()" value="Reset"/>
                            </div>
                            <div ng-if="objCtrl.flag == 'edit'">
                                <input  type="submit" ng-click="objCtrl.updateObjectDetail()" value="Update Category"/> 	
                                <input type="button" ng-click="objCtrl.cancelUpdate()" value="Cancel"/>				   
                            </div> </td>
                    </tr>
                    <tr>
                        <td colspan="2"> <span ng-if="objCtrl.flag == 'deleted'" class="msg-success">Category successfully deleted.</span>
                    </tr>
                </table>  
		</center>
            </form>
	    <center>
            <table>
                <tr><th>ID </th>
		    <th>Category Name</th> 
		    <th>Description</th>
		</tr>
                <tr ng-repeat="row in objCtrl.objArray">
                    <td><span ng-bind="row.categoryId"></span></td>
                    <td><span ng-bind="row.categoryName"></span></td>
                    <td><span ng-bind="row.description"></span></td>                   
                    <td>
                        <input type="button" ng-click="objCtrl.deleteObject(row.categoryId)" value="Delete"/>
                        <input type="button" ng-click="objCtrl.editObject(row.categoryId)" value="Edit"/>
                        <span ng-if="objCtrl.flag == 'updated' && row.categoryId == objCtrl.updatedId" class="msg-success">Category successfully updated.</span> </td> 
                </tr>	
            </table>
	    </center>
        </div>
        <script src="${pageContext.request.contextPath}/static/js/lib/angular.min.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/lib/angular-resource.min.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/app.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/controller/category_controller.js"></script>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css"/>
    </body>
</html> 