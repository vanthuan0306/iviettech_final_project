<%--
  Created by IntelliJ IDEA.
  User: Thuan
  Date: 10/18/22
  Time: 12:10 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body class="animsition">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="/resources/js/active-link.js"></script>
<!-- Header -->
<header class="header-v4">
    <!-- Header desktop -->
    <div class="container-menu-desktop">
        <!-- Topbar -->
        <div class="top-bar">
            <div class="content-topbar flex-sb-m h-full container">
                <div class="left-top-bar">
                    Free shipping for standard order over $100
                </div>

                <div class="right-top-bar flex-w h-full">
                    <a href="#" class="flex-c-m trans-04 p-lr-25">
                        Help & FAQs
                    </a>

                    <a href="#" class="flex-c-m trans-04 p-lr-25">
                        My Account
                    </a>

                    <a href="#" class="flex-c-m trans-04 p-lr-25">
                        USD
                    </a>
                </div>
            </div>
        </div>

        <div class="wrap-menu-desktop how-shadow1">
            <nav class="limiter-menu-desktop container">

                <!-- Logo desktop -->
                <a href="/" class="logo">
                    <img src="/resources/images/icons/logo_T_T_Black.png" alt="IMG-LOGO">
                </a>

                <!-- Menu desktop -->
                <div class="menu-desktop">
                    <ul class="main-menu">
                        <li class="active-menu">
                            <a href="/">Home</a>
<%--                            <ul class="sub-menu">--%>
<%--                                <li><a href="/">Homepage 1</a></li>--%>
<%--                                <li><a href="home-02.html">Homepage 2</a></li>--%>
<%--                                <li><a href="home-03.html">Homepage 3</a></li>--%>
<%--                            </ul>--%>
                        </li>

                        <li class="label1" data-label1="hot">
                            <a href="/shop">Shop</a>
                        </li>

                        <li >
                            <a href="/cart">Shopping Cart</a>
                        </li>

                        <li>
                            <a href="/blog">Blog</a>
                        </li>

                        <li>
                            <a href="/about">About</a>
                        </li>

                        <li>
                            <a href="/contact">Contact</a>
                        </li>
                    </ul>
                </div>

                <!-- Icon header -->
                <div class="wrap-icon-header flex-w flex-r-m">
                    <div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-modal-search">
                        <i class="zmdi zmdi-search"></i>
                    </div>
                    <c:choose>
                        <c:when test="${sessionScope.shopping_cart == null}">
                            <div id="cart_number" class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart" data-notify="0">
                                <i class="zmdi zmdi-shopping-cart"></i>
                            </div>
                        </c:when>
                        <c:when test="${sessionScope.shopping_cart != null}">
                            <div id="cart_number" class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart" data-notify="${sessionScope.shopping_cart.size()}">
                                <i class="zmdi zmdi-shopping-cart"></i>
                            </div>
                        </c:when>
                    </c:choose>
                    <a href="#" class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti" data-notify="0">
                        <i class="zmdi zmdi-favorite-outline"></i>
                    </a>
                </div>
            </nav>
        </div>
    </div>

    <!-- Header Mobile -->
    <div class="wrap-header-mobile">
        <!-- Logo moblie -->
        <div class="logo-mobile">
            <a href="/"><img src="/resources/images/icons/logo_T_T_Black.png" alt="IMG-LOGO"></a>
        </div>

        <!-- Icon header -->
        <div class="wrap-icon-header flex-w flex-r-m m-r-15">
            <div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 js-show-modal-search">
                <i class="zmdi zmdi-search"></i>
            </div>
            <c:choose>
            <c:when test="${sessionScope.shopping_cart == null}">
            <div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti js-show-cart" data-notify="0">
                <i class="zmdi zmdi-shopping-cart"></i>
            </div>
            </c:when>
                <c:when test="${sessionScope.shopping_cart != null}">
                    <div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti js-show-cart" data-notify="${sessionScope.shopping_cart.size()}">
                        <i class="zmdi zmdi-shopping-cart"></i>
                    </div>
                </c:when>
            </c:choose>
            <a href="#" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti" data-notify="0">
                <i class="zmdi zmdi-favorite-outline"></i>
            </a>
        </div>

        <!-- Button show menu -->
        <div class="btn-show-menu-mobile hamburger hamburger--squeeze">
				<span class="hamburger-box">
					<span class="hamburger-inner"></span>
				</span>
        </div>
    </div>


    <!-- Menu Mobile -->
    <div class="menu-mobile">
        <ul class="topbar-mobile">
            <li>
                <div class="left-top-bar">
                    Free shipping for standard order over $100
                </div>
            </li>

            <li>
                <div class="right-top-bar flex-w h-full">
                    <a href="#" class="flex-c-m p-lr-10 trans-04">
                        Help & FAQs
                    </a>

                    <a href="#" class="flex-c-m p-lr-10 trans-04">
                        My Account
                    </a>

                    <a href="#" class="flex-c-m p-lr-10 trans-04">
                        EN
                    </a>

                    <a href="#" class="flex-c-m p-lr-10 trans-04">
                        USD
                    </a>
                </div>
            </li>
        </ul>

        <ul class="main-menu-m">
            <li>
                <a href="/">Home</a>
                <ul class="sub-menu-m">
                    <li><a href="/">Homepage 1</a></li>
                    <li><a href="home-02.html">Homepage 2</a></li>
                    <li><a href="home-03.html">Homepage 3</a></li>
                </ul>
                <span class="arrow-main-menu-m">
						<i class="fa fa-angle-right" aria-hidden="true"></i>
					</span>
            </li>

            <li>
                <a href="/shop" class="label1 rs1" data-label1="hot">Shop</a>
            </li>

            <li>
                <a href="/cart" >Shopping Cart</a>
            </li>

            <li>
                <a href="/blog">Blog</a>
            </li>

            <li>
                <a href="/about">About</a>
            </li>

            <li>
                <a href="/contact">Contact</a>
            </li>
        </ul>
    </div>

    <!-- Modal Search -->
    <div class="modal-search-header flex-c-m trans-04 js-hide-modal-search">
        <div class="container-search-header">
            <button class="flex-c-m btn-hide-modal-search trans-04 js-hide-modal-search">
                <img src="/resources/images/icons/icon-close2.png" alt="CLOSE">
            </button>

            <form class="wrap-search-header flex-w p-l-15" action="/shop/search" method="get">
                <button class="flex-c-m trans-04">
                    <i class="zmdi zmdi-search"></i>
                </button>
                <input class="plh3" type="text" name="searchInput" value="${searchInput}" placeholder="Search...">
            </form>
        </div>
    </div>
</header>

<!-- Cart -->
<div class="wrap-header-cart js-panel-cart">
    <div class="s-full js-hide-cart"></div>

    <div class="header-cart flex-col-l p-l-65 p-r-25">
        <div class="header-cart-title flex-w flex-sb-m p-b-8">
				<span class="mtext-103 cl2">
					Your Cart
				</span>

            <div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart">
                <i class="zmdi zmdi-close"></i>
            </div>
        </div>
        <div class="header-cart-content flex-w js-pscroll">
            <ul class="header-cart-wrapitem w-full">
                <c:forEach items="${sessionScope.shopping_cart}" var="cart">
                <li class="header-cart-item flex-w flex-t m-b-12">
                    <div class="header-cart-item-img">
                        <img src="${cart.imgSource}" alt="IMG">
                    </div>

                    <div class="header-cart-item-txt p-t-8">
                        <a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
                            ${cart.title}
                        </a>

                        <span class="header-cart-item-info">
								${cart.quantity} x $${cart.price}, ${cart.color}, ${cart.size}
							</span>
                    </div>
                </li>
                </c:forEach>
            </ul>

            <div class="w-full">
                <c:choose>
                    <c:when test="${sessionScope.shopping_cart == null}">
                        <div class="header-cart-total w-full p-tb-40">
                            Total: $0
                        </div>
                    </c:when>
                    <c:when test="${sessionScope.shopping_cart != null}">
                        <div class="header-cart-total w-full p-tb-40">
                            Total: $<c:out value="${sessionScope.total_price_in_cart}"/>
                        </div>
                    </c:when>
                </c:choose>

                <div class="header-cart-buttons flex-w w-full">
                    <a href="/cart" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10">
                        View Cart
                    </a>

                    <a href="/checkout?data=" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-b-10">
                        Check Out
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>


