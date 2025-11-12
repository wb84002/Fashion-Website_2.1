<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
