<%-- 
    Document   : category
    Created on : Jul 4, 2023, 9:26:53 PM
    Author     : Warspite
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../websiteComponents/headMetadata.jsp"></jsp:include>

<div class="col-2 categories">
    <h3 class="text-center">Category</h3>
    <div class="list-group">
        <a href="productServlet"  class="list-group-item list-group-item-action list-group-item-info" aria-current="true">All product</a> 
        <c:forEach items="${productCategory}" var="pc" >
            <a class="list-group-item list-group-item-action ${categoryName == pc.name ? "active" : ""}" href="searchCategory?categoryName=${pc.name}" >${pc.name}</a>
        </c:forEach>  
    </div>
</div>

<!-- JavaScript Libraries -->
        <jsp:include page="../websiteComponents/jsScripts.jsp"></jsp:include>