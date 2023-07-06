<%-- 
    Document   : pagination
    Created on : Jul 6, 2023, 9:10:38 PM
    Author     : Warspite
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<nav>
    <ul class="pagination justify-content-center">
        <c:forEach begin="${1}" end="${numberOfPage}" var="page">
            <li class="page-item"><a class="page-link" href="productServlet?currentPage=${page}">${page}</a></li>
        </c:forEach>
    </ul>
</nav>
