<%-- 
    Document   : home
    Created on : Jun 3, 2023, 5:24:01 PM
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
             
            <!-- displaying items -->
                <div class="col-10 items-list">
                    <h3 class="text-center">Product</h3>
                    <div class="row g-2 item_row">
                        <c:forEach items="${productList}" var="p">
                            <div class="col-12 col-sm-2 col-md-4 col-lg-3 ">
                                <div class="card">
                                   <img class="img-fluid card-img-top" src="${p.image}" alt="productImage">
                                   <div class="card-body">
                                    <a href="productDetails?productId=${p.id}"><p class="card-title">${p.name}</p></a>                                   
                                    <p class="card-text">${p.price} VND</p>
                                   <a href="#" class="btn btn-danger">Buy now</a>
                                   <a href="#" class="btn btn-primary">Add to cart</a>
                                   </div>
                                </div>
                               </div> 
                        </c:forEach>
                    </div>
                </div>
            <!-- displaying items -->
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
