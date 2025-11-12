<%-- 
    Document   : cart
    Created on : Nov 10, 2025, 10:56:47 PM
    Author     : trong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Giỏ hàng - Group 5</title>
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

            .cart-badge {
                background: rgba(255, 255, 255, 0.3);
                color: white;
                padding: 2px 10px;
                border-radius: 12px;
                font-size: 14px;
                font-weight: bold;
                margin-left: 8px;
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

            /* Cart Container */
            .cart-container {
                max-width: 1400px;
                margin: 30px auto;
                padding: 0 20px;
                display: grid;
                grid-template-columns: 1fr 400px;
                gap: 30px;
            }

            .cart-title {
                font-size: 28px;
                font-weight: bold;
                color: #333;
                margin-bottom: 20px;
                grid-column: 1 / -1;
            }

            /* Cart Items Section */
            .cart-items {
                background: white;
                border-radius: 16px;
                padding: 0;
                overflow: hidden;
            }

            .cart-header {
                display: grid;
                grid-template-columns: 50px 1fr 150px 120px 120px 50px;
                gap: 20px;
                padding: 20px 25px;
                background: #f8f8f8;
                font-weight: 600;
                color: #666;
                font-size: 14px;
                border-bottom: 2px solid #e0e0e0;
            }

            .cart-item {
                display: grid;
                grid-template-columns: 50px 1fr 150px 120px 120px 50px;
                gap: 20px;
                padding: 25px;
                border-bottom: 1px solid #f0f0f0;
                align-items: center;
                transition: background 0.2s;
            }

            .cart-item:hover {
                background: #fafafa;
            }

            .item-checkbox {
                width: 20px;
                height: 20px;
                cursor: pointer;
            }

            .item-info {
                display: flex;
                gap: 15px;
                align-items: center;
            }

            .item-image {
                width: 80px;
                height: 80px;
                object-fit: contain;
                background: #f8f8f8;
                border-radius: 8px;
                padding: 5px;
            }

            .item-details {
                flex: 1;
            }

            .item-name {
                font-size: 15px;
                font-weight: 600;
                color: #333;
                margin-bottom: 8px;
                line-height: 1.4;
            }

            .item-specs {
                font-size: 13px;
                color: #666;
            }

            .item-price {
                font-size: 18px;
                font-weight: bold;
                color: #d32f2f;
            }

            .item-quantity {
                display: flex;
                align-items: center;
                border: 2px solid #ddd;
                border-radius: 8px;
                overflow: hidden;
                width: fit-content;
            }

            .qty-btn {
                width: 35px;
                height: 35px;
                background: white;
                border: none;
                cursor: pointer;
                font-size: 18px;
                color: #667eea;
                transition: background 0.2s;
            }

            .qty-btn:hover {
                background: #f0f0f0;
            }

            .qty-btn:disabled {
                color: #ccc;
                cursor: not-allowed;
            }

            .qty-input {
                width: 45px;
                height: 35px;
                border: none;
                text-align: center;
                font-size: 15px;
                font-weight: bold;
            }

            .item-total {
                font-size: 18px;
                font-weight: bold;
                color: #333;
            }

            .item-remove {
                color: #d32f2f;
                cursor: pointer;
                font-size: 20px;
                transition: transform 0.2s;
            }

            .item-remove:hover {
                transform: scale(1.2);
            }

            /* Cart Summary */
            .cart-summary {
                background: white;
                border-radius: 16px;
                padding: 25px;
                height: fit-content;
                position: sticky;
                top: 105px;
            }

            .summary-title {
                font-size: 20px;
                font-weight: bold;
                color: #333;
                margin-bottom: 20px;
                padding-bottom: 15px;
                border-bottom: 2px solid #f0f0f0;
            }

            .summary-row {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 15px;
                font-size: 15px;
            }

            .summary-label {
                color: #666;
            }

            .summary-value {
                font-weight: 600;
                color: #333;
            }

            .summary-divider {
                height: 1px;
                background: #e0e0e0;
                margin: 20px 0;
            }

            .summary-total {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 25px;
                font-size: 18px;
            }

            .total-label {
                font-weight: 600;
                color: #333;
            }

            .total-value {
                font-size: 24px;
                font-weight: bold;
                color: #d32f2f;
            }

            .voucher-section {
                margin-bottom: 20px;
            }

            .voucher-input {
                display: flex;
                gap: 10px;
                margin-top: 10px;
            }

            .voucher-input input {
                flex: 1;
                padding: 12px 15px;
                border: 2px solid #ddd;
                border-radius: 8px;
                font-size: 14px;
            }

            .voucher-btn {
                padding: 12px 20px;
                background: #667eea;
                color: white;
                border: none;
                border-radius: 8px;
                cursor: pointer;
                font-weight: 600;
                transition: background 0.3s;
            }

            .voucher-btn:hover {
                background: #5568d3;
            }

            .checkout-btn {
                width: 100%;
                padding: 18px;
                background: linear-gradient(135deg, #d32f2f 0%, #e74c3c 100%);
                color: white;
                border: none;
                border-radius: 12px;
                font-size: 16px;
                font-weight: bold;
                cursor: pointer;
                transition: all 0.3s;
                margin-bottom: 15px;
            }

            .checkout-btn:hover {
                transform: translateY(-2px);
                box-shadow: 0 8px 20px rgba(211, 47, 47, 0.3);
            }

            .checkout-btn:disabled {
                background: #ccc;
                cursor: not-allowed;
                transform: none;
            }

            .continue-shopping {
                width: 100%;
                padding: 15px;
                background: white;
                color: #667eea;
                border: 2px solid #667eea;
                border-radius: 12px;
                font-size: 15px;
                font-weight: 600;
                cursor: pointer;
                transition: all 0.3s;
            }

            .continue-shopping:hover {
                background: #667eea;
                color: white;
            }

            /* Empty Cart */
            .empty-cart {
                text-align: center;
                padding: 80px 20px;
                background: white;
                border-radius: 16px;
                grid-column: 1 / -1;
            }

            .empty-cart-icon {
                font-size: 80px;
                margin-bottom: 20px;
                opacity: 0.5;
            }

            .empty-cart-text {
                font-size: 20px;
                color: #666;
                margin-bottom: 30px;
            }

            .shop-now-btn {
                padding: 15px 40px;
                background: linear-gradient(135deg, #d32f2f 0%, #e74c3c 100%);
                color: white;
                border: none;
                border-radius: 12px;
                font-size: 16px;
                font-weight: bold;
                cursor: pointer;
                transition: all 0.3s;
            }

            .shop-now-btn:hover {
                transform: translateY(-2px);
                box-shadow: 0 8px 20px rgba(211, 47, 47, 0.3);
            }

            /* Select All */
            .select-all-section {
                display: flex;
                align-items: center;
                gap: 10px;
                padding: 20px 25px;
                background: #f8f8f8;
                border-bottom: 2px solid #e0e0e0;
            }

            .select-all-section input {
                width: 20px;
                height: 20px;
                cursor: pointer;
            }

            .select-all-section label {
                font-weight: 600;
                color: #333;
                cursor: pointer;
            }

            .delete-selected {
                margin-left: auto;
                color: #d32f2f;
                cursor: pointer;
                font-weight: 600;
                transition: color 0.2s;
            }

            .delete-selected:hover {
                color: #b71c1c;
            }

            /* Promotion Banner */
            .promotion-banner {
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                color: white;
                padding: 15px 25px;
                border-radius: 12px;
                margin-bottom: 20px;
                display: flex;
                align-items: center;
                gap: 15px;
            }

            .promotion-icon {
                font-size: 30px;
            }

            .promotion-text {
                flex: 1;
            }

            .promotion-title {
                font-weight: bold;
                margin-bottom: 5px;
            }

            .promotion-desc {
                font-size: 13px;
                opacity: 0.9;
            }

            @media (max-width: 1024px) {
                .cart-container {
                    grid-template-columns: 1fr;
                }

                .cart-summary {
                    position: static;
                }

                .cart-header {
                    display: none;
                }

                .cart-item {
                    grid-template-columns: 1fr;
                    gap: 15px;
                }

                .item-info {
                    grid-column: 1;
                }

                .item-price, .item-quantity, .item-total {
                    justify-self: start;
                }

                .item-remove {
                    position: absolute;
                    top: 25px;
                    right: 25px;
                }
            }
        </style>
    </head>
    <body>
        <!-- Header -->
        <header class="header">
            <div class="header-container">
                <div class="logo" onclick="window.location.href = '../product'">Group 5</div>
                <div class="search-bar">
                    <input type="text" id="searchInput" placeholder="Bạn muốn mua gì hôm nay?" onkeypress="handleSearch(event)">
                </div>
                <div class="header-actions">
                    <div class="cart-icon" onclick="window.location.href = 'cart.jsp'">
                        🛒 Giỏ hàng
                        <span class="cart-badge" id="cartCount">0</span>
                    </div>
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

                                    <a href="../my-order" class="user-dropdown-item">
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

        <div class="cart-container">
            <h1 class="cart-title">🛒 Giỏ hàng của bạn</h1>

            <!-- Check if cart is empty -->
            <c:choose>
                <c:when test="${empty sessionScope.cart || sessionScope.cart.size() == 0}">
                    <div class="empty-cart">
                        <div class="empty-cart-icon">🛒</div>
                        <div class="empty-cart-text">Giỏ hàng của bạn đang trống</div>
                        <button class="shop-now-btn" onclick="window.location.href = '../product'">
                            Mua sắm ngay
                        </button>
                    </div>
                </c:when>
                <c:otherwise>
                    <!-- Cart Items -->
                    <div class="cart-items">
                        <div class="select-all-section">
                            <input type="checkbox" id="selectAll" onchange="toggleSelectAll()">
                            <label for="selectAll">Chọn tất cả (${sessionScope.cart.size()} sản phẩm)</label>
                            <span class="delete-selected" onclick="deleteSelected()">🗑️ Xóa đã chọn</span>
                        </div>

                        <div class="cart-header">
                            <div></div>
                            <div>Sản phẩm</div>
                            <div>Đơn giá</div>
                            <div>Số lượng</div>
                            <div>Thành tiền</div>
                            <div></div>
                        </div>
                        <form id="checkoutForm" method="POST" action="../checkout">
                            <c:forEach items="${sessionScope.cart.items}" var="item" varStatus="status">
                                <div class="cart-item" data-product-id="${item.product.productID}">
                                    <input type="checkbox" class="item-checkbox" onchange="updateSummary()">

                                    <div class="item-info">
                                        <img src="${item.product.image[0]}" alt="${item.product.name}" class="item-image">
                                        <div class="item-details">
                                            <div class="item-name">${item.product.name}</div>
                                            <div class="item-specs">CPU: i5-12450H | RAM: 8GB | SSD: 512GB</div>
                                        </div>
                                    </div>

                                    <div class="item-price">${item.product.getFormattedPrice()}</div>

                                    <div class="item-quantity">
                                        <button class="qty-btn" onclick="decreaseQuantity(${item.product.productID})">-</button>
                                        <input type="number" class="qty-input" value="${item.quantity}" 
                                               min="1" max="99">
                                        <button class="qty-btn" onclick="increaseQuantity(${item.product.productID})">+</button>
                                    </div>

                                    <div class="item-total" id="total-${item.product.productID}">
                                        ${item.getFormattedTotal()}
                                    </div>

                                    <div class="item-remove" onclick="removeItem(${item.product.productID})">🗑️</div>
                                </div>
                            </c:forEach>
                        </form>
                    </div>

                    <!-- Cart Summary -->
                    <div class="cart-summary">
                        <div class="promotion-banner">
                            <div class="promotion-icon">🎁</div>
                            <div class="promotion-text">
                                <div class="promotion-title">Ưu đãi đặc biệt</div>
                                <div class="promotion-desc">Miễn phí vận chuyển cho đơn hàng trên 5 triệu</div>
                            </div>
                        </div>

                        <h3 class="summary-title">Thông tin đơn hàng</h3>

                        <div class="summary-row">
                            <span class="summary-label">Tạm tính:</span>
                            <span class="summary-value" id="subtotal">0₫</span>
                        </div>

                        <div class="summary-row">
                            <span class="summary-label">Giảm giá:</span>
                            <span class="summary-value" id="discount" style="color: #d32f2f;">-0₫</span>
                        </div>

                        <div class="summary-row">
                            <span class="summary-label">Phí vận chuyển:</span>
                            <span class="summary-value" id="shipping">30.000₫</span>
                        </div>

                        <div class="voucher-section">
                            <div class="summary-label">Mã giảm giá:</div>
                            <div class="voucher-input">
                                <input type="text" placeholder="Nhập mã giảm giá" id="voucherInput">
                                <button class="voucher-btn" onclick="applyVoucher()">Áp dụng</button>
                            </div>
                        </div>

                        <div class="summary-divider"></div>

                        <div class="summary-total">
                            <span class="total-label">Tổng cộng:</span>
                            <span class="total-value" id="grandTotal">0₫</span>
                        </div>

                        <button class="checkout-btn" id="checkoutBtn" onclick="checkout()" disabled>
                            Thanh toán
                        </button>
                        <button class="continue-shopping" onclick="window.location.href = '../product'">
                            ← Tiếp tục mua sắm
                        </button>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>

        <script>
            function handleSearch(event) {
                if (event.key === "Enter") {
                    const keyword = document.getElementById("searchInput").value.trim();
                    if (keyword !== "") {
                        window.location.href = "search?keyword=" + encodeURIComponent(keyword);
                    }
                }
            }

            function toggleSelectAll() {
                const selectAll = document.getElementById('selectAll');
                const checkboxes = document.querySelectorAll('.item-checkbox');
                checkboxes.forEach(cb => cb.checked = selectAll.checked);
                updateSummary();
            }

            function updateSummary() {
                const checkboxes = document.querySelectorAll('.item-checkbox:checked');
                const checkoutBtn = document.getElementById('checkoutBtn');

                let subtotal = 0;
                checkboxes.forEach(cb => {
                    const item = cb.closest('.cart-item');
                    const priceText = item.querySelector('.item-price').textContent;
                    const quantity = parseInt(item.querySelector('.qty-input').value);
                    const price = parseInt(priceText.replace(/[^\d]/g, ''));
                    subtotal += price * quantity;
                });

                const shipping = subtotal >= 5000000 ? 0 : 30000;
                const discount = 0;
                const total = subtotal - discount + shipping;

                document.getElementById('subtotal').textContent = formatPrice(subtotal);
                document.getElementById('shipping').textContent = formatPrice(shipping);
                document.getElementById('discount').textContent = '-' + formatPrice(discount);
                document.getElementById('grandTotal').textContent = formatPrice(total);

                checkoutBtn.disabled = checkboxes.length === 0;
            }

            function formatPrice(price) {
                return price.toLocaleString('vi-VN') + '₫';
            }

            function increaseQuantity(productId) {
                fetch(`update-cart?productId=${productId}&action=increase`, {
                    method: 'GET'
                })
                        .then(response => response.json())
                        .then(data => {
                            if (data.success) {
                                location.reload();
                            }
                        });
            }

            function decreaseQuantity(productId) {
                fetch(`update-cart?productId=${productId}&action=decrease`, {
                    method: 'GET'
                })
                        .then(response => response.json())
                        .then(data => {
                            if (data.success) {
                                location.reload();
                            }
                        });
            }

            function removeItem(productId) {
                if (confirm('Bạn có chắc muốn xóa sản phẩm này?')) {
                    fetch('../remove-from-cart?productId=' + productId, {
                        method: 'GET'
                    })
                            .then(response => response.json())
                            .then(data => {
                                if (data.success) {
                                    alert('Xóa sản phẩm thành công!');
                                    location.reload();
                                } else {
                                    alert('Xóa sản phẩm thất bại: ' + (data.message || 'Không xác định'));
                                }
                            })
                            .catch(error => {
                                console.error('Error:', error);
                                alert('Đã xảy ra lỗi khi xóa sản phẩm.');
                            });
                }
            }



            function deleteSelected() {
                const selected = document.querySelectorAll('.item-checkbox:checked');
                if (selected.length === 0) {
                    alert('Vui lòng chọn sản phẩm cần xóa');
                    return;
                }

                if (confirm(`Bạn có chắc muốn xóa ${selected.length} sản phẩm đã chọn?`)) {
                    const productIds = Array.from(selected).map(cb =>
                        cb.closest('.cart-item').dataset.productId
                    );

                    fetch(`remove-multiple-from-cart?productIds=${productIds.join(',')}`, {
                        method: 'GET'
                    })
                            .then(response => response.json())
                            .then(data => {
                                if (data.success) {
                                    location.reload();
                                }
                            });
                }
            }

            function applyVoucher() {
                const voucher = document.getElementById('voucherInput').value.trim();
                if (voucher === '') {
                    alert('Vui lòng nhập mã giảm giá');
                    return;
                }

                fetch(`apply-voucher?code=${voucher}`, {
                    method: 'GET'
                })
                        .then(response => response.json())
                        .then(data => {
                            if (data.success) {
                                alert('Áp dụng mã giảm giá thành công!');
                                updateSummary();
                            } else {
                                alert('Mã giảm giá không hợp lệ');
                            }
                        });
            }

            function checkout() {
                const selected = document.querySelectorAll('.item-checkbox:checked');
                if (selected.length === 0) {
                    alert('Vui lòng chọn sản phẩm cần thanh toán');
                    return;
                }

                const form = document.getElementById('checkoutForm');

                // Xóa các input ẩn cũ nếu có
                form.querySelectorAll('input[name="productId"]').forEach(input => input.remove());

                // Thêm input ẩn cho mỗi productId được chọn
                selected.forEach(cb => {
                    const id = cb.closest('.cart-item').dataset.productId;
                    const input = document.createElement('input');
                    input.type = 'hidden';
                    input.name = 'productId';
                    input.value = id;
                    form.appendChild(input);
                });

                // Submit form
                form.submit();
            }

            // Update cart count on load
            window.addEventListener('DOMContentLoaded', function () {
                const cartItems = document.querySelectorAll('.cart-item');
                document.getElementById('cartCount').textContent = cartItems.length;
            });
        </script>
    </body>
</html>
