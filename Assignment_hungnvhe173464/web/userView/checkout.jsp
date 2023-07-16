<%-- 
    Document   : checkout
    Created on : Jul 10, 2023, 4:34:37 PM
    Author     : Warspite
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c
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


    <!-- Checkout Start -->
    <div class="container-fluid pt-5">
        
             <form action="checkOut" method="post">
          <div class="row px-xl-5">       
            <div class="col-lg-8">
                <div class="mb-4">
                    <h4 class="font-weight-semi-bold mb-4">Billing Address</h4>
                   
                      <div class="row">
                        <div class="col-md-6 form-group">
                            <label>Username</label>
                            <input class="form-control" type="text" placeholder="John" name="username"  value="${sessionScope.account.name}" disabled>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>E-mail</label>
                            <input class="form-control" type="text" placeholder="example@email.com" name="email" value="${sessionScope.account.email}" disabled>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Phone number</label>
                            <input class="form-control" type="text" name="number" placeholder="+123 456 789">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Address</label>
                            <input class="form-control" type="text" name="address" placeholder="123 Street">
                        </div>
                    </div>  
                   
                </div>
            </div>
            <div class="col-lg-4">
                <div class="card border-secondary mb-5">
                    <div class="card-header bg-secondary border-0">
                        <h4 class="font-weight-semi-bold m-0">Order Total</h4>
                    </div>
                    <div class="card-body">
                        <h5 class="font-weight-medium mb-3">Products</h5>
                        <c:if test="${not empty cart}">
                        <c:set var="subTotal" value="0"></c:set>
                        <c:forEach items="${cart}" var="c">
                                <p style="color:blue" class="align-middle">---${c.value.product.name}--- </p>
                                <input type="text" name="productName" value="${c.value.product.name}" hidden>
                                <p style="color:red">Quantity:${c.value.quantity}</p>
                                <input type="text" name="productQuantity" value="${c.value.quantity}" hidden>
                            <c:set var="subTotal" value="${subTotal + (c.value.quantity * c.value.product.price)}"></c:set>
                        </c:forEach>  
                        </c:if>
                        <hr class="mt-0">
                        <div class="d-flex justify-content-between mb-3 pt-1">
                            <h6 class="font-weight-medium">Subtotal</h6>
                            <h6 class="font-weight-medium">${subTotal} VND</h6>
                        </div>
                        <div class="d-flex justify-content-between">
                            <h6 class="font-weight-medium">Shipping</h6>
                            <h6 class="font-weight-medium">24000 VND</h6>
                        </div>
                    </div>
                    <div class="card-footer border-secondary bg-transparent">
                        <div class="d-flex justify-content-between mt-2">
                            <h5 class="font-weight-bold">Total</h5>
                            <h5 class="font-weight-bold">${subTotal + 24000} VND</h5>
                            <input type="text" name="totalMoney" value="${subTotal + 24000}" hidden>
                        </div>
                    </div>
                </div>
                <div class="card border-secondary mb-5">
                    <div class="card-header bg-secondary border-0">
                        <h4 class="font-weight-semi-bold m-0">Payment</h4>
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <div class="custom-control custom-radio">
                                <input type="radio" class="custom-control-input" name="payment" id="paypal">
                                <label class="custom-control-label" for="paypal">Pay with cash</label>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer border-secondary bg-transparent">
                        <button type="submit" class="btn btn-lg btn-block btn-primary font-weight-bold my-3 py-3">Place Order</button><br>
                        <p style="color:red">${message}</p>
                    </div>
                </div>
            </div>
        </div>
    </form>
        
    </div>
    <!-- Checkout End -->


    <!-- Footer Start -->
<jsp:include page="../websiteComponents/footer.jsp"></jsp:include>
    <!-- Footer End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


    <!-- JavaScript Libraries -->
<jsp:include page="../websiteComponents/jsScripts.jsp"></jsp:include>

    <!-- Contact Javascript File -->
    <script src="mail/jqBootstrapValidation.min.js"></script>
    <script src="mail/contact.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>
