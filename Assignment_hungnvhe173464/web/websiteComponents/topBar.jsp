<%-- 
    Document   : topBar
    Created on : Jul 4, 2023, 9:27:18 PM
    Author     : Warspite
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="../websiteComponents/headMetadata.jsp"></jsp:include>


<div class="container-fluid">
            <div class="row align-items-center py-3 px-xl-5">
                <div class="col-lg-3 d-none d-lg-block">
                    <a href="" class="text-decoration-none">
                        <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">VHStationary</span></h1>
                    </a>
                </div>
                <div class="col-lg-6 col-6 text-left">
                    <form name="searchProduct" action="searchProductByName" method="get">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Search for products" name="searchByName">
                            <div class="input-group-append">
                                <span class="input-group-text bg-transparent text-primary btn" onclick="searchProduct.submit()" >
                                    <i  class="fa fa-search"></i>
                                </span>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-lg-3 col-6 text-right">
                    <a href="cart" class="btn border">
                        <i class="fas fa-shopping-cart text-primary"></i>
                        <span class="badge">${sessionScope.cartSize}</span>
                    </a>
                </div>
            </div>
        </div>

<!-- JavaScript Libraries -->
        <jsp:include page="../websiteComponents/jsScripts.jsp"></jsp:include>