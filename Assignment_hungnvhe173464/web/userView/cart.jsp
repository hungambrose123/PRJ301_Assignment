<%-- 
    Document   : cart
    Created on : Jul 10, 2023, 4:34:29 PM
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
    <div class="container-fluid pt-5">
        <div class="row px-xl-5">
            <div class="col-lg-8 table-responsive mb-5">
                <table class="table table-bordered text-center mb-0">
                    <thead class="bg-secondary text-dark">
                        <tr>
                            <th>Products</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                            <th>Remove</th>
                        </tr>
                    </thead>
                    <tbody class="align-middle">
                    <c:if test="${not empty cart}">
                        <c:set var="subTotal" value="0"></c:set>
                        <c:forEach items="${cart}" var="c">
                            <tr>
                                <td class="align-middle"> <img src="${c.value.product.image}" alt="" style="width: 50px;">${c.value.product.name}</td>  
                                <td class="align-middle">${c.value.product.price}</td>
                                <td class="align-middle">
                                     <div class="input-group quantity mx-auto text-center" style="width: 50px;">
                                         <span>
                                        <!--    increment-->
                                        <a href="updateCartQuantity?id=${c.value.product.id}&action=plus" class="fa fa-plus"></a>    
                                        <!--   number of item-->
                                        <form action="updateCartQuantity?id=${c.value.product.id}" method="post">
                                            <input type="text" class="form-control form-control-sm bg-secondary text-center" value="${c.value.quantity}" name="quantity"> 
                                        </form>
                                         <!-- decrement-->
                                          <a href="updateCartQuantity?id=${c.value.product.id}&action=minus" class="fa fa-minus"></a> 
                                         </span>            
                                    </div>    
                                </td>
                                <td class="align-middle">${c.value.quantity * c.value.product.price} VND</td>
                                <td class="align-middle"><a href="removeProductFromCart?id=${c.value.product.id}"<button class="btn btn-sm btn-primary"><i class="fa fa-times"></i></button></td>
                            </tr>
                            <c:set var="subTotal" value="${subTotal + (c.value.quantity * c.value.product.price)}"></c:set>
                        </c:forEach>  
                    </c:if>
                    </tbody>
                </table>
            </div>
            <div class="col-lg-4">
<!--                <form class="mb-5" action="">
                    <div class="input-group">
                        <input type="text" class="form-control p-4" placeholder="Coupon Code">
                        <div class="input-group-append">
                            <button class="btn btn-primary">Apply Coupon</button>
                        </div>
                    </div>
                </form>-->
                <div class="card border-secondary mb-5">
                    <div class="card-header bg-secondary border-0">
                        <h4 class="font-weight-semi-bold m-0">Cart Summary</h4>
                    </div>
                    <div class="card-body">
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
                        <form action="checkOut?subTotal=${subTotal}" method="get">
                            <div class="d-flex justify-content-between mt-2">
                            <h5 class="font-weight-bold">Total</h5>
                            <h5 class="font-weight-bold">${subTotal + 24000} VND</h5>
                        </div>
                        <button type="submit" class="btn btn-block btn-primary my-3 py-3">Proceed To Checkout</button>
                        </form>
                    </div>
                </div>
            </div>
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