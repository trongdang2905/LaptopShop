<%-- 
    Document   : checkout
    Created on : Nov 11, 2025
    Author     : Group 5
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Thanh toán - Group 5</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Arial, sans-serif;
                background-color: #f4f4f4;
                padding-top: 85px;
            }

            .header {
                background: linear-gradient(135deg, #d32f2f 0%, #e74c3c 100%);
                color: white;
                padding: 15px 0;
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
                z-index: 1000;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
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

            .checkout-steps {
                display: flex;
                align-items: center;
                gap: 15px;
                color: white;
            }

            .step {
                display: flex;
                align-items: center;
                gap: 8px;
                padding: 8px 15px;
                border-radius: 20px;
                background: rgba(255, 255, 255, 0.15);
                font-size: 14px;
            }

            .step.active {
                background: rgba(255, 255, 255, 0.3);
                font-weight: 600;
            }

            .step-number {
                width: 24px;
                height: 24px;
                border-radius: 50%;
                background: white;
                color: #d32f2f;
                display: flex;
                align-items: center;
                justify-content: center;
                font-weight: bold;
                font-size: 12px;
            }

            /* Main Container */
            .checkout-container {
                max-width: 1400px;
                margin: 30px auto;
                padding: 0 20px;
                display: grid;
                grid-template-columns: 1fr 450px;
                gap: 30px;
            }

            .page-title {
                font-size: 28px;
                font-weight: bold;
                color: #333;
                margin-bottom: 20px;
                grid-column: 1 / -1;
                display: flex;
                align-items: center;
                gap: 10px;
            }

            .back-button {
                background: white;
                border: 2px solid #ddd;
                border-radius: 8px;
                padding: 8px 15px;
                cursor: pointer;
                font-size: 14px;
                font-weight: 600;
                color: #666;
                transition: all 0.3s;
            }

            .back-button:hover {
                border-color: #d32f2f;
                color: #d32f2f;
            }

            /* Form Section */
            .checkout-form {
                display: flex;
                flex-direction: column;
                gap: 25px;
            }

            .form-section {
                background: white;
                border-radius: 16px;
                padding: 25px;
            }

            .section-title {
                font-size: 18px;
                font-weight: bold;
                color: #333;
                margin-bottom: 20px;
                display: flex;
                align-items: center;
                gap: 10px;
            }

            .section-icon {
                font-size: 24px;
            }

            .form-group {
                margin-bottom: 20px;
            }

            .form-group label {
                display: block;
                font-size: 14px;
                font-weight: 600;
                color: #333;
                margin-bottom: 8px;
            }

            .required {
                color: #d32f2f;
            }

            .form-group input,
            .form-group select,
            .form-group textarea {
                width: 100%;
                padding: 12px 15px;
                border: 2px solid #ddd;
                border-radius: 8px;
                font-size: 14px;
                transition: border-color 0.3s;
            }

            .form-group input:focus,
            .form-group select:focus,
            .form-group textarea:focus {
                outline: none;
                border-color: #667eea;
            }

            .form-group textarea {
                resize: vertical;
                min-height: 80px;
            }

            .form-row {
                display: grid;
                grid-template-columns: 1fr 1fr;
                gap: 15px;
            }

            .saved-address {
                display: flex;
                align-items: center;
                gap: 10px;
                padding: 15px;
                border: 2px solid #ddd;
                border-radius: 8px;
                margin-bottom: 15px;
                cursor: pointer;
                transition: all 0.3s;
            }

            .saved-address:hover {
                border-color: #667eea;
                background: #f8f9ff;
            }

            .saved-address.selected {
                border-color: #667eea;
                background: #f0f2ff;
            }

            .saved-address input[type="radio"] {
                width: 20px;
                height: 20px;
                cursor: pointer;
            }

            .address-info {
                flex: 1;
            }

            .address-name {
                font-weight: 600;
                color: #333;
                margin-bottom: 5px;
            }

            .address-details {
                font-size: 14px;
                color: #666;
                line-height: 1.5;
            }

            .add-new-address {
                color: #667eea;
                font-weight: 600;
                cursor: pointer;
                display: inline-flex;
                align-items: center;
                gap: 5px;
                transition: color 0.3s;
            }

            .add-new-address:hover {
                color: #5568d3;
            }

            /* Payment Methods */
            .payment-method {
                display: flex;
                align-items: center;
                gap: 15px;
                padding: 15px;
                border: 2px solid #ddd;
                border-radius: 8px;
                margin-bottom: 15px;
                cursor: pointer;
                transition: all 0.3s;
            }

            .payment-method:hover {
                border-color: #667eea;
                background: #f8f9ff;
            }

            .payment-method.selected {
                border-color: #667eea;
                background: #f0f2ff;
            }

            .payment-method input[type="radio"] {
                width: 20px;
                height: 20px;
                cursor: pointer;
            }

            .payment-icon {
                font-size: 32px;
            }

            .payment-info {
                flex: 1;
            }

            .payment-name {
                font-weight: 600;
                color: #333;
                margin-bottom: 3px;
            }

            .payment-desc {
                font-size: 13px;
                color: #666;
            }

            /* Order Summary */
            .order-summary {
                background: white;
                border-radius: 16px;
                padding: 25px;
                height: fit-content;
                position: sticky;
                top: 105px;
            }

            .summary-title {
                font-size: 20px;
                font-weight: bold;
                color: #333;
                margin-bottom: 20px;
                padding-bottom: 15px;
                border-bottom: 2px solid #f0f0f0;
            }

            .summary-item {
                display: flex;
                gap: 15px;
                padding: 15px 0;
                border-bottom: 1px solid #f0f0f0;
            }

            .summary-item-image {
                width: 60px;
                height: 60px;
                object-fit: contain;
                background: #f8f8f8;
                border-radius: 8px;
                padding: 5px;
            }

            .summary-item-info {
                flex: 1;
            }

            .summary-item-name {
                font-size: 14px;
                font-weight: 600;
                color: #333;
                margin-bottom: 5px;
            }

            .summary-item-quantity {
                font-size: 13px;
                color: #666;
            }

            .summary-item-price {
                font-size: 15px;
                font-weight: bold;
                color: #d32f2f;
            }

            .summary-row {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin: 15px 0;
                font-size: 15px;
            }

            .summary-label {
                color: #666;
            }

            .summary-value {
                font-weight: 600;
                color: #333;
            }

            .summary-divider {
                height: 1px;
                background: #e0e0e0;
                margin: 20px 0;
            }

            .summary-total {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin: 20px 0;
                font-size: 18px;
            }

            .total-label {
                font-weight: 600;
                color: #333;
            }

            .total-value {
                font-size: 24px;
                font-weight: bold;
                color: #d32f2f;
            }

            .place-order-btn {
                width: 100%;
                padding: 18px;
                background: linear-gradient(135deg, #d32f2f 0%, #e74c3c 100%);
                color: white;
                border: none;
                border-radius: 12px;
                font-size: 16px;
                font-weight: bold;
                cursor: pointer;
                transition: all 0.3s;
                margin-top: 20px;
            }

            .place-order-btn:hover {
                transform: translateY(-2px);
                box-shadow: 0 8px 20px rgba(211, 47, 47, 0.3);
            }

            .place-order-btn:disabled {
                background: #ccc;
                cursor: not-allowed;
                transform: none;
            }

            .security-note {
                display: flex;
                align-items: center;
                gap: 10px;
                padding: 15px;
                background: #f0f9ff;
                border: 1px solid #bae6fd;
                border-radius: 8px;
                margin-top: 15px;
                font-size: 13px;
                color: #0369a1;
            }

            .promo-code-section {
                margin-top: 20px;
                padding-top: 20px;
                border-top: 1px solid #f0f0f0;
            }

            .promo-input {
                display: flex;
                gap: 10px;
                margin-top: 10px;
            }

            .promo-input input {
                flex: 1;
                padding: 12px 15px;
                border: 2px solid #ddd;
                border-radius: 8px;
                font-size: 14px;
            }

            .promo-btn {
                padding: 12px 20px;
                background: #667eea;
                color: white;
                border: none;
                border-radius: 8px;
                cursor: pointer;
                font-weight: 600;
                transition: background 0.3s;
            }

            .promo-btn:hover {
                background: #5568d3;
            }

            @media (max-width: 1024px) {
                .checkout-container {
                    grid-template-columns: 1fr;
                }

                .order-summary {
                    position: static;
                }

                .form-row {
                    grid-template-columns: 1fr;
                }

                .checkout-steps {
                    display: none;
                }
            }
        </style>
    </head>
    <body>
        <!-- Header -->
        <header class="header">
            <div class="header-container">
                <div class="logo" onclick="window.location.href = 'product'">Group 5</div>
                <div class="checkout-steps">
                    <div class="step">
                        <span class="step-number">✓</span>
                        <span>Giỏ hàng</span>
                    </div>
                    <span>→</span>
                    <div class="step active">
                        <span class="step-number">2</span>
                        <span>Thanh toán</span>
                    </div>
                    <span>→</span>
                    <div class="step">
                        <span class="step-number">3</span>
                        <span>Hoàn tất</span>
                    </div>
                </div>
            </div>
        </header>

        <div class="checkout-container">
            <div class="page-title">
                <button class="back-button" onclick="window.location.href = 'cart.jsp'">← Quay lại</button>
                <span>Thanh toán đơn hàng</span>
            </div>

            <!-- Checkout Form -->
            <div class="checkout-form">
                <!-- Customer Information -->
                <div class="form-section">
                    <h2 class="section-title">
                        <span class="section-icon">👤</span>
                        Thông tin khách hàng
                    </h2>
                    <div class="form-row">
                        <div class="form-group">
                            <label>Họ và tên <span class="required">*</span></label>
                            <input type="text" id="fullName" value="${sessionScope.infoCustomer.fullName}" required>
                        </div>
                        <div class="form-group">
                            <label>Số điện thoại <span class="required">*</span></label>
                            <input type="tel" id="phone" value="${sessionScope.infoCustomer.phone}" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Email <span class="required">*</span></label>
                        <input type="email" id="email" value="${sessionScope.accountCustomer.userName}" required>
                    </div>
                </div>

                <!-- Shipping Address -->
                <div class="form-section">
                    <h2 class="section-title">
                        <span class="section-icon">📍</span>
                        Địa chỉ giao hàng
                    </h2>

                    <div class="form-group">
                        <label>Địa chỉ cụ thể <span class="required">*</span></label>
                        <input type="text" id="street" placeholder="Số nhà, tên đường" required>
                    </div>
                    <div class="form-row">
                        <div class="form-group">
                            <label>Tỉnh/Thành phố <span class="required">*</span></label>
                            <select id="city" required>
                                <option value="">Chọn Tỉnh/Thành phố</option>
                                <option value="Hà Nội">Hà Nội</option>
                                <option value="TP Hồ Chí Minh">TP Hồ Chí Minh</option>
                                <option value="Đà Nẵng">Đà Nẵng</option>
                                <option value="Hải Phòng">Hải Phòng</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Quận/Huyện <span class="required">*</span></label>
                            <select id="district" required>
                                <option value="">Chọn Quận/Huyện</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Ghi chú giao hàng</label>
                        <textarea id="note" placeholder="Ví dụ: Giao hàng giờ hành chính"></textarea>
                    </div>
                </div>

                <!-- Payment Method -->
                <div class="form-section">
                    <h2 class="section-title">
                        <span class="section-icon">💳</span>
                        Phương thức thanh toán
                    </h2>

                    <div class="payment-method selected" onclick="selectPayment('cod')">
                        <input type="radio" name="payment" id="cod" checked>
                        <span class="payment-icon">💵</span>
                        <div class="payment-info">
                            <div class="payment-name">Thanh toán khi nhận hàng (COD)</div>
                            <div class="payment-desc">Thanh toán bằng tiền mặt khi nhận hàng</div>
                        </div>
                    </div>

                    <div class="payment-method" onclick="selectPayment('bank')">
                        <input type="radio" name="payment" id="bank">
                        <span class="payment-icon">🏦</span>
                        <div class="payment-info">
                            <div class="payment-name">Chuyển khoản ngân hàng</div>
                            <div class="payment-desc">Chuyển khoản qua VietQR hoặc số tài khoản</div>
                        </div>
                    </div>

                    <div class="payment-method" onclick="selectPayment('card')">
                        <input type="radio" name="payment" id="card">
                        <span class="payment-icon">💳</span>
                        <div class="payment-info">
                            <div class="payment-name">Thẻ tín dụng/Ghi nợ</div>
                            <div class="payment-desc">Visa, MasterCard, JCB</div>
                        </div>
                    </div>

                    <div class="payment-method" onclick="selectPayment('wallet')">
                        <input type="radio" name="payment" id="wallet">
                        <span class="payment-icon">📱</span>
                        <div class="payment-info">
                            <div class="payment-name">Ví điện tử</div>
                            <div class="payment-desc">MoMo, ZaloPay, VNPay</div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Order Summary -->
            <div class="order-summary">
                <h3 class="summary-title">Đơn hàng của bạn</h3>

                <!-- Sample cart items - replace with actual data -->
                <c:forEach items="${requestScope.checkoutItems.items}" var="item">
                    <div class="summary-item">
                        <img src="${item.product.image[0]}" alt="${item.product.name}" class="summary-item-image">
                        <div class="summary-item-info">
                            <div class="summary-item-name">${item.product.name}</div>
                            <div class="summary-item-quantity">Số lượng: ${item.quantity}</div>
                        </div>
                        <div class="summary-item-price">${item.getFormattedTotal()}</div>
                    </div>
                </c:forEach>

                <div class="promo-code-section">
                    <div class="summary-label">Mã giảm giá</div>
                    <div class="promo-input">
                        <input type="text" placeholder="Nhập mã giảm giá" id="promoCode">
                        <button class="promo-btn" onclick="applyPromo()">Áp dụng</button>
                    </div>
                </div>

                <div class="summary-divider"></div>

                <div class="summary-row">
                    <span class="summary-label">Tạm tính:</span>
                    <span class="summary-value" id="subtotalAmount">${requestScope.checkoutItems.getFormattedPrice()}</span>
                </div>

                <div class="summary-row">
                    <span class="summary-label">Giảm giá:</span>
                    <span class="summary-value" id="discountAmount" style="color: #d32f2f;">-0₫</span>
                </div>

                <div class="summary-row">
                    <span class="summary-label">Phí vận chuyển:</span>
                    <span class="summary-value" id="shippingAmount">0₫</span>
                </div>

                <div class="summary-divider"></div>

                <div class="summary-total">
                    <span class="total-label">Tổng cộng:</span>
                    <span class="total-value" id="totalAmount">${requestScope.checkoutItems.getFormattedPrice()}</span>
                </div>

                <button class="place-order-btn" onclick="placeOrder()">
                    Đặt hàng
                </button>

                <div class="security-note">
                    <span>🔒</span>
                    <span>Thông tin của bạn được bảo mật an toàn</span>
                </div>
            </div>
        </div>

        <script>
            function placeOrder() {
                // Validate form
                const fullName = document.getElementById('fullName').value.trim();
                const phone = document.getElementById('phone').value.trim();
                const email = document.getElementById('email').value.trim();

                if (!fullName || !phone || !email) {
                    alert('Vui lòng điền đầy đủ thông tin khách hàng');
                    return;
                }

                // Get address information
                const street = document.getElementById('street').value.trim();
                const city = document.getElementById('city').value;
                const district = document.getElementById('district').value;
                const note = document.getElementById('note').value.trim();

                if (!street || !city || !district) {
                    alert('Vui lòng điền đầy đủ địa chỉ giao hàng');
                    return;
                }

                // Get payment method
                const paymentMethod = document.querySelector('input[name="payment"]:checked');
                if (!paymentMethod) {
                    alert('Vui lòng chọn phương thức thanh toán');
                    return;
                }

                // Prepare order data
                const orderData = {
                    fullName: fullName,
                    phone: phone,
                    email: email,
                    address: {
                        street: street,
                        district: district,
                        city: city,
                        note: note,
                        fullAddress: `${street}, ${district}, ${city}`
                                    },
                                    paymentMethod: paymentMethod.id
                                };

                                // Submit order
                                fetch('${pageContext.request.contextPath}/get-order', {
                                    method: 'POST',
                                    headers: {
                                        'Content-Type': 'application/json'
                                    },
                                    body: JSON.stringify(orderData)
                                })
                                        .then(response => response.json())
                                        .then(data => {
                                            if (data.success) {
                                                alert('Đặt hàng thành công!');
                                                window.location.href = 'customer/bill.jsp';
                                            } else {
                                                alert('Đặt hàng thất bại: ' + data.message);
                                            }
                                        })
                                        .catch(error => {
                                            console.error('Error:', error);
                                            alert('Có lỗi xảy ra. Vui lòng thử lại!');
                                        });
                            }

                            function selectPayment(method) {
                                document.getElementById(method).checked = true;
                                document.querySelectorAll('.payment-method').forEach(el => {
                                    el.classList.remove('selected');
                                });
                                event.currentTarget.classList.add('selected');
                            }

                            function applyPromo() {
                                const promoCode = document.getElementById('promoCode').value.trim();
                                if (promoCode === '') {
                                    alert('Vui lòng nhập mã giảm giá');
                                    return;
                                }

                                fetch(`apply-promo?code=${promoCode}`, {
                                    method: 'GET'
                                })
                                        .then(response => response.json())
                                        .then(data => {
                                            if (data.success) {
                                                alert('Áp dụng mã giảm giá thành công!');
                                                // Update discount and total
                                                document.getElementById('discountAmount').textContent = '-' + data.discount;
                                                document.getElementById('totalAmount').textContent = data.total;
                                            } else {
                                                alert('Mã giảm giá không hợp lệ');
                                            }
                                        });
                            }

                            document.getElementById('city')?.addEventListener('change', function () {
                                const districtSelect = document.getElementById('district');
                                districtSelect.innerHTML = '<option value="">Chọn Quận/Huyện</option>';

                                const city = this.value;
                                let districts = [];

                                if (city === 'Hà Nội') {
                                    districts = ['Ba Đình', 'Hoàn Kiếm', 'Đống Đa', 'Hai Bà Trưng', 'Cầu Giấy', 'Thanh Xuân'];
                                } else if (city === 'TP Hồ Chí Minh') {
                                    districts = ['Quận 1', 'Quận 3', 'Quận 4', 'Quận 5', 'Phú Nhuận', 'Bình Thạnh'];
                                } else if (city === 'Đà Nẵng') {
                                    districts = ['Hải Châu', 'Thanh Khê', 'Cẩm Lệ', 'Sơn Trà', 'Liên Chiểu'];
                                }

                                districts.forEach(d => {
                                    districtSelect.innerHTML += '<option value="' + d + '">' + d + '</option>';
                                });
                            });

                            ;
        </script>
    </body>
</html>