<%--
  Created by IntelliJ IDEA.
  User: phamv
  Date: 10/23/22
  Time: 9:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Order</title>
    <link rel="icon" type="image/png" href="/resources/images/icons/logo_T_T_Black.png"/>
    <link rel="stylesheet" type="text/css" href="/resources/admin/assets/dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/admin/css/dashboard.css">
    <link rel="stylesheet" type="text/css" href="/resources/admin/css/custom.css">
    <link rel="stylesheet" type="text/css" href="/resources/admin/css/styles.css">
    <script src="/resources/admin/js/all.js" crossorigin="anonymous"></script>
    <script src="/resources/admin/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="/resources/admin/js/scripts.js"></script>
    <script src="/resources/admin/js/Chart.min.js" crossorigin="anonymous"></script>
    <script src="/resources/admin/assets/demo/chart-area-demo.js"></script>
    <script src="/resources/admin/assets/demo/chart-bar-demo.js"></script>
    <script src="/resources/admin/js/simple-datatables@latest.js" crossorigin="anonymous"></script>
    <script src="/resources/admin/js/datatables-simple-demo.js"></script>
</head>
<body class="sb-nav-fixed">
<jsp:include page="ad_header.jsp"/>
<div id="layoutSidenav">
    <jsp:include page="ad_sidebar_menu.jsp"/>
    <div id="layoutSidenav_content">
        <main>
            <div class="card-header">
                <i class="fas fa-table me-1"></i>
                Order
            </div>
            <div class="card-body">
                <table id="datatablesSimple">
                    <thead>
                    <tr>
                        <th>Id</th>
                        <th>Name</th>
                        <th>Phone</th>
                        <th>Email</th>
                        <th>Address</th>
                        <th>Req date</th>
                        <th>Ship date</th>
                        <th>Total</th>
                        <th>Status</th>
                        <th>Note</th>
                        <th>Edit</th>
                    </tr>
                    </thead>
                    <tfoot>
                    <tr>
                        <th>Id</th>
                        <th>Name</th>
                        <th>Phone</th>
                        <th>Email</th>
                        <th>Address</th>
                        <th>Req date</th>
                        <th>Ship date</th>
                        <th>Total</th>
                        <th>Status</th>
                        <th>Note</th>
                        <th>Edit</th>
                    </tr>
                    </tfoot>
                    <tbody>
                    <c:forEach items="${orderList}" var="o">
                        <tr>
                            <td>${o.id}</td>
                            <td>
                                <a href="<c:url value="/admin/adOrderDetail/${o.id}"/>">${o.firstName} ${o.lastName}</a>
                            </td>
                            <td>${o.phoneNumber}</td>
                            <td>${o.email}</td>
                            <td>${o.addressDetail}</td>
                            <td>${o.requireDate}</td>
                            <td>${o.shippingDate}</td>
                            <td>${o.totalAmount}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${o.orderStatus == 0}">

                                        <a href="<c:url value="/admin/updateOrderStatus/${o.id}"/>">
                                            <i class="fa fa-check" aria-hidden="true"></i></a>
                                    </c:when>
                                    <c:otherwise>
                                        <%--                                        <label style="color: green">${p.status}</label>--%>
                                        <a href="<c:url value="/admin/updateOrderStatus/${o.id}"/>">
                                            <i class="fa fa-times" aria-hidden="true" style="color: red"></i>
                                        </a>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>${o.notesOfCustomer}</td>
                            <td>
                                <a href="<c:url value="/admin/editOrder/${o.id}"/>"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

            </div>
            <div class="input-group-btn">
                <a href="/admin/exportOrder">
                    <button type="button" class="btn btn-success">Export All Order</button>
                </a>
            </div>
        </main>
        <jsp:include page="ad_footer.jsp"/>
    </div>
</div>
</body>
</html>
