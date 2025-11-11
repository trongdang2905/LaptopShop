<%-- 
    Document   : register-employee
    Created on : Nov 2, 2025, 12:43:15 AM
    Author     : trong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Create Employee - Laptop Shop</title>
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
                max-width: 1400px;
            }

            .page-header {
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

            .breadcrumb {
                display: flex;
                align-items: center;
                gap: 10px;
                margin-bottom: 15px;
                font-size: 14px;
            }

            .breadcrumb a {
                color: #64748b;
                text-decoration: none;
                transition: color 0.3s;
            }

            .breadcrumb a:hover {
                color: #3b82f6;
            }

            .breadcrumb span {
                color: #475569;
            }

            .form-container {
                background: linear-gradient(135deg, #1e293b 0%, #0f172a 100%);
                border: 1px solid rgba(148, 163, 184, 0.1);
                border-radius: 20px;
                padding: 40px;
                max-width: 900px;
            }

            .form-grid {
                display: grid;
                grid-template-columns: repeat(2, 1fr);
                gap: 25px;
                margin-bottom: 30px;
            }

            .form-group {
                display: flex;
                flex-direction: column;
                gap: 10px;
            }

            .form-group.full-width {
                grid-column: 1 / -1;
            }

            .form-label {
                font-size: 14px;
                font-weight: 600;
                color: #f1f5f9;
                display: flex;
                align-items: center;
                gap: 5px;
            }

            .required {
                color: #ef4444;
            }

            .form-input,
            .form-select {
                background: rgba(30, 41, 59, 0.5);
                border: 1px solid rgba(148, 163, 184, 0.2);
                padding: 14px 18px;
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
                background: rgba(30, 41, 59, 0.8);
            }

            .form-input::placeholder {
                color: #64748b;
            }

            .form-select {
                cursor: pointer;
            }

            .form-select option {
                background: #1e293b;
                color: #e2e8f0;
            }

            .input-icon {
                position: relative;
            }

            .input-icon .form-input {
                padding-left: 45px;
            }

            .input-icon::before {
                content: attr(data-icon);
                position: absolute;
                left: 15px;
                top: 50%;
                transform: translateY(-50%);
                font-size: 18px;
                pointer-events: none;
            }

            .form-actions {
                display: flex;
                gap: 15px;
                justify-content: flex-end;
                padding-top: 20px;
                border-top: 1px solid rgba(148, 163, 184, 0.1);
            }

            .btn {
                padding: 14px 32px;
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
                border-color: rgba(148, 163, 184, 0.3);
            }

            .helper-text {
                font-size: 12px;
                color: #64748b;
                margin-top: 5px;
            }

            .error-message {
                font-size: 12px;
                color: #ef4444;
                margin-top: 5px;
                display: none;
            }

            .form-input.error,
            .form-select.error {
                border-color: #ef4444;
            }

            .form-input.error:focus,
            .form-select.error:focus {
                box-shadow: 0 0 0 3px rgba(239, 68, 68, 0.1);
            }

            .success-message {
                background: rgba(16, 185, 129, 0.1);
                border: 1px solid rgba(16, 185, 129, 0.3);
                color: #10b981;
                padding: 16px 20px;
                border-radius: 12px;
                margin-bottom: 25px;

                align-items: center;
                gap: 12px;
                font-size: 14px;
                font-weight: 500;
            }

            .success-message.show {
                display: flex;
            }

            .fail-message {
                background: rgba(239, 68, 68, 0.1);
                border: 1px solid rgba(239, 68, 68, 0.3);
                color: #ef4444;
                padding: 16px 20px;
                border-radius: 12px;
                margin-bottom: 25px;
                
                align-items: center;
                gap: 12px;
                font-size: 14px;
                font-weight: 500;
            }

            .fail-message.show {
                display: flex;
            }

            @media (max-width: 768px) {
                .sidebar {
                    display: none;
                }

                .main-content {
                    margin-left: 0;
                    padding: 20px;
                }

                .form-container {
                    padding: 25px;
                }

                .form-grid {
                    grid-template-columns: 1fr;
                }

                .form-actions {
                    flex-direction: column-reverse;
                }

                .btn {
                    width: 100%;
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
                    <a href="admin/dashboard.jsp" class="nav-link">
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
            <div class="breadcrumb">
                <a href="admin/dashboard.jsp">Dashboard</a>
                <span>/</span>
                <a href="admin/list-employee.jsp">Employees</a>
                <span>/</span>
                <span style="color: #f1f5f9;">Create Employee</span>
            </div>

            <div class="page-header">
                <h2>Create New Employee 👔</h2>
                <p>Add a new employee to your team</p>
            </div>
            <c:if test="${success != null}">
                <div class="success-message" id="successMessage">
                    <span style="font-size: 20px;">✓</span>
                    <span>Employee created successfully!</span>
                </div>
            </c:if>

            <c:if test="${existedAccount != null}">
                <div class="fail-message" id="failMessage">
                    <span style="font-size: 20px;">⚠️</span>
                    <span>Email existed!</span>
                </div>
            </c:if>

            <div class="form-container">
                <form id="employeeForm" action="register-employee" method="post">
                    <div class="form-grid">
                        <div class="form-group">
                            <label class="form-label">
                                Full Name <span class="required">*</span>
                            </label>
                            <div class="input-icon" data-icon="👤">
                                <input 
                                    type="text" 
                                    class="form-input" 
                                    id="fullname" 
                                    name="fullname" 
                                    placeholder="Enter full name"
                                    required
                                    >
                            </div>
                            <span class="error-message" id="fullnameError">Please enter a valid full name</span>
                        </div>

                        <div class="form-group">
                            <label class="form-label">
                                Email Address <span class="required">*</span>
                            </label>
                            <div class="input-icon" data-icon="📧">
                                <input 
                                    type="email" 
                                    class="form-input" 
                                    id="email" 
                                    name="email" 
                                    placeholder="employee@company.com"
                                    required
                                    >
                            </div>
                            <span class="error-message" id="emailError">Please enter a valid email address</span>
                        </div>

                        <div class="form-group">
                            <label class="form-label">
                                Phone Number <span class="required">*</span>
                            </label>
                            <div class="input-icon" data-icon="📱">
                                <input 
                                    type="tel" 
                                    class="form-input" 
                                    id="phone" 
                                    name="phone" 
                                    placeholder="0123456789"
                                    required
                                    >
                            </div>
                            <span class="error-message" id="phoneError">Please enter a valid phone number</span>
                        </div>

                        <div class="form-group">
                            <label class="form-label">
                                Department <span class="required">*</span>
                            </label>
                            <select class="form-select" id="department" name="department" required>
                                <option value="">Select Department</option>
                                <option value="Sales">Sales</option>
                                <option value="Customer Service">Customer Service</option>
                                <option value="Management">Management</option>
                            </select>
                            <span class="error-message" id="departmentError">Please select a department</span>
                        </div>

                        <div class="form-group">
                            <label class="form-label">
                                Hire Date <span class="required">*</span>
                            </label>
                            <div class="input-icon" data-icon="📅">
                                <input 
                                    type="date" 
                                    class="form-input" 
                                    id="hiredate" 
                                    name="hiredate" 
                                    required
                                    >
                            </div>
                            <span class="helper-text">Select the employee's start date</span>
                            <span class="error-message" id="hiredateError">Please select a hire date</span>
                        </div>

                        <div class="form-group">
                            <label class="form-label">
                                Salary (VNĐ) <span class="required">*</span>
                            </label>
                            <div class="input-icon" data-icon="💰">
                                <input 
                                    type="number" 
                                    class="form-input" 
                                    id="salary" 
                                    name="salary" 
                                    placeholder="15000000"
                                    min="0"
                                    step="100000"
                                    required
                                    >
                            </div>
                            <span class="helper-text">Monthly salary in Vietnamese Dong</span>
                            <span class="error-message" id="salaryError">Please enter a valid salary amount</span>
                        </div>
                    </div>

                    <div class="form-actions">
                        <button type="button" class="btn btn-secondary" onclick="window.history.back()">
                            Cancel
                        </button>
                        <button type="submit" class="btn btn-primary">
                            Create Employee
                        </button>
                    </div>
                </form>
            </div>
        </main>

        <script>
            const form = document.getElementById('employeeForm');
            const successMessage = document.getElementById('successMessage');

            // Set max date to today for hire date
            const today = new Date().toISOString().split('T')[0];
            document.getElementById('hiredate').setAttribute('max', today);

            // Form validation
            function validateField(field) {
                const value = field.value.trim();
                const fieldName = field.name;
                const errorElement = document.getElementById(fieldName + 'Error');
                let isValid = true;

                // Remove previous error state
                field.classList.remove('error');
                if (errorElement) {
                    errorElement.style.display = 'none';
                }

                if (!value) {
                    isValid = false;
                } else {
                    switch (fieldName) {
                        case 'fullname':
                            if (value.length < 2) {
                                isValid = false;
                                errorElement.textContent = 'Name must be at least 2 characters';
                            }
                            break;
                        case 'email':
                            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                            if (!emailRegex.test(value)) {
                                isValid = false;
                                errorElement.textContent = 'Please enter a valid email address';
                            }
                            break;
                        case 'phone':
                            const phoneRegex = /^[0-9]{10,11}$/;
                            if (!phoneRegex.test(value)) {
                                isValid = false;
                                errorElement.textContent = 'Phone number must be 10-11 digits';
                            }
                            break;
                        case 'salary':
                            if (value <= 0) {
                                isValid = false;
                                errorElement.textContent = 'Salary must be greater than 0';
                            }
                            break;
                    }
                }

                if (!isValid && errorElement) {
                    field.classList.add('error');
                    errorElement.style.display = 'block';
                }

                return isValid;
            }

            // Add blur event listeners for real-time validation
            const inputs = form.querySelectorAll('.form-input, .form-select');
            inputs.forEach(input => {
                input.addEventListener('blur', () => validateField(input));
                input.addEventListener('input', () => {
                    if (input.classList.contains('error')) {
                        validateField(input);
                    }
                });
            });

            // Format salary input
            const salaryInput = document.getElementById('salary');
            salaryInput.addEventListener('input', (e) => {
                let value = e.target.value.replace(/[^0-9]/g, '');
                e.target.value = value;
            });

            );
        </script>
    </body>
</html>
