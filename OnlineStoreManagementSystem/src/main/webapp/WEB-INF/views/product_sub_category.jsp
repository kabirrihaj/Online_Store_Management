<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en-US">
    <head>
        <meta charset="UTF-8" /> 
        <title> Sub Category </title>
    </head>
    <body ng-app="myApp">
        <div ng-controller="ProductSubCategoryController as objCtrl">
	    <center> <h1> Sub Category Info </h1></center>
            <form name="objForm" method="POST">
		<center>
                <table>
                    <tr><td colspan="2">
                            <div ng-if="objCtrl.flag != 'edit'">
                                <h3> Add New Sub Category </h3> 
                            </div>
                            <div ng-if="objCtrl.flag == 'edit'">
                                <h3> Update Sub Category for ID: {{ objCtrl.obj.subCategoryId}} </h3> 
                            </div> </td>
                    </tr>
                    <tr>
                        <td>Category Name:</td>
			<td><select ng-model="objCtrl.obj.proCategory" name="description" ng-options="x.categoryName for x in names"></select>
			<span ng-show="objForm.categoryName.$error.required" class="msg-val">*</span> </td>
                    </tr>
                    <tr>
                        <td>Category Description:</td>
			<td><select ng-model="objCtrl.obj.proCategory" ng-options="x.description for x in names"></select></td>
                    </tr>
                  
                    <tr>
                        <td>Sub Category Name: </td> <td><input type="text" name="subCategoryName" ng-model="objCtrl.obj.subCategoryName" required/> 
                            <span ng-show="objForm.subCategoryName.$error.required" class="msg-val">Sub Category Name is required.</span> </td>
                    </tr>
                    <tr>
                        <td>Sub Category Description: </td> <td> <input type="text" name="description" ng-model="objCtrl.obj.description" required/> 
                            <span ng-show="objForm.description.$error.required" class="msg-val">Description is required.</span> </td>
                    </tr>



                    <tr>
                        <td colspan="2"> <span ng-if="objCtrl.flag == 'created'" class="msg-success">                      sub Category successfully added.</span>
                            <span ng-if="objCtrl.flag == 'failed'" class="msg-val">Sub Category already exists.</span> </td>
                    </tr>
                    <tr><td colspan="2">
                            <div ng-if="objCtrl.flag != 'edit'">
                                <input  type="submit" ng-click="objCtrl.addObject()" value="Add Sub Category"/> 
                                <input type="button" ng-click="objCtrl.reset()" value="Reset"/>
                            </div>
                            <div ng-if="objCtrl.flag == 'edit'">
                                <input  type="submit" ng-click="objCtrl.updateObjectDetail()" value="Update Sub Category"/> 	
                                <input type="button" ng-click="objCtrl.cancelUpdate()" value="Cancel"/>				   
                            </div> </td>
                    </tr>
                    <tr>
                        <td colspan="2"> <span ng-if="objCtrl.flag == 'deleted'" class="msg-success">Sub Category successfully deleted.</span>
                    </tr>
                </table>    
		</center>
            </form>
	    
	    
	    <center>
		<table class="table-responsive">
                <tr><th>ID </th> 
                    <th>category Name</th>
		    <th>Category Description</th>
                    <th>Sub Category name</th> 
                    <th>Sub Category Description</th>
                </tr>
                <tr ng-repeat="row in objCtrl.objArray">
                    <td><span ng-bind="row.subCategoryId"></span></td>
                    <td><span ng-bind="row.proCategory.categoryName"></span></td>
                    <td><span ng-bind="row.proCategory.description"></span></td>
                    <td><span ng-bind="row.subCategoryName"></span></td>
                    <td><span ng-bind="row.description"></span></td>
<!--                    <td><span ng-bind="row.facultyPhone"></span></td>-->
                    <td>
                        <input type="button" ng-click="objCtrl.deleteObject(row.subCategoryId)" value="Delete"/>
                        <input type="button" ng-click="objCtrl.editObject(row.subCategoryId)" value="Edit"/>
                        <span ng-if="objCtrl.flag == 'updated' && row.subCategoryId == objCtrl.updatedId" class="msg-success">product sub category successfully updated.</span> </td> 
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
        <script src="${pageContext.request.contextPath}/static/js/controller/sub_category_controller.js"></script>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css"/>
    </body>
</html> 