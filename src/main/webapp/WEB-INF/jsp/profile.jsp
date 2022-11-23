<%--
  Created by IntelliJ IDEA.
  User: Thuan
  Date: 11/06/22
  Time: 6:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Profile</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="/resources/images/icons/logo_T_T_Black.png"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/fonts/iconic/css/material-design-iconic-font.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/fonts/linearicons-v1.0.0/icon-font.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/vendor/animsition/css/animsition.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/vendor/daterangepicker/daterangepicker.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/vendor/slick/slick.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/vendor/MagnificPopup/magnific-popup.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/vendor/perfect-scrollbar/perfect-scrollbar.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/css/util.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/main.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/custom.css">
    <!--===============================================================================================-->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.02.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="/resources/css/form-validation.css" rel="stylesheet">
    <!--===============================================================================================-->
</head>
<jsp:include page="header.jsp"></jsp:include>

<!-- breadcrumb -->
<div class="container">
    <div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
        <a href="/" class="stext-109 cl8 hov-cl1 trans-04">
            Home
            <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
        </a>

        <span class="stext-109 cl4">
                Profile
            </span>
    </div>
</div>


<!--================Login Box Area =================-->
<div class="site-section">
    <div class="container">
        <link href="/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <div class="container">
            <div class="row flex-lg-nowrap">
                <div class="col-12 col-lg-auto mb-3" style="width: 200px;">
                    <div class="card">
                        <div class="e-navlist e-navlist--active-bg">
                            <ul class="nav">
                                <li class="nav-item active"><a class="nav-link px-2 active" href="/user/profile"><i class="fa fa-user fa-fw mr-1" aria-hidden="true"></i></i><span>Overview</span></a></li>
                                <li class="nav-item"><a class="nav-link px-2" href="/user/orderhistory"><i class="fa fa-history fa-fw mr-1" aria-hidden="true"></i></i><span>Order History</span></a></li>
                                <li class="nav-item"><a class="nav-link px-2" href="/user/changepass"><i class="fa fa-fw fa-cog fa-fw mr-1"></i><span>Change Password</span></a></li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="row">
                        <div class="col mb-3">
                            <div class="card">
                                <div class="card-body">
                                    <div class="e-profile">
                                        <div class="row">
                                            <div class="col-12 col-sm-auto mb-3">
                                                <div class="mx-auto" style="width: 140px;">
                                                    <div class="d-flex justify-content-center align-items-center rounded" style="height: 140px; background-color: rgb(233, 236, 239);">
                                                        <img src="/resources/images/avatar-vo-danh-2.jpg" style="width: -webkit-fill-available;">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col d-flex flex-column flex-sm-row justify-content-between mb-3">
                                                <div class="text-center text-sm-left mb-2 mb-sm-0">
                                                    <h4 class="pt-sm-2 pb-1 mb-0 text-nowrap">${sessionScope.user.firstName} ${sessionScope.user.lastName}</h4>
                                                    <p class="mb-0">@${sessionScope.user.firstName}</p>
                                                <%-- <div class="text-muted"><small>Last seen 2 hours ago</small></div>--%>
                                                <%-- <div class="mt-2">--%>
                                                <%-- <button class="btn btn-primary" type="button">--%>
                                                <%-- <i class="fa fa-fw fa-camera"></i>--%>
                                                <%-- <span>Change Photo</span>--%>
                                                <%-- </button>--%>
                                                <%-- </div>--%>
                                                </div>
                                                <div class="text-center text-sm-right">
                                                    <span class="badge badge-secondary">${sessionScope.user.role.id == 2?"administrator":"customer"}</span>
                                                <%-- <div class="text-muted"><small>Joined 09 Dec 2017</small></div>--%>
                                                </div>
                                            </div>
                                        </div>
                                        <ul class="nav nav-tabs">
                                            <li class="nav-item"><a href="" class="active nav-link">Overview</a></li>
                                        </ul>
                                            <div class="card h-100">
                                                <div class="card-body">
                                                    <form:form method="post" action="/user/updateProfile" modelAttribute="user">
                                                    <div class="row gutters">
                                                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                                            <h6 class="mb-2 text-primary">Personal Details</h6>
                                                        </div>
                                                        <form:hidden path="id" value="${user.id}"></form:hidden>
                                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                            <div class="form-group">
                                                                <label for="firstName">First Name</label>
                                                                <form:input path="firstName" type="text" class="form-control" id="firstName" placeholder="Enter first name"/>
                                                            </div>
                                                        </div>
                                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                            <div class="form-group">
                                                                <label for="lastName">Last Name</label>
                                                                <form:input path="lastName" type="text" class="form-control" id="lastName" placeholder="Enter last name"/>
                                                            </div>
                                                        </div>
                                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                            <div class="form-group">
                                                                <label for="email">Email</label>
                                                                <form:input path="email" type="email" class="form-control" id="email" placeholder="Enter email address" disabled="true"/>
                                                            </div>
                                                        </div>
                                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                            <div class="form-group">
                                                                <label for="phoneNumber">Phone Number</label>
                                                                <form:input path="phoneNumber" type="text" class="form-control" id="phoneNumber" placeholder="Enter phone number"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row gutters">
                                                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                                            <h6 class="mt-3 mb-2 text-primary">Address</h6>
                                                        </div>
                                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                            <div class="form-group">
                                                                <label for="Street">Street or village</label>
                                                                <form:input path="addressDetail" type="name" class="form-control" id="Street" placeholder="Enter Street"/>
                                                            </div>
                                                        </div>
                                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                            <div class="form-group">
                                                                <label for="province">Province</label>
                                                                <form:select path="province.id" class="custom-select d-block w-100" id="province" required="true">
                                                                    <form:option value='-1'>Select an option</form:option>
                                                                    <form:options items="${province}"/>
                                                                </form:select>
                                                            </div>
                                                        </div>
                                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                            <div class="form-group">
                                                                <label for="district">District</label>
                                                                <form:select path="district.id" class="custom-select d-block w-100" id="district" required="true">
                                                                    <form:option value='${sessionScope.user.district.id}'>${sessionScope.user.district.fullNameEn}</form:option>
                                                                </form:select>
                                                            </div>
                                                        </div>
                                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                            <div class="form-group">
                                                                <label for="ward">Ward</label>
                                                                <form:select path="ward.id" class="custom-select d-block w-100" id="ward" required="true">
                                                                    <form:option value='${sessionScope.user.ward.id}'>${sessionScope.user.ward.fullNameEn}</form:option>
                                                                </form:select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row gutters">
                                                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                                            <div class="text-right">
                                                                <button type="reset" id="submit" name="submit" class="btn btn-secondary">Cancel</button>
                                                                <button type="submit" id="submit" name="submit" class="btn btn-primary">Update</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    </form:form>
                                                </div>
                                            </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<!-- Footer -->
<jsp:include page="footer.jsp"></jsp:include>


<!-- Back to top -->
<div class="btn-back-to-top" id="myBtn">
        <span class="symbol-btn-back-to-top">
            <i class="zmdi zmdi-chevron-up"></i>
        </span>
</div>

<!--===============================================================================================-->
<script src="/resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="/resources/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
<script src="/resources/vendor/bootstrap/js/popper.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="/resources/vendor/select2/select2.min.js"></script>
<script>
    $(".js-select2").each(function () {
        $(this).select2({
            minimumResultsForSearch: 20,
            dropdownParent: $(this).next('.dropDownSelect2')
        });
    })
</script>
<!--===============================================================================================-->
<script src="/resources/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
<!--===============================================================================================-->
<script src="/resources/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script>
    $('.js-pscroll').each(function () {
        $(this).css('position', 'relative');
        $(this).css('overflow', 'hidden');
        var ps = new PerfectScrollbar(this, {
            wheelSpeed: 1,
            scrollingThreshold: 1000,
            wheelPropagation: false,
        });

        $(window).on('resize', function () {
            ps.update();
        })
    });
</script>
<!--===============================================================================================-->
<script src="/resources/js/main.js"></script>
<!--===============================================================================================-->
<%--<script src="https://code.jquery.com/jquery-3.5.1.slim.js" integrity="sha256-DrT5NfxfbHvMHux31Lkhxg42LY6of8TaYyK50jnxRnM=" crossorigin="anonymous"></script>--%>
<%--<script>window.jQuery || document.write('<script src="../assets/js//resources/vendor/jquery.slim.min.js"><\/script>')</script>--%>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.02.js"></script>
<script src="/resources/js/form-validation.js"></script>
<!--===============================================================================================-->

<script src="/resources/vendor/jquery/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $("#province").change(function() {
            var provinceId = $(this).val();
            var s = '<option value=' + -1 + '>Select an option</option>';
            if (provinceId > 0) {
                $.ajax({
                    url : 'getDistricts',
                    data : { "provinceId" : provinceId },
                    success : function(result) {
                        var result = JSON.parse(result);
                        for (var i = 0; i < result.length; i++) {
                            s += '<option value="' + result[i][0] + '">'+ result[i][1]+ '</option>';
                        }
                        $('#district').html(s);
                    }
                });
            }
            //reset data
            $('#district').html(s);
            $('#ward').html(s);

        });

        $("#district").change(function() {
            var districtId = $(this).val();
            var s = '<option value=' + -1 + '>Select an option</option>';
            if (districtId > 0) {
                $.ajax({
                    url : 'getWards',
                    data : {"districtId" : districtId},
                    success : function(result) {
                        var result = JSON.parse(result);
                        for (var i = 0; i < result.length; i++) {
                            s += '<option value="' + result[i][0] + '">'+ result[i][1]+ '</option>';
                        }
                        $('#ward').html(s);
                    }
                });
            }
            //reset data
            $('#ward').html(s);
        });
    });
</script>
<!--===============================================================================================-->
</body>

</html>
