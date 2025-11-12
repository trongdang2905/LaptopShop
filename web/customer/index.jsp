<%-- 
    Document   : index
    Created on : Oct 17, 2025, 3:44:20 PM
    Author     : trong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Group 5 - Project</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Arial, sans-serif;
                background-color: #f4f4f4;
                padding-top: 85px;
            }

            .header {
                background: linear-gradient(135deg, #d32f2f 0%, #e74c3c 100%);
                color: white;
                padding: 15px 0;
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
                z-index: 1000;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                transition: transform 0.3s ease, box-shadow 0.3s ease;
            }

            .header-container {
                max-width: 1400px;
                margin: 0 auto;
                display: flex;
                align-items: center;
                justify-content: space-between;
                padding: 0 20px;
            }

            .logo {
                font-size: 24px;
                font-weight: bold;
                letter-spacing: 1px;
                cursor: pointer;
            }

            .header-nav {
                display: flex;
                gap: 20px;
                align-items: center;
            }

            .nav-item {
                display: flex;
                align-items: center;
                gap: 8px;
                cursor: pointer;
                padding: 8px 15px;
                border-radius: 5px;
                transition: background 0.3s;
                position: relative;
            }

            .nav-item:hover {
                background: rgba(255, 255, 255, 0.1);
            }

            .dropdown-menu {
                position: absolute;
                top: 100%;
                left: 0;
                background: white;
                min-width: 250px;
                border-radius: 8px;
                box-shadow: 0 8px 24px rgba(0, 0, 0, 0.15);
                opacity: 0;
                visibility: hidden;
                transform: translateY(-10px);
                transition: all 0.3s ease;
                margin-top: 10px;
                z-index: 1000;
            }

            .nav-item:hover .dropdown-menu {
                opacity: 1;
                visibility: visible;
                transform: translateY(0);
            }

            .dropdown-item {
                padding: 12px 20px;
                color: #333;
                display: flex;
                align-items: center;
                gap: 12px;
                transition: all 0.2s;
                border-bottom: 1px solid #f0f0f0;
            }

            .dropdown-item:first-child {
                border-radius: 8px 8px 0 0;
            }

            .dropdown-item:last-child {
                border-bottom: none;
                border-radius: 0 0 8px 8px;
            }

            .dropdown-item:hover {
                background: #f8f8f8;
                padding-left: 25px;
            }

            .brand-icon {
                width: 24px;
                height: 24px;
                display: flex;
                align-items: center;
                justify-content: center;
                font-weight: bold;
                border-radius: 4px;
                font-size: 12px;
            }

            .brand-hp {
                background: #0096D6;
                color: white;
            }

            .brand-dell {
                background: #007DB8;
                color: white;
            }

            .brand-asus {
                background: #000;
                color: white;
            }

            .brand-acer {
                background: #83B81A;
                color: white;
            }

            .brand-lenovo {
                background: #E2231A;
                color: white;
            }

            .brand-macbook {
                background: #555;
                color: white;
            }

            .brand-msi {
                background: #000;
                color: #FF0000;
            }

            .brand-all {
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                color: white;
            }

            .search-bar {
                flex: 1;
                max-width: 500px;
                margin: 0 30px;
            }

            .search-bar input {
                width: 100%;
                padding: 12px 20px;
                border: none;
                border-radius: 25px;
                font-size: 14px;
            }

            .header-actions {
                display: flex;
                gap: 20px;
                align-items: center;
            }

            .cart-icon, .login-btn, .user-menu {
                background: rgba(255, 255, 255, 0.15);
                padding: 8px 16px;
                border-radius: 20px;
                cursor: pointer;
                transition: background 0.3s;
                position: relative;
            }

            .cart-icon:hover, .login-btn:hover, .user-menu:hover {
                background: rgba(255, 255, 255, 0.25);
            }

            /* User Menu Dropdown */
            .user-menu {
                display: flex;
                align-items: center;
                gap: 8px;
            }

            .user-avatar {
                width: 32px;
                height: 32px;
                border-radius: 50%;
                background: white;
                color: #d32f2f;
                display: flex;
                align-items: center;
                justify-content: center;
                font-weight: bold;
                font-size: 14px;
            }

            .user-dropdown {
                position: absolute;
                top: 100%;
                right: 0;
                background: white;
                min-width: 280px;
                border-radius: 8px;
                box-shadow: 0 8px 24px rgba(0, 0, 0, 0.15);
                opacity: 0;
                visibility: hidden;
                transform: translateY(-10px);
                transition: all 0.3s ease;
                margin-top: 10px;
                z-index: 1000;
            }

            .user-menu:hover .user-dropdown {
                opacity: 1;
                visibility: visible;
                transform: translateY(0);
            }

            .user-dropdown-header {
                padding: 20px;
                border-bottom: 1px solid #f0f0f0;
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                color: white;
                border-radius: 8px 8px 0 0;
            }

            .user-dropdown-name {
                font-size: 16px;
                font-weight: 600;
                margin-bottom: 5px;
            }

            .user-dropdown-email {
                font-size: 13px;
                opacity: 0.9;
            }

            .user-dropdown-item {
                padding: 12px 20px;
                color: #333;
                display: flex;
                align-items: center;
                gap: 12px;
                transition: all 0.2s;
                border-bottom: 1px solid #f0f0f0;
                text-decoration: none;
            }

            .user-dropdown-item:last-child {
                border-bottom: none;
                border-radius: 0 0 8px 8px;
            }

            .user-dropdown-item:hover {
                background: #f8f8f8;
                padding-left: 25px;
            }

            .user-dropdown-item.logout {
                color: #d32f2f;
                font-weight: 600;
            }

            .user-dropdown-icon {
                width: 20px;
                font-size: 16px;
            }

            /* Hero Banner */
            .hero-banner {
                max-width: 1400px;
                margin: 20px auto;
                padding: 0 20px;
            }

            .banner-slider {
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                border-radius: 16px;
                padding: 60px 40px;
                color: white;
                position: relative;
                overflow: hidden;
            }

            .banner-content h1 {
                font-size: 48px;
                margin-bottom: 20px;
                font-weight: 700;
            }

            .banner-content p {
                font-size: 20px;
                margin-bottom: 30px;
                opacity: 0.95;
            }

            .banner-btn {
                background: white;
                color: #667eea;
                padding: 15px 40px;
                border-radius: 30px;
                font-weight: 600;
                cursor: pointer;
                display: inline-block;
                transition: transform 0.3s;
            }

            .banner-btn:hover {
                transform: scale(1.05);
            }

            /* Features Section */
            .features-section {
                max-width: 1400px;
                margin: 40px auto;
                padding: 0 20px;
            }

            .features-grid {
                display: grid;
                grid-template-columns: repeat(4, 1fr);
                gap: 20px;
                margin-bottom: 40px;
            }

            .feature-card {
                background: white;
                padding: 30px 20px;
                border-radius: 12px;
                text-align: center;
                transition: transform 0.3s;
                cursor: pointer;
            }

            .feature-card:hover {
                transform: translateY(-5px);
            }

            .feature-icon {
                font-size: 48px;
                margin-bottom: 15px;
            }

            .feature-title {
                font-size: 16px;
                font-weight: 600;
                color: #333;
                margin-bottom: 8px;
            }

            .feature-desc {
                font-size: 13px;
                color: #666;
            }

            /* Promotional Banners */
            .promo-banners {
                max-width: 1400px;
                margin: 30px auto;
                padding: 0 20px;
            }

            .promo-grid {
                display: grid;
                grid-template-columns: repeat(3, 1fr);
                gap: 20px;
            }

            .promo-card {
                background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
                border-radius: 12px;
                padding: 40px 30px;
                color: white;
                cursor: pointer;
                transition: transform 0.3s;
            }

            .promo-card:nth-child(2) {
                background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            }

            .promo-card:nth-child(3) {
                background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%);
            }

            .promo-card:hover {
                transform: scale(1.03);
            }

            .promo-title {
                font-size: 24px;
                font-weight: bold;
                margin-bottom: 10px;
            }

            .promo-subtitle {
                font-size: 14px;
                opacity: 0.9;
            }

            .main-container {
                max-width: 1400px;
                margin: 30px auto;
                padding: 0 20px;
            }

            .filter-section {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 30px;
            }

            .filter-section h2 {
                font-size: 24px;
                color: #333;
            }

            .filter-buttons {
                display: flex;
                gap: 15px;
            }

            .filter-btn {
                padding: 10px 20px;
                border: 1px solid #ddd;
                background: white;
                border-radius: 20px;
                cursor: pointer;
                transition: all 0.3s;
                display: flex;
                align-items: center;
                gap: 8px;
            }

            .filter-btn.active {
                border-color: #2196F3;
                color: #2196F3;
            }

            .filter-btn:hover {
                border-color: #2196F3;
            }

            .products-grid {
                display: grid;
                grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
                gap: 20px;
            }

            .product-card {
                background: white;
                border-radius: 12px;
                padding: 15px;
                position: relative;
                transition: transform 0.3s, box-shadow 0.3s;
                cursor: pointer;
            }

            .product-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            }

            .discount-badge {
                position: absolute;
                top: 10px;
                left: 10px;
                background: #d32f2f;
                color: white;
                padding: 5px 12px;
                border-radius: 5px;
                font-size: 12px;
                font-weight: bold;
            }

            .installment-badge {
                position: absolute;
                top: 10px;
                right: 10px;
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                color: white;
                padding: 5px 10px;
                border-radius: 5px;
                font-size: 11px;
            }

            .product-icons {
                position: absolute;
                top: 50px;
                right: 10px;
                display: flex;
                flex-direction: column;
                gap: 5px;
            }

            .icon-badge {
                width: 24px;
                height: 24px;
                border-radius: 4px;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 10px;
                color: white;
                font-weight: bold;
            }

            .icon-android {
                background: #3DDC84;
            }
            .icon-ios {
                background: #000;
            }
            .icon-windows {
                background: #0078D4;
            }
            .icon-mac {
                background: #000;
            }

            .product-image {
                width: 100%;
                height: 200px;
                object-fit: contain;
                margin: 20px 0;
            }

            .product-specs {
                font-size: 11px;
                color: #666;
                margin-bottom: 8px;
                line-height: 1.4;
            }

            .product-name {
                font-size: 15px;
                font-weight: 600;
                color: #333;
                margin-bottom: 12px;
                min-height: 40px;
            }

            .price-section {
                display: flex;
                align-items: center;
                gap: 10px;
                margin-bottom: 10px;
            }

            .current-price {
                font-size: 18px;
                font-weight: bold;
                color: #d32f2f;
            }

            .old-price {
                font-size: 14px;
                color: #999;
                text-decoration: line-through;
            }

            .promo-info {
                font-size: 11px;
                color: #666;
                margin-bottom: 5px;
                padding: 5px;
                background: #f8f8f8;
                border-radius: 4px;
            }

            .student-discount {
                color: #9c27b0;
                font-weight: 600;
            }

            .member-discount {
                color: #2196F3;
                font-weight: 600;
            }

            .product-footer {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-top: 15px;
                padding-top: 15px;
                border-top: 1px solid #f0f0f0;
            }

            .rating {
                display: flex;
                align-items: center;
                gap: 5px;
                color: #FFA726;
                font-size: 14px;
                font-weight: bold;
            }

            .favorite-btn {
                color: #2196F3;
                cursor: pointer;
                display: flex;
                align-items: center;
                gap: 5px;
                font-size: 13px;
                transition: color 0.3s;
            }

            .favorite-btn:hover {
                color: #1976D2;
            }

            /* Newsletter Section */
            .newsletter-section {
                max-width: 1400px;
                margin: 60px auto;
                padding: 0 20px;
            }

            .newsletter-box {
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                border-radius: 16px;
                padding: 50px;
                text-align: center;
                color: white;
            }

            .newsletter-box h2 {
                font-size: 32px;
                margin-bottom: 15px;
            }

            .newsletter-box p {
                font-size: 16px;
                margin-bottom: 30px;
                opacity: 0.9;
            }

            .newsletter-form {
                display: flex;
                gap: 15px;
                max-width: 500px;
                margin: 0 auto;
            }

            .newsletter-input {
                flex: 1;
                padding: 15px 20px;
                border: none;
                border-radius: 30px;
                font-size: 14px;
            }

            .newsletter-btn {
                background: white;
                color: #667eea;
                padding: 15px 40px;
                border-radius: 30px;
                border: none;
                font-weight: 600;
                cursor: pointer;
                transition: transform 0.3s;
            }

            .newsletter-btn:hover {
                transform: scale(1.05);
            }

            /* Footer */
            .footer {
                background: #2c3e50;
                color: white;
                padding: 50px 0 20px;
                margin-top: 60px;
            }

            .footer-container {
                max-width: 1400px;
                margin: 0 auto;
                padding: 0 20px;
            }

            .footer-grid {
                display: grid;
                grid-template-columns: repeat(4, 1fr);
                gap: 40px;
                margin-bottom: 40px;
            }

            .footer-column h3 {
                font-size: 18px;
                margin-bottom: 20px;
            }

            .footer-links {
                list-style: none;
            }

            .footer-links li {
                margin-bottom: 12px;
                opacity: 0.8;
                cursor: pointer;
                transition: opacity 0.3s;
            }

            .footer-links li:hover {
                opacity: 1;
            }

            .footer-bottom {
                text-align: center;
                padding-top: 30px;
                border-top: 1px solid rgba(255, 255, 255, 0.1);
                opacity: 0.7;
            }

            .floating-buttons {
                position: fixed;
                bottom: 30px;
                right: 30px;
                display: flex;
                flex-direction: column;
                gap: 15px;
                z-index: 1000;
            }

            .float-btn {
                background: #333;
                color: white;
                padding: 15px 25px;
                border-radius: 30px;
                cursor: pointer;
                transition: all 0.3s;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
                display: flex;
                align-items: center;
                gap: 10px;
                font-weight: 600;
            }

            .float-btn:hover {
                transform: translateY(-3px);
                box-shadow: 0 6px 16px rgba(0, 0, 0, 0.4);
            }

            .float-btn.support {
                background: #d32f2f;
            }

            /* Pagination Styles */
            .pagination {
                display: flex;
                justify-content: center;
                align-items: center;
                gap: 10px;
                margin-top: 40px;
                padding: 20px 0;
            }

            .page-btn {
                padding: 10px 18px;
                background: white;
                color: #333;
                border: 1px solid #ddd;
                border-radius: 8px;
                cursor: pointer;
                transition: all 0.3s;
                text-decoration: none;
                font-weight: 500;
                display: inline-block;
            }

            .page-btn:hover {
                background: #667eea;
                color: white;
                border-color: #667eea;
                transform: translateY(-2px);
            }

            .page-current {
                padding: 10px 18px;
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                color: white;
                border-radius: 8px;
                font-weight: 600;
                display: inline-block;
            }

            @media (max-width: 768px) {
                .products-grid {
                    grid-template-columns: repeat(auto-fill, minmax(160px, 1fr));
                    gap: 10px;
                }

                .filter-buttons {
                    flex-wrap: wrap;
                }

                .header-container {
                    flex-wrap: wrap;
                }

                .search-bar {
                    order: 3;
                    flex-basis: 100%;
                    margin: 15px 0 0 0;
                }

                .features-grid {
                    grid-template-columns: repeat(2, 1fr);
                }

                .promo-grid {
                    grid-template-columns: 1fr;
                }

                .footer-grid {
                    grid-template-columns: repeat(2, 1fr);
                }

                .banner-content h1 {
                    font-size: 32px;
                }

                .newsletter-form {
                    flex-direction: column;
                }

                .pagination {
                    flex-wrap: wrap;
                    gap: 5px;
                }

                .page-btn, .page-current {
                    padding: 8px 14px;
                    font-size: 14px;
                }
            }
        </style>
    </head>
    <body>
        <header class="header">
            <div class="header-container">
                <div class="logo" onclick="window.location.href = 'product'">Group 5</div>
                <div class="header-nav">
                    <div class="nav-item">
                        ⊞ Danh mục ▼
                        <div class="dropdown-menu">

                            <div class="dropdown-item"  onclick="filterCategory(0)">
                                <div class="brand-icon brand-all" >ALL</div>
                                <span>ALL</span>
                            </div>

                            <c:forEach items="${requestScope.category}" var="c">
                                <div class="dropdown-item " onclick="filterCategory(${c.categoryID})">
                                    <div class="brand-icon brand-hp">${c.name}</div>
                                    <span>${c.name}</span>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <div class="search-bar">
                    <input type="text" id="searchInput" placeholder="Bạn muốn mua gì hôm nay?" onkeypress="handleSearch(event)">
                </div>
                <div class="header-actions">
                    <div class="cart-icon" onclick="window.location.href = 'customer/cart.jsp'">🛒 Giỏ hàng</div>
                    <!-- Check if user is logged in -->
                    <c:choose>
                        <c:when test="${sessionScope.accountCustomer != null && sessionScope.infoCustomer !=null}">
                            <!-- User Menu (when logged in) -->
                            <div class="user-menu">
                                <div class="user-avatar">
                                    ${sessionScope.accountCustomer.userName.substring(0,1).toUpperCase()}
                                </div>
                                <span>${sessionScope.infoCustomer.fullName}</span> ▼

                                <div class="user-dropdown">
                                    <div class="user-dropdown-header">
                                        <div class="user-dropdown-name">${sessionScope.infoCustomer.fullName}</div>
                                        <div class="user-dropdown-email">${sessionScope.accountCustomer.userName}</div>
                                    </div>

                                    <a href="customer/profile.jsp" class="user-dropdown-item">
                                        <span class="user-dropdown-icon">👤</span>
                                        <span>Thông tin tài khoản</span>
                                    </a>

                                    <a href="my-order" class="user-dropdown-item">
                                        <span class="user-dropdown-icon">📦</span>
                                        <span>Đơn hàng của tôi</span>
                                    </a>





                                    <a href="logout" class="user-dropdown-item logout" onclick="return confirm('Bạn có chắc muốn đăng xuất?')">
                                        <span class="user-dropdown-icon">🚪</span>
                                        <span>Đăng xuất</span>
                                    </a>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <!-- Login Button (when not logged in) -->
                            <div class="login-btn" onclick="changeToLogin()">👤 Đăng nhập</div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </header>

        <!-- Hero Banner -->
        <section class="hero-banner">
            <div class="banner-slider">
                <div class="banner-content">
                    <h1>🎉 Khuyến mãi lớn mùa thu</h1>
                    <p>Giảm giá đến 50% cho các sản phẩm laptop cao cấp</p>
                    <div class="banner-btn" onclick="scrollToProduct()">Khám phá ngay</div>
                </div>
            </div>
        </section>

        <!-- Features Section -->
        <section class="features-section">
            <div class="features-grid">
                <div class="feature-card">
                    <div class="feature-icon">🚚</div>
                    <div class="feature-title">Miễn phí vận chuyển</div>
                    <div class="feature-desc">Cho đơn hàng trên 5 triệu</div>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">🔒</div>
                    <div class="feature-title">Thanh toán an toàn</div>
                    <div class="feature-desc">Bảo mật 100%</div>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">🎁</div>
                    <div class="feature-title">Quà tặng hấp dẫn</div>
                    <div class="feature-desc">Nhiều ưu đãi đặc biệt</div>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">⭐</div>
                    <div class="feature-title">Bảo hành chính hãng</div>
                    <div class="feature-desc">Hỗ trợ 24/7</div>
                </div>
            </div>
        </section>

        <!-- Promotional Banners -->
        <section class="promo-banners">
            <div class="promo-grid">
                <div class="promo-card">
                    <div class="promo-title">💳 Trả góp 0%</div>
                    <div class="promo-subtitle">Duyệt nhanh - Không cần thẻ tín dụng</div>
                </div>
                <div class="promo-card">
                    <div class="promo-title">🎓 Ưu đãi sinh viên</div>
                    <div class="promo-subtitle">Giảm thêm 500.000đ khi xuất trình thẻ</div>
                </div>
                <div class="promo-card">
                    <div class="promo-title">🔄 Thu cũ đổi mới</div>
                    <div class="promo-subtitle">Trợ giá lên đến 2 triệu đồng</div>
                </div>
            </div>
        </section>

        <main class="main-container" id="product-section">
            <div class="filter-section">
                <h2>🔥 Sản phẩm nổi bật</h2>
            </div>

            <div class="products-grid">

                <c:forEach items="${requestScope.product}" var="c">
                    <!-- Product -->
                    <div class="product-card" onclick="hrefToDetail(${c.productID})">

                        <div class="product-icons">
                            <div class="icon-badge icon-android">A</div>
                            <div class="icon-badge icon-ios">🍎</div>
                            <div class="icon-badge icon-windows">W</div>
                        </div>

                        <img src="${c.image[0]}" alt="Acer Laptop" class="product-image">

                        <div class="product-name">${c.name}</div>
                        <div class="price-section">
                            <div class="current-price">${c.getFormattedPrice()}</div>

                        </div>
                        <div class="promo-info member-discount">Smember giảm đến 190.000đ</div>
                        <div class="promo-info student-discount">S-Student giảm thêm 500.000đ</div>
                        <div class="promo-info">Tặng Sim/Esim VNSKY, có ngay 5GB data 5G/ngay, miễn phí 30...</div>
                        <div class="product-footer">
                            <div class="rating">⭐ 5</div>
                            <div class="favorite-btn">♡ Yêu thích</div>
                        </div>
                    </div>
                </c:forEach>

            </div>

            <!-- Pagination -->
            <div class="pagination">
                <c:if test="${currentPage > 1}">
                    <a href="product?page=${currentPage - 1}" class="page-btn">← Prev</a>
                </c:if>
                <c:forEach begin="1" end="${totalPages}" var="i">
                    <c:choose>
                        <c:when test="${i == currentPage}">
                            <span class="page-current">${i}</span>
                        </c:when>
                        <c:otherwise>
                            <a href="product?page=${i}" class="page-btn">${i}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <c:if test="${currentPage < totalPages}">
                    <a href="product?page=${currentPage + 1}" class="page-btn">Next →</a>
                </c:if>
            </div>
        </main>

        <!-- Newsletter Section -->
        <section class="newsletter-section">
            <div class="newsletter-box">
                <h2>📧 Đăng ký nhận tin khuyến mãi</h2>
                <p>Nhận ngay mã giảm giá 200.000đ cho đơn hàng đầu tiên</p>
                <div class="newsletter-form">
                    <input type="email" class="newsletter-input" placeholder="Nhập email của bạn...">
                    <button class="newsletter-btn">Đăng ký</button>
                </div>
            </div>
        </section>

        <!-- Footer -->
        <footer class="footer">
            <div class="footer-container">
                <div class="footer-grid">
                    <div class="footer-column">
                        <h3>Về chúng tôi</h3>
                        <ul class="footer-links">
                            <li>Giới thiệu công ty</li>
                            <li>Tuyển dụng</li>
                            <li>Tin tức</li>
                            <li>Liên hệ</li>
                        </ul>
                    </div>
                    <div class="footer-column">
                        <h3>Chính sách</h3>
                        <ul class="footer-links">
                            <li>Chính sách bảo hành</li>
                            <li>Chính sách đổi trả</li>
                            <li>Chính sách thanh toán</li>
                            <li>Chính sách vận chuyển</li>
                        </ul>
                    </div>
                    <div class="footer-column">
                        <h3>Hỗ trợ khách hàng</h3>
                        <ul class="footer-links">
                            <li>📞 Hotline: 1900-xxxx</li>
                            <li>📧 Email: support@group5.com</li>
                            <li>🕐 8:00 - 22:00 hàng ngày</li>
                            <li>Hướng dẫn mua hàng</li>
                        </ul>
                    </div>
                    <div class="footer-column">
                        <h3>Kết nối với chúng tôi</h3>
                        <ul class="footer-links">
                            <li>📘 Facebook</li>
                            <li>📸 Instagram</li>
                            <li>🐦 Twitter</li>
                            <li>▶️ YouTube</li>
                        </ul>
                    </div>
                </div>
                <div class="footer-bottom">
                    <p>© 2025 Group 5. All rights reserved.</p>
                </div>
            </div>
        </footer>

        <div class="floating-buttons">
            <div class="float-btn" onclick="scrollToTop()"> 🔝 Lên đầu </div>
            <div class="float-btn support">🎧 Liên hệ</div>
        </div>
    </body>
    <script>
        function filterCategory(id) {
            if (id == 0) {
                window.location.href = "product#product-section";
            } else {
                window.location.href = "category?id=" + id + "#product-section";
            }
        }

        function changeToLogin() {
            window.location.href = "common/login.jsp";
        }


        function handleSearch(event) {
            if (event.key === "Enter") {
                const keyword = document.getElementById("searchInput").value.trim();
                if (keyword !== "") {
                    window.location.href = "search?keyword=" + encodeURIComponent(keyword);
                }
            }
        }

        function hrefToDetail(id) {
            window.location.href = "product-detail?id=" + id;
        }
        function scrollToTop() {
            window.scrollTo({top: 0, behavior: 'smooth'});
        }

        function scrollToProduct() {
            document.getElementById("product-section").scrollIntoView({behavior: "smooth"});
        }


    </script>
</html>