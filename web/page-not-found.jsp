
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>404 - Trang không tìm thấy</title>
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
                overflow: hidden;
            }

            .error-container {
                text-align: center;
                color: white;
                padding: 40px;
                max-width: 600px;
                position: relative;
                z-index: 10;
            }

            .error-code {
                font-size: 150px;
                font-weight: 900;
                line-height: 1;
                margin-bottom: 20px;
                text-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
                animation: float 3s ease-in-out infinite;
            }

            @keyframes float {
                0%, 100% {
                    transform: translateY(0px);
                }
                50% {
                    transform: translateY(-20px);
                }
            }

            .error-icon {
                font-size: 80px;
                margin-bottom: 30px;
                animation: shake 2s ease-in-out infinite;
            }

            @keyframes shake {
                0%, 100% {
                    transform: rotate(0deg);
                }
                25% {
                    transform: rotate(-10deg);
                }
                75% {
                    transform: rotate(10deg);
                }
            }

            .error-title {
                font-size: 36px;
                font-weight: 700;
                margin-bottom: 15px;
                text-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            }

            .error-message {
                font-size: 18px;
                margin-bottom: 40px;
                opacity: 0.95;
                line-height: 1.6;
            }

            .error-buttons {
                display: flex;
                gap: 20px;
                justify-content: center;
                flex-wrap: wrap;
            }

            .btn {
                padding: 15px 40px;
                border-radius: 30px;
                font-size: 16px;
                font-weight: 600;
                cursor: pointer;
                transition: all 0.3s;
                text-decoration: none;
                display: inline-flex;
                align-items: center;
                gap: 10px;
                border: none;
            }

            .btn-primary {
                background: white;
                color: #667eea;
                box-shadow: 0 5px 20px rgba(0, 0, 0, 0.2);
            }

            .btn-primary:hover {
                transform: translateY(-3px);
                box-shadow: 0 8px 25px rgba(0, 0, 0, 0.3);
            }

            .btn-secondary {
                background: rgba(255, 255, 255, 0.2);
                color: white;
                backdrop-filter: blur(10px);
                border: 2px solid rgba(255, 255, 255, 0.3);
            }

            .btn-secondary:hover {
                background: rgba(255, 255, 255, 0.3);
                transform: translateY(-3px);
            }

            .suggestions {
                margin-top: 50px;
                padding: 30px;
                background: rgba(255, 255, 255, 0.1);
                backdrop-filter: blur(10px);
                border-radius: 20px;
                border: 1px solid rgba(255, 255, 255, 0.2);
            }

            .suggestions h3 {
                font-size: 20px;
                margin-bottom: 20px;
                font-weight: 600;
            }

            .suggestion-list {
                list-style: none;
                text-align: left;
                display: inline-block;
            }

            .suggestion-list li {
                padding: 10px 0;
                font-size: 15px;
                opacity: 0.9;
                display: flex;
                align-items: center;
                gap: 10px;
            }

            .suggestion-list li:before {
                content: "→";
                font-weight: bold;
            }

            /* Background Animation */
            .background-animation {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                z-index: 1;
                overflow: hidden;
            }

            .floating-shape {
                position: absolute;
                background: rgba(255, 255, 255, 0.1);
                border-radius: 50%;
                animation: floatShapes 20s infinite;
            }

            @keyframes floatShapes {
                0%, 100% {
                    transform: translateY(0) rotate(0deg);
                    opacity: 0.3;
                }
                50% {
                    transform: translateY(-100px) rotate(180deg);
                    opacity: 0.6;
                }
            }

            .shape1 {
                width: 100px;
                height: 100px;
                top: 10%;
                left: 10%;
                animation-delay: 0s;
            }

            .shape2 {
                width: 150px;
                height: 150px;
                top: 60%;
                right: 15%;
                animation-delay: 2s;
            }

            .shape3 {
                width: 80px;
                height: 80px;
                bottom: 15%;
                left: 20%;
                animation-delay: 4s;
            }

            .shape4 {
                width: 120px;
                height: 120px;
                top: 30%;
                right: 25%;
                animation-delay: 6s;
            }

            @media (max-width: 768px) {
                .error-code {
                    font-size: 100px;
                }

                .error-icon {
                    font-size: 60px;
                }

                .error-title {
                    font-size: 28px;
                }

                .error-message {
                    font-size: 16px;
                }

                .error-buttons {
                    flex-direction: column;
                    align-items: center;
                }

                .btn {
                    width: 100%;
                    max-width: 300px;
                }

                .suggestions {
                    padding: 20px;
                }
            }
        </style>
    </head>
    <body>
        <div class="background-animation">
            <div class="floating-shape shape1"></div>
            <div class="floating-shape shape2"></div>
            <div class="floating-shape shape3"></div>
            <div class="floating-shape shape4"></div>
        </div>

        <div class="error-container">
            <div class="error-icon">🔍</div>
            <div class="error-code">404</div>
            <h1 class="error-title">Oops! Trang không tìm thấy</h1>
            <p class="error-message">
                Xin lỗi, trang bạn đang tìm kiếm không tồn tại hoặc bạn không có quyền truy cập.<br>
                Có thể liên kết đã bị hỏng hoặc trang đã bị xóa.
            </p>

            <div class="error-buttons">
                <a href="product" class="btn btn-primary">
                    🏠 Về trang chủ
                </a>
                <button onclick="history.back()" class="btn btn-secondary">
                    ← Quay lại
                </button>
            </div>

            <div class="suggestions">
                <h3>💡 Bạn có thể thử:</h3>
                <ul class="suggestion-list">
                    <li>Kiểm tra lại URL đã nhập</li>
                    <li>Về trang chủ và tìm kiếm sản phẩm</li>
                    <li>Liên hệ với chúng tôi nếu vấn đề vẫn tiếp diễn</li>
                    <li>Đăng nhập nếu trang yêu cầu xác thực</li>
                </ul>
            </div>
        </div>

        <script>
            // Add more floating shapes dynamically
            function createFloatingShapes() {
                const container = document.querySelector('.background-animation');
                for (let i = 0; i < 5; i++) {
                    const shape = document.createElement('div');
                    shape.className = 'floating-shape';
                    shape.style.width = Math.random() * 100 + 50 + 'px';
                    shape.style.height = shape.style.width;
                    shape.style.left = Math.random() * 100 + '%';
                    shape.style.top = Math.random() * 100 + '%';
                    shape.style.animationDelay = Math.random() * 10 + 's';
                    shape.style.animationDuration = Math.random() * 10 + 15 + 's';
                    container.appendChild(shape);
                }
            }

            createFloatingShapes();

            // Prevent default behavior on error
            window.addEventListener('load', function () {
                console.log('404 Error Page Loaded');
            });
        </script>
    </body>
</html>