<%-- 
    Document   : detail
    Created on : Oct 23, 2025
    Author     : trong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>${product.name} - Group 5</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Arial, sans-serif;
                background-color: #f4f4f4;
            }

            .header {
                background: linear-gradient(135deg, #d32f2f 0%, #e74c3c 100%);
                color: white;
                padding: 15px 0;
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
                background: #0096D6;
                color: white;
            }

            .brand-all {
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
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
            
            .user-menu {
                display: flex;
                align-items: center;
                gap: 8px;
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

            /* Breadcrumb */
            .breadcrumb {
                max-width: 1400px;
                margin: 20px auto;
                padding: 0 20px;
                display: flex;
                gap: 10px;
                align-items: center;
                font-size: 14px;
                color: #666;
            }

            .breadcrumb a {
                color: #667eea;
                text-decoration: none;
            }

            .breadcrumb a:hover {
                text-decoration: underline;
            }

            /* Product Detail Section */
            .product-detail-container {
                max-width: 1400px;
                margin: 20px auto;
                padding: 0 20px;
            }

            .product-detail-grid {
                display: grid;
                grid-template-columns: 1fr 1fr;
                gap: 40px;
                background: white;
                border-radius: 16px;
                padding: 40px;
                margin-bottom: 30px;
            }

            .product-gallery {
                position: sticky;
                top: 20px;
                height: fit-content;
            }

            .main-image {
                width: 100%;
                height: 500px;
                object-fit: contain;
                background: #f8f8f8;
                border-radius: 12px;
                padding: 20px;
                margin-bottom: 20px;
                background-color: white;
            }

            .thumbnail-gallery {
                display: grid;
                grid-template-columns: repeat(4, 1fr);
                gap: 10px;
            }

            .thumbnail {
                width: 100%;
                height: 100px;
                object-fit: contain;
                background: #f8f8f8;
                border-radius: 8px;
                padding: 10px;
                cursor: pointer;
                border: 2px solid transparent;
                transition: all 0.3s;
                background-color: white;
            }

            .thumbnail:hover, .thumbnail.active {
                border-color: #667eea;
            }

            .product-info {
                display: flex;
                flex-direction: column;
            }

            .product-title {
                font-size: 28px;
                font-weight: bold;
                color: #333;
                margin-bottom: 15px;
            }

            .product-rating {
                display: flex;
                align-items: center;
                gap: 15px;
                margin-bottom: 20px;
                padding-bottom: 20px;
                border-bottom: 1px solid #f0f0f0;
            }

            .stars {
                display: flex;
                gap: 5px;
                color: #FFA726;
                font-size: 18px;
            }

            .rating-text {
                color: #666;
                font-size: 14px;
            }

            .product-price-section {
                background: linear-gradient(135deg, #fff5f5 0%, #ffe6e6 100%);
                padding: 25px;
                border-radius: 12px;
                margin-bottom: 25px;
            }

            .current-price {
                font-size: 36px;
                font-weight: bold;
                color: #d32f2f;
                margin-bottom: 10px;
            }

            .old-price {
                font-size: 20px;
                color: #999;
                text-decoration: line-through;
                margin-right: 15px;
            }

            .discount-percentage {
                display: inline-block;
                background: #d32f2f;
                color: white;
                padding: 5px 12px;
                border-radius: 5px;
                font-weight: bold;
                font-size: 14px;
            }

            .promotion-badges {
                display: flex;
                flex-wrap: wrap;
                gap: 10px;
                margin-top: 15px;
            }

            .badge {
                padding: 8px 15px;
                border-radius: 20px;
                font-size: 13px;
                font-weight: 600;
            }

            .badge-student {
                background: #f3e5f5;
                color: #9c27b0;
            }

            .badge-member {
                background: #e3f2fd;
                color: #2196F3;
            }

            .badge-installment {
                background: #f3e5f5;
                color: #667eea;
            }

            .product-specs {
                margin-bottom: 25px;
            }

            .specs-title {
                font-size: 18px;
                font-weight: bold;
                margin-bottom: 15px;
                color: #333;
            }

            .specs-list {
                list-style: none;
            }

            .specs-list li {
                padding: 12px 0;
                border-bottom: 1px solid #f0f0f0;
                display: flex;
                justify-content: space-between;
                font-size: 14px;
            }

            .spec-label {
                color: #666;
                font-weight: 500;
            }

            .spec-value {
                color: #333;
                font-weight: 600;
            }

            .quantity-selector {
                display: flex;
                align-items: center;
                gap: 15px;
                margin-bottom: 25px;
            }

            .quantity-label {
                font-weight: 600;
                color: #333;
            }

            .quantity-controls {
                display: flex;
                align-items: center;
                border: 2px solid #ddd;
                border-radius: 8px;
                overflow: hidden;
            }

            .qty-btn {
                width: 40px;
                height: 40px;
                background: white;
                border: none;
                cursor: pointer;
                font-size: 20px;
                color: #667eea;
                transition: background 0.3s;
            }

            .qty-btn:hover {
                background: #f0f0f0;
            }

            .qty-input {
                width: 60px;
                height: 40px;
                border: none;
                text-align: center;
                font-size: 16px;
                font-weight: bold;
            }

            .action-buttons {
                display: flex;
                gap: 15px;
                margin-bottom: 25px;
            }

            .btn {
                flex: 1;
                padding: 18px;
                border: none;
                border-radius: 12px;
                font-size: 16px;
                font-weight: 600;
                cursor: pointer;
                transition: all 0.3s;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 10px;
            }

            .btn-primary {
                background: linear-gradient(135deg, #d32f2f 0%, #e74c3c 100%);
                color: white;
            }

            .btn-primary:hover {
                transform: translateY(-2px);
                box-shadow: 0 8px 20px rgba(211, 47, 47, 0.3);
            }

            .btn-secondary {
                background: white;
                color: #667eea;
                border: 2px solid #667eea;
            }

            .btn-secondary:hover {
                background: #667eea;
                color: white;
            }

            .product-features {
                background: #f8f8f8;
                padding: 20px;
                border-radius: 12px;
                margin-bottom: 25px;
            }

            .features-grid {
                display: grid;
                grid-template-columns: repeat(2, 1fr);
                gap: 15px;
            }

            .feature-item {
                display: flex;
                align-items: center;
                gap: 10px;
                font-size: 14px;
                color: #333;
            }

            .feature-icon {
                font-size: 20px;
            }

            /* Product Tabs */
            .product-tabs {
                background: white;
                border-radius: 16px;
                padding: 30px;
                margin-bottom: 30px;
            }

            .tabs-header {
                display: flex;
                gap: 30px;
                border-bottom: 2px solid #f0f0f0;
                margin-bottom: 30px;
            }

            .tab-btn {
                padding: 15px 0;
                font-size: 16px;
                font-weight: 600;
                color: #666;
                background: none;
                border: none;
                cursor: pointer;
                position: relative;
                transition: color 0.3s;
            }

            .tab-btn.active {
                color: #667eea;
            }

            .tab-btn.active::after {
                content: '';
                position: absolute;
                bottom: -2px;
                left: 0;
                right: 0;
                height: 2px;
                background: #667eea;
            }

            .tab-content {
                display: none;
            }

            .tab-content.active {
                display: block;
            }

            .description-content {
                font-size: 15px;
                line-height: 1.8;
                color: #333;
            }

            .description-content h3 {
                margin-top: 20px;
                margin-bottom: 10px;
                color: #333;
            }

            .description-content ul {
                margin-left: 20px;
                margin-bottom: 15px;
            }

            .description-content li {
                margin-bottom: 8px;
            }

            /* Related Products Section */
            .related-products {
                max-width: 1400px;
                margin: 40px auto;
                padding: 0 20px;
            }

            .section-title {
                font-size: 24px;
                font-weight: bold;
                color: #333;
                margin-bottom: 25px;
                display: flex;
                align-items: center;
                gap: 10px;
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

            .product-image {
                width: 100%;
                height: 200px;
                object-fit: contain;
                margin: 20px 0;
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

            .product-price {
                font-size: 18px;
                font-weight: bold;
                color: #d32f2f;
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


            @media (max-width: 768px) {
                .product-detail-grid {
                    grid-template-columns: 1fr;
                    gap: 20px;
                    padding: 20px;
                }

                .main-image {
                    height: 300px;
                }

                .product-title {
                    font-size: 22px;
                }

                .current-price {
                    font-size: 28px;
                }

                .action-buttons {
                    flex-direction: column;
                }

                .features-grid {
                    grid-template-columns: 1fr;
                }

                .footer-grid {
                    grid-template-columns: repeat(2, 1fr);
                }

                .products-grid {
                    grid-template-columns: repeat(auto-fill, minmax(160px, 1fr));
                }
            }
        </style>
    </head>
    <body>
        <!-- Header (same as index.jsp) -->
        <header class="header">
            <div class="header-container">
                <div class="logo" onclick="window.location.href = 'product'">Group 5</div>
                <div class="header-nav">
                    <div class="nav-item">
                        ⊞ Danh mục ▼
                        <div class="dropdown-menu">
                            <div class="dropdown-item" onclick="filterCategory(0)">
                                <div class="brand-icon brand-all">ALL</div>
                                <span>ALL</span>
                            </div>
                            <c:forEach items="${requestScope.listCategory}" var="c">
                                <div class="dropdown-item" onclick="filterCategory(${c.categoryID})">
                                    <div class="brand-icon">${c.name}</div>
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
                    <div class="cart-icon">🛒 Giỏ hàng</div>
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

                                    <a href="profile.jsp" class="user-dropdown-item">
                                        <span class="user-dropdown-icon">👤</span>
                                        <span>Thông tin tài khoản</span>
                                    </a>

                                    <a href="orders.jsp" class="user-dropdown-item">
                                        <span class="user-dropdown-icon">📦</span>
                                        <span>Đơn hàng của tôi</span>
                                    </a>



                                    <a href="addresses.jsp" class="user-dropdown-item">
                                        <span class="user-dropdown-icon">📍</span>
                                        <span>Địa chỉ giao hàng</span>
                                    </a>

                                    <a href="settings.jsp" class="user-dropdown-item">
                                        <span class="user-dropdown-icon">⚙️</span>
                                        <span>Cài đặt</span>
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

        <!-- Breadcrumb -->
        <div class="breadcrumb">
            <a href="product">Trang chủ</a> / 
            <a href="category?id=${product.category.categoryID}">${product.category.name}</a> / 
            <span>${product.name}</span>
        </div>

        <!-- Product Detail -->
        <div class="product-detail-container">
            <div class="product-detail-grid">
                <!-- Product Gallery -->

                <div class="product-gallery">
                    <img src="${product.image[0]}" alt="${product.name}" class="main-image" id="mainImage">
                    <div class="thumbnail-gallery">
                        <img src="${product.image[1]}" class="thumbnail active" onclick="changeImage(this)">
                        <img src="${product.image[2]}" class="thumbnail" onclick="changeImage(this)">
                        <img src="${product.image[3]}" class="thumbnail" onclick="changeImage(this)">
                        <img src="${product.image[4]}" class="thumbnail" onclick="changeImage(this)">
                    </div>
                </div>

                <!-- Product Info -->
                <div class="product-info">
                    <h1 class="product-title">${product.name}</h1>

                    <div class="product-rating">
                        <div class="stars">⭐⭐⭐⭐⭐</div>
                        <span class="rating-text">(128 đánh giá)</span>
                        <span class="rating-text">|</span>
                        <span class="rating-text">Đã bán: 245</span>
                    </div>

                    <div class="product-price-section">
                        <div class="current-price">${product.getFormattedPrice()}</div>
                        <div>

                            <span class="discount-percentage">-15%</span>
                        </div>
                        <div class="promotion-badges">
                            <span class="badge badge-student">🎓 S-Student giảm thêm 500.000đ</span>
                            <span class="badge badge-member">👤 Smember giảm đến 190.000đ</span>
                            <span class="badge badge-installment">💳 Trả góp 0% lãi suất</span>
                        </div>
                    </div>

                    <div class="product-specs">
                        <h3 class="specs-title">Thông số kỹ thuật</h3>
                        <ul class="specs-list">
                            <li>
                                <span class="spec-label">CPU:</span>
                                <span class="spec-value">Intel Core i5-12450H</span>
                            </li>
                            <li>
                                <span class="spec-label">RAM:</span>
                                <span class="spec-value">8GB DDR4</span>
                            </li>
                            <li>
                                <span class="spec-label">Ổ cứng:</span>
                                <span class="spec-value">512GB SSD</span>
                            </li>
                            <li>
                                <span class="spec-label">Màn hình:</span>
                                <span class="spec-value">15.6 inch FHD</span>
                            </li>
                            <li>
                                <span class="spec-label">Card đồ họa:</span>
                                <span class="spec-value">NVIDIA GTX 1650</span>
                            </li>
                            <li>
                                <span class="spec-label">Trọng lượng:</span>
                                <span class="spec-value">1.8 kg</span>
                            </li>
                        </ul>
                    </div>

                    <div class="quantity-selector">
                        <span class="quantity-label">Số lượng:</span>
                        <div class="quantity-controls">
                            <button class="qty-btn" onclick="decreaseQty()">-</button>
                            <input type="number" class="qty-input" id="quantity" value="1" min="1" max="10">
                            <button class="qty-btn" onclick="increaseQty()">+</button>
                        </div>
                    </div>

                    <div class="action-buttons">
                        <button class="btn btn-secondary">🛒 Thêm vào giỏ</button>
                        <button class="btn btn-primary">⚡ Mua ngay</button>
                    </div>

                    <div class="product-features">
                        <div class="features-grid">
                            <div class="feature-item">
                                <span class="feature-icon">🚚</span>
                                <span>Miễn phí vận chuyển</span>
                            </div>
                            <div class="feature-item">
                                <span class="feature-icon">🔒</span>
                                <span>Thanh toán an toàn</span>
                            </div>
                            <div class="feature-item">
                                <span class="feature-icon">🎁</span>
                                <span>Quà tặng hấp dẫn</span>
                            </div>
                            <div class="feature-item">
                                <span class="feature-icon">⭐</span>
                                <span>Bảo hành 12 tháng</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Product Tabs -->
            <div class="product-tabs">
                <div class="tabs-header">
                    <button class="tab-btn active" onclick="switchTab('description')">Mô tả sản phẩm</button>
                    <button class="tab-btn" onclick="switchTab('specs')">Thông số chi tiết</button>
                    <button class="tab-btn" onclick="switchTab('reviews')">Đánh giá (128)</button>
                </div>

                <div class="tab-content active" id="description">
                    <div class="description-content">
                        <h3>Giới thiệu ${product.name}</h3>
                        <p>${product.description != null ? product.description : 'Laptop gaming hiệu năng cao, thiết kế hiện đại, phù hợp cho game thủ và người làm đồ họa chuyên nghiệp.'}</p>

                        <h3>Đặc điểm nổi bật</h3>
                        <ul>
                            <li>Hiệu năng mạnh mẽ với chip xử lý thế hệ mới</li>
                            <li>Màn hình sắc nét, độ phân giải cao</li>
                            <li>Card đồ họa rời cho trải nghiệm gaming mượt mà</li>
                            <li>Hệ thống tản nhiệt hiệu quả</li>
                            <li>Bàn phím RGB đèn nền đầy đủ</li>
                            <li>Pin sử dụng lâu dài</li>
                        </ul>

                        <h3>Trong hộp bao gồm</h3>
                        <ul>
                            <li>Laptop ${product.name}</li>
                            <li>Sạc nguồn</li>
                            <li>Sách hướng dẫn sử dụng</li>
                            <li>Thẻ bảo hành chính hãng</li>
                        </ul>
                    </div>
                </div>

                <div class="tab-content" id="specs">
                    <div class="description-content">
                        <h3>Thông số kỹ thuật chi tiết</h3>
                        <p>Thông tin đầy đủ về cấu hình sản phẩm...</p>
                    </div>
                </div>

                <div class="tab-content" id="reviews">
                    <div class="description-content">
                        <h3>Đánh giá từ khách hàng</h3>
                        <p>Các đánh giá và nhận xét từ người mua...</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Related Products -->
        <section class="related-products">
            <h2 class="section-title">🔥 Sản phẩm liên quan</h2>
            <div class="products-grid">
                <c:forEach items="${requestScope.relatedProducts}" var="p">
                    <div class="product-card" onclick="hrefToDetail(${p.productID})">
                        <img src="${p.image[0]}" alt="${p.name}" class="product-image">
                        <div class="product-name">${p.name}</div>
                        <div class="price-section">
                            <div class="product-price">${p.getFormattedPrice()}</div>
                        </div>
                        <div class="product-footer">
                            <div class="rating">⭐ 5</div>
                            <div class="favorite-btn">♡ Yêu thích</div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </section>

        <!-- Footer (same as index.jsp) -->
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
            <div class="float-btn" onclick="scrollToTop()">🔝 Lên đầu</div>
            <div class="float-btn support">🎧 Liên hệ</div>
        </div>

        <script>
            function filterCategory(id) {
                if (id == 0) {
                    window.location.href = "product";
                } else {
                    window.location.href = "category?id=" + id;
                }
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
                window.location.href = "detail?id=" + id;
            }

            function changeImage(thumbnail) {
                document.querySelectorAll('.thumbnail').forEach(t => t.classList.remove('active'));
                thumbnail.classList.add('active');
                document.getElementById('mainImage').src = thumbnail.src;
            }

            function increaseQty() {
                const qtyInput = document.getElementById('quantity');
                if (parseInt(qtyInput.value) < parseInt(qtyInput.max)) {
                    qtyInput.value = parseInt(qtyInput.value) + 1;
                }
            }

            function decreaseQty() {
                const qtyInput = document.getElementById('quantity');
                if (parseInt(qtyInput.value) > parseInt(qtyInput.min)) {
                    qtyInput.value = parseInt(qtyInput.value) - 1;
                }
            }

            function switchTab(tabName) {
                document.querySelectorAll('.tab-btn').forEach(btn => btn.classList.remove('active'));
                document.querySelectorAll('.tab-content').forEach(content => content.classList.remove('active'));

                event.target.classList.add('active');
                document.getElementById(tabName).classList.add('active');
            }

            function scrollToTop() {
                window.scrollTo({top: 0, behavior: 'smooth'});
            }

            // Show/hide floating buttons based on scroll
            window.addEventListener('scroll', function () {
                const floatingButtons = document.querySelector('.floating-buttons');
                if (window.scrollY > 300) {
                    floatingButtons.style.display = 'flex';
                } else {
                    floatingButtons.style.display = 'none';
                }
            });
        </script>
    </body>
</html>