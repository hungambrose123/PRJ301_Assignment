<%-- 
    Document   : contact
    Created on : Jul 14, 2023, 7:17:14 PM
    Author     : Warspite
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <jsp:include page="../websiteComponents/headMetadata.jsp"></jsp:include>
        
        </head>

        <body>
            <!-- Topbar Start -->
        <jsp:include page="../websiteComponents/topBar.jsp"></jsp:include>
            <!-- Topbar End -->


            <!-- Navbar Start -->
        <jsp:include page="../websiteComponents/navBar.jsp"></jsp:include>
            <!-- Navbar End -->


            <!-- Page Header Start -->
        <jsp:include page="../websiteComponents/pageHeader.jsp"></jsp:include>
            <!-- Page Header End -->


            <!-- Cart Start -->
            <div class="container-fluid pt-5 ">
                <div style="text-align: center">
                    <p>Our shop info</p>
                    <p class="mb-2"><i class="fa fa-map-marker-alt text-primary mr-3"></i>123 Street, Hanoi, Viet Nam</p>
                    <p class="mb-2"><i class="fa fa-envelope text-primary mr-3"></i>hungnvhe173464@efpt.edu.vn</p>
                    <p class="mb-0"><i class="fa fa-phone-alt text-primary mr-3"></i>(+56) 034 234 54645</p>
                </div> <br>
                <div style="text-align: center">
                    <p>Contract us through our email if you have any question !</p>
                </div>
            
           </div>
        <!-- Cart End -->


        <!-- Footer Start -->
        <jsp:include page="../websiteComponents/footer.jsp"></jsp:include>
            <!-- Footer End -->


            <!-- Back to Top -->
            <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


            <!-- JavaScript Libraries -->
        <jsp:include page="../websiteComponents/jsScripts.jsp"></jsp:include>
    </body>

</html>