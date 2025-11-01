<%-- 
    Document   : login
    Created on : Oct 24, 2025
    Author     : trong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đăng nhập - Group 5</title>
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
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 20px;
            }

            .login-container {
                background: white;
                border-radius: 20px;
                box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
                overflow: hidden;
                max-width: 1000px;
                width: 100%;
                display: grid;
                grid-template-columns: 1fr 1fr;
            }

            .login-left {
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                padding: 60px 40px;
                color: white;
                display: flex;
                flex-direction: column;
                justify-content: center;
            }

            .login-left h1 {
                font-size: 36px;
                margin-bottom: 20px;
                font-weight: 700;
            }

            .login-left p {
                font-size: 16px;
                line-height: 1.6;
                opacity: 0.95;
                margin-bottom: 30px;
            }

            .feature-list {
                list-style: none;
            }

            .feature-item {
                display: flex;
                align-items: center;
                gap: 15px;
                margin-bottom: 20px;
                font-size: 15px;
            }

            .feature-icon {
                width: 40px;
                height: 40px;
                background: rgba(255, 255, 255, 0.2);
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 20px;
            }

            .login-right {
                padding: 60px 40px;
            }

            .login-header {
                text-align: center;
                margin-bottom: 40px;
            }

            .logo {
                font-size: 28px;
                font-weight: bold;
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                margin-bottom: 10px;
            }

            .login-header h2 {
                font-size: 24px;
                color: #333;
                margin-bottom: 10px;
            }

            .login-header p {
                color: #666;
                font-size: 14px;
            }

            .login-form {
                display: flex;
                flex-direction: column;
                gap: 20px;
            }

            .form-group {
                display: flex;
                flex-direction: column;
                gap: 8px;
            }

            .form-group label {
                font-size: 14px;
                font-weight: 600;
                color: #333;
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

            .password-toggle {
                position: absolute;
                right: 15px;
                top: 50%;
                transform: translateY(-50%);
                cursor: pointer;
                color: #999;
                font-size: 18px;
            }

            .form-options {
                display: flex;
                justify-content: space-between;
                align-items: center;
                font-size: 14px;
            }

            .remember-me {
                display: flex;
                align-items: center;
                gap: 8px;
                cursor: pointer;
            }

            .remember-me input[type="checkbox"] {
                width: 18px;
                height: 18px;
                cursor: pointer;
            }

            .forgot-password {
                color: #667eea;
                text-decoration: none;
                font-weight: 600;
                transition: color 0.3s;
            }

            .forgot-password:hover {
                color: #764ba2;
            }

            .login-btn {
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                color: white;
                padding: 15px;
                border: none;
                border-radius: 10px;
                font-size: 16px;
                font-weight: 600;
                cursor: pointer;
                transition: transform 0.3s, box-shadow 0.3s;
                margin-top: 10px;
            }

            .login-btn:hover {
                transform: translateY(-2px);
                box-shadow: 0 10px 20px rgba(102, 126, 234, 0.3);
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

            .social-login {
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

            .signup-link {
                text-align: center;
                margin-top: 30px;
                font-size: 14px;
                color: #666;
            }

            .signup-link a {
                color: #667eea;
                text-decoration: none;
                font-weight: 600;
            }

            .signup-link a:hover {
                color: #764ba2;
            }

            /* Error Messages */
            .error-message {
                background: #ffebee;
                color: #c62828;
                padding: 15px 20px;
                border-radius: 10px;
                font-size: 14px;
                
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

            .wrong-email-message {
                background: #fff3e0;
                color: #e65100;
                padding: 15px 20px;
                border-radius: 10px;
                font-size: 14px;
                display: none;
                margin-bottom: 20px;
                border-left: 4px solid #ff9800;
            }

            .wrong-email-message.show {
                display: flex;
            }

            .wrong-email-message::before {
                content: '📧';
                font-size: 18px;
                margin-right: 10px;
            }

            .wrong-password-message {
                background: #fce4ec;
                color: #880e4f;
                padding: 15px 20px;
                border-radius: 10px;
                font-size: 14px;
                display: none;
                margin-bottom: 20px;
                border-left: 4px solid #e91e63;
            }

            .wrong-password-message.show {
                display: flex;
            }

            .wrong-password-message::before {
                content: '🔒';
                font-size: 18px;
                margin-right: 10px;
            }

            .account-not-found-message {
                background: #e3f2fd;
                color: #01579b;
                padding: 15px 20px;
                border-radius: 10px;
                font-size: 14px;
                display: none;
                margin-bottom: 20px;
                border-left: 4px solid #2196f3;
            }

            .account-not-found-message.show {
                display: flex;
            }

            .account-not-found-message::before {
                content: '👤';
                font-size: 18px;
                margin-right: 10px;
            }

            @media (max-width: 768px) {
                .login-container {
                    grid-template-columns: 1fr;
                }

                .login-left {
                    display: none;
                }

                .login-right {
                    padding: 40px 30px;
                }
            }
        </style>
    </head>
    <body>
        <div class="login-container">
            <div class="login-left">
                <h1>👋 Chào mừng trở lại!</h1>
                <p>Đăng nhập để trải nghiệm mua sắm tuyệt vời với hàng ngàn sản phẩm laptop chính hãng.</p>
                <ul class="feature-list">
                    <li class="feature-item">
                        <div class="feature-icon">🎁</div>
                        <span>Ưu đãi độc quyền cho thành viên</span>
                    </li>
                    <li class="feature-item">
                        <div class="feature-icon">🚚</div>
                        <span>Miễn phí vận chuyển toàn quốc</span>
                    </li>
                    <li class="feature-item">
                        <div class="feature-icon">⭐</div>
                        <span>Tích điểm đổi quà hấp dẫn</span>
                    </li>
                    <li class="feature-item">
                        <div class="feature-icon">🔒</div>
                        <span>Bảo mật thông tin tuyệt đối</span>
                    </li>
                </ul>
            </div>

            <div class="login-right">
                <div class="login-header">
                    <div class="logo">Group 5</div>
                    <h2>Đăng nhập tài khoản</h2>
                    <p>Nhập thông tin để tiếp tục</p>
                </div>
                <c:if test="${accountNotFound != null}">
                    <!-- General Error Message -->
                    <div class="error-message" id="errorMessage">
                        Email hoặc mật khẩu không chính xác!
                    </div>
                </c:if>
                <form class="login-form" action="login-customer" method="POST">
                    <div class="form-group">
                        <label for="email">Email</label>
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
                    </div>

                    <div class="form-group">
                        <label for="password">Mật khẩu</label>
                        <div class="input-wrapper">
                            <span class="input-icon">🔒</span>
                            <input 
                                type="password" 
                                id="password" 
                                name="password" 
                                class="form-input" 
                                placeholder="Nhập mật khẩu"
                                required
                                >
                            <span class="password-toggle" onclick="togglePassword()">👁️</span>
                        </div>
                    </div>

                    <div class="form-options">
                        <label class="remember-me">
                            <input type="checkbox" name="remember">
                            <span>Ghi nhớ đăng nhập</span>
                        </label>
                        <a href="forgot-password" class="forgot-password">Quên mật khẩu?</a>
                    </div>

                    <button type="submit" class="login-btn">Đăng nhập</button>
                </form>

                <div class="divider">hoặc đăng nhập với</div>

                <div class="social-login">
                    <button class="social-btn">
                        <span>🔍</span>
                        <span>Google</span>
                    </button>
                    <button class="social-btn">
                        <span>📘</span>
                        <span>Facebook</span>
                    </button>
                </div>

                <div class="signup-link">
                    Chưa có tài khoản? <a href="register.jsp">Đăng ký ngay</a>
                </div>
            </div>
        </div>

        <script>
            function togglePassword() {
                const passwordInput = document.getElementById('password');
                const type = passwordInput.type === 'password' ? 'text' : 'password';
                passwordInput.type = type;
            }
        </script>
    </body>
</html>