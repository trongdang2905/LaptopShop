<%-- 
    Document   : profile
    Created on : Nov 03, 2025
    Author     : trong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Thông tin tài khoản - Group 5</title>
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
                cursor: pointer;
            }

            .back-btn {
                background: rgba(255, 255, 255, 0.15);
                padding: 8px 20px;
                border-radius: 20px;
                cursor: pointer;
                transition: background 0.3s;
                display: flex;
                align-items: center;
                gap: 8px;
            }

            .back-btn:hover {
                background: rgba(255, 255, 255, 0.25);
            }

            .main-container {
                max-width: 1000px;
                margin: 30px auto;
                padding: 0 20px;
            }

            .profile-header {
                background: white;
                border-radius: 12px;
                padding: 30px;
                margin-bottom: 30px;
                display: flex;
                align-items: center;
                gap: 30px;
            }

            .profile-avatar {
                width: 120px;
                height: 120px;
                border-radius: 50%;
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 48px;
                font-weight: bold;
                color: white;
            }

            .profile-info {
                flex: 1;
            }

            .profile-name {
                font-size: 28px;
                font-weight: bold;
                color: #333;
                margin-bottom: 8px;
            }

            .profile-email {
                font-size: 16px;
                color: #666;
                margin-bottom: 15px;
            }

            .profile-badges {
                display: flex;
                gap: 10px;
            }

            .badge {
                padding: 6px 15px;
                border-radius: 20px;
                font-size: 13px;
                font-weight: 600;
            }

            .badge-member {
                background: #e3f2fd;
                color: #2196F3;
            }

            .badge-verified {
                background: #e8f5e9;
                color: #4caf50;
            }

            .profile-content {
                background: white;
                border-radius: 12px;
                padding: 40px;
            }

            .section-title {
                font-size: 22px;
                font-weight: bold;
                color: #333;
                margin-bottom: 30px;
                padding-bottom: 15px;
                border-bottom: 2px solid #f0f0f0;
                display: flex;
                align-items: center;
                gap: 10px;
            }

            .form-grid {
                display: grid;
                grid-template-columns: repeat(2, 1fr);
                gap: 25px;
            }

            .form-group {
                display: flex;
                flex-direction: column;
            }

            .form-group.full-width {
                grid-column: 1 / -1;
            }

            .form-label {
                font-size: 14px;
                font-weight: 600;
                color: #555;
                margin-bottom: 8px;
                display: flex;
                align-items: center;
                gap: 5px;
            }

            .form-input {
                padding: 12px 15px;
                border: 2px solid #e0e0e0;
                border-radius: 8px;
                font-size: 15px;
                transition: all 0.3s;
                background: white;
            }

            .form-input:focus {
                outline: none;
                border-color: #667eea;
                box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
            }

            .form-input:read-only {
                background: #f8f8f8;
                color: #666;
                cursor: not-allowed;
            }

            .form-input:read-only:focus {
                border-color: #e0e0e0;
                box-shadow: none;
            }

            .readonly-badge {
                font-size: 11px;
                background: #fef3c7;
                color: #92400e;
                padding: 2px 8px;
                border-radius: 10px;
                font-weight: 600;
            }

            .button-group {
                display: flex;
                gap: 15px;
                margin-top: 30px;
                padding-top: 30px;
                border-top: 2px solid #f0f0f0;
            }

            .btn {
                padding: 12px 30px;
                border-radius: 8px;
                font-size: 15px;
                font-weight: 600;
                cursor: pointer;
                transition: all 0.3s;
                border: none;
                display: flex;
                align-items: center;
                gap: 8px;
            }

            .btn-primary {
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                color: white;
            }

            .btn-primary:hover {
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(102, 126, 234, 0.3);
            }

            .btn-secondary {
                background: white;
                color: #666;
                border: 2px solid #e0e0e0;
            }

            .btn-secondary:hover {
                background: #f8f8f8;
                border-color: #d0d0d0;
            }

            .info-box {
                background: #f0f7ff;
                border-left: 4px solid #2196F3;
                padding: 15px 20px;
                border-radius: 8px;
                margin-bottom: 25px;
                font-size: 14px;
                color: #1565c0;
            }

            .footer {
                background: #2c3e50;
                color: white;
                padding: 30px 0;
                margin-top: 60px;
                text-align: center;
            }

            .success-message {
                background: #e8f5e9;
                border-left: 4px solid #4caf50;
                padding: 15px 20px;
                border-radius: 8px;
                margin-bottom: 25px;
                color: #2e7d32;
            }

            .error-message {
                background: #ffebee;
                border-left: 4px solid #f44336;
                padding: 15px 20px;
                border-radius: 8px;
                margin-bottom: 25px;
                color: #c62828;
            }

            @media (max-width: 768px) {
                .form-grid {
                    grid-template-columns: 1fr;
                }

                .profile-header {
                    flex-direction: column;
                    text-align: center;
                }

                .profile-content {
                    padding: 25px;
                }

                .button-group {
                    flex-direction: column;
                }

                .btn {
                    width: 100%;
                    justify-content: center;
                }
            }
        </style>
    </head>
    <body>
        <header class="header">
            <div class="header-container">
                <div class="logo" onclick="window.location.href = '../product'">Group 5</div>
                <div class="back-btn" onclick="window.location.href = '../product'">
                    ← Quay lại trang chủ
                </div>
            </div>
        </header>

        <main class="main-container">
            <!-- Profile Header -->
            <div class="profile-header">
                <div class="profile-avatar">
                    ${sessionScope.accountCustomer.userName.substring(0,1).toUpperCase()}
                </div>
                <div class="profile-info">
                    <div class="profile-name">${sessionScope.infoCustomer.fullName}</div>
                    <div class="profile-email">${sessionScope.accountCustomer.userName}</div>
                    <div class="profile-badges">
                        <span class="badge badge-member">👑 Thành viên</span>
                        <span class="badge badge-verified">✓ Đã xác thực</span>
                    </div>
                </div>
            </div>

            <!-- Profile Form -->
            <div class="profile-content">
                <div class="section-title">
                    👤 Thông tin cá nhân
                </div>

                <div class="info-box">
                    ℹ️ Email không thể thay đổi vì đây là tài khoản đăng nhập của bạn
                </div>

                <!-- Success/Error Messages -->
                <c:if test="${requestScope.success!=null}">
                    <div class="success-message" id="successMessage">
                        ✓ Cập nhật thông tin thành công!
                    </div>
                </c:if>
                <c:if test="${requestScope.fail!=null}">
                    <div class="error-message" id="errorMessage">
                        ✗ Có lỗi xảy ra. Vui lòng thử lại!
                    </div>
                </c:if>
                <form id="profileForm" method="POST" action="update-profile">
                    <div class="form-grid">
                        <div class="form-group">
                            <label class="form-label">
                                Họ và tên <span style="color: #d32f2f;">*</span>
                            </label>
                            <input 
                                type="text" 
                                class="form-input" 
                                name="fullName"
                                value="${sessionScope.infoCustomer.fullName}"
                                required
                                placeholder="Nhập họ và tên"
                                >
                        </div>

                        <div class="form-group">
                            <label class="form-label">
                                Ngày sinh <span style="color: #d32f2f;">*</span>
                            </label>
                            <input 
                                type="date" 
                                class="form-input" 
                                name="date"
                                value="${sessionScope.infoCustomer.date}"
                                required
                                >
                        </div>

                        <div class="form-group full-width">
                            <label class="form-label">
                                Email 
                                <span class="readonly-badge">Chỉ đọc</span>
                            </label>
                            <input 
                                type="email" 
                                class="form-input" 
                                name="email"
                                value="${sessionScope.accountCustomer.userName}"
                                readonly
                                >
                        </div>

                        <div class="form-group">
                            <label class="form-label">
                                Số điện thoại <span style="color: #d32f2f;">*</span>
                            </label>
                            <input 
                                type="tel" 
                                class="form-input" 
                                name="phone"
                                value="${sessionScope.infoCustomer.phone}"
                                required
                                placeholder="Nhập số điện thoại"
                                pattern="[0-9]{10}"
                                title="Vui lòng nhập 10 số"
                                >
                        </div>



                        <div class="form-group full-width">
                            <label class="form-label">
                                Địa chỉ <span style="color: #d32f2f;">*</span>
                            </label>
                            <input 
                                type="text" 
                                class="form-input" 
                                name="address"
                                value="${sessionScope.infoCustomer.address}"
                                required
                                placeholder="Nhập địa chỉ đầy đủ"
                                >
                        </div>
                    </div>

                    <div class="button-group">
                        <button type="submit" class="btn btn-primary">
                            💾 Lưu thay đổi
                        </button>
                        <button type="button" class="btn btn-secondary" onclick="resetForm()">
                            ↺ Hủy bỏ
                        </button>
                    </div>
                </form>
            </div>
        </main>

        <footer class="footer">
            <p>© 2025 Group 5. All rights reserved.</p>
        </footer>

        <script>
            // Store original values
            const originalValues = {
                fullName: document.querySelector('[name="fullName"]').value,
                date: document.querySelector('[name="date"]').value,
                phone: document.querySelector('[name="phone"]').value,
                gender: document.querySelector('[name="gender"]').value,
                address: document.querySelector('[name="address"]').value
            };

            function resetForm() {
                if (confirm('Bạn có chắc muốn hủy các thay đổi?')) {
                    document.querySelector('[name="fullName"]').value = originalValues.fullName;
                    document.querySelector('[name="date"]').value = originalValues.date;
                    document.querySelector('[name="phone"]').value = originalValues.phone;
                    document.querySelector('[name="gender"]').value = originalValues.gender;
                    document.querySelector('[name="address"]').value = originalValues.address;
                }
            }

            // Form validation
            document.getElementById('profileForm').addEventListener('submit', function (e) {
                const phone = document.querySelector('[name="phone"]').value;

                // Validate phone number (must be 10 digits)
                if (!/^\d{10}$/.test(phone)) {
                    e.preventDefault();
                    alert('Số điện thoại phải có đúng 10 chữ số!');
                    return false;
                }

                // Validate date of birth (must be at least 13 years old)
                const dob = new Date(document.querySelector('[name="date"]').value);
                const today = new Date();
                const age = today.getFullYear() - dob.getFullYear();

                if (age < 13) {
                    e.preventDefault();
                    alert('Bạn phải ít nhất 13 tuổi!');
                    return false;
                }
            });

            );
        </script>
    </body>
</html>