<%-- 
    Document   : list-employee
    Created on : Nov 2, 2025, 12:49:42 AM
    Author     : trong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Employee Management - Laptop Shop</title>
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

            .page-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 40px;
            }

            .page-title h2 {
                font-size: 32px;
                font-weight: 700;
                color: #f1f5f9;
                margin-bottom: 8px;
            }

            .page-title p {
                color: #64748b;
                font-size: 15px;
            }

            .header-actions {
                display: flex;
                gap: 15px;
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
                display: inline-flex;
                align-items: center;
                gap: 8px;
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

            .btn-small {
                padding: 8px 16px;
                font-size: 13px;
            }

            .btn-edit {
                background: rgba(59, 130, 246, 0.1);
                color: #3b82f6;
                border: 1px solid rgba(59, 130, 246, 0.3);
            }

            .btn-edit:hover {
                background: rgba(59, 130, 246, 0.2);
            }

            .btn-delete {
                background: rgba(239, 68, 68, 0.1);
                color: #ef4444;
                border: 1px solid rgba(239, 68, 68, 0.3);
            }

            .btn-delete:hover {
                background: rgba(239, 68, 68, 0.2);
            }

            .search-filter {
                background: linear-gradient(135deg, #1e293b 0%, #0f172a 100%);
                border: 1px solid rgba(148, 163, 184, 0.1);
                border-radius: 20px;
                padding: 25px;
                margin-bottom: 25px;
                display: flex;
                gap: 15px;
                flex-wrap: wrap;
                align-items: center;
            }

            .search-box {
                flex: 1;
                min-width: 250px;
                position: relative;
            }

            .search-box input {
                width: 100%;
                background: rgba(30, 41, 59, 0.5);
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
                font-size: 18px;
            }

            .filter-select {
                background: rgba(30, 41, 59, 0.5);
                border: 1px solid rgba(148, 163, 184, 0.2);
                padding: 12px 18px;
                border-radius: 12px;
                color: #e2e8f0;
                font-size: 14px;
                font-family: 'Inter', sans-serif;
                cursor: pointer;
                transition: all 0.3s;
            }

            .filter-select:focus {
                outline: none;
                border-color: #3b82f6;
            }

            .table-container {
                background: linear-gradient(135deg, #1e293b 0%, #0f172a 100%);
                border: 1px solid rgba(148, 163, 184, 0.1);
                border-radius: 20px;
                padding: 30px;
                overflow-x: auto;
            }

            table {
                width: 100%;
                border-collapse: collapse;
            }

            thead {
                border-bottom: 2px solid rgba(148, 163, 184, 0.1);
            }

            th {
                text-align: left;
                padding: 15px;
                font-size: 13px;
                font-weight: 700;
                color: #94a3b8;
                text-transform: uppercase;
                letter-spacing: 0.5px;
            }

            td {
                padding: 20px 15px;
                font-size: 14px;
                border-bottom: 1px solid rgba(148, 163, 184, 0.05);
            }

            tbody tr {
                transition: all 0.3s;
            }

            tbody tr:hover {
                background: rgba(30, 41, 59, 0.5);
            }

            .employee-info {
                display: flex;
                align-items: center;
                gap: 12px;
            }

            .avatar {
                width: 45px;
                height: 45px;
                border-radius: 12px;
                background: linear-gradient(135deg, #3b82f6, #8b5cf6);
                display: flex;
                align-items: center;
                justify-content: center;
                font-weight: 700;
                font-size: 16px;
                color: white;
            }

            .employee-details h4 {
                font-size: 14px;
                font-weight: 600;
                color: #f1f5f9;
                margin-bottom: 4px;
            }

            .employee-details p {
                font-size: 12px;
                color: #64748b;
            }

            .department-badge {
                padding: 6px 12px;
                border-radius: 8px;
                font-size: 12px;
                font-weight: 600;
                display: inline-block;
            }

            .dept-sales {
                background: rgba(59, 130, 246, 0.1);
                color: #3b82f6;
            }

            .dept-marketing {
                background: rgba(139, 92, 246, 0.1);
                color: #8b5cf6;
            }

            .dept-it {
                background: rgba(6, 182, 212, 0.1);
                color: #06b6d4;
            }

            .dept-hr {
                background: rgba(245, 158, 11, 0.1);
                color: #f59e0b;
            }

            .dept-finance {
                background: rgba(16, 185, 129, 0.1);
                color: #10b981;
            }

            .dept-operations {
                background: rgba(236, 72, 153, 0.1);
                color: #ec4899;
            }

            .dept-cs {
                background: rgba(99, 102, 241, 0.1);
                color: #6366f1;
            }

            .dept-management {
                background: rgba(234, 88, 12, 0.1);
                color: #ea580c;
            }

            .actions {
                display: flex;
                gap: 8px;
            }

            .modal {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background: rgba(0, 0, 0, 0.7);
                backdrop-filter: blur(4px);
                z-index: 1000;
                align-items: center;
                justify-content: center;
                padding: 20px;
            }

            .modal.show {
                display: flex;
            }

            .modal-content {
                background: linear-gradient(135deg, #1e293b 0%, #0f172a 100%);
                border: 1px solid rgba(148, 163, 184, 0.2);
                border-radius: 20px;
                padding: 35px;
                max-width: 600px;
                width: 100%;
                max-height: 90vh;
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
                font-size: 28px;
                color: #64748b;
                cursor: pointer;
                transition: color 0.3s;
                padding: 0;
                width: 32px;
                height: 32px;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .close-btn:hover {
                color: #ef4444;
            }

            .form-group {
                margin-bottom: 20px;
            }

            .form-label {
                font-size: 14px;
                font-weight: 600;
                color: #f1f5f9;
                margin-bottom: 8px;
                display: block;
            }

            .form-input,
            .form-select {
                width: 100%;
                background: rgba(30, 41, 59, 0.5);
                border: 1px solid rgba(148, 163, 184, 0.2);
                padding: 12px 16px;
                border-radius: 12px;
                color: #e2e8f0;
                font-size: 14px;
                font-family: 'Inter', sans-serif;
                transition: all 0.3s;
            }

            .form-input:focus,
            .form-select:focus {
                outline: none;
                border-color: #3b82f6;
                box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
            }

            .modal-actions {
                display: flex;
                gap: 12px;
                justify-content: flex-end;
                margin-top: 30px;
                padding-top: 20px;
                border-top: 1px solid rgba(148, 163, 184, 0.1);
            }

            .empty-state {
                text-align: center;
                padding: 60px 20px;
                color: #64748b;
            }

            .empty-state-icon {
                font-size: 64px;
                margin-bottom: 20px;
            }

            @media (max-width: 768px) {
                .sidebar {
                    display: none;
                }

                .main-content {
                    margin-left: 0;
                    padding: 20px;
                }

                .page-header {
                    flex-direction: column;
                    align-items: flex-start;
                    gap: 20px;
                }

                .search-filter {
                    flex-direction: column;
                }

                .search-box {
                    width: 100%;
                }

                table {
                    font-size: 12px;
                }

                th, td {
                    padding: 12px 8px;
                }

                .employee-info {
                    flex-direction: column;
                    align-items: flex-start;
                }
            }
        </style>
    </head>
    <body>
        <aside class="sidebar">
            <div class="logo" onclick="window.location.href = 'dashboard.jsp'">
                <h1>💻 LaptopShop</h1>
            </div>
            <ul class="nav-menu">
                <li class="nav-item">
                    <a href="dashboard.jsp" class="nav-link">
                        <span>📊</span>
                        <span>Dashboard</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="dashboard-product" class="nav-link">
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
                    <a href="#" class="nav-link active">
                        <span>👔</span>
                        <span>Employees</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <span>⚙️</span>
                        <span>Settings</span>
                    </a>
                </li>
            </ul>
        </aside>

        <main class="main-content">
            <div class="page-header">
                <div class="page-title">
                    <h2>Employee Management 👔</h2>
                    <p>Manage your team members</p>
                </div>
                <div class="header-actions">
                    <button class="btn btn-primary" onclick="openAddModal()">
                        <span>+</span>
                        <span>Add Employee</span>
                    </button>
                </div>
            </div>

            <div class="search-filter">
                <div class="search-box">
                    <span class="search-icon">🔍</span>
                    <input type="text" id="searchInput" placeholder="Search by name, email, or phone..." onkeyup="filterTable()">
                </div>
                <select class="filter-select" id="departmentFilter" onchange="filterTable()">
                    <option value="">All Departments</option>
                    <option value="Sales">Sales</option>
                    <option value="Marketing">Marketing</option>
                    <option value="IT">IT & Technical Support</option>
                    <option value="HR">Human Resources</option>
                    <option value="Finance">Finance & Accounting</option>
                    <option value="Operations">Operations</option>
                    <option value="Customer Service">Customer Service</option>
                    <option value="Management">Management</option>
                </select>
            </div>

            <div class="table-container">
                <table id="employeeTable">
                    <thead>
                        <tr>
                            <th>Employee</th>
                            <th>Phone</th>
                            <th>Department</th>
                            <th>Hire Date</th>
                            <th>Salary</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody id="employeeTableBody">
                        <!-- Data will be inserted here -->
                    </tbody>
                </table>
            </div>
        </main>

        <!-- Add/Edit Modal -->
        <div class="modal" id="employeeModal">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="modalTitle">Add Employee</h3>
                    <button class="close-btn" onclick="closeModal()">&times;</button>
                </div>
                <form id="employeeForm" onsubmit="saveEmployee(event)">
                    <input type="hidden" id="employeeId">
                    <div class="form-group">
                        <label class="form-label">Full Name</label>
                        <input type="text" class="form-input" id="fullname" required>
                    </div>
                    <div class="form-group">
                        <label class="form-label">Email</label>
                        <input type="email" class="form-input" id="email" required>
                    </div>
                    <div class="form-group">
                        <label class="form-label">Phone</label>
                        <input type="tel" class="form-input" id="phone" required>
                    </div>
                    <div class="form-group">
                        <label class="form-label">Department</label>
                        <select class="form-select" id="department" required>
                            <option value="">Select Department</option>
                            <option value="Sales">Sales</option>
                            <option value="Marketing">Marketing</option>
                            <option value="IT">IT & Technical Support</option>
                            <option value="HR">Human Resources</option>
                            <option value="Finance">Finance & Accounting</option>
                            <option value="Operations">Operations</option>
                            <option value="Customer Service">Customer Service</option>
                            <option value="Management">Management</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label class="form-label">Hire Date</label>
                        <input type="date" class="form-input" id="hiredate" required>
                    </div>
                    <div class="form-group">
                        <label class="form-label">Salary (VNĐ)</label>
                        <input type="number" class="form-input" id="salary" min="0" step="100000" required>
                    </div>
                    <div class="modal-actions">
                        <button type="button" class="btn btn-secondary" onclick="closeModal()">Cancel</button>
                        <button type="submit" class="btn btn-primary">Save</button>
                    </div>
                </form>
            </div>
        </div>

        <script>
            // Sample data
            let employees = [
                {
                    id: 1,
                    fullname: "Nguyen Van A",
                    email: "nguyenvana@laptopshop.com",
                    phone: "0901234567",
                    department: "Sales",
                    hiredate: "2023-01-15",
                    salary: 15000000
                },
                {
                    id: 2,
                    fullname: "Tran Thi B",
                    email: "tranthib@laptopshop.com",
                    phone: "0912345678",
                    department: "Marketing",
                    hiredate: "2023-03-20",
                    salary: 18000000
                },
                {
                    id: 3,
                    fullname: "Le Van C",
                    email: "levanc@laptopshop.com",
                    phone: "0923456789",
                    department: "IT",
                    hiredate: "2022-11-10",
                    salary: 22000000
                },
                {
                    id: 4,
                    fullname: "Pham Thi D",
                    email: "phamthid@laptopshop.com",
                    phone: "0934567890",
                    department: "HR",
                    hiredate: "2023-05-01",
                    salary: 17000000
                },
                {
                    id: 5,
                    fullname: "Hoang Van E",
                    email: "hoangvane@laptopshop.com",
                    phone: "0945678901",
                    department: "Finance",
                    hiredate: "2023-02-14",
                    salary: 20000000
                }
            ];

            let editingId = null;

            function getDepartmentClass(dept) {
                const map = {
                    'Sales': 'dept-sales',
                    'Marketing': 'dept-marketing',
                    'IT': 'dept-it',
                    'HR': 'dept-hr',
                    'Finance': 'dept-finance',
                    'Operations': 'dept-operations',
                    'Customer Service': 'dept-cs',
                    'Management': 'dept-management'
                };
                return map[dept] || 'dept-sales';
            }

            function getInitials(name) {
                return name.split(' ').map(n => n[0]).join('').substring(0, 2).toUpperCase();
            }

            function formatCurrency(amount) {
                return new Intl.NumberFormat('vi-VN', {
                    style: 'currency',
                    currency: 'VND'
                }).format(amount);
            }

           
            function filterTable() {
                const searchText = document.getElementById('searchInput').value.toLowerCase();
                const deptFilter = document.getElementById('departmentFilter').value;

                const filtered = employees.filter(emp => {
                    const matchSearch = emp.fullname.toLowerCase().includes(searchText) ||
                            emp.email.toLowerCase().includes(searchText) ||
                            emp.phone.includes(searchText);
                    const matchDept = !deptFilter || emp.department === deptFilter;
                    return matchSearch && matchDept;
                });

                renderTable(filtered);
            }

            function openAddModal() {
                editingId = null;
                document.getElementById('modalTitle').textContent = 'Add Employee';
                document.getElementById('employeeForm').reset();
                document.getElementById('employeeId').value = '';
                document.getElementById('employeeModal').classList.add('show');
            }

            function editEmployee(id) {
                const emp = employees.find(e => e.id === id);
                if (!emp)
                    return;

                editingId = id;
                document.getElementById('modalTitle').textContent = 'Edit Employee';
                document.getElementById('employeeId').value = emp.id;
                document.getElementById('fullname').value = emp.fullname;
                document.getElementById('email').value = emp.email;
                document.getElementById('phone').value = emp.phone;
                document.getElementById('department').value = emp.department;
                document.getElementById('hiredate').value = emp.hiredate;
                document.getElementById('salary').value = emp.salary;
                document.getElementById('employeeModal').classList.add('show');
            }

            function deleteEmployee(id) {
                if (confirm('Are you sure you want to delete this employee?')) {
                    employees = employees.filter(e => e.id !== id);
                    renderTable();
                }
            }

            function closeModal() {
                document.getElementById('employeeModal').classList.remove('show');
            }

            function saveEmployee(e) {
                e.preventDefault();

                const formData = {
                    fullname: document.getElementById('fullname').value,
                    email: document.getElementById('email').value,
                    phone: document.getElementById('phone').value,
                    department: document.getElementById('department').value,
                    hiredate: document.getElementById('hiredate').value,
                    salary: parseInt(document.getElementById('salary').value)
                };

                if (editingId) {
                    // Update existing
                    const index = employees.findIndex(e => e.id === editingId);
                    employees[index] = {...employees[index], ...formData};
                } else {
                    // Add new
                    const newId = employees.length > 0 ? Math.max(...employees.map(e => e.id)) + 1 : 1;
                    employees.push({id: newId, ...formData});
                }

                renderTable();
                closeModal();
            }

            // Close modal when clicking outside
            document.getElementById('employeeModal').addEventListener('click', (e) => {
                if (e.target.id === 'employeeModal') {
                    closeModal();
                }
            });

            // Initial render
            renderTable();
        </script>
    </body>
</html>