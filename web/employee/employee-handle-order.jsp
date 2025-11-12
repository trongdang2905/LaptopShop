<%-- 
    Document   : employee-handle-order
    Created on : Nov 3, 2025, 10:46:06 PM
    Author     : trong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Order Management - Employee Portal</title>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap');

            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: 'Inter', sans-serif;
                background: #0f172a;
                color: #e2e8f0;
                min-height: 100vh;
            }

            .sidebar {
                position: fixed;
                left: 0;
                top: 0;
                width: 280px;
                height: 100vh;
                background: linear-gradient(180deg, #1e293b 0%, #0f172a 100%);
                border-right: 1px solid rgba(148, 163, 184, 0.1);
                padding: 30px 0;
                z-index: 100;
            }

            .logo {
                padding: 0 30px;
                margin-bottom: 40px;
                cursor: pointer;
            }

            .logo h1 {
                font-size: 24px;
                font-weight: 800;
                background: linear-gradient(135deg, #3b82f6, #8b5cf6);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                background-clip: text;
            }

            .user-info {
                padding: 0 30px;
                margin-bottom: 30px;
                padding-bottom: 20px;
                border-bottom: 1px solid rgba(148, 163, 184, 0.1);
            }

            .user-info p {
                font-size: 13px;
                color: #64748b;
                margin-bottom: 5px;
            }

            .user-info h3 {
                font-size: 16px;
                color: #f1f5f9;
                font-weight: 600;
            }

            .user-badge {
                display: inline-block;
                margin-top: 8px;
                padding: 4px 10px;
                background: rgba(59, 130, 246, 0.1);
                color: #3b82f6;
                border-radius: 6px;
                font-size: 11px;
                font-weight: 600;
                text-transform: uppercase;
            }

            .nav-menu {
                list-style: none;
            }

            .nav-item {
                margin: 5px 15px;
            }

            .nav-link {
                display: flex;
                align-items: center;
                gap: 15px;
                padding: 14px 20px;
                color: #94a3b8;
                text-decoration: none;
                border-radius: 12px;
                transition: all 0.3s;
                font-weight: 500;
                font-size: 14px;
            }

            .nav-link:hover {
                background: rgba(59, 130, 246, 0.1);
                color: #3b82f6;
            }

            .nav-link.active {
                background: linear-gradient(135deg, #3b82f6, #8b5cf6);
                color: white;
            }

            .main-content {
                margin-left: 280px;
                padding: 30px 40px;
            }

            .top-bar {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 40px;
            }

            .welcome h2 {
                font-size: 32px;
                font-weight: 700;
                color: #f1f5f9;
                margin-bottom: 8px;
            }

            .welcome p {
                color: #64748b;
                font-size: 15px;
            }

            .top-actions {
                display: flex;
                gap: 15px;
                align-items: center;
            }

            .btn {
                padding: 12px 24px;
                border: none;
                border-radius: 12px;
                font-weight: 600;
                font-size: 14px;
                cursor: pointer;
                transition: all 0.3s;
                font-family: 'Inter', sans-serif;
                text-decoration: none;
                display: inline-block;
            }

            .btn-secondary {
                background: rgba(30, 41, 59, 0.8);
                color: #e2e8f0;
                border: 1px solid rgba(148, 163, 184, 0.2);
            }

            .btn-secondary:hover {
                background: rgba(30, 41, 59, 1);
                border-color: #3b82f6;
            }

            .stats-grid {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
                gap: 25px;
                margin-bottom: 35px;
            }

            .stat-card {
                background: linear-gradient(135deg, #1e293b 0%, #0f172a 100%);
                border: 1px solid rgba(148, 163, 184, 0.1);
                padding: 28px;
                border-radius: 20px;
                transition: all 0.3s;
            }

            .stat-card:hover {
                transform: translateY(-5px);
                border-color: rgba(59, 130, 246, 0.3);
                box-shadow: 0 10px 40px rgba(0, 0, 0, 0.3);
            }

            .stat-icon {
                width: 60px;
                height: 60px;
                border-radius: 16px;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 28px;
                margin-bottom: 20px;
            }

            .icon-pending {
                background: linear-gradient(135deg, #f59e0b, #d97706);
            }

            .icon-confirmed {
                background: linear-gradient(135deg, #3b82f6, #2563eb);
            }

            .icon-shipping {
                background: linear-gradient(135deg, #8b5cf6, #7c3aed);
            }

            .icon-delivered {
                background: linear-gradient(135deg, #10b981, #059669);
            }

            .icon-cancelled {
                background: linear-gradient(135deg, #ef4444, #dc2626);
            }

            .stat-label {
                font-size: 14px;
                color: #64748b;
                font-weight: 500;
                margin-bottom: 10px;
                text-transform: uppercase;
                letter-spacing: 0.5px;
            }

            .stat-value {
                font-size: 36px;
                font-weight: 800;
                color: #f1f5f9;
            }

            .card {
                background: linear-gradient(135deg, #1e293b 0%, #0f172a 100%);
                border: 1px solid rgba(148, 163, 184, 0.1);
                border-radius: 20px;
                padding: 30px;
                margin-bottom: 25px;
            }

            .card-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 30px;
                flex-wrap: wrap;
                gap: 20px;
            }

            .card-title {
                font-size: 20px;
                font-weight: 700;
                color: #f1f5f9;
            }

            .filters {
                display: flex;
                gap: 10px;
                flex-wrap: wrap;
            }

            .filter-btn {
                padding: 8px 16px;
                background: rgba(30, 41, 59, 0.8);
                color: #94a3b8;
                border: 1px solid rgba(148, 163, 184, 0.2);
                border-radius: 10px;
                font-size: 13px;
                font-weight: 600;
                cursor: pointer;
                transition: all 0.3s;
            }

            .filter-btn:hover,
            .filter-btn.active {
                background: linear-gradient(135deg, #3b82f6, #8b5cf6);
                color: white;
                border-color: transparent;
            }

            .search-filter {
                display: flex;
                gap: 15px;
                margin-bottom: 25px;
                flex-wrap: wrap;
            }

            .search-box {
                position: relative;
                flex: 1;
                min-width: 250px;
            }

            .search-box input {
                width: 100%;
                background: #1e293b;
                border: 1px solid rgba(148, 163, 184, 0.2);
                padding: 12px 20px 12px 45px;
                border-radius: 12px;
                color: #e2e8f0;
                font-size: 14px;
                transition: all 0.3s;
            }

            .search-box input:focus {
                outline: none;
                border-color: #3b82f6;
                box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
            }

            .search-icon {
                position: absolute;
                left: 15px;
                top: 50%;
                transform: translateY(-50%);
                color: #64748b;
            }

            .orders-table {
                width: 100%;
                border-collapse: collapse;
            }

            .orders-table thead {
                background: rgba(30, 41, 59, 0.5);
            }

            .orders-table th {
                padding: 15px;
                text-align: left;
                font-size: 13px;
                font-weight: 600;
                color: #94a3b8;
                text-transform: uppercase;
                letter-spacing: 0.5px;
                border-bottom: 1px solid rgba(148, 163, 184, 0.1);
            }

            .orders-table td {
                padding: 20px 15px;
                border-bottom: 1px solid rgba(148, 163, 184, 0.1);
                font-size: 14px;
            }

            .orders-table tr {
                transition: all 0.3s;
            }

            .orders-table tbody tr:hover {
                background: rgba(30, 41, 59, 0.3);
            }

            .order-id {
                font-weight: 600;
                color: #3b82f6;
            }

            .customer-name {
                font-weight: 600;
                color: #f1f5f9;
                margin-bottom: 4px;
            }

            .customer-email {
                font-size: 12px;
                color: #64748b;
            }

            .order-amount {
                font-weight: 700;
                color: #10b981;
                font-size: 15px;
            }

            .status-badge {
                display: inline-block;
                padding: 6px 12px;
                border-radius: 8px;
                font-size: 12px;
                font-weight: 600;
                text-transform: uppercase;
            }

            .status-pending {
                background: rgba(245, 158, 11, 0.1);
                color: #f59e0b;
            }

            .status-confirmed {
                background: rgba(59, 130, 246, 0.1);
                color: #3b82f6;
            }

            .status-shipping {
                background: rgba(139, 92, 246, 0.1);
                color: #8b5cf6;
            }

            .status-delivered {
                background: rgba(16, 185, 129, 0.1);
                color: #10b981;
            }

            .status-cancelled {
                background: rgba(239, 68, 68, 0.1);
                color: #ef4444;
            }

            .action-dropdown {
                position: relative;
                display: inline-block;
            }

            .dropdown-btn {
                padding: 8px 16px;
                border-radius: 8px;
                font-size: 13px;
                font-weight: 600;
                cursor: pointer;
                transition: all 0.3s;
                border: none;
                background: linear-gradient(135deg, #3b82f6, #8b5cf6);
                color: white;
            }

            .dropdown-btn:hover {
                box-shadow: 0 4px 15px rgba(59, 130, 246, 0.4);
                transform: translateY(-2px);
            }

            .dropdown-content {
                display: none;
                position: absolute;
                right: 0;
                background: #1e293b;
                min-width: 180px;
                box-shadow: 0 8px 30px rgba(0, 0, 0, 0.5);
                z-index: 1;
                border-radius: 12px;
                overflow: hidden;
                border: 1px solid rgba(148, 163, 184, 0.2);
                margin-top: 5px;
            }

            .dropdown-content.show {
                display: block;
            }

            .dropdown-item {
                color: #e2e8f0;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
                transition: all 0.2s;
                cursor: pointer;
                font-size: 13px;
                font-weight: 500;
            }

            .dropdown-item:hover {
                background: rgba(59, 130, 246, 0.1);
                color: #3b82f6;
            }

            .dropdown-item.pending {
                border-left: 3px solid #f59e0b;
            }

            .dropdown-item.confirmed {
                border-left: 3px solid #3b82f6;
            }

            .dropdown-item.shipping {
                border-left: 3px solid #8b5cf6;
            }

            .dropdown-item.delivered {
                border-left: 3px solid #10b981;
            }

            .dropdown-item.cancelled {
                border-left: 3px solid #ef4444;
            }

            .action-btn {
                padding: 8px 16px;
                border-radius: 8px;
                font-size: 13px;
                font-weight: 600;
                cursor: pointer;
                transition: all 0.3s;
                border: none;
                margin-right: 8px;
            }

            .btn-view {
                background: rgba(59, 130, 246, 0.1);
                color: #3b82f6;
            }

            .btn-view:hover {
                background: rgba(59, 130, 246, 0.2);
            }

            .modal {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0, 0, 0, 0.8);
                z-index: 1000;
                align-items: center;
                justify-content: center;
            }

            .modal.active {
                display: flex;
            }

            .modal-content {
                background: linear-gradient(135deg, #1e293b 0%, #0f172a 100%);
                border: 1px solid rgba(148, 163, 184, 0.2);
                border-radius: 20px;
                padding: 40px;
                max-width: 600px;
                width: 90%;
                max-height: 80vh;
                overflow-y: auto;
            }

            .modal-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 25px;
            }

            .modal-title {
                font-size: 24px;
                font-weight: 700;
                color: #f1f5f9;
            }

            .close-btn {
                background: none;
                border: none;
                font-size: 24px;
                color: #64748b;
                cursor: pointer;
                transition: all 0.3s;
            }

            .close-btn:hover {
                color: #ef4444;
            }

            .order-detail-section {
                margin-bottom: 25px;
            }

            .detail-label {
                font-size: 12px;
                color: #64748b;
                text-transform: uppercase;
                letter-spacing: 0.5px;
                margin-bottom: 8px;
            }

            .detail-value {
                font-size: 15px;
                color: #f1f5f9;
                font-weight: 500;
            }

            .order-items {
                list-style: none;
                margin-top: 10px;
            }

            .order-item {
                display: flex;
                justify-content: space-between;
                padding: 15px;
                background: rgba(30, 41, 59, 0.5);
                border-radius: 10px;
                margin-bottom: 10px;
            }

            @media (max-width: 1200px) {
                .orders-table {
                    font-size: 13px;
                }

                .orders-table th,
                .orders-table td {
                    padding: 12px 10px;
                }
            }

            @media (max-width: 768px) {
                .sidebar {
                    display: none;
                }

                .main-content {
                    margin-left: 0;
                    padding: 20px;
                }

                .stats-grid {
                    grid-template-columns: 1fr;
                }

                .orders-table {
                    display: block;
                    overflow-x: auto;
                }

                .search-filter {
                    flex-direction: column;
                }

                .modal-content {
                    padding: 25px;
                }
            }

            .loading {
                pointer-events: none;
                opacity: 0.6;
            }
        </style>
    </head>
    <body>
        <aside class="sidebar">
            <div class="logo" onclick="window.location.href = 'employee-orders.jsp'">
                <h1>💻 LaptopShop</h1>
            </div>

            <div class="user-info">
                <p>Logged in as</p>
                <h3>${sessionScope.infoEmployee.fullName}</h3>
                <span class="user-badge">Order Handler</span>
            </div>

            <ul class="nav-menu">
                <li class="nav-item">
                    <a href="#" class="nav-link active">
                        <span>🛒</span>
                        <span>Orders</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="logout" class="nav-link">
                        <span>🚪</span>
                        <span>Logout</span>
                    </a>
                </li>
            </ul>
        </aside>

        <main class="main-content">
            <div class="top-bar">
                <div class="welcome">
                    <h2>Order Management 📦</h2>
                    <p>Process and track customer orders</p>
                </div>
                <div class="top-actions">
                    <button class="btn btn-secondary" onclick="refreshOrders()">🔄 Refresh</button>
                </div>
            </div>

            <div class="stats-grid">
                <div class="stat-card">
                    <div class="stat-icon icon-pending">⏳</div>
                    <div class="stat-label">Pending Orders</div>
                    <div class="stat-value" id="stat-pending">0</div>
                </div>

                <div class="stat-card">
                    <div class="stat-icon icon-confirmed">✓</div>
                    <div class="stat-label">Confirmed</div>
                    <div class="stat-value" id="stat-confirmed">0</div>
                </div>

                <div class="stat-card">
                    <div class="stat-icon icon-shipping">🚚</div>
                    <div class="stat-label">Shipping</div>
                    <div class="stat-value" id="stat-shipping">0</div>
                </div>

                <div class="stat-card">
                    <div class="stat-icon icon-delivered">✅</div>
                    <div class="stat-label">Delivered</div>
                    <div class="stat-value" id="stat-delivered">0</div>
                </div>
            </div>

            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">All Orders</h3>
                    <div class="filters">
                        <button class="filter-btn active" onclick="filterOrders('all')">All</button>
                        <button class="filter-btn" onclick="filterOrders('pending')">Pending</button>
                        <button class="filter-btn" onclick="filterOrders('confirmed')">Confirmed</button>
                        <button class="filter-btn" onclick="filterOrders('shipping')">Shipping</button>
                        <button class="filter-btn" onclick="filterOrders('delivered')">Delivered</button>
                        <button class="filter-btn" onclick="filterOrders('cancelled')">Cancelled</button>
                    </div>
                </div>

                <div class="search-filter">
                    <div class="search-box">
                        <span class="search-icon">🔍</span>
                        <input type="text" placeholder="Search by order ID or customer name..." id="searchInput" onkeyup="searchOrders()">
                    </div>
                </div>

                <table class="orders-table">
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Customer</th>
                            <th>Products</th>
                            <th>Amount</th>
                            <th>Date</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${orders}" var="handleOrders">
                            <tr data-status="${handleOrders.status}">
                                <td><span class="order-id">#${handleOrders.order.orderID}</span></td>
                                <td>
                                    <div class="customer-name">${handleOrders.order.customer.fullName}</div>
                                    <div class="customer-email">${handleOrders.order.customer.email}</div>
                                </td>
                                <td>
                                    <c:forEach items="${handleOrders.product}" var="product" varStatus="status">
                                        ${product.name}<c:if test="${!status.last}">, </c:if>
                                    </c:forEach>
                                </td>
                                <td><span class="order-amount">${handleOrders.getFormattedPrice()}</span></td>
                                <td>${handleOrders.order.orderDate}</td>
                                <td>
                                    <span class="status-badge status-${handleOrders.status.toLowerCase()}">
                                        ${handleOrders.status}
                                    </span>
                                </td>
                                <td>
                                    <button class="action-btn btn-view" onclick="viewOrder(${handleOrders.order.orderID})">👁️ View</button>
                                    <div class="action-dropdown">
                                        <button class="dropdown-btn" onclick="toggleDropdown(event, ${handleOrders.order.orderID})">
                                            ⚙️ Change Status
                                        </button>
                                        <div class="dropdown-content" id="dropdown-${handleOrders.order.orderID}">
                                            <div class="dropdown-item pending" onclick="updateOrderStatus(${handleOrders.order.orderID}, 'Pending')">
                                                ⏳ Pending
                                            </div>
                                            <div class="dropdown-item confirmed" onclick="updateOrderStatus(${handleOrders.order.orderID}, 'Confirmed')">
                                                ✓ Confirmed
                                            </div>
                                            <div class="dropdown-item shipping" onclick="updateOrderStatus(${handleOrders.order.orderID}, 'Shipping')">
                                                🚚 Shipping
                                            </div>
                                            <div class="dropdown-item delivered" onclick="updateOrderStatus(${handleOrders.order.orderID}, 'Delivered')">
                                                ✅ Delivered
                                            </div>
                                            <div class="dropdown-item cancelled" onclick="updateOrderStatus(${handleOrders.order.orderID}, 'Cancelled')">
                                                ❌ Cancelled
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </main>

        <!-- Order Details Modal -->
        <div class="modal" id="orderModal">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title">Order Details</h3>
                    <button class="close-btn" onclick="closeModal()">×</button>
                </div>

                <div class="order-detail-section">
                    <div class="detail-label">Order ID</div>
                    <div class="detail-value" id="modalOrderId">#ORD-2025-001</div>
                </div>

                <div class="order-detail-section">
                    <div class="detail-label">Customer Information</div>
                    <div class="detail-value" id="modalCustomerName">Customer Name</div>
                    <div class="customer-email" id="modalCustomerEmail">customer@email.com</div>
                    <div class="customer-email" id="modalCustomerPhone">+84 123 456 789</div>
                </div>

                <div class="order-detail-section">
                    <div class="detail-label">Delivery Address</div>
                    <div class="detail-value" id="modalAddress">Delivery address</div>
                </div>

                <div class="order-detail-section">
                    <div class="detail-label">Order Items</div>
                    <ul class="order-items" id="modalOrderItems">
                    </ul>
                </div>

                <div class="order-detail-section">
                    <div class="detail-label">Total Amount</div>
                    <div class="order-amount" style="font-size: 24px;" id="modalTotal">₫0</div>
                </div>

                <div class="order-detail-section">
                    <div class="detail-label">Status</div>
                    <span class="status-badge status-pending" id="modalStatus">Pending</span>
                </div>
            </div>
        </div>

        <script>
            // Get employee email from session
            const employeeEmail = '${sessionScope.infoEmployee.email}';
            // Calculate statistics on page load
            document.addEventListener('DOMContentLoaded', function () {
                calculateStats();
            });
            function calculateStats() {
                const rows = document.querySelectorAll('.orders-table tbody tr');
                const stats = {
                    pending: 0,
                    confirmed: 0,
                    shipping: 0,
                    delivered: 0,
                    cancelled: 0
                };
                rows.forEach(row => {
                    const status = row.getAttribute('data-status').toLowerCase();
                    if (stats.hasOwnProperty(status)) {
                        stats[status]++;
                    }
                });
                document.getElementById('stat-pending').textContent = stats.pending;
                document.getElementById('stat-confirmed').textContent = stats.confirmed;
                document.getElementById('stat-shipping').textContent = stats.shipping;
                document.getElementById('stat-delivered').textContent = stats.delivered;
            }

            function toggleDropdown(event, orderId) {
                event.stopPropagation();
                const dropdown = document.getElementById('dropdown-' + orderId);
                // Close all other dropdowns
                document.querySelectorAll('.dropdown-content').forEach(d => {
                    if (d !== dropdown) {
                        d.classList.remove('show');
                    }
                });
                dropdown.classList.toggle('show');
            }

            // Close dropdowns when clicking outside
            window.onclick = function (event) {
                if (!event.target.matches('.dropdown-btn')) {
                    document.querySelectorAll('.dropdown-content').forEach(dropdown => {
                        dropdown.classList.remove('show');
                    });
                }

                const modal = document.getElementById('orderModal');
                if (event.target === modal) {
                    closeModal();
                }
            }

            function updateOrderStatus(orderId, newStatus) {
                if (!confirm(`Are you sure you want to change this order to ${newStatus} status?`)) {
                    return;
                }

                // Get current date
                const now = new Date();
                const updateDate = now.toISOString().slice(0, 19).replace('T', ' ');
                // Prepare data to send
                const data = {
                    orderId: orderId,
                    status: newStatus,
                    employeeEmail: employeeEmail,
                    updateAt: updateDate
                };
                // Show loading state
                const row = document.querySelector(`tr:has(#dropdown-${orderId})`);
                if (row) {
                    row.classList.add('loading');
                }

                // Send fetch request to servlet
                fetch('updateOrder', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify(data)
                })
                        .then(response => response.json())
                        .then(result => {
                            if (result.success) {
                                alert(`Order #${orderId} has been updated to ${newStatus}`);
                                window.location.href = 'employee-handle';
                                // Update the status badge in the table
                                const statusBadge = row.querySelector('.status-badge');
                                statusBadge.className = `status-badge status-${newStatus.toLowerCase()}`;
                                statusBadge.textContent = newStatus;

                                // Update data-status attribute
                                row.setAttribute('data-status', newStatus);

                                // Recalculate statistics
                                calculateStats();

                                // Close dropdown
                                document.getElementById(`dropdown-${orderId}`).classList.remove('show');

                            } else {
                                alert('Failed to update order status: ' + (result.message || 'Unknown error'));
                            }
                        })
                        .catch(error => {
                            console.error('Error:', error);
//                            alert('An error occurred while updating the order status. Please try again.');
                        })
                        .finally(() => {
                            // Remove loading state
                            if (row) {
                                row.classList.remove('loading');
                            }
                        });
            }

            function viewOrder(orderId) {
                // Find the order row
                const row = document.querySelector(`tr[data-status]:has(.order-id:contains('#${orderId}'))`);
                if (!row) {
                    alert('Order not found');
                    return;
                }

                // Extract order information from the row
                const cells = row.querySelectorAll('td');
                const orderIdText = cells[0].textContent.trim();
                const customerName = cells[1].querySelector('.customer-name').textContent;
                const customerEmail = cells[1].querySelector('.customer-email').textContent;
                const products = cells[2].textContent.trim();
                const amount = cells[3].textContent.trim();
                const orderDate = cells[4].textContent.trim();
                const status = cells[5].querySelector('.status-badge').textContent.trim();

                // Populate modal
                document.getElementById('modalOrderId').textContent = orderIdText;
                document.getElementById('modalCustomerName').textContent = customerName;
                document.getElementById('modalCustomerEmail').textContent = customerEmail;
                document.getElementById('modalCustomerPhone').textContent = 'N/A'; // Not available in table
                document.getElementById('modalAddress').textContent = 'Not available in current view';
                document.getElementById('modalTotal').textContent = amount;

                // Update status badge
                const modalStatus = document.getElementById('modalStatus');
                modalStatus.className = `status-badge status-${status.toLowerCase()}`;
                modalStatus.textContent = status;

                // Parse and display order items
                const orderItemsList = document.getElementById('modalOrderItems');
                orderItemsList.innerHTML = '';
                const productList = products.split(',').map(p => p.trim());
                productList.forEach(product => {
                    const li = document.createElement('li');
                    li.className = 'order-item';
                    li.innerHTML = `
                        <span>${product}</span>
                        <span>Quantity: 1</span>
                    `;
                    orderItemsList.appendChild(li);
                });

                // Show modal
                document.getElementById('orderModal').classList.add('active');
            }

            function closeModal() {
                document.getElementById('orderModal').classList.remove('active');
            }

            function filterOrders(status) {
                const rows = document.querySelectorAll('.orders-table tbody tr');
                const filterBtns = document.querySelectorAll('.filter-btn');

                // Update active filter button
                filterBtns.forEach(btn => btn.classList.remove('active'));
                event.target.classList.add('active');

                // Filter rows
                rows.forEach(row => {
                    const rowStatus = row.getAttribute('data-status').toLowerCase();
                    if (status === 'all' || rowStatus === status) {
                        row.style.display = '';
                    } else {
                        row.style.display = 'none';
                    }
                });
            }

            function searchOrders() {
                const searchTerm = document.getElementById('searchInput').value.toLowerCase();
                const rows = document.querySelectorAll('.orders-table tbody tr');

                rows.forEach(row => {
                    const orderId = row.querySelector('.order-id').textContent.toLowerCase();
                    const customerName = row.querySelector('.customer-name').textContent.toLowerCase();

                    if (orderId.includes(searchTerm) || customerName.includes(searchTerm)) {
                        row.style.display = '';
                    } else {
                        row.style.display = 'none';
                    }
                });
            }

            function refreshOrders() {
                location.reload();
            }

            // Helper function for contains selector (for older browsers)
            if (!Element.prototype.matches) {
                Element.prototype.matches = Element.prototype.msMatchesSelector ||
                        Element.prototype.webkitMatchesSelector;
            }
        </script>
    </body>
</html>