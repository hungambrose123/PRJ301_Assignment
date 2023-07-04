<%-- 
    Document   : productDetails
    Created on : Jul 4, 2023, 9:44:09 PM
    Author     : Warspite
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Văn phòng phẩm VH</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="css/styleindex.css">
    </head>
    <body>
        <!-- top bar -->
        <jsp:include page="websiteComponents/topBar.jsp"></jsp:include>
            <!-- top bar -->

            <!-- left bar and main content -->
            <div class="container-fluid content">
                <div class="row">
                    <!-- categories -->    
                <jsp:include page="websiteComponents/category.jsp"></jsp:include>
                    <!-- categories --> 

                    <!-- product details -->
                    <div class="col-10 items-list">
                        <div class="card mb-3">
                            <div class="row g-0">
                                <div class="col-md-4">
                                    <img src="${product.image}" class="img-fluid rounded-start" alt="productImage">
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body">
                                        <p class="card-title">Product details</p>
                                        <h5 class="card-title" style="color:red">${product.name}</h5>
                                        <p class="card-text">${product.description}</p>
                                        <p class="card-text">${product.price} VND</p>
                                        <a href="#" class="btn btn-danger">Buy now</a>
                                        <a href="#" class="btn btn-primary">Add to cart</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                </div>
                <!-- product details -->
            </div>
        </div>
        <!-- left bar and main content -->

        <!-- footer bottom -->
        <jsp:include page="websiteComponents/footer.jsp"></jsp:include>
            <!-- footer bottom -->

            <!-- bootstrap js and js -->
        <jsp:include page="websiteComponents/jsScripts.jsp"></jsp:include>
        <!-- bootstrap js and js -->
    </body>
</html>
