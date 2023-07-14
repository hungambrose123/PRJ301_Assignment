<%-- 
    Document   : navBar
    Created on : Jul 10, 2023, 3:33:14 PM
    Author     : Warspite
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jakarta.servlet.http.HttpSession" %>
<jsp:include page="../websiteComponents/headMetadata.jsp"></jsp:include>

<div class="container-fluid">
            <div class="row border-top px-xl-5">
                <div class="col-lg-3 d-none d-lg-block">
                    <a class="btn shadow-none d-flex align-items-center justify-content-between bg-primary text-white w-100" data-toggle="collapse" href="#navbar-vertical" style="height: 65px; margin-top: -1px; padding: 0 30px;">
                        <h6 class="m-0">Categories</h6>
                        <i class="fa fa-angle-down text-dark"></i>
                    </a>
                    <nav class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0 bg-light" id="navbar-vertical" style="width: calc(100% - 30px); z-index: 1;">
                        <div class="navbar-nav w-100 overflow-hidden" style="height: 180px">
                            <c:forEach items="${productCategory}" var="pc" >
                                <a href="searchCategory?categoryName=${pc.name}" class="nav-item nav-link">${pc.name}</a>
                            </c:forEach>
                        </div>
                    </nav>
                </div>
                <div class="col-lg-9">
                    <nav class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
                        <a href="" class="text-decoration-none d-block d-lg-none">
                            <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">E</span>Shopper</h1>
                        </a>
                        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                            <div class="navbar-nav mr-auto py-0">
                                <a href="productServlet" class="nav-item nav-link active">Home</a>
                                <a href="contact.html" class="nav-item nav-link">Contact</a>
                            </div>
                            
                            <div class="navbar-nav mr-auto py-0">
                                <a href="cart" class="nav-item nav-link">Shopping Cart</a>
                                <a href="checkOut" class="nav-item nav-link">Checkout</a>
                                <c:if test="${sessionScope.account.isAdmin == true}">
                                    <a href="redirectToManage" class="nav-item nav-link">Management</a>
                            </c:if>
                            </div>
                            
                            <div class="navbar-nav mr-auto py-0">
                                <c:if test="${sessionScope.account.isAdmin == true}">
                                <a href="redirectToManage" class="nav-item nav-link">Management</a
                                </c:if>
                                <% if (session.getAttribute("account") == null){ %>
                                <a href="login" class="nav-item nav-link">Login</a>
                                <a href="register" class="nav-item nav-link">Register</a>
                                <%
                                    } else{ %>
                                    <p class="nav-item nav-link">Hello, ${sessionScope.account.name}</p>
                                    <a href="logout" class="nav-item nav-link">Logout</a>
                                 <%   }
                                %>
                            </div>
                            
                        </div>
                    </nav>
                </div>
            </div>
        </div>

<!-- JavaScript Libraries -->
        <jsp:include page="../websiteComponents/jsScripts.jsp"></jsp:include>