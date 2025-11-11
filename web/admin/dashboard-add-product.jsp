<%-- 
    Document   : dashboard-add-product
    Created on : Oct 22, 2025, 7:06:11 PM
    Author     : trong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add Product - Laptop Shop</title>
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
                margin-bottom: 30px;
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
                gap: 10px;
                align-items: center;
                margin-bottom: 25px;
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
                color: #64748b;
            }

            .breadcrumb .current {
                color: #f1f5f9;
                font-weight: 600;
            }

            .form-container {
                display: grid;
                grid-template-columns: 1fr 400px;
                gap: 25px;
            }

            .form-card {
                background: linear-gradient(135deg, #1e293b 0%, #0f172a 100%);
                border: 1px solid rgba(148, 163, 184, 0.1);
                border-radius: 20px;
                padding: 30px;
            }

            .card-title {
                font-size: 18px;
                font-weight: 700;
                color: #f1f5f9;
                margin-bottom: 25px;
                padding-bottom: 15px;
                border-bottom: 1px solid rgba(148, 163, 184, 0.1);
            }

            .form-group {
                margin-bottom: 25px;
            }

            .form-label {
                display: block;
                font-size: 14px;
                font-weight: 600;
                color: #94a3b8;
                margin-bottom: 10px;
            }

            .required {
                color: #ef4444;
                margin-left: 4px;
            }

            .form-input, .form-select, .form-textarea {
                width: 100%;
                background: #0f172a;
                border: 1px solid rgba(148, 163, 184, 0.2);
                padding: 12px 16px;
                border-radius: 10px;
                color: #e2e8f0;
                font-size: 14px;
                font-family: 'Inter', sans-serif;
                transition: all 0.3s;
            }

            .form-input:focus, .form-select:focus, .form-textarea:focus {
                outline: none;
                border-color: #3b82f6;
                box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
            }

            .form-textarea {
                resize: vertical;
                min-height: 120px;
            }

            .form-hint {
                font-size: 12px;
                color: #64748b;
                margin-top: 6px;
            }

            .info-card {
                background: rgba(59, 130, 246, 0.1);
                border: 1px solid rgba(59, 130, 246, 0.3);
                padding: 16px;
                border-radius: 12px;
                margin-bottom: 20px;
            }

            .info-card-title {
                display: flex;
                align-items: center;
                gap: 8px;
                font-size: 14px;
                font-weight: 600;
                color: #60a5fa;
                margin-bottom: 8px;
            }

            .info-card-text {
                font-size: 13px;
                color: #94a3b8;
                line-height: 1.6;
            }

            .image-links-container {
                display: flex;
                flex-direction: column;
                gap: 15px;
            }

            .image-link-item {
                display: flex;
                gap: 10px;
                align-items: flex-start;
            }

            .image-link-item .form-input {
                flex: 1;
            }

            .btn-icon {
                padding: 12px;
                border: none;
                border-radius: 10px;
                cursor: pointer;
                transition: all 0.3s;
                font-size: 16px;
                display: flex;
                align-items: center;
                justify-content: center;
                min-width: 44px;
            }

            .btn-remove {
                background: rgba(239, 68, 68, 0.2);
                color: #ef4444;
                border: 1px solid rgba(239, 68, 68, 0.3);
            }

            .btn-remove:hover {
                background: rgba(239, 68, 68, 0.3);
                transform: scale(1.05);
            }

            .btn-add-link {
                background: rgba(59, 130, 246, 0.2);
                color: #3b82f6;
                border: 1px solid rgba(59, 130, 246, 0.3);
                padding: 10px 20px;
                border-radius: 10px;
                cursor: pointer;
                transition: all 0.3s;
                font-size: 14px;
                font-weight: 600;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 8px;
                font-family: 'Inter', sans-serif;
            }

            .btn-add-link:hover {
                background: rgba(59, 130, 246, 0.3);
                transform: translateY(-1px);
            }

            .image-preview-grid {
                display: grid;
                grid-template-columns: repeat(auto-fill, minmax(120px, 1fr));
                gap: 15px;
                margin-top: 20px;
            }

            .image-preview {
                position: relative;
                border-radius: 12px;
                overflow: hidden;
                background: #0f172a;
                border: 1px solid rgba(148, 163, 184, 0.2);
                aspect-ratio: 1;
            }

            .image-preview img {
                width: 100%;
                height: 100%;
                object-fit: cover;
            }

            .image-preview.loading {
                display: flex;
                align-items: center;
                justify-content: center;
                color: #64748b;
            }

            .image-preview.error {
                display: flex;
                align-items: center;
                justify-content: center;
                color: #ef4444;
                font-size: 12px;
                text-align: center;
                padding: 10px;
            }

            .form-row {
                display: grid;
                grid-template-columns: 1fr 1fr;
                gap: 20px;
            }

            .form-actions {
                display: flex;
                gap: 15px;
                justify-content: flex-end;
                margin-top: 30px;
                padding-top: 25px;
                border-top: 1px solid rgba(148, 163, 184, 0.1);
            }

            .btn {
                padding: 12px 28px;
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

            @media (max-width: 1200px) {
                .form-container {
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

                .form-row {
                    grid-template-columns: 1fr;
                }

                .form-actions {
                    flex-direction: column-reverse;
                }

                .btn {
                    width: 100%;
                }

                .image-link-item {
                    flex-direction: column;
                }

                .btn-icon {
                    width: 100%;
                }
            }
        </style>
    </head>
    <body>
        <aside class="sidebar">
            <div class="logo">
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
                    <a href="products.jsp" class="nav-link active">
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
                    <a href="#" class="nav-link">
                        <span>📈</span>
                        <span>Analytics</span>
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
                <span>→</span>
                <a href="admin/dashboard-product.jsp">Products</a>
                <span>→</span>
                <span class="current">Add Product</span>
            </div>

            <div class="page-header">
                <h2>Add New Product ✨</h2>
                <p>Fill in the information below to add a new laptop to your inventory</p>
            </div>

            <form action="add-product" method="POST">
                <div class="form-container">
                    <div>
                        <div class="form-card">
                            <h3 class="card-title">Basic Information</h3>

                            <div class="form-group">
                                <label class="form-label">Product Name<span class="required">*</span></label>
                                <input type="text" name="name" class="form-input" placeholder="e.g., ASUS TUF Gaming F16 FX607VU-LL034W" required>
                                <p class="form-hint">Enter the full product name including model number</p>
                            </div>

                            <div class="form-group">
                                <label class="form-label">Description<span class="required">*</span></label>
                                <textarea name="description" class="form-textarea" placeholder="Describe the product features, specifications, and benefits..." required></textarea>
                                <p class="form-hint">Provide detailed information about the product</p>
                            </div>

                            <div class="form-row">
                                <div class="form-group">
                                    <label class="form-label">Price (₫)<span class="required">*</span></label>
                                    <input type="number" name="price" class="form-input" placeholder="21490000" min="0" step="1000" required>
                                    <p class="form-hint">Enter price in Vietnamese Dong</p>
                                </div>

                                <div class="form-group">
                                    <label class="form-label">Quantity in Stock<span class="required">*</span></label>
                                    <input type="number" name="quantityInStock" class="form-input" placeholder="50" min="0" required>
                                    <p class="form-hint">Available units for sale</p>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="form-label">Brand<span class="required">*</span></label>
                                <select name="brand" class="form-select" required>
                                    <option value="">Select Brand</option>
                                    <option value="Asus">ASUS</option>
                                    <option value="Acer">Acer</option>
                                    <option value="HP">HP</option>
                                    <option value="Dell">Dell</option>
                                    <option value="Lenovo">Lenovo</option>
                                    <option value="MSI">MSI</option>
                                    <option value="Macbook">Apple(MacBook)</option>
                                    <option value="Samsung">Samsung</option>
                                    <option value="LG">LG</option>
                                    <option value="Razer">Razer</option>
                                    <option value="Microsoft">Microsoft (Surface)</option>
                                    <option value="Gigabyte">Gigabyte</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div>
                        <div class="form-card">
                            <h3 class="card-title">Product Images</h3>

                            <div class="info-card">
                                <div class="info-card-title">
                                    <span>💡</span>
                                    <span>Image Guidelines</span>
                                </div>
                                <p class="info-card-text">
                                    • Enter valid image URLs (must start with http:// or https://)<br>
                                    • You can add up to 5 image links (expandable)<br>
                                    • At least one image link is required<br>
                                    • Preview will show after entering valid URLs
                                </p>
                            </div>

                            <div class="form-group">
                                <label class="form-label">Image Links<span class="required">*</span></label>
                                <div class="image-links-container" id="imageLinksContainer">
                                    <div class="image-link-item">
                                        <input type="url" name="imageLinks" class="form-input" placeholder="https://example.com/image1.jpg" required>
                                    </div>
                                </div>
                                <button type="button" class="btn-add-link" id="addLinkBtn" onclick="addImageLink()">
                                    <span>➕</span>
                                    <span>Add Another Image Link</span>
                                </button>
                            </div>

                            <div class="image-preview-grid" id="imagePreviewGrid"></div>
                        </div>
                    </div>
                </div>

                <div class="form-actions">
                    <a href="dashboard-product" class="btn btn-secondary">Cancel</a>
                    <button type="submit" class="btn btn-primary">Add Product</button>
                </div>
            </form>
        </main>

        <script>
            let linkCount = 1;
            const maxLinks = 5;

            function addImageLink() {
                if (linkCount >= maxLinks) {
                    alert(`Maximum ${maxLinks} image links allowed. You can modify this limit if needed.`);
                    return;
                }

                const container = document.getElementById('imageLinksContainer');
                const newLinkItem = document.createElement('div');
                newLinkItem.className = 'image-link-item';

                newLinkItem.innerHTML = `
                    <input type="url" name="imageLinks" class="form-input" placeholder="https://example.com/image${linkCount + 1}.jpg">
                    <button type="button" class="btn-icon btn-remove" onclick="removeImageLink(this)">
                        <span>🗑️</span>
                    </button>
                `;

                container.appendChild(newLinkItem);
                linkCount++;

                // Add event listener to new input
                const newInput = newLinkItem.querySelector('input');
                newInput.addEventListener('input', updatePreviews);
            }

            function removeImageLink(button) {
                const linkItem = button.closest('.image-link-item');
                linkItem.remove();
                linkCount--;
                updatePreviews();
            }

            function updatePreviews() {
                const inputs = document.querySelectorAll('input[name="imageLinks"]');
                const previewGrid = document.getElementById('imagePreviewGrid');
                previewGrid.innerHTML = '';

                inputs.forEach((input, index) => {
                    const url = input.value.trim();
                    if (url && (url.startsWith('http://') || url.startsWith('https://'))) {
                        const previewDiv = document.createElement('div');
                        previewDiv.className = 'image-preview loading';
                        previewDiv.textContent = '⏳';
                        previewGrid.appendChild(previewDiv);

                        const img = new Image();
                        img.onload = function () {
                            previewDiv.className = 'image-preview';
                            previewDiv.innerHTML = '';
                            previewDiv.appendChild(img);
                        };
                        img.onerror = function () {
                            previewDiv.className = 'image-preview error';
                            previewDiv.textContent = '❌ Failed to load';
                        };
                        img.src = url;
                    }
                });
            }

            // Add event listeners to initial input
            document.addEventListener('DOMContentLoaded', function () {
                const inputs = document.querySelectorAll('input[name="imageLinks"]');
                inputs.forEach(input => {
                    input.addEventListener('input', updatePreviews);
                });
            });
        </script>
    </body>
</html>