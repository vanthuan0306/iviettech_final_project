<%--
  Created by IntelliJ IDEA.
  User: phamv
  Date: 10/21/22
  Time: 11:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Sidebar Menu</title>
    <link rel="stylesheet" type="text/css" href="/resources/admin/assets/dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/admin/css/dashboard.css">
    <link rel="stylesheet" type="text/css" href="/resources/admin/css/custom.css">
    <link rel="stylesheet" type="text/css" href="/resources/admin/css/styles.css">
    <script src="/resources/admin/js/all.js" crossorigin="anonymous"></script>
    <script src="/resources/admin/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<%--    <script src="/resources/admin/js/scripts.js"></script>--%>
    <script src="/resources/admin/js/Chart.min.js" crossorigin="anonymous"></script>
    <script src="/resources/admin/assets/demo/chart-area-demo.js"></script>
    <script src="/resources/admin/assets/demo/chart-bar-demo.js"></script>
    <script src="/resources/admin/js/simple-datatables@latest.js" crossorigin="anonymous"></script>
    <script src="/resources/admin/js/datatables-simple-demo.js"></script>

</head>
<body>
<div id="layoutSidenav_nav">
    <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
        <div class="sb-sidenav-menu">
            <div class="nav">
                <div class="sb-sidenav-menu-heading">Core</div>
                <a class="nav-link" href="/admin">
                    <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                    Dashboard
                </a>
                <div class="sb-sidenav-menu-heading">Interface</div>
                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                    <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                    All data
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                    <nav class="sb-sidenav-menu-nested nav">
                        <a class="nav-link" href="/admin/adProduct">Product</a>
                        <a class="nav-link" href="/admin/adCategory">Category</a>
                        <a class="nav-link" href="/admin/adManyfactor">Manufactor</a>
                        <a class="nav-link" href="/admin/adOrder">Order</a>
                    </nav>
                </div>
                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                    <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                    Report
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
<%--                    <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">--%>
<%--                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">--%>
<%--                            Reports--%>
<%--                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>--%>
<%--                        </a>--%>
<%--                        <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">--%>
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="/admin/adReportDate">During the day</a>
                                <a class="nav-link" href="/admin/adReportWeek">In Week</a>
                                <a class="nav-link" href="/admin/adReportMonth">In Month</a>
                                <a class="nav-link" href="/admin/adReportYear">In Year</a>
                            </nav>
<%--                        </div>--%>
<%--                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">--%>
<%--                            Error--%>
<%--                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>--%>
<%--                        </a>--%>
<%--                        <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">--%>
<%--                            <nav class="sb-sidenav-menu-nested nav">--%>
<%--                                <a class="nav-link" href="401.html">401 Page</a>--%>
<%--                                <a class="nav-link" href="404.html">404 Page</a>--%>
<%--                                <a class="nav-link" href="500.html">500 Page</a>--%>
<%--                            </nav>--%>
<%--                        </div>--%>
<%--                    </nav>--%>
                </div>
                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                    <div class="sb-nav-link-icon"><i class="fas fa-user"></i></div>
                    Member
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingThree" data-bs-parent="#sidenavAccordion">
                    <nav class="sb-sidenav-menu-nested nav">
                        <a class="nav-link" href="/admin/adAccount">Account</a>
                    </nav>
                </div>
                <div class="sb-sidenav-menu-heading">Addons</div>
                <a class="nav-link" href="charts.html">
                    <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                    Charts
                </a>
                <a class="nav-link" href="tables.html">
                    <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                    Tables
                </a>
            </div>
        </div>
        <div class="sb-sidenav-footer">
            <div class="small">Logged in as:</div>
            Admin T&T Fashion
        </div>
    </nav>
</div>
</body>
</html>
