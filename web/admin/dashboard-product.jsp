<%-- 
    Document   : dashboard-add-product
    Created on : Oct 22, 2025, 6:53:39 PM
    Author     : trong
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Products Management - Laptop Shop</title>
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
                color: white;
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

            .page-header h2 {
                font-size: 32px;
                font-weight: 700;
                color: #f1f5f9;
                margin-bottom: 8px;
            }

            .page-header p {
                color: #64748b;
                font-size: 15px;
            }

            .top-actions {
                display: flex;
                gap: 15px;
                align-items: center;
            }

            .search-box {
                position: relative;
            }

            .search-box input {
                background: #1e293b;
                border: 1px solid rgba(148, 163, 184, 0.2);
                padding: 12px 20px 12px 45px;
                border-radius: 12px;
                color: #e2e8f0;
                width: 300px;
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

            .btn-primary {
                background: linear-gradient(135deg, #3b82f6, #8b5cf6);
                color: white;
                box-shadow: 0 4px 15px rgba(59, 130, 246, 0.4);
            }

            .btn-primary:hover {
                box-shadow: 0 6px 25px rgba(59, 130, 246, 0.5);
                transform: translateY(-2px);
            }

            .btn-secondary {
                background: rgba(30, 41, 59, 0.8);
                color: #e2e8f0;
                border: 1px solid rgba(148, 163, 184, 0.2);
            }

            .btn-secondary:hover {
                background: rgba(30, 41, 59, 1);
                border-color: rgba(59, 130, 246, 0.3);
            }

            .btn-danger {
                background: linear-gradient(135deg, #ef4444, #dc2626);
                color: white;
            }

            .btn-danger:hover {
                box-shadow: 0 4px 15px rgba(239, 68, 68, 0.4);
                transform: translateY(-2px);
            }

            .btn-icon {
                padding: 10px;
                display: inline-flex;
                align-items: center;
                justify-content: center;
                width: 38px;
                height: 38px;
            }

            .filters-bar {
                display: flex;
                gap: 15px;
                margin-bottom: 25px;
                flex-wrap: wrap;
            }

            .filter-group {
                display: flex;
                gap: 10px;
                align-items: center;
            }

            .filter-group label {
                font-size: 14px;
                color: #94a3b8;
                font-weight: 500;
            }

            .filter-select {
                background: #1e293b;
                border: 1px solid rgba(148, 163, 184, 0.2);
                padding: 10px 16px;
                border-radius: 10px;
                color: #e2e8f0;
                font-size: 14px;
                cursor: pointer;
                min-width: 150px;
            }

            .filter-select:focus {
                outline: none;
                border-color: #3b82f6;
            }

            .products-table-container {
                background: linear-gradient(135deg, #1e293b 0%, #0f172a 100%);
                border: 1px solid rgba(148, 163, 184, 0.1);
                border-radius: 20px;
                overflow: hidden;
            }

            .table-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 25px 30px;
                border-bottom: 1px solid rgba(148, 163, 184, 0.1);
            }

            .table-title {
                font-size: 20px;
                font-weight: 700;
                color: #f1f5f9;
            }

            .products-table {
                width: 100%;
                border-collapse: collapse;
            }

            .products-table thead {
                background: rgba(30, 41, 59, 0.5);
            }

            .products-table th {
                padding: 18px 25px;
                text-align: left;
                font-size: 13px;
                font-weight: 600;
                color: #94a3b8;
                text-transform: uppercase;
                letter-spacing: 0.5px;
            }

            .products-table td {
                padding: 20px 25px;
                border-top: 1px solid rgba(148, 163, 184, 0.1);
                font-size: 14px;
                color: #e2e8f0;
            }

            .products-table tbody tr {
                transition: all 0.3s;
            }

            .products-table tbody tr:hover {
                background: rgba(30, 41, 59, 0.5);
            }

            .product-name {
                font-weight: 600;
                color: #f1f5f9;
                margin-bottom: 4px;
            }

            .product-sku {
                font-size: 12px;
                color: #64748b;
            }

            .category-badge {
                display: inline-block;
                padding: 6px 12px;
                border-radius: 8px;
                font-size: 12px;
                font-weight: 600;
            }

            .badge-gaming {
                background: rgba(59, 130, 246, 0.15);
                color: #60a5fa;
            }

            .badge-business {
                background: rgba(139, 92, 246, 0.15);
                color: #a78bfa;
            }

            .badge-student {
                background: rgba(16, 185, 129, 0.15);
                color: #34d399;
            }

            .badge-creative {
                background: rgba(245, 158, 11, 0.15);
                color: #fbbf24;
            }

            .stock-badge {
                display: inline-flex;
                align-items: center;
                gap: 6px;
                padding: 6px 12px;
                border-radius: 8px;
                font-size: 13px;
                font-weight: 600;
            }

            .stock-high {
                background: rgba(16, 185, 129, 0.1);
                color: #10b981;
            }

            .stock-medium {
                background: rgba(245, 158, 11, 0.1);
                color: #f59e0b;
            }

            .stock-low {
                background: rgba(239, 68, 68, 0.1);
                color: #ef4444;
            }

            .price-cell {
                font-weight: 700;
                color: #10b981;
                font-size: 15px;
            }

            .actions-cell {
                display: flex;
                gap: 8px;
            }

            .pagination {
                display: flex;
                justify-content: center;
                align-items: center;
                gap: 10px;
                padding: 25px;
            }

            .page-btn {
                padding: 10px 16px;
                background: rgba(30, 41, 59, 0.8);
                border: 1px solid rgba(148, 163, 184, 0.2);
                border-radius: 10px;
                color: #e2e8f0;
                cursor: pointer;
                font-size: 14px;
                font-weight: 600;
                transition: all 0.3s;
                text-decoration: none;
            }

            .page-btn:hover {
                background: rgba(30, 41, 59, 1);
                border-color: rgba(59, 130, 246, 0.3);
            }

            .page-btn.active {
                background: linear-gradient(135deg, #3b82f6, #8b5cf6);
                border-color: transparent;
            }

            @media (max-width: 1200px) {
                .filters-bar {
                    grid-template-columns: repeat(2, 1fr);
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

                .top-bar {
                    flex-direction: column;
                    gap: 15px;
                    align-items: flex-start;
                }

                .search-box input {
                    width: 100%;
                }

                .products-table-container {
                    overflow-x: auto;
                }

                .filters-bar {
                    flex-direction: column;
                }

                .filter-group {
                    width: 100%;
                }

                .filter-select {
                    flex: 1;
                }
            }
        </style>
    </head>
    <body>
        <aside class="sidebar">
            <div class="logo" onclick="linkToDashBoard()">
                <h1>🧑‍💻 LaptopShop</h1>
            </div>
            <ul class="nav-menu">
                <li class="nav-item">
                    <a href="dashboard.jsp" class="nav-link">
                        <span>📊</span>
                        <span>Dashboard</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="../dashboard-product" class="nav-link active">
                        <span>💼</span>
                        <span>Products</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="employee-handle" class="nav-link">
                        <span>🛒</span>
                        <span>Orders</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <span>👥</span>
                        <span>Customers</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="admin/register-employee.jsp" class="nav-link">
                        <span>👔</span>
                        <span>Employees</span>
                    </a>
                </li>

                <li class="nav-item">
                    <a href="../logout" class="nav-link">
                        <span>🚪️</span>
                        <span>Logout</span>
                    </a>
                </li>
            </ul>
        </aside>

        <main class="main-content">
            <div class="top-bar">
                <div class="page-header">
                    <h2>Products Management 💼</h2>
                    <p>Manage your laptop inventory and pricing</p>
                </div>
                <div class="top-actions">
                    <div class="search-box">
                        <span class="search-icon">🔍</span>
                        <input type="text" id="searchInput" placeholder="Search products..." onkeypress="handleSearch(event)">
                    </div>
                    <a href="dashboard-add-product.jsp" class="btn btn-primary">+ Add Product</a>
                </div>
            </div>



            <div class="products-table-container">
                <div class="table-header">
                    <h3 class="table-title">All Products (${size})</h3>
                </div>
                <table class="products-table">
                    <thead>
                        <tr>
                            <th>Product</th>
                            <th>Brand</th>
                            <th>Price</th>
                            <th>Stock</th>
                            <th>Status</th>
                            <th style="text-align: center;">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.product}" var="c">
                            <tr>
                                <td>
                                    <div class="product-name">${c.name}</div>

                                </td>
                                <td><span class="category-badge badge-gaming">${c.category.getName()}</span></td>
                                <td class="price-cell">${c.getFormattedPrice()}</td>
                                <td>${c.quantityInStock} units</td>
                                <c:choose>
                                    <c:when test="${c.quantityInStock <= 5}">
                                        <td><span class="stock-badge stock-low">⚠️ Low Stock</span></td>
                                    </c:when>
                                    <c:when test="${c.quantityInStock <= 10}">
                                        <td><span class="stock-badge stock-medium">⚠️ Medium</span></td>
                                    </c:when>
                                    <c:when test="${c.quantityInStock <= 20}">
                                        <td><span class="stock-badge stock-high">✓ In Stock</span></td>
                                    </c:when>
                                    <c:otherwise>
                                        <td><span class="stock-badge stock-full">✅ Plenty</span></td>
                                    </c:otherwise>
                                </c:choose>

                                <td>
                                    <div class="actions-cell">
                                        <a href="/laptop/edit-product?id=${c.productID}" class="btn btn-icon btn-secondary" title="Edit">✏️</a>
                                        <a href="/laptop/delete-product?id=${c.productID}" class="btn btn-icon btn-danger" title="Delete" onclick="return confirm('Are you sure you want to delete this product?')">🗑️</a>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div class="pagination">
                    <c:if test="${currentPage > 1}">
                        <a href="dashboard-product?page=${currentPage - 1}" class="page-btn">← Prev</a>
                    </c:if>
                    <c:forEach begin="1" end="${totalPages}" var="i">
                        <c:choose>
                            <c:when test="${i == currentPage}">
                                <span>${i}</span>
                            </c:when>
                            <c:otherwise>
                                <a href="dashboard-product?page=${i}" class="page-btn">${i}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:if test="${currentPage < totalPages}">
                        <a href="dashboard-product?page=${currentPage + 1}" class="page-btn">Next →</a>
                    </c:if>
                </div>
            </div>
        </main>
    </body>
    <script>
        function handleSearch(event) {
            if (event.key === "Enter") {
                const keyword = document.getElementById("searchInput").value.trim();
                if (keyword !== "") {
                    window.location.href = "dashboard-search?keyword=" + encodeURIComponent(keyword);
                }
            }
        }
        function linkToDashBoard() {
            window.location.href = "admin/dashboard.jsp";
        }
    </script>
</html>
