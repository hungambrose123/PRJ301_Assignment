<%-- 
    Document   : editProduct
    Created on : Jul 11, 2023, 8:34:21 PM
    Author     : Warspite
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Product edit</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    </head>
    <body>
        <div>
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="edit" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Edit product</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>ID</label>
                                <input type="text" value="${id}" name="id" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Name</label>
                                <input type="text" value="${name}" name="name" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                <input type="text" value="${image}" name="image" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input type="text" value="${price}" name="price" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <textarea class="form-control" name="description" required>${description}</textarea>
                            </div>   
                            <div class="form-group">
                                    <label>Category</label>
                                    <select name="category" class="form-select" aria-label="Default select example">
                                        <c:forEach items="${productCategory}" var="o">
                                            <option value="${o.id}">${o.name}</option>
                                        </c:forEach>
                                    </select>
                            </div>                            
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" href="redirectToManage" value="Cancel">
                            <input type="submit" class="btn btn-info" value="Save">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
