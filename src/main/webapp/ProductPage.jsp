<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="tw.com.fw.model.Product"%>

<html lang="zh">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>商品詳情 - Women Fashion Style</title>
  <link rel="stylesheet" href="css/home.css"/>
  <link rel="stylesheet" href="css/productPage.css"/>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
  <%@include file="components/header.jsp"%>

  <!-- 商品內容 -->
	<c:forEach items="${lists}" var="product">
		<main class="main-content">
			<div class="container">
				<div class="product-detail">
					<!-- 圖片 -->
					<div class="product-images">
						<div class="main-image">
							<img id="mainImage" src="${product.image_url1}"
								alt="${product.productName}">
						</div>
						<div class="thumbnail-images">
							<div class="thumbnail active"
								onclick="changeMainImage(this, '${product.image_url1}')">
								<img src="${product.image_url1}" alt="縮圖1">
							</div>
							<div class="thumbnail"
								onclick="changeMainImage(this, '${product.image_url2}')">
								<img src="${product.image_url2}" alt="縮圖2">
							</div>
							<div class="thumbnail"
								onclick="changeMainImage(this, '${product.image_url3}')">
								<img src="${product.image_url3}" alt="縮圖3">
							</div>
						</div>
					</div>

					<!-- 文字資訊 -->
					<div class="product-info">
						<h1 class="product-title">${product.productName}</h1>
						<div class="product-price">
							<span class="current-price">NT$ ${product.price}</span>
						</div>
						<div class="product-description">
							<p>${product.description}</p>
						</div>

						<!-- 規格選擇 -->
						<div class="product-options">
							<div class="option-group">
								<label>尺寸選擇：</label>
								<div class="size-options">
									<button class="size-option">S</button>
									<button class="size-option active">M</button>
									<button class="size-option">L</button>
								</div>
							</div>
							<div class="option-group">
								<label>數量：</label>
								<div class="quantity-selector">
									<button class="qty-btn" onclick="changeQuantity(-1)">-</button>
									<input type="number" id="quantity" value="1" min="1" max="99">
									<button class="qty-btn" onclick="changeQuantity(1)">+</button>
								</div>
							</div>
						</div>

						<!-- 操作按鈕 -->
						<div class="purchase-actions">
							<button class="btn btn-primary"
								onclick="addToCart('${product.productName}')">🛒
								加入購物車</button>
							<button class="btn btn-secondary">⚡ 立即購買</button>
							<button class="btn btn-outline">♡ 加入願望清單</button>
						</div>
					</div>
				</div>
			</div>
		</main>
	</c:forEach>

	<!-- Footer -->
  <footer class="footer">
    <p>© 2025 Women Fashion Style. All rights reserved.</p>
  </footer>

  <script>
    function changeMainImage(el, src) {
      document.getElementById('mainImage').src = src;
      document.querySelectorAll('.thumbnail').forEach(t => t.classList.remove('active'));
      el.classList.add('active');
    }

    function changeQuantity(val) {
      const input = document.getElementById('quantity');
      let q = parseInt(input.value) + val;
      if (q < 1) q = 1;
      if (q > 99) q = 99;
      input.value = q;
    }

    function addToCart(name) {
      alert(`${name} 已加入購物車！`);
    }
  </script>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="java.util.List"%>
<%@page import="tw.com.fw.model.Product"%>

<html lang="zh">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>商品詳情 - Women Fashion Style</title>
<link rel="stylesheet" href="css/home.css" />
<link rel="stylesheet" href="css/ProductPage.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>

<body>
	<%@include file="components/header.jsp"%>
	
  <!-- 除錯資訊（開發時使用，記得上線前刪除或註解掉） -->
  	
  <div style="background: #ffffcc; padding: 10px; margin: 10px; border: 2px solid #ff9800;">
    <h4>🔍 除錯資訊：</h4>
    <p><strong>pd_group_by_id:</strong> ${pd_group_by_id}</p>
    <p><strong>當前商品 ID:</strong> ${currentProduct.product_id}</p>
    <p><strong>商品名稱:</strong> ${currentProduct.product_name}</p>
    <p><strong>價格:</strong> ${currentProduct.price}</p>
    <p><strong>選擇的顏色:</strong> ${selectedColor}</p>
    <p><strong>選擇的尺寸:</strong> ${selectedSize}</p>
    <p><strong>庫存:</strong> ${currentProduct.stock}</p>
    <p><strong>可用顏色:</strong> ${availableColors}</p>
    <p><strong>可用尺寸:</strong> ${availableSizes}</p>
  </div>
   <!-- 除錯資訊（開發時使用，記得上線前刪除或註解掉） -->

	<!--<c:set var="mainProduct" value="${currentProduct}" />-->

  <main class="main-content">
    <div class="container">
      <div class="product-detail">
        <!-- 商品圖片區 -->
        <div class="product-images">
          <div class="main-image">
            <c:choose>
              <c:when test="${not empty currentProduct.image_url_1}">
                <img id="mainImage" src="${currentProduct.image_url_1}" alt="${currentProduct.product_name}">
              </c:when>
              <c:otherwise>
                <img id="mainImage" src="https://via.placeholder.com/500x500?text=商品圖片" alt="預設圖片">
              </c:otherwise>
            </c:choose>
          </div>
          
          <div class="thumbnail-images">
            <!-- 縮圖 1 -->
            <c:if test="${not empty currentProduct.image_url_1}">
              <div class="thumbnail active" onclick="changeMainImage(this, '${currentProduct.image_url_1}')">
                <img src="${currentProduct.image_url_1}" alt="縮圖1">
              </div>
            </c:if>
            
            <!-- 縮圖 2 -->
            <c:if test="${not empty currentProduct.image_url_2}">
              <div class="thumbnail" onclick="changeMainImage(this, '${currentProduct.image_url_2}')">
                <img src="${currentProduct.image_url_2}" alt="縮圖2">
              </div>
            </c:if>
            
            <!-- 縮圖 3 -->
            <c:if test="${not empty currentProduct.image_url_3}">
              <div class="thumbnail" onclick="changeMainImage(this, '${currentProduct.image_url_3}')">
                <img src="${currentProduct.image_url_3}" alt="縮圖3">
              </div>
            </c:if>
          </div>
        </div>

        <!-- 商品資訊區 -->
        <div class="product-info">
          <!-- 商品名稱 -->
          <h1 class="product-title">
            <c:choose>
              <c:when test="${not empty currentProduct.product_name}">
                ${currentProduct.product_name}
              </c:when>
              <c:otherwise>
                商品名稱載入中...
              </c:otherwise>
            </c:choose>
          </h1>
          
          <!-- 商品價格 -->
          <div class="product-price">
            <span class="current-price">
              NT$ <c:choose>
                <c:when test="${not empty currentProduct.price}">
                  ${currentProduct.price}
                </c:when>
                <c:otherwise>
                  0
                </c:otherwise>
              </c:choose>
            </span>
          </div>
          
          <!-- 商品描述 -->
          <div class="product-description">
            <p>
              <c:choose>
                <c:when test="${not empty currentProduct.description}">
                  ${currentProduct.description}
                </c:when>
                <c:otherwise>
                  暫無商品描述
                </c:otherwise>
              </c:choose>
            </p>
          </div>

          <!-- 商品選項 -->
          <div class="product-options">
            <!-- 顏色選擇 -->
            <div class="option-group">
              <label>顏色選擇：</label>
              <div class="color-options">
                <c:forEach items="${availableColors}" var="color">
                  <a href="ProductPageServlet?pd_group_by_id=${pd_group_by_id}&selectedColor=${color}&selectedSize=${selectedSize}" 
                     class="color-option ${color == selectedColor ? 'active' : ''}">
                    ${color}
                  </a>
                </c:forEach>
              </div>
            </div>

            <!-- 尺寸選擇 -->
            <div class="option-group">
              <label>尺寸選擇：</label>
              <div class="size-options">
                <c:forEach items="${availableSizes}" var="size">
                  <a href="ProductPageServlet?pd_group_by_id=${pd_group_by_id}&selectedColor=${selectedColor}&selectedSize=${size}" 
                     class="size-option ${size == selectedSize ? 'active' : ''}">
                    ${size}
                  </a>
                </c:forEach>
              </div>
            </div>

            <!-- 數量選擇 -->
            <div class="option-group">
              <label>數量：</label>
              <div class="quantity-selector">
                <input type="number" name="quantity" id="quantity" value="1" min="1" max="99" 
                       style="width: 100px; padding: 0.8rem; text-align: center; font-size: 1rem; border: 2px solid #e9ecef; border-radius: 8px;">
              </div>
            </div>

            <!-- 庫存狀態 -->
            <div class="option-group">
              <label>庫存狀態：</label>
              <c:choose>
                <c:when test="${currentProduct.stock > 0}">
                  <span class="stock-status in-stock">
                    ✓ 庫存充足 (${currentProduct.stock} 件)
                  </span>
                </c:when>
                <c:otherwise>
                  <span class="stock-status out-of-stock">
                    ✗ 目前缺貨
                  </span>
                </c:otherwise>
              </c:choose>
            </div>
          </div>

          <!-- 操作按鈕 -->
          <div class="purchase-actions">
            <!-- 加入購物車表單 -->
            <form method="get" action="shoppingCart.jsp" style="display: inline; width: 100%;">
              <input type="hidden" name="product_id" value="${currentProduct.product_id}">
              <input type="hidden" name="itemName" value="${currentProduct.product_name}">
              <input type="hidden" name="itemPrice" value="${currentProduct.price}">
              <input type="hidden" name="color" value="${selectedColor}">
              <input type="hidden" name="size" value="${selectedSize}">
              <input type="hidden" name="quantity" id="quantityForCart" value="1">
              
              <c:choose>
                <c:when test="${currentProduct.stock > 0}">
                  <button type="submit" class="btn btn-primary">
                    🛒 加入購物車
                  </button>
                </c:when>
                <c:otherwise>
                  <button type="button" class="btn btn-primary" disabled>
                    🛒 加入購物車 (缺貨中)
                  </button>
                </c:otherwise>
              </c:choose>
            </form>
            
            <button class="btn btn-secondary">⚡ 立即購買</button>
            <button class="btn btn-outline">♡ 加入願望清單</button>
          </div>

          <!-- 商品詳細資訊 -->
          <div class="product-meta">
            <p><strong>商品編號：</strong>${currentProduct.product_id}</p>
            <p><strong>商品群組：</strong>${pd_group_by_id}</p>
            <p><strong>商品分類：</strong>${currentProduct.category}</p>
            <p><strong>已選規格：</strong>${selectedColor} / ${selectedSize}</p>
          </div>
        </div>
      </div>
    </div>
  </main>

  <footer class="footer">
    <div class="container">
      <p>© 2025 Women Fashion Style. All rights reserved.</p>
    </div>
  </footer>

  <!-- 只保留必要的 JavaScript（只有圖片切換和數量同步） -->

	<!--  <script>
    function changeMainImage(el, src) {
      document.getElementById('mainImage').src = src;
      document.querySelectorAll('.thumbnail').forEach(t => t.classList.remove('active'));
      el.classList.add('active');
    }

    function changeQuantity(val) {
      const input = document.getElementById('quantity');
      let q = parseInt(input.value) + val;
      if (q < 1 || isNaN(q)) q = 1;
      if (q > 99) q = 99;
      input.value = q;
    }
    
    // 尺寸選擇器點擊事件
    document.querySelectorAll('.size-option').forEach(button => {
        button.addEventListener('click', function() {
            document.querySelectorAll('.size-option').forEach(btn => btn.classList.remove('active'));
            this.classList.add('active');
        });
    });

    // 核心 AJAX 函數：收集資料並發送到 shoppingCart.jsp
    function addToCart() {
      // 從 JSTL 變數中取得商品的基本資訊
      const productName = "${currentProduct.product_name}";
      const price = parseInt("${currentProduct.price}"); 

      // 取得數量
      const quantity = parseInt(document.getElementById('quantity').value);

      // 取得選定的尺寸
      const selectedSizeElement = document.querySelector('.size-option.active');
      if (!selectedSizeElement) {
        alert('請選擇商品尺寸！');
        return;
      }
      const selectedSize = selectedSizeElement.getAttribute('data-size'); // 從 data-size 屬性獲取尺寸

      if (quantity < 1 || isNaN(price)) {
          alert('商品資料錯誤，請檢查數量或價格。');
          return;
      }
      
      // 準備要傳輸的資料
      const params = new URLSearchParams();
      params.append('itemName', productName);
      params.append('itemPrice', price);
      params.append('quantity', quantity);
      params.append('size', selectedSize);
      
      // 執行 AJAX 請求
      fetch('shoppingCart.jsp?' + params.toString(), {
        method: 'GET'
      })
      .then(response => response.json())
      .then(data => {
        if (data.status === 'success') {
          alert(`✅ ${data.message}`);
        } else {
          alert('❌ 加入購物車失敗: ' + data.message);
        }
      })
      .catch(error => {
        console.error('Error:', error);
        alert('🌐 加入購物車時發生網路錯誤。');
      });
    }
  </script>
      -->

  <script>
    // 切換主圖片
    function changeMainImage(el, src) {
      document.getElementById('mainImage').src = src;
      document.querySelectorAll('.thumbnail').forEach(function(t) {
        t.classList.remove('active');
      });
      el.classList.add('active');
    }

    // 同步數量到加入購物車表單
    document.getElementById('quantity').addEventListener('input', function() {
      document.getElementById('quantityForCart').value = this.value;
    });
  </script>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>