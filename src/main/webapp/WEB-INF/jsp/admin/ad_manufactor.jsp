<%--
  Created by IntelliJ IDEA.
  User: phamv
  Date: 10/22/22
  Time: 9:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Mamufactor</title>
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
<body>
<%@include file="ad_header.jsp"%>
<div id="layoutSidenav">
  <%@include file="ad_sidebar_menu.jsp"%>
  <div id="layoutSidenav_content">
    <main>
      <div class="card mb-4">
        <div class="card-header">
          <a
                  href="/admin/newManufactor"
                  class="btn btn-primary btn-block text-uppercase me-1">Add Manufactor</a>
          <i class="fas fa-table me-1"></i>
          Manufactory
        </div>
        <div class="card-body">
          <table id="datatablesSimple">
            <thead>
            <tr>
              <th>Id</th>
              <th>Manufactory name</th>
            </tr>
            </thead>
            <tfoot>
            <tr>
              <th>Id</th>
              <th>Manufactory name</th>
            </tr>
            </tfoot>
            <tbody>
            <c:forEach items="${manufactorList}" var="m">
              <tr>
                <td>${m.id}</td>
                <td>
                  <a href="<c:url value="/admin/editManufactor/${m.id}"/>"> ${m.name}</a>
                </td>
              </tr>
            </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
    </main>
    <%@include file="ad_footer.jsp"%>
  </div>
</div>

</body>
</html>
