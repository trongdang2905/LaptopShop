<%-- 
    Document   : dashboard
    Created on : Oct 21, 2025, 7:28:22 PM
    Author     : trong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Laptop Shop Dashboard</title>
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

            .welcome {
                flex: 1;
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
            }

            .btn-primary {
                background: linear-gradient(135deg, #3b82f6, #8b5cf6);
                color: white;
                box-shadow: 0 4px 15px rgba(59, 130, 246, 0.4);
            }

            a {
                text-decoration: none;
            }

            .btn btn-primary a {
                text-decoration: none;
            }

            .btn-primary:hover {
                box-shadow: 0 6px 25px rgba(59, 130, 246, 0.5);
                transform: translateY(-2px);
            }

            .stats-grid {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
                gap: 25px;
                margin-bottom: 35px;
            }

            .stat-card {
                background: linear-gradient(135deg, #1e293b 0%, #0f172a 100%);
                border: 1px solid rgba(148, 163, 184, 0.1);
                padding: 28px;
                border-radius: 20px;
                position: relative;
                overflow: hidden;
                transition: all 0.3s;
            }

            .stat-card::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                height: 3px;
                background: linear-gradient(90deg, #3b82f6, #8b5cf6);
                opacity: 0;
                transition: opacity 0.3s;
            }

            .stat-card:hover {
                transform: translateY(-5px);
                border-color: rgba(59, 130, 246, 0.3);
                box-shadow: 0 10px 40px rgba(0, 0, 0, 0.3);
            }

            .stat-card:hover::before {
                opacity: 1;
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

            .icon-1 {
                background: linear-gradient(135deg, #3b82f6, #2563eb);
            }
            .icon-2 {
                background: linear-gradient(135deg, #8b5cf6, #7c3aed);
            }
            .icon-3 {
                background: linear-gradient(135deg, #06b6d4, #0891b2);
            }
            .icon-4 {
                background: linear-gradient(135deg, #f59e0b, #d97706);
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
                margin-bottom: 12px;
            }

            .stat-change {
                display: inline-flex;
                align-items: center;
                gap: 6px;
                padding: 6px 12px;
                border-radius: 8px;
                font-size: 13px;
                font-weight: 600;
            }

            .change-positive {
                background: rgba(16, 185, 129, 0.1);
                color: #10b981;
            }

            .change-negative {
                background: rgba(239, 68, 68, 0.1);
                color: #ef4444;
            }

            .dashboard-grid {
                display: grid;
                grid-template-columns: 2fr 1fr;
                gap: 25px;
                margin-bottom: 25px;
            }

            .card {
                background: linear-gradient(135deg, #1e293b 0%, #0f172a 100%);
                border: 1px solid rgba(148, 163, 184, 0.1);
                border-radius: 20px;
                padding: 30px;
            }

            .card-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 30px;
            }

            .card-title {
                font-size: 20px;
                font-weight: 700;
                color: #f1f5f9;
            }

            .card-subtitle {
                font-size: 13px;
                color: #64748b;
                margin-top: 5px;
            }

            .chart-area {
                height: 320px;
                display: flex;
                align-items: flex-end;
                justify-content: space-between;
                padding: 0 10px;
                gap: 15px;
            }

            .chart-bar {
                flex: 1;
                display: flex;
                flex-direction: column;
                align-items: center;
                gap: 12px;
            }

            .bar {
                width: 100%;
                background: linear-gradient(to top, #3b82f6, #8b5cf6);
                border-radius: 10px;
                position: relative;
                transition: all 0.3s;
                box-shadow: 0 5px 20px rgba(59, 130, 246, 0.3);
            }

            .bar:hover {
                background: linear-gradient(to top, #60a5fa, #a78bfa);
                transform: scaleY(1.05);
                box-shadow: 0 8px 30px rgba(59, 130, 246, 0.5);
            }

            .bar-value {
                position: absolute;
                top: -30px;
                left: 50%;
                transform: translateX(-50%);
                font-weight: 700;
                font-size: 14px;
                color: #f1f5f9;
            }

            .bar-label {
                font-size: 12px;
                color: #64748b;
                font-weight: 600;
            }

            .products-list {
                list-style: none;
            }

            .product-item {
                display: flex;
                align-items: center;
                justify-content: space-between;
                padding: 20px;
                border-radius: 12px;
                margin-bottom: 12px;
                background: rgba(30, 41, 59, 0.5);
                border: 1px solid rgba(148, 163, 184, 0.1);
                transition: all 0.3s;
            }

            .product-item:hover {
                background: rgba(30, 41, 59, 0.8);
                border-color: rgba(59, 130, 246, 0.3);
                transform: translateX(5px);
            }

            .product-left {
                display: flex;
                align-items: center;
                gap: 15px;
            }

            .product-rank {
                width: 40px;
                height: 40px;
                border-radius: 10px;
                display: flex;
                align-items: center;
                justify-content: center;
                font-weight: 800;
                font-size: 16px;
                background: linear-gradient(135deg, #3b82f6, #8b5cf6);
                color: white;
            }

            .product-info h4 {
                font-size: 15px;
                color: #f1f5f9;
                margin-bottom: 5px;
                font-weight: 600;
            }

            .product-info p {
                font-size: 13px;
                color: #64748b;
            }

            .product-right {
                text-align: right;
            }

            .product-revenue {
                font-size: 16px;
                font-weight: 700;
                color: #10b981;
                margin-bottom: 5px;
            }

            .product-stock {
                font-size: 12px;
                color: #64748b;
                padding: 4px 10px;
                border-radius: 6px;
                background: rgba(100, 116, 139, 0.1);
            }

            .stock-warning {
                color: #f59e0b;
                background: rgba(245, 158, 11, 0.1);
            }

            .categories-grid {
                display: grid;
                grid-template-columns: repeat(2, 1fr);
                gap: 15px;
            }

            .category-card {
                padding: 25px;
                border-radius: 16px;
                transition: all 0.3s;
                position: relative;
                overflow: hidden;
            }

            .category-card::before {
                content: '';
                position: absolute;
                top: 0;
                right: 0;
                width: 100px;
                height: 100px;
                opacity: 0.1;
                border-radius: 50%;
            }

            .cat-1 {
                background: linear-gradient(135deg, #3b82f6, #2563eb);
            }

            .cat-2 {
                background: linear-gradient(135deg, #8b5cf6, #7c3aed);
            }

            .cat-3 {
                background: linear-gradient(135deg, #10b981, #059669);
            }

            .cat-4 {
                background: linear-gradient(135deg, #f59e0b, #d97706);
            }

            .category-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 10px 40px rgba(0, 0, 0, 0.3);
            }

            .category-name {
                font-size: 15px;
                font-weight: 600;
                color: rgba(255, 255, 255, 0.9);
                margin-bottom: 15px;
            }

            .category-value {
                font-size: 32px;
                font-weight: 800;
                color: white;
            }

            .full-width-card {
                grid-column: 1 / -1;
            }

            @media (max-width: 1200px) {
                .dashboard-grid {
                    grid-template-columns: 1fr;
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
                    gap: 20px;
                    align-items: flex-start;
                }

                .search-box input {
                    width: 100%;
                }

                .stats-grid {
                    grid-template-columns: 1fr;
                }

                .categories-grid {
                    grid-template-columns: 1fr;
                }
            }
        </style>
    </head>
    <body>
        <aside class="sidebar">
            <div class="logo" onclick="linkToDashBoard()">
                <h1>💻 LaptopShop</h1>
            </div>
            <ul class="nav-menu">
                <li class="nav-item">
                    <a href="#" class="nav-link active">
                        <span>📊</span>
                        <span>Dashboard</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="admin/dashboard-product" class="nav-link">
                        <span>💼</span>
                        <span>Products</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">
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
                    <a href="#" class="nav-link">
                        <span>📈</span>
                        <span>Analytics</span>
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
                <div class="welcome">
                    <h2>Welcome back, Admin 👋</h2>
                    <p>Here's what's happening with your store today</p>
                </div>
                <div class="top-actions">
                    <div class="search-box">
                        <span class="search-icon">🔍</span>
                        <input type="text" placeholder="Search products, orders...">
                    </div>
                    <a href="admin/dashboard-add-product.jsp" class="btn btn-primary">+ Add Product</a>
                </div>
            </div>

            <div class="stats-grid">
                <div class="stat-card">
                    <div class="stat-icon icon-1">💰</div>
                    <div class="stat-label">Total Revenue</div>
                    <div class="stat-value">₫6.73B</div>
                    <span class="stat-change change-positive">↑ 12.5% vs last week</span>
                </div>

                <div class="stat-card">
                    <div class="stat-icon icon-2">📊</div>
                    <div class="stat-label">Total Sales</div>
                    <div class="stat-value">388</div>
                    <span class="stat-change change-positive">↑ 8.2% vs last week</span>
                </div>

                <div class="stat-card">
                    <div class="stat-icon icon-3">📦</div>
                    <div class="stat-label">Products Stock</div>
                    <div class="stat-value">1,247</div>
                    <span class="stat-change change-negative">↓ 3.1% vs last week</span>
                </div>

                <div class="stat-card">
                    <div class="stat-icon icon-4">👥</div>
                    <div class="stat-label">Active Users</div>
                    <div class="stat-value">2,456</div>
                    <span class="stat-change change-positive">↑ 15.3% vs last week</span>
                </div>
            </div>

            <div class="dashboard-grid">
                <div class="card">
                    <div class="card-header">
                        <div>
                            <h3 class="card-title">Sales Overview</h3>
                            <p class="card-subtitle">Weekly performance metrics</p>
                        </div>
                        <select class="btn" style="background: rgba(30, 41, 59, 0.8); color: #e2e8f0; cursor: pointer;">
                            <option>This Week</option>
                            <option>Last Week</option>
                            <option>This Month</option>
                        </select>
                    </div>
                    <div class="chart-area">
                        <div class="chart-bar">
                            <div class="bar" style="height: 140px;">
                                <span class="bar-value">42</span>
                            </div>
                            <span class="bar-label">Mon</span>
                        </div>
                        <div class="chart-bar">
                            <div class="bar" style="height: 126px;">
                                <span class="bar-value">38</span>
                            </div>
                            <span class="bar-label">Tue</span>
                        </div>
                        <div class="chart-bar">
                            <div class="bar" style="height: 183px;">
                                <span class="bar-value">55</span>
                            </div>
                            <span class="bar-label">Wed</span>
                        </div>
                        <div class="chart-bar">
                            <div class="bar" style="height: 160px;">
                                <span class="bar-value">48</span>
                            </div>
                            <span class="bar-label">Thu</span>
                        </div>
                        <div class="chart-bar">
                            <div class="bar" style="height: 206px;">
                                <span class="bar-value">62</span>
                            </div>
                            <span class="bar-label">Fri</span>
                        </div>
                        <div class="chart-bar">
                            <div class="bar" style="height: 260px;">
                                <span class="bar-value">78</span>
                            </div>
                            <span class="bar-label">Sat</span>
                        </div>
                        <div class="chart-bar">
                            <div class="bar" style="height: 216px;">
                                <span class="bar-value">65</span>
                            </div>
                            <span class="bar-label">Sun</span>
                        </div>
                    </div>
                </div>

                <div class="card">
                    <div class="card-header">
                        <div>
                            <h3 class="card-title">Categories</h3>
                            <p class="card-subtitle">Sales by category</p>
                        </div>
                    </div>
                    <div class="categories-grid">
                        <div class="category-card cat-1">
                            <div class="category-name">Gaming</div>
                            <div class="category-value">35%</div>
                        </div>
                        <div class="category-card cat-2">
                            <div class="category-name">Business</div>
                            <div class="category-value">28%</div>
                        </div>
                        <div class="category-card cat-3">
                            <div class="category-name">Student</div>
                            <div class="category-value">22%</div>
                        </div>
                        <div class="category-card cat-4">
                            <div class="category-name">Creative</div>
                            <div class="category-value">15%</div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card full-width-card">
                <div class="card-header">
                    <div>
                        <h3 class="card-title">Top Selling Products</h3>
                        <p class="card-subtitle">Best performers this week</p>
                    </div>
                    <button class="btn" style="background: rgba(30, 41, 59, 0.8); color: #e2e8f0;">View All →</button>
                </div>
                <ul class="products-list">
                    <li class="product-item">
                        <div class="product-left">
                            <div class="product-rank">1</div>
                            <div class="product-info">
                                <h4>ASUS TUF Gaming F16 FX607VU-LL034W</h4>
                                <p>45 units sold • Gaming Category</p>
                            </div>
                        </div>
                        <div class="product-right">
                            <div class="product-revenue">₫21,490,000</div>
                            <span class="product-stock">Stock: 12 units</span>
                        </div>
                    </li>
                    <li class="product-item">
                        <div class="product-left">
                            <div class="product-rank">2</div>
                            <div class="product-info">
                                <h4>Acer Gaming Aspire 7 A715-59G-57TU</h4>
                                <p>38 units sold • Gaming Category</p>
                            </div>
                        </div>
                        <div class="product-right">
                            <div class="product-revenue">₫18,990,000</div>
                            <span class="product-stock">Stock: 8 units</span>
                        </div>
                    </li>
                    <li class="product-item">
                        <div class="product-left">
                            <div class="product-rank">3</div>
                            <div class="product-info">
                                <h4>HP 14-EP0112TU 8C5LJPA</h4>
                                <p>32 units sold • Business Category</p>
                            </div>
                        </div>
                        <div class="product-right">
                            <div class="product-revenue">₫15,290,000</div>
                            <span class="product-stock">Stock: 15 units</span>
                        </div>
                    </li>
                    <li class="product-item">
                        <div class="product-left">
                            <div class="product-rank">4</div>
                            <div class="product-info">
                                <h4>Acer Aspire Lite 16 AI Gen 27 AL16-52P-572A</h4>
                                <p>28 units sold • Student Category</p>
                            </div>
                        </div>
                        <div class="product-right">
                            <div class="product-revenue">₫13,790,000</div>
                            <span class="product-stock stock-warning">⚠️ Low stock: 5 units</span>
                        </div>
                    </li>
                </ul>
            </div>
        </main>
    </body>
    <script>
        function linkToDashBoard() {
            window.location.href = "admin/dashboard.jsp";
        }
    </script>
</html>

