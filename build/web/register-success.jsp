<%-- 
    Document   : register-success
    Created on : Nov 1, 2025, 1:53:56 AM
    Author     : trong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đăng ký thành công - Group 5</title>
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

            .success-container {
                max-width: 500px;
                width: 100%;
                background: white;
                border-radius: 20px;
                box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
                padding: 50px 40px;
                text-align: center;
                animation: slideUp 0.6s ease-out;
            }

            @keyframes slideUp {
                from {
                    opacity: 0;
                    transform: translateY(30px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            .success-icon {
                width: 120px;
                height: 120px;
                margin: 0 auto 30px;
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 60px;
                animation: scaleIn 0.5s ease-out 0.2s both;
            }

            @keyframes scaleIn {
                from {
                    transform: scale(0);
                }
                to {
                    transform: scale(1);
                }
            }

            .checkmark {
                color: white;
                font-size: 70px;
                animation: checkmark 0.8s ease-out 0.4s both;
            }

            @keyframes checkmark {
                0% {
                    transform: scale(0) rotate(-45deg);
                }
                50% {
                    transform: scale(1.2) rotate(10deg);
                }
                100% {
                    transform: scale(1) rotate(0deg);
                }
            }

            h1 {
                font-size: 32px;
                color: #333;
                margin-bottom: 15px;
                font-weight: 700;
            }

            .success-message {
                font-size: 16px;
                color: #666;
                line-height: 1.6;
                margin-bottom: 35px;
            }

            .info-box {
                background: #f8f9ff;
                border-radius: 12px;
                padding: 20px;
                margin-bottom: 30px;
                text-align: left;
            }

            .info-item {
                display: flex;
                align-items: center;
                gap: 12px;
                margin-bottom: 12px;
                font-size: 14px;
                color: #555;
            }

            .info-item:last-child {
                margin-bottom: 0;
            }

            .info-icon {
                font-size: 20px;
            }

            .button-group {
                display: flex;
                flex-direction: column;
                gap: 12px;
            }

            .btn {
                padding: 16px 32px;
                border: none;
                border-radius: 10px;
                font-size: 16px;
                font-weight: 600;
                cursor: pointer;
                transition: all 0.3s;
                text-decoration: none;
                display: inline-block;
            }

            .btn-primary {
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                color: white;
            }

            .btn-primary:hover {
                transform: translateY(-2px);
                box-shadow: 0 10px 20px rgba(102, 126, 234, 0.3);
            }

            .btn-secondary {
                background: white;
                color: #667eea;
                border: 2px solid #667eea;
            }

            .btn-secondary:hover {
                background: #f8f9ff;
            }

            .logo {
                font-size: 24px;
                font-weight: bold;
                color: #667eea;
                margin-bottom: 20px;
            }

            @media (max-width: 480px) {
                .success-container {
                    padding: 40px 30px;
                }

                h1 {
                    font-size: 26px;
                }

                .success-icon {
                    width: 100px;
                    height: 100px;
                }
            }
        </style>
    </head>
    <body>
        <div class="success-container">
            <div class="logo">Group 5</div>

            <div class="success-icon">
                <div class="checkmark">✓</div>
            </div>

            <h1>🎉 Đăng ký thành công!</h1>

            <p class="success-message">
                Chúc mừng! Tài khoản của bạn đã được tạo thành công. 
                Bạn có thể đăng nhập và bắt đầu trải nghiệm mua sắm ngay bây giờ.
            </p>

            <div class="info-box">
                <div class="info-item">
                    <span class="info-icon">📧</span>
                    <span>Email xác nhận đã được gửi đến hộp thư của bạn</span>
                </div>
                <div class="info-item">
                    <span class="info-icon">🎁</span>
                    <span>Nhận ngay ưu đãi 15% cho đơn hàng đầu tiên</span>
                </div>
                <div class="info-item">
                    <span class="info-icon">⚡</span>
                    <span>Miễn phí vận chuyển cho thành viên mới</span>
                </div>
            </div>

            <div class="button-group">
                <a href="login.jsp" class="btn btn-primary">
                    🚀 Đăng nhập ngay
                </a>
                <a href="product" class="btn btn-secondary">
                    🏠 Về trang chủ
                </a>
            </div>
        </div>
    </body>
</html>