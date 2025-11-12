<%-- 
    Document   : order-success
    Created on : Nov 11, 2025
    Author     : Group 5
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đặt hàng thành công - Group 5</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Arial, sans-serif;
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                min-height: 100vh;
                padding: 20px;
            }

            .container {
                max-width: 900px;
                margin: 0 auto;
            }

            .success-header {
                text-align: center;
                color: white;
                margin-bottom: 30px;
                animation: fadeInDown 0.6s ease;
            }

            .success-icon {
                width: 80px;
                height: 80px;
                background: white;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 40px;
                margin: 0 auto 20px;
                animation: scaleIn 0.5s ease;
            }

            .success-title {
                font-size: 32px;
                font-weight: bold;
                margin-bottom: 10px;
            }

            .success-message {
                font-size: 16px;
                opacity: 0.9;
            }

            .bill-container {
                background: white;
                border-radius: 20px;
                overflow: hidden;
                box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
                animation: fadeInUp 0.6s ease;
            }

            .bill-header {
                background: linear-gradient(135deg, #d32f2f 0%, #e74c3c 100%);
                color: white;
                padding: 30px;
                text-align: center;
            }

            .company-name {
                font-size: 28px;
                font-weight: bold;
                margin-bottom: 5px;
                letter-spacing: 1px;
            }

            .bill-title {
                font-size: 18px;
                opacity: 0.9;
            }

            .bill-content {
                padding: 40px;
            }

            .order-info-grid {
                display: grid;
                grid-template-columns: 1fr 1fr;
                gap: 30px;
                margin-bottom: 40px;
                padding-bottom: 30px;
                border-bottom: 2px solid #f0f0f0;
            }

            .info-section {
                background: #f8f9fa;
                padding: 20px;
                border-radius: 12px;
            }

            .info-title {
                font-size: 14px;
                font-weight: bold;
                color: #666;
                text-transform: uppercase;
                margin-bottom: 15px;
                display: flex;
                align-items: center;
                gap: 8px;
            }

            .info-row {
                display: flex;
                margin-bottom: 10px;
                font-size: 15px;
            }

            .info-label {
                font-weight: 600;
                color: #333;
                min-width: 120px;
            }

            .info-value {
                color: #666;
                flex: 1;
            }

            .order-number {
                background: #fff3cd;
                border: 2px dashed #ffc107;
                border-radius: 8px;
                padding: 15px;
                text-align: center;
                margin-bottom: 30px;
            }

            .order-number-label {
                font-size: 13px;
                color: #856404;
                margin-bottom: 5px;
            }

            .order-number-value {
                font-size: 24px;
                font-weight: bold;
                color: #856404;
                letter-spacing: 2px;
            }

            .items-section {
                margin-bottom: 30px;
            }

            .section-title {
                font-size: 18px;
                font-weight: bold;
                color: #333;
                margin-bottom: 20px;
                padding-bottom: 10px;
                border-bottom: 2px solid #f0f0f0;
                display: flex;
                align-items: center;
                gap: 10px;
            }

            .item-table {
                width: 100%;
                border-collapse: collapse;
            }

            .item-table thead {
                background: #f8f9fa;
            }

            .item-table th {
                padding: 15px;
                text-align: left;
                font-size: 14px;
                font-weight: 600;
                color: #666;
                border-bottom: 2px solid #e0e0e0;
            }

            .item-table td {
                padding: 20px 15px;
                border-bottom: 1px solid #f0f0f0;
                font-size: 14px;
            }

            .item-table tbody tr:last-child td {
                border-bottom: none;
            }

            .item-info {
                display: flex;
                align-items: center;
                gap: 15px;
            }

            .item-image {
                width: 60px;
                height: 60px;
                object-fit: contain;
                background: #f8f8f8;
                border-radius: 8px;
                padding: 5px;
            }

            .item-details {
                flex: 1;
            }

            .item-name {
                font-weight: 600;
                color: #333;
                margin-bottom: 5px;
            }

            .item-sku {
                font-size: 12px;
                color: #999;
            }

            .item-price {
                text-align: right;
                color: #333;
            }

            .item-quantity {
                text-align: center;
                color: #666;
            }

            .item-total {
                text-align: right;
                font-weight: 600;
                color: #d32f2f;
            }

            .summary-section {
                background: #f8f9fa;
                padding: 25px;
                border-radius: 12px;
                margin-top: 30px;
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
                background: #ddd;
                margin: 20px 0;
            }

            .summary-total {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding-top: 15px;
                border-top: 2px solid #ddd;
            }

            .total-label {
                font-size: 18px;
                font-weight: bold;
                color: #333;
            }

            .total-value {
                font-size: 28px;
                font-weight: bold;
                color: #d32f2f;
            }

            .payment-method-badge {
                display: inline-flex;
                align-items: center;
                gap: 8px;
                padding: 8px 15px;
                background: #e3f2fd;
                color: #1976d2;
                border-radius: 20px;
                font-size: 14px;
                font-weight: 600;
            }

            .status-badge {
                display: inline-block;
                padding: 6px 12px;
                background: #fff3cd;
                color: #856404;
                border-radius: 20px;
                font-size: 13px;
                font-weight: 600;
            }

            .action-buttons {
                display: flex;
                gap: 15px;
                margin-top: 30px;
                padding-top: 30px;
                border-top: 2px solid #f0f0f0;
            }

            .btn {
                flex: 1;
                padding: 15px 30px;
                border: none;
                border-radius: 10px;
                font-size: 15px;
                font-weight: 600;
                cursor: pointer;
                transition: all 0.3s;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 8px;
            }

            .btn-primary {
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                color: white;
            }

            .btn-primary:hover {
                transform: translateY(-2px);
                box-shadow: 0 8px 20px rgba(102, 126, 234, 0.4);
            }

            .btn-secondary {
                background: white;
                color: #333;
                border: 2px solid #ddd;
            }

            .btn-secondary:hover {
                border-color: #667eea;
                color: #667eea;
            }

            .btn-success {
                background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);
                color: white;
            }

            .btn-success:hover {
                transform: translateY(-2px);
                box-shadow: 0 8px 20px rgba(17, 153, 142, 0.4);
            }

            .note-section {
                background: #fff9e6;
                border-left: 4px solid #ffc107;
                padding: 20px;
                border-radius: 8px;
                margin-top: 30px;
            }

            .note-title {
                font-weight: bold;
                color: #856404;
                margin-bottom: 10px;
                display: flex;
                align-items: center;
                gap: 8px;
            }

            .note-content {
                color: #856404;
                font-size: 14px;
                line-height: 1.6;
            }

            @keyframes fadeInDown {
                from {
                    opacity: 0;
                    transform: translateY(-30px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            @keyframes fadeInUp {
                from {
                    opacity: 0;
                    transform: translateY(30px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            @keyframes scaleIn {
                from {
                    transform: scale(0);
                }
                to {
                    transform: scale(1);
                }
            }

            @media print {
                body {
                    background: white;
                    padding: 0;
                }

                .success-header,
                .action-buttons {
                    display: none;
                }

                .bill-container {
                    box-shadow: none;
                }
            }

            @media (max-width: 768px) {
                .order-info-grid {
                    grid-template-columns: 1fr;
                    gap: 20px;
                }

                .item-table {
                    font-size: 12px;
                }

                .item-image {
                    width: 50px;
                    height: 50px;
                }

                .action-buttons {
                    flex-direction: column;
                }

                .success-title {
                    font-size: 24px;
                }

                .bill-content {
                    padding: 20px;
                }
            }
        </style>
    </head>
    <body>
        <div class="container">
            <!-- Success Header -->
            <div class="success-header">
                <div class="success-icon">✓</div>
                <h1 class="success-title">Đặt hàng thành công!</h1>
                <p class="success-message">Cảm ơn bạn đã mua hàng. Đơn hàng của bạn đang được xử lý.</p>
            </div>

            <!-- Bill Container -->
            <div class="bill-container">
                <!-- Bill Header -->
                <div class="bill-header">
                    <div class="company-name">GROUP 5 STORE</div>
                    <div class="bill-title">HÓA ĐƠN BÁN HÀNG</div>
                </div>

                <!-- Bill Content -->
                <div class="bill-content">
                    <!-- Order Number -->
                    <div class="order-number">
                        <div class="order-number-label">Mã đơn hàng</div>
                        <div class="order-number-value"></div>
                    </div>

                    <!-- Order Information Grid -->
                    <div class="order-info-grid">
                        <!-- Customer Info -->
                        <div class="info-section">
                            <div class="info-title">
                                <span>👤</span>
                                Thông tin khách hàng
                            </div>
                            <div class="info-row">
                                <span class="info-label">Họ tên:</span>
                                <span class="info-value">${sessionScope.infoCustomer.fullName}</span>
                            </div>
                            <div class="info-row">
                                <span class="info-label">Điện thoại:</span>
                                <span class="info-value">${sessionScope.infoCustomer.phone}</span>
                            </div>
                            <div class="info-row">
                                <span class="info-label">Email:</span>
                                <span class="info-value">${sessionScope.accountCustomer.userName}</span>
                            </div>
                        </div>

                        <!-- Order Details -->
                        <div class="info-section">
                            <div class="info-title">
                                <span>📋</span>
                                Chi tiết đơn hàng
                            </div>
                            <div class="info-row">
                                <span class="info-label">Ngày đặt:</span>
                                <span class="info-value">
                                    <jsp:useBean id="now" class="java.util.Date"/>
                                    <fmt:formatDate value="${now}" pattern="dd/MM/yyyy HH:mm"/>
                                </span>
                            </div>
                            <div class="info-row">
                                <span class="info-label">Trạng thái:</span>
                                <span class="info-value">
                                    <span class="status-badge">Đang xử lý</span>
                                </span>
                            </div>
                            <div class="info-row">
                                <span class="info-label">Thanh toán:</span>
                                <span class="info-value">
                                    <span class="payment-method-badge">
                                        <span>💵</span>
                                        <span>COD</span>
                                    </span>
                                </span>
                            </div>
                        </div>
                    </div>

                    <!-- Shipping Address -->
                    <div class="info-section" style="margin-bottom: 30px;">
                        <div class="info-title">
                            <span>📍</span>
                            Địa chỉ giao hàng
                        </div>
                        <div class="info-row">
                            <span class="info-value">
                                ${sessionScope.infoCustomer.fullName} - ${sessionScope.infoCustomer.phone}<br>
                                ${sessionScope.address}
                            </span>
                        </div>
                    </div>

                    <!-- Order Items -->
                    <div class="items-section">
                        <h2 class="section-title">
                            <span>🛍️</span>
                            Sản phẩm đã đặt
                        </h2>
                        <table class="item-table">
                            <thead>
                                <tr>
                                    <th>Sản phẩm</th>
                                    <th style="text-align: center;">Số lượng</th>
                                    <th style="text-align: right;">Đơn giá</th>
                                    <th style="text-align: right;">Thành tiền</th>
                                </tr>
                            </thead>
                            
                            <tbody>
                                <c:forEach items="${sessionScope.checkoutItem.items}" var="item">
                                    <tr>
                                        <td>
                                            <div class="item-info">
                                                <img src="${item.product.image[0]}" alt="${item.product.name}" class="item-image">
                                                <div class="item-details">
                                                    <div class="item-name">${item.product.name}</div>
                                                    <div class="item-sku">SKU: ${item.itemID}</div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="item-quantity">${item.quantity}</td>
                                        <td class="item-price">${item.getFormattedUnitPrice()}</td>
                                        <td class="item-total">${item.getFormattedTotal()}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>

                    <!-- Order Summary -->
                    <div class="summary-section">
                        <div class="summary-row">
                            <span class="summary-label">Tạm tính:</span>
                            <span class="summary-value">${sessionScope.checkoutItem.getFormattedPrice()}</span>
                        </div>
                        <div class="summary-row">
                            <span class="summary-label">Giảm giá:</span>
                            <span class="summary-value" style="color: #d32f2f;">-0₫</span>
                        </div>
                        <div class="summary-row">
                            <span class="summary-label">Phí vận chuyển:</span>
                            <span class="summary-value">Miễn phí</span>
                        </div>
                        <div class="summary-total">
                            <span class="total-label">Tổng cộng:</span>
                            <span class="total-value">${sessionScope.checkoutItem.getFormattedPrice()}</span>
                        </div>
                    </div>

                    <!-- Important Note -->
                    <div class="note-section">
                        <div class="note-title">
                            <span>ℹ️</span>
                            Lưu ý quan trọng
                        </div>
                        <div class="note-content">
                            • Đơn hàng sẽ được giao trong vòng 2-3 ngày làm việc.<br>
                            • Vui lòng kiểm tra kỹ sản phẩm trước khi thanh toán với shipper.<br>
                            • Mọi thắc mắc xin liên hệ hotline: 1900-xxxx hoặc email: support@group5.com<br>
                            • Quý khách có thể theo dõi đơn hàng tại mục "Đơn hàng của tôi".
                        </div>
                    </div>

                    <!-- Action Buttons -->
                    <div class="action-buttons">
                        <button class="btn btn-secondary" onclick="window.print()">
                            <span>🖨️</span>
                            <span>In hóa đơn</span>
                        </button>
                        <button class="btn btn-success" onclick="window.location.href = '/laptop/my-order'">
                            <span>📦</span>
                            <span>Xem đơn hàng</span>
                        </button>
                        <button class="btn btn-primary" onclick="window.location.href = '../product'">
                            <span>🛒</span>
                            <span>Tiếp tục mua sắm</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>