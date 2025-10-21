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
            }

            .nav-item:hover {
                background: rgba(255, 255, 255, 0.1);
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

            .cart-icon, .login-btn {
                background: rgba(255, 255, 255, 0.15);
                padding: 8px 16px;
                border-radius: 20px;
                cursor: pointer;
                transition: background 0.3s;
            }

            .cart-icon:hover, .login-btn:hover {
                background: rgba(255, 255, 255, 0.25);
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
        </style>
    </head>
    <body>
        <header class="header">
            <div class="header-container">
                <div class="logo">Group 5</div>
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
                    <div class="cart-icon">🛒 Giỏ hàng</div>
                    <div class="login-btn">👤 Đăng nhập</div>
                </div>
            </div>
        </header>

        <main class="main-container">


            <div class="products-grid">

                <c:forEach items="${requestScope.product}" var="c">
                    <!-- Product -->
                    <div class="product-card">

                        <div class="product-icons">
                            <div class="icon-badge icon-android">A</div>
                            <div class="icon-badge icon-ios">🍎</div>
                            <div class="icon-badge icon-windows">W</div>
                        </div>
                        <img src="${pageContext.request.contextPath}/images/${c.image}" alt="Acer Laptop" class="product-image">

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
        </main>

        <div class="floating-buttons">
            <div class="float-btn">🔝 Lên đầu</div>
            <div class="float-btn support">🎧 Liên hệ</div>
        </div>
    </body>
    <script>
        function filterCategory(id) {
            if (id == 0) {
                window.location.href = "product"; // hiển thị tất cả sản phẩm
            } else {
                window.location.href = "category?id=" + id; // lọc theo id danh mục
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

    </script>
</html>
