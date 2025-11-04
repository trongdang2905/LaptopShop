<%-- 
    Document   : employee-handle-order
    Created on : Nov 3, 2025, 10:46:06 PM
    Author     : trong
--%>

<%-- 
    Document   : employee-orders
    Created on : Nov 03, 2025
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

            .icon-processing {
                background: linear-gradient(135deg, #3b82f6, #2563eb);
            }

            .icon-completed {
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

            .status-processing {
                background: rgba(59, 130, 246, 0.1);
                color: #3b82f6;
            }

            .status-completed {
                background: rgba(16, 185, 129, 0.1);
                color: #10b981;
            }

            .status-cancelled {
                background: rgba(239, 68, 68, 0.1);
                color: #ef4444;
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

            .btn-process {
                background: linear-gradient(135deg, #3b82f6, #8b5cf6);
                color: white;
            }

            .btn-process:hover {
                box-shadow: 0 4px 15px rgba(59, 130, 246, 0.4);
                transform: translateY(-2px);
            }

            .btn-complete {
                background: linear-gradient(135deg, #10b981, #059669);
                color: white;
            }

            .btn-complete:hover {
                box-shadow: 0 4px 15px rgba(16, 185, 129, 0.4);
                transform: translateY(-2px);
            }

            .pagination {
                display: flex;
                justify-content: center;
                align-items: center;
                gap: 10px;
                margin-top: 30px;
            }

            .page-btn {
                width: 40px;
                height: 40px;
                border-radius: 10px;
                background: rgba(30, 41, 59, 0.8);
                border: 1px solid rgba(148, 163, 184, 0.2);
                color: #e2e8f0;
                font-weight: 600;
                cursor: pointer;
                transition: all 0.3s;
            }

            .page-btn:hover,
            .page-btn.active {
                background: linear-gradient(135deg, #3b82f6, #8b5cf6);
                border-color: transparent;
                color: white;
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

            .modal-actions {
                display: flex;
                gap: 10px;
                margin-top: 30px;
            }

            .modal-actions button {
                flex: 1;
                padding: 14px;
                border-radius: 12px;
                font-weight: 600;
                cursor: pointer;
                transition: all 0.3s;
                border: none;
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
                    <a href="#" class="nav-link" onclick="logout()">
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
                    <div class="stat-value">24</div>
                </div>

                <div class="stat-card">
                    <div class="stat-icon icon-processing">⚙️</div>
                    <div class="stat-label">Processing</div>
                    <div class="stat-value">18</div>
                </div>

                <div class="stat-card">
                    <div class="stat-icon icon-completed">✅</div>
                    <div class="stat-label">Completed Today</div>
                    <div class="stat-value">42</div>
                </div>

                <div class="stat-card">
                    <div class="stat-icon icon-cancelled">❌</div>
                    <div class="stat-label">Cancelled</div>
                    <div class="stat-value">3</div>
                </div>
            </div>

            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">All Orders</h3>
                    <div class="filters">
                        <button class="filter-btn active" onclick="filterOrders('all')">All</button>
                        <button class="filter-btn" onclick="filterOrders('pending')">Pending</button>
                        <button class="filter-btn" onclick="filterOrders('processing')">Processing</button>
                        <button class="filter-btn" onclick="filterOrders('completed')">Completed</button>
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
                        <tr>
                            <td><span class="order-id">#ORD-2025-001</span></td>
                            <td>
                                <div class="customer-name">Nguyen Van A</div>
                                <div class="customer-email">nguyenvana@email.com</div>
                            </td>
                            <td>ASUS TUF Gaming F16 (+1 more)</td>
                            <td><span class="order-amount">₫23,980,000</span></td>
                            <td>Nov 03, 2025</td>
                            <td><span class="status-badge status-pending">Pending</span></td>
                            <td>
                                <button class="action-btn btn-view" onclick="viewOrder(1)">👁️ View</button>
                                <button class="action-btn btn-process" onclick="processOrder(1)">▶️ Process</button>
                            </td>
                        </tr>
                        <tr>
                            <td><span class="order-id">#ORD-2025-002</span></td>
                            <td>
                                <div class="customer-name">Tran Thi B</div>
                                <div class="customer-email">tranthib@email.com</div>
                            </td>
                            <td>Acer Gaming Aspire 7</td>
                            <td><span class="order-amount">₫18,990,000</span></td>
                            <td>Nov 03, 2025</td>
                            <td><span class="status-badge status-processing">Processing</span></td>
                            <td>
                                <button class="action-btn btn-view" onclick="viewOrder(2)">👁️ View</button>
                                <button class="action-btn btn-complete" onclick="completeOrder(2)">✅ Complete</button>
                            </td>
                        </tr>
                        <tr>
                            <td><span class="order-id">#ORD-2025-003</span></td>
                            <td>
                                <div class="customer-name">Le Van C</div>
                                <div class="customer-email">levanc@email.com</div>
                            </td>
                            <td>HP 14-EP0112TU</td>
                            <td><span class="order-amount">₫15,290,000</span></td>
                            <td>Nov 02, 2025</td>
                            <td><span class="status-badge status-completed">Completed</span></td>
                            <td>
                                <button class="action-btn btn-view" onclick="viewOrder(3)">👁️ View</button>
                            </td>
                        </tr>
                        <tr>
                            <td><span class="order-id">#ORD-2025-004</span></td>
                            <td>
                                <div class="customer-name">Pham Thi D</div>
                                <div class="customer-email">phamthid@email.com</div>
                            </td>
                            <td>Acer Aspire Lite 16 AI</td>
                            <td><span class="order-amount">₫13,790,000</span></td>
                            <td>Nov 02, 2025</td>
                            <td><span class="status-badge status-pending">Pending</span></td>
                            <td>
                                <button class="action-btn btn-view" onclick="viewOrder(4)">👁️ View</button>
                                <button class="action-btn btn-process" onclick="processOrder(4)">▶️ Process</button>
                            </td>
                        </tr>
                        <tr>
                            <td><span class="order-id">#ORD-2025-005</span></td>
                            <td>
                                <div class="customer-name">Hoang Van E</div>
                                <div class="customer-email">hoangvane@email.com</div>
                            </td>
                            <td>ASUS ROG Strix G16</td>
                            <td><span class="order-amount">₫32,490,000</span></td>
                            <td>Nov 01, 2025</td>
                            <td><span class="status-badge status-cancelled">Cancelled</span></td>
                            <td>
                                <button class="action-btn btn-view" onclick="viewOrder(5)">👁️ View</button>
                            </td>
                        </tr>
                    </tbody>
                </table>

                <div class="pagination">
                    <button class="page-btn">«</button>
                    <button class="page-btn active">1</button>
                    <button class="page-btn">2</button>
                    <button class="page-btn">3</button>
                    <button class="page-btn">4</button>
                    <button class="page-btn">»</button>
                </div>
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
                    <div class="detail-value" id="modalCustomerName">Nguyen Van A</div>
                    <div class="customer-email" id="modalCustomerEmail">nguyenvana@email.com</div>
                    <div class="customer-email" id="modalCustomerPhone">+84 123 456 789</div>
                </div>

                <div class="order-detail-section">
                    <div class="detail-label">Delivery Address</div>
                    <div class="detail-value" id="modalAddress">123 Nguyen Hue Street, District 1, Ho Chi Minh City</div>
                </div>

                <div class="order-detail-section">
                    <div class="detail-label">Order Items</div>
                    <ul class="order-items" id="modalOrderItems">
                        <li class="order-item">
                            <div>
                                <div class="customer-name">ASUS TUF Gaming F16 FX607VU</div>
                                <div class="customer-email">Quantity: 1</div>
                            </div>
                            <div class="order-amount">₫21,490,000</div>
                        </li>
                        <li class="order-item">
                            <div>
                                <div class="customer-name">Gaming Mouse</div>
                                <div class="customer-email">Quantity: 1</div>
                            </div>
                            <div class="order-amount">₫2,490,000</div>
                        </li>
                    </ul>
                </div>

                <div class="order-detail-section">
                    <div class="detail-label">Total Amount</div>
                    <div class="order-amount" style="font-size: 24px;" id="modalTotal">₫23,980,000</div>
                </div>

                <div class="order-detail-section">
                    <div class="detail-label">Status</div>
                    <span class="status-badge status-pending" id="modalStatus">Pending</span>
                </div>

                <div class="modal-actions">
                    <button class="btn-process" style="flex: 1; padding: 14px; border-radius: 12px;" onclick="processOrderFromModal()">Process Order</button>
                    <button class="btn-complete" style="flex: 1; padding: 14px; border-radius: 12px;" onclick="completeOrderFromModal()">Mark as Complete</button>
                </div>
            </div>
        </div>

    </body>
    <script>
        function logout() {
            if (confirm('Are you sure you want to logout?')) {
                window.location.href = 'logout.jsp'; // Or your logout endpoint
            }
        }

        function refreshOrders() {
            location.reload();
        }

        function filterOrders(status) {
            // Remove active class from all filter buttons
            const filterBtns = document.querySelectorAll('.filter-btn');
            filterBtns.forEach(btn => btn.classList.remove('active'));

            // Add active class to clicked button
            event.target.classList.add('active');

            // Get all table rows
            const rows = document.querySelectorAll('.orders-table tbody tr');

            rows.forEach(row => {
                if (status === 'all') {
                    row.style.display = '';
                } else {
                    const statusBadge = row.querySelector('.status-badge');
                    const rowStatus = statusBadge.textContent.toLowerCase().trim();

                    if (rowStatus === status) {
                        row.style.display = '';
                    } else {
                        row.style.display = 'none';
                    }
                }
            });
        }

        function searchOrders() {
            const input = document.getElementById('searchInput');
            const filter = input.value.toLowerCase();
            const rows = document.querySelectorAll('.orders-table tbody tr');

            rows.forEach(row => {
                const orderId = row.querySelector('.order-id').textContent.toLowerCase();
                const customerName = row.querySelector('.customer-name').textContent.toLowerCase();

                if (orderId.includes(filter) || customerName.includes(filter)) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        }

        function viewOrder(orderId) {
            document.getElementById('orderModal').classList.add('active');
        }

        function closeModal() {
            document.getElementById('orderModal').classList.remove('active');
        }

        function processOrder(orderId) {
            if (confirm('Are you sure you want to process this order?')) {
                alert('Order #' + orderId + ' has been moved to Processing status.');
                location.reload();
            }
        }

        function completeOrder(orderId) {
            if (confirm('Are you sure this order is completed?')) {
                alert('Order #' + orderId + ' has been marked as Completed.');
                location.reload();
            }
        }

        function processOrderFromModal() {
            closeModal();
            alert('Order has been moved to Processing status.');
        }

        function completeOrderFromModal() {
            closeModal();
            alert('Order has been marked as Completed.');
            location.reload();
        }

        // Close modal when clicking outside
        window.onclick = function (event) {
            const modal = document.getElementById('orderModal');
            if (event.target === modal) {
                closeModal();
            }
        }

        // Close modal with Escape key
        document.addEventListener('keydown', function (event) {
            if (event.key === 'Escape') {
                closeModal();
            }
        });
    </script>
</html>

