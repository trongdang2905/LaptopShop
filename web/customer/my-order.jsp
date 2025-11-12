<%-- 
    Document   : orders
    Created on : Nov 11, 2025
    Author     : Group 5
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đơn hàng của tôi - Group 5</title>
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

            .back-btn {
                background: rgba(255, 255, 255, 0.15);
                padding: 8px 20px;
                border-radius: 20px;
                cursor: pointer;
                transition: background 0.3s;
            }

            .back-btn:hover {
                background: rgba(255, 255, 255, 0.25);
            }

            .main-container {
                max-width: 1200px;
                margin: 30px auto;
                padding: 0 20px;
            }

            .page-header {
                background: white;
                border-radius: 12px;
                padding: 30px;
                margin-bottom: 30px;
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            }

            .page-header h1 {
                font-size: 28px;
                color: #333;
                margin-bottom: 10px;
            }

            .page-header p {
                color: #666;
                font-size: 14px;
            }

            .filter-tabs {
                background: white;
                border-radius: 12px;
                padding: 20px;
                margin-bottom: 20px;
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
                display: flex;
                gap: 10px;
                flex-wrap: wrap;
            }

            .filter-tab {
                padding: 10px 20px;
                border: 2px solid #e0e0e0;
                background: white;
                border-radius: 25px;
                cursor: pointer;
                transition: all 0.3s;
                font-weight: 500;
                color: #666;
            }

            .filter-tab:hover {
                border-color: #667eea;
                color: #667eea;
            }

            .filter-tab.active {
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                color: white;
                border-color: transparent;
            }

            .orders-list {
                display: flex;
                flex-direction: column;
                gap: 20px;
            }

            .order-card {
                background: white;
                border-radius: 12px;
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
                overflow: hidden;
                transition: transform 0.3s;
            }

            .order-card:hover {
                transform: translateY(-3px);
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
            }

            .order-header {
                padding: 20px;
                background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
                border-bottom: 2px solid #e0e0e0;
                display: flex;
                justify-content: space-between;
                align-items: center;
                flex-wrap: wrap;
                gap: 15px;
            }

            .order-info {
                display: flex;
                gap: 30px;
                flex-wrap: wrap;
            }

            .order-id {
                font-weight: 600;
                color: #333;
                font-size: 15px;
            }

            .order-date {
                color: #666;
                font-size: 14px;
            }

            .order-status {
                padding: 8px 20px;
                border-radius: 20px;
                font-weight: 600;
                font-size: 13px;
                text-transform: uppercase;
            }

            .status-pending {
                background: #fff3cd;
                color: #856404;
            }

            .status-confirmed {
                background: #cfe2ff;
                color: #084298;
            }

            .status-shipping {
                background: #d1e7dd;
                color: #0f5132;
            }

            .status-delivered {
                background: #d1f2eb;
                color: #0a3622;
            }

            .status-cancelled {
                background: #f8d7da;
                color: #842029;
            }

            .order-body {
                padding: 20px;
            }

            .order-items {
                display: flex;
                flex-direction: column;
                gap: 15px;
                margin-bottom: 20px;
            }

            .order-item {
                display: flex;
                gap: 15px;
                padding: 15px;
                background: #f8f9fa;
                border-radius: 8px;
            }

            .item-image {
                width: 80px;
                height: 80px;
                object-fit: contain;
                border-radius: 8px;
                background: white;
                padding: 5px;
            }

            .item-details {
                flex: 1;
            }

            .item-name {
                font-weight: 600;
                color: #333;
                margin-bottom: 5px;
                font-size: 15px;
            }

            .item-specs {
                color: #666;
                font-size: 13px;
                margin-bottom: 5px;
            }

            .item-quantity {
                color: #666;
                font-size: 13px;
            }

            .item-price {
                text-align: right;
            }

            .item-unit-price {
                color: #666;
                font-size: 13px;
                margin-bottom: 5px;
            }

            .item-total-price {
                font-weight: 600;
                color: #d32f2f;
                font-size: 16px;
            }

            .order-footer {
                padding: 20px;
                background: #f8f9fa;
                border-top: 2px solid #e0e0e0;
                display: flex;
                justify-content: space-between;
                align-items: center;
                flex-wrap: wrap;
                gap: 15px;
            }

            .order-total {
                display: flex;
                flex-direction: column;
                align-items: flex-end;
            }

            .total-label {
                color: #666;
                font-size: 14px;
                margin-bottom: 5px;
            }

            .total-amount {
                font-size: 24px;
                font-weight: bold;
                color: #d32f2f;
            }

            .order-actions {
                display: flex;
                gap: 10px;
                flex-wrap: wrap;
            }

            .action-btn {
                padding: 10px 25px;
                border-radius: 25px;
                cursor: pointer;
                transition: all 0.3s;
                font-weight: 600;
                font-size: 14px;
                border: none;
                text-decoration: none;
                display: inline-block;
            }

            .btn-detail {
                background: white;
                color: #667eea;
                border: 2px solid #667eea;
            }

            .btn-detail:hover {
                background: #667eea;
                color: white;
            }

            .btn-cancel {
                background: white;
                color: #d32f2f;
                border: 2px solid #d32f2f;
            }

            .btn-cancel:hover {
                background: #d32f2f;
                color: white;
            }

            .btn-review {
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                color: white;
                border: none;
            }

            .btn-review:hover {
                transform: scale(1.05);
            }

            .btn-reorder {
                background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%);
                color: white;
                border: none;
            }

            .btn-reorder:hover {
                transform: scale(1.05);
            }

            .empty-state {
                background: white;
                border-radius: 12px;
                padding: 60px 20px;
                text-align: center;
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            }

            .empty-icon {
                font-size: 80px;
                margin-bottom: 20px;
            }

            .empty-title {
                font-size: 24px;
                color: #333;
                margin-bottom: 10px;
            }

            .empty-desc {
                color: #666;
                margin-bottom: 30px;
            }

            .empty-btn {
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                color: white;
                padding: 15px 40px;
                border-radius: 30px;
                cursor: pointer;
                display: inline-block;
                font-weight: 600;
                transition: transform 0.3s;
                text-decoration: none;
            }

            .empty-btn:hover {
                transform: scale(1.05);
            }

            .timeline {
                display: flex;
                flex-direction: column;
                gap: 10px;
                padding: 20px;
                background: #f8f9fa;
                border-radius: 8px;
                margin-top: 15px;
            }

            .timeline-item {
                display: flex;
                gap: 15px;
                align-items: flex-start;
            }

            .timeline-dot {
                width: 12px;
                height: 12px;
                border-radius: 50%;
                background: #667eea;
                margin-top: 5px;
                flex-shrink: 0;
            }

            .timeline-dot.completed {
                background: #43e97b;
            }

            .timeline-content {
                flex: 1;
            }

            .timeline-status {
                font-weight: 600;
                color: #333;
                margin-bottom: 3px;
            }

            .timeline-date {
                color: #666;
                font-size: 13px;
            }

            @media (max-width: 768px) {
                .order-header, .order-footer {
                    flex-direction: column;
                    align-items: flex-start;
                }

                .order-info {
                    flex-direction: column;
                    gap: 10px;
                }

                .order-total {
                    align-items: flex-start;
                    width: 100%;
                }

                .order-actions {
                    width: 100%;
                }

                .action-btn {
                    flex: 1;
                    text-align: center;
                }

                .order-item {
                    flex-direction: column;
                }

                .item-image {
                    width: 100%;
                    height: 150px;
                }

                .item-price {
                    text-align: left;
                }
            }
        </style>
    </head>
    <body>
        <header class="header">
            <div class="header-container">
                <div class="logo" onclick="window.location.href = 'product'">Group 5</div>
                <div class="header-nav">
                    <div class="back-btn" onclick="window.history.back()">← Quay lại</div>
                </div>
            </div>
        </header>

        <main class="main-container">
            <div class="page-header">
                <h1>📦 Đơn hàng của tôi</h1>
                <p>Quản lý và theo dõi tất cả đơn hàng của bạn</p>
            </div>

            <!-- Filter Tabs -->
            <div class="filter-tabs">
                <div class="filter-tab active" onclick="filterOrders('all')">Tất cả</div>
                <div class="filter-tab" onclick="filterOrders('Pending')">Chờ xác nhận</div>
                <div class="filter-tab" onclick="filterOrders('Confirmed')">Đã xác nhận</div>
                <div class="filter-tab" onclick="filterOrders('Shipping')">Đang giao</div>
                <div class="filter-tab" onclick="filterOrders('Delivered')">Đã giao</div>
                <div class="filter-tab" onclick="filterOrders('Cancelled')">Đã hủy</div>
            </div>

            <!-- Orders List -->
            <div class="orders-list">
                <c:choose>
                    <c:when test="${empty orders}">
                        <!-- Empty State -->
                        <div class="empty-state">
                            <div class="empty-icon">📭</div>
                            <div class="empty-title">Bạn chưa có đơn hàng nào</div>
                            <div class="empty-desc">Hãy khám phá và đặt hàng những sản phẩm yêu thích của bạn!</div>
                            <a href="product" class="empty-btn">Mua sắm ngay</a>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <!-- Group orders by orderID -->
                        <c:set var="currentOrderID" value="" />
                        <c:set var="orderTotal" value="0" />

                        <c:forEach items="${orders}" var="myOrder" varStatus="status">
                            <!-- Check if this is a new order -->
                            <c:if test="${myOrder.order.orderID != currentOrderID && currentOrderID != ''}">
                                <!-- Close previous order card -->
                            </div>
                        </div>

                        <div class="order-footer">
                            <div class="order-total">
                                <div class="total-label">Tổng tiền:</div>
                                <div class="total-amount">
                                    <c:out value="${String.format('%,.0f', orderTotal)}"/>đ
                                </div>
                            </div>
                            <div class="order-actions">
                                <a href="order-detail?id=${currentOrderID}" class="action-btn btn-detail">Xem chi tiết</a>

                                <c:if test="${currentStatus == 'Pending'}">
                                    <button class="action-btn btn-cancel" onclick="cancelOrder(${currentOrderID})">Hủy đơn</button>
                                </c:if>

                                <c:if test="${currentStatus == 'Delivered'}">
                                    <button class="action-btn btn-review" onclick="reviewOrder(${currentOrderID})">Đánh giá</button>
                                    <button class="action-btn btn-reorder" onclick="reorder(${currentOrderID})">Mua lại</button>
                                </c:if>
                            </div>
                        </div>
                    </div>
                    <c:set var="orderTotal" value="0" />
                </c:if>

                <!-- Start new order card if orderID changed -->
                <c:if test="${myOrder.order.orderID != currentOrderID}">
                    <c:set var="currentOrderID" value="${myOrder.order.orderID}" />
                    <c:set var="currentStatus" value="${myOrder.status}" />

                    <div class="order-card" data-status="${myOrder.status}">
                        <div class="order-header">
                            <div class="order-info">
                                <div class="order-id">📋 Mã đơn: #${myOrder.order.orderID}</div>
                                <div class="order-date">📅 ${myOrder.order.orderDate}</div>
                            </div>
                            <div class="order-status status-${myOrder.status}">
                                <c:choose>
                                    <c:when test="${myOrder.status == 'Pending'}">Chờ xác nhận</c:when>
                                    <c:when test="${myOrder.status == 'Confirmed'}">Đã xác nhận</c:when>
                                    <c:when test="${myOrder.status == 'Shipping'}">Đang giao</c:when>
                                    <c:when test="${myOrder.status == 'Delivered'}">Đã giao</c:when>
                                    <c:when test="${myOrder.status == 'Cancelled'}">Đã hủy</c:when>
                                    <c:otherwise>${myOrder.status}</c:otherwise>
                                </c:choose>
                            </div>
                        </div>

                        <div class="order-body">
                            <div class="order-items">
                            </c:if>

                            <!-- Add product item -->
                            <c:forEach items="${myOrder.product}" var="product">
                                <div class="order-item">
                                    <img src="${product.image[0]}" alt="${product.name}" class="item-image">
                                    <div class="item-details">
                                        <div class="item-name">${product.name}</div>
                                        <div class="item-specs">
                                            <c:if test="${not empty product.name}">Thương hiệu: ${product.name}</c:if>
                                            </div>
                                            <div class="item-quantity">Số lượng: ${myOrder.quantity}</div>
                                    </div>
                                    <div class="item-price">
                                        <div class="item-unit-price">
                                            ${product.getFormattedPrice()}
                                        </div>
                                        <div class="item-total-price">
                                            <c:out value="${String.format('%,.0f', myOrder.amount)}"/>đ
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            <!-- Accumulate order total -->
                            <c:set var="orderTotal" value="${orderTotal + myOrder.amount}" />

                            <!-- Close the last order card -->
                            <c:if test="${status.last}">
                            </div>
                        </div>

                        <div class="order-footer">
                            <div class="order-total">
                                <div class="total-label">Tổng tiền:</div>
                                <div class="total-amount">
                                    <c:out value="${String.format('%,.0f', orderTotal)}"/>đ
                                </div>
                            </div>
                            <div class="order-actions">
                                <a href="order-detail?id=${myOrder.order.orderID}" class="action-btn btn-detail">Xem chi tiết</a>

                                <c:if test="${myOrder.status == 'Pending'}">
                                    <button class="action-btn btn-cancel" onclick="cancelOrder(${myOrder.order.orderID})">Hủy đơn</button>
                                </c:if>

                                <c:if test="${myOrder.status == 'Delivered'}">
                                    <button class="action-btn btn-review" onclick="reviewOrder(${myOrder.order.orderID})">Đánh giá</button>
                                    <button class="action-btn btn-reorder" onclick="reorder(${myOrder.order.orderID})">Mua lại</button>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </c:otherwise>
    </c:choose>
</div>
</main>

<script>
    function filterOrders(status) {
        // Update active tab
        document.querySelectorAll('.filter-tab').forEach(tab => {
            tab.classList.remove('active');
        });
        event.target.classList.add('active');

        // Filter orders
        const orders = document.querySelectorAll('.order-card');
        orders.forEach(order => {
            if (status === 'all' || order.dataset.status === status) {
                order.style.display = 'block';
            } else {
                order.style.display = 'none';
            }
        });
    }

    function cancelOrder(orderId) {
        if (confirm('Bạn có chắc chắn muốn hủy đơn hàng này?')) {
            // Call API to cancel order
            window.location.href = 'cancel-order?id=' + orderId;
        }
    }

    function reviewOrder(orderId) {
        window.location.href = 'review?orderId=' + orderId;
    }

    function reorder(orderId) {
        if (confirm('Bạn có muốn đặt lại đơn hàng này?')) {
            window.location.href = 'reorder?id=' + orderId;
        }
    }
</script>
</body>
</html>