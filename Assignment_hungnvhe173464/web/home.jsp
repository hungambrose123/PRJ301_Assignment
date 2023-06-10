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
        <div class="container-fluid logo_searchMenu">
            <div class="row">
                <div class="col-4 img-fluid logo"><img src="https://img.freepik.com/free-vector/flat-design-stationery-store-logo-template_23-2149758692.jpg?w=2000" alt="logo"></div>
                <div class="col-4">

                    <div class="input-group mb-3">
                        <input type="text" class="form-control" placeholder="Tên sản phẩm" aria-label="Tên sản phẩm" aria-describedby="basic-addon2">
                        <div class="input-group-append">
                            <button class="btn btn-outline-secondary searchButton" type="button">Tìm kiếm</button>
                        </div>
                    </div>

                </div>
                <div class="col-4">
                    <% if(session.getAttribute("username") == null
                        || session.getAttribute("username") == "") { %>
                    <a href="login.jsp">Đăng nhập</a>
                    <a href="register.jsp">Đăng kí</a>
                    <% } else{%>
                    <p>Hello, ${sessionScope.username}</p>
                    <a href="logout">Đăng xuất</a>
                    <% } %>
                    <img src="data:image/jpeg;base64,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" alt="">
                </div>
            </div>
        </div>

        <div class="container-fluid content">
            <div class="row">
                <div class="col-3 categories">
                    <h3>Category</h3>
                    <ul>
                        <c:forEach items="${productCategory}" var="pc" >
                            <li><a href="#">${pc.name}</a></li>
                        </c:forEach>  
                    </ul>
                </div>
                <div class="col-9 items-list">
                    <h3>Product</h3>
                    <div class="row item_row">
                        <c:forEach items="${productList}" var="p">
                           <div class="col-4">
                               <p>${p.name}</p>
                               <img class="img-fluid" src="${p.image}" alt="productImage">
                               <p>${p.price} VND</p>
                               <a href="#">Buy now</a>
                           </div> 
                        </c:forEach>
                    </div>
                    
                </div>
            </div>


        </div>

        <div class="container-fluid footer">
            <div class="row">
                <div class="col-4 footer1">@2023 - Văn phòng phẩm VH</div>
                <div class="col-8 footer2">HungNVHE173464 - SE1740</div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>
