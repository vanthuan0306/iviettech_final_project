<%--
  Created by IntelliJ IDEA.
  User: phamv
  Date: 10/21/22
  Time: 9:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
      <title>Admin home</title>
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
              <br>
              <jsp:include page="ad_view_total.jsp"/>

              <jsp:include page="ad_dashboard.jsp"/>
              <jsp:include page="ad_last_5_order.jsp"/>
          </main>
          <jsp:include page="ad_footer.jsp"/>
      </div>
  </div>

  </body>
</html>
