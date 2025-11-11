<%-- 
    Document   : register
    Created on : Oct 24, 2025
    Author     : trong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đăng ký tài khoản - Group 5</title>
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
                padding: 40px 20px;
            }

            .register-container {
                max-width: 900px;
                margin: 0 auto;
                background: white;
                border-radius: 20px;
                box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
                overflow: hidden;
            }

            .register-header {
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                color: white;
                padding: 40px;
                text-align: center;
            }

            .logo {
                font-size: 32px;
                font-weight: bold;
                margin-bottom: 15px;
            }

            .register-header h1 {
                font-size: 28px;
                margin-bottom: 10px;
            }

            .register-header p {
                font-size: 15px;
                opacity: 0.95;
            }

            .register-body {
                padding: 40px;
            }

            .progress-steps {
                display: flex;
                justify-content: space-between;
                margin-bottom: 40px;
                position: relative;
            }

            .progress-steps::before {
                content: '';
                position: absolute;
                top: 20px;
                left: 0;
                right: 0;
                height: 2px;
                background: #e0e0e0;
                z-index: 0;
            }

            .step {
                display: flex;
                flex-direction: column;
                align-items: center;
                gap: 10px;
                flex: 1;
                position: relative;
                z-index: 1;
            }

            .step-number {
                width: 40px;
                height: 40px;
                border-radius: 50%;
                background: #e0e0e0;
                color: #999;
                display: flex;
                align-items: center;
                justify-content: center;
                font-weight: bold;
                transition: all 0.3s;
            }

            .step.active .step-number {
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                color: white;
            }

            .step-label {
                font-size: 13px;
                color: #999;
                font-weight: 600;
            }

            .step.active .step-label {
                color: #667eea;
            }

            .register-form {
                display: flex;
                flex-direction: column;
                gap: 20px;
            }

            .form-row {
                display: grid;
                grid-template-columns: 1fr 1fr;
                gap: 20px;
            }

            .form-group {
                display: flex;
                flex-direction: column;
                gap: 8px;
            }

            .form-group.full-width {
                grid-column: 1 / -1;
            }

            .form-group label {
                font-size: 14px;
                font-weight: 600;
                color: #333;
            }

            .required {
                color: #d32f2f;
            }

            .input-wrapper {
                position: relative;
            }

            .input-icon {
                position: absolute;
                left: 15px;
                top: 50%;
                transform: translateY(-50%);
                color: #999;
                font-size: 18px;
            }

            .form-input {
                width: 100%;
                padding: 14px 15px 14px 45px;
                border: 2px solid #e0e0e0;
                border-radius: 10px;
                font-size: 14px;
                transition: all 0.3s;
            }

            .form-input:focus {
                outline: none;
                border-color: #667eea;
                box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
            }

            .form-input.error {
                border-color: #d32f2f;
            }

            .password-toggle {
                position: absolute;
                right: 15px;
                top: 50%;
                transform: translateY(-50%);
                cursor: pointer;
                color: #999;
                font-size: 18px;
            }

            .error-text {
                font-size: 12px;
                color: #d32f2f;
                display: none;
            }

            .error-text.show {
                display: block;
            }

            .password-strength {
                display: flex;
                gap: 5px;
                margin-top: 5px;
            }

            .strength-bar {
                flex: 1;
                height: 4px;
                background: #e0e0e0;
                border-radius: 2px;
                transition: background 0.3s;
            }

            .strength-bar.active {
                background: #4caf50;
            }

            .strength-bar.medium {
                background: #ff9800;
            }

            .strength-bar.weak {
                background: #f44336;
            }

            .hint-text {
                font-size: 12px;
                color: #666;
                margin-top: 5px;
            }

            .register-btn {
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                color: white;
                padding: 16px;
                border: none;
                border-radius: 10px;
                font-size: 16px;
                font-weight: 600;
                cursor: pointer;
                transition: transform 0.3s, box-shadow 0.3s;
                margin-top: 10px;
            }

            .register-btn:hover {
                transform: translateY(-2px);
                box-shadow: 0 10px 20px rgba(102, 126, 234, 0.3);
            }

            .register-btn:disabled {
                opacity: 0.6;
                cursor: not-allowed;
                transform: none;
            }

            .divider {
                display: flex;
                align-items: center;
                gap: 15px;
                margin: 30px 0;
                color: #999;
                font-size: 14px;
            }

            .divider::before,
            .divider::after {
                content: '';
                flex: 1;
                height: 1px;
                background: #e0e0e0;
            }

            .social-register {
                display: grid;
                grid-template-columns: 1fr 1fr;
                gap: 15px;
            }

            .social-btn {
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 10px;
                padding: 12px;
                border: 2px solid #e0e0e0;
                border-radius: 10px;
                background: white;
                cursor: pointer;
                font-size: 14px;
                font-weight: 600;
                transition: all 0.3s;
            }

            .social-btn:hover {
                border-color: #667eea;
                background: #f8f9ff;
            }

            .login-link {
                text-align: center;
                margin-top: 30px;
                font-size: 14px;
                color: #666;
            }

            .login-link a {
                color: #667eea;
                text-decoration: none;
                font-weight: 600;
            }

            .login-link a:hover {
                color: #764ba2;
            }

            .success-message {
                background: #e8f5e9;
                color: #2e7d32;
                padding: 15px 20px;
                border-radius: 10px;
                font-size: 14px;
                display: none;
                margin-bottom: 20px;
                border-left: 4px solid #4caf50;
                display: flex;
                align-items: center;
                gap: 10px;
            }

            .success-message.show {
                display: flex;
            }

            .success-message::before {
                content: '✓';
                font-size: 20px;
                font-weight: bold;
            }

            .error-message {
                background: #ffebee;
                color: #c62828;
                padding: 15px 20px;
                border-radius: 10px;
                font-size: 14px;
                display: none;
                margin-bottom: 20px;
                border-left: 4px solid #f44336;
            }

            .error-message.show {
                display: flex;
            }

            .error-message::before {
                content: '⚠';
                font-size: 20px;
                margin-right: 10px;
            }

            .account-exists-message {
                background: #fff3e0;
                color: #e65100;
                padding: 15px 20px;
                border-radius: 10px;
                font-size: 14px;
                
                margin-bottom: 20px;
                border-left: 4px solid #ff9800;
            }

            .account-exists-message.show {
                display: flex;
            }

            .account-exists-message::before {
                content: 'ℹ';
                font-size: 20px;
                margin-right: 10px;
                font-weight: bold;
            }

            .password-mismatch-message {
                background: #fce4ec;
                color: #880e4f;
                padding: 15px 20px;
                border-radius: 10px;
                font-size: 14px;
                
                margin-bottom: 20px;
                border-left: 4px solid #e91e63;
            }

            .password-mismatch-message.show {
                display: flex;
            }

            .password-mismatch-message::before {
                content: '🔒';
                font-size: 18px;
                margin-right: 10px;
            }

            @media (max-width: 768px) {
                .register-body {
                    padding: 30px 20px;
                }

                .form-row {
                    grid-template-columns: 1fr;
                }

                .progress-steps {
                    flex-direction: column;
                    gap: 15px;
                }

                .progress-steps::before {
                    display: none;
                }

                .step {
                    flex-direction: row;
                    justify-content: flex-start;
                }

                .social-register {
                    grid-template-columns: 1fr;
                }
            }
        </style>
    </head>
    <body>
        <div class="register-container">
            <div class="register-header">
                <div class="logo">Group 5</div>
                <h1>🎉 Đăng ký tài khoản</h1>
                <p>Tạo tài khoản để nhận ưu đãi độc quyền và trải nghiệm mua sắm tuyệt vời</p>
            </div>

            <div class="register-body">
                <div class="progress-steps">
                    <div class="step active">
                        <div class="step-number">1</div>
                        <div class="step-label">Thông tin</div>
                    </div>
                    <div class="step">
                        <div class="step-number">2</div>
                        <div class="step-label">Xác thực</div>
                    </div>
                    <div class="step">
                        <div class="step-number">3</div>
                        <div class="step-label">Hoàn tất</div>
                    </div>
                </div>




                <c:if test="${existedAccount != null}">
                    <!-- Account Exists Message -->
                    <div class="account-exists-message" id="accountExistsMessage">
                        Tài khoản với email hoặc số điện thoại này đã tồn tại. Vui lòng đăng nhập hoặc sử dụng thông tin khác.
                    </div>
                </c:if>
                <c:if test="${differencePassword!=null}">
                    <!-- Password Mismatch Message -->
                    <div class="password-mismatch-message" id="passwordMismatchMessage">
                        Mật khẩu xác nhận không khớp. Vui lòng kiểm tra và nhập lại.
                    </div>
                </c:if>
                <form class="register-form" action="register-customer" method="POST">
                    <div class="form-row">
                        <div class="form-group">
                            <label for="fullname">Họ và tên <span class="required">*</span></label>
                            <div class="input-wrapper">
                                <span class="input-icon">👤</span>
                                <input 
                                    type="text" 
                                    id="fullname" 
                                    name="fullname" 
                                    class="form-input" 
                                    placeholder="Nguyễn Văn A"
                                    required
                                    >
                            </div>
                            <span class="error-text" id="nameError">Vui lòng nhập họ tên</span>
                        </div>

                        <div class="form-group">
                            <label for="phone">Số điện thoại <span class="required">*</span></label>
                            <div class="input-wrapper">
                                <span class="input-icon">📞</span>
                                <input 
                                    type="tel" 
                                    id="phone" 
                                    name="phone" 
                                    class="form-input" 
                                    placeholder="0912345678"
                                    pattern="[0-9]{10}"
                                    required
                                    >
                            </div>
                            <span class="error-text" id="phoneError">Số điện thoại không hợp lệ</span>
                            <span class="hint-text">Nhập 10 chữ số</span>
                        </div>
                    </div>

                    <div class="form-group full-width">
                        <label for="email">Email <span class="required">*</span></label>
                        <div class="input-wrapper">
                            <span class="input-icon">📧</span>
                            <input 
                                type="email" 
                                id="email" 
                                name="email" 
                                class="form-input" 
                                placeholder="example@email.com"
                                required
                                >
                        </div>
                        <span class="error-text" id="emailError">Email không hợp lệ</span>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="dateofbirth">Ngày sinh <span class="required">*</span></label>
                            <div class="input-wrapper">
                                <span class="input-icon">🎂</span>
                                <input 
                                    type="date" 
                                    id="dateofbirth" 
                                    name="dateofbirth" 
                                    class="form-input"
                                    max="2007-12-31"
                                    required
                                    >
                            </div>
                            <span class="error-text" id="dobError">Phải từ 18 tuổi trở lên</span>
                        </div>
                        <div class="form-group">
                            <label for="address">Địa chỉ <span class="required">*</span></label>
                            <div class="input-wrapper">
                                <span class="input-icon">📍</span>
                                <input 
                                    type="text" 
                                    id="address" 
                                    name="address" 
                                    class="form-input" 
                                    placeholder="Số nhà, đường, phường/xã, quận/huyện, tỉnh/thành phố"
                                    required
                                    >
                            </div>
                            <span class="error-text" id="addressError">Vui lòng nhập địa chỉ</span>
                        </div>

                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="password">Mật khẩu <span class="required">*</span></label>
                            <div class="input-wrapper">
                                <span class="input-icon">🔒</span>
                                <input 
                                    type="password" 
                                    id="password" 
                                    name="password" 
                                    class="form-input" 
                                    placeholder="Tối thiểu 8 ký tự"
                                    minlength="8"
                                    required
                                    oninput="checkPasswordStrength()"
                                    >
                                <span class="password-toggle" onclick="togglePassword('password')">👁️</span>
                            </div>
                            <div class="password-strength">
                                <div class="strength-bar" id="strength1"></div>
                                <div class="strength-bar" id="strength2"></div>
                                <div class="strength-bar" id="strength3"></div>
                                <div class="strength-bar" id="strength4"></div>
                            </div>
                            <span class="hint-text">Mật khẩu mạnh: chữ hoa, chữ thường, số và ký tự đặc biệt</span>
                        </div>

                        <div class="form-group">
                            <label for="confirmPassword">Xác nhận mật khẩu <span class="required">*</span></label>
                            <div class="input-wrapper">
                                <span class="input-icon">🔒</span>
                                <input 
                                    type="password" 
                                    id="confirmPassword" 
                                    name="confirmPassword" 
                                    class="form-input" 
                                    placeholder="Nhập lại mật khẩu"
                                    required
                                    >
                                <span class="password-toggle" onclick="togglePassword('confirmPassword')">👁️</span>
                            </div>
                            <span class="error-text" id="confirmPasswordError">Mật khẩu không khớp</span>
                        </div>
                    </div>

                    <button type="submit" class="register-btn" id="registerBtn">
                        🚀 Đăng ký ngay
                    </button>
                </form>

                <div class="divider">hoặc đăng ký với</div>

                <div class="social-register">
                    <button class="social-btn">
                        <span>🔍</span>
                        <span>Google</span>
                    </button>
                    <button class="social-btn">
                        <span>📘</span>
                        <span>Facebook</span>
                    </button>
                </div>

                <div class="login-link">
                    Đã có tài khoản? <a href="login.jsp">Đăng nhập ngay</a>
                </div>
            </div>
        </div>

        <script>
            function togglePassword(fieldId) {
                const passwordInput = document.getElementById(fieldId);
                const type = passwordInput.type === 'password' ? 'text' : 'password';
                passwordInput.type = type;
            }

            function checkPasswordStrength() {
                const password = document.getElementById('password').value;
                const strength1 = document.getElementById('strength1');
                const strength2 = document.getElementById('strength2');
                const strength3 = document.getElementById('strength3');
                const strength4 = document.getElementById('strength4');

                // Reset
                [strength1, strength2, strength3, strength4].forEach(bar => {
                    bar.classList.remove('active', 'medium', 'weak');
                });

                if (password.length === 0)
                    return;

                let strength = 0;
                if (password.length >= 8)
                    strength++;
                if (password.match(/[a-z]/) && password.match(/[A-Z]/))
                    strength++;
                if (password.match(/[0-9]/))
                    strength++;
                if (password.match(/[^a-zA-Z0-9]/))
                    strength++;

                const bars = [strength1, strength2, strength3, strength4];
                for (let i = 0; i < strength; i++) {
                    if (strength <= 2) {
                        bars[i].classList.add('weak');
                    } else if (strength === 3) {
                        bars[i].classList.add('medium');
                    } else {
                        bars[i].classList.add('active');
                    }
                }
            }

            // Set max date for date of birth (18 years ago)
            const today = new Date();
            const maxDate = new Date(today.getFullYear() - 18, today.getMonth(), today.getDate());
            document.getElementById('dateofbirth').max = maxDate.toISOString().split('T')[0];
        </script>
    </body>
</html>