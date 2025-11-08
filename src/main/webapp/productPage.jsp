<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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

  <%
    String productId = request.getParameter("id");
    // 模擬資料庫資料，可用 Map / JSON 替代
    String name = "純色圓領T";
    String price = "NT$ 299";
    String desc = "舒適棉質材質，柔軟透氣，夏日百搭單品。";
    String imgMain = "images/acc/roundnetT-shirt.jpg";
    String img1 = "images/acc/roundnetT-shirt.jpg";
    String img2 = "images/acc/pocketT-shirt.jpg";
    String img3 = "images/acc/PatternT-shirt.jpg";

    if("A1001".equals(productId)) {
      name = "純色圓領T";
      price = "NT$ 299";
      desc = "柔軟棉質材質，簡約百搭，夏日透氣舒適。";
      imgMain = "images/acc/roundnetT-shirt.jpg";
      img1 = "images/acc/roundnetT-shirt.jpg";
      img2 = "images/acc/pocketT-shirt.jpg";
      img3 = "images/acc/PatternT-shirt.jpg";
    } else if("A1002".equals(productId)) {
      name = "口袋短T";
      price = "NT$ 329";
      desc = "實用口袋設計，舒適棉質，休閒日常必備。";
      imgMain = "images/acc/pocketT-shirt.jpg";
      img1 = "images/acc/pocketT-shirt.jpg";
      img2 = "images/acc/PatternT-shirt.jpg";
      img3 = "images/acc/LinenShirt.jpg";
    } else if("A1003".equals(productId)) {
      name = "寬鬆印花T";
      price = "NT$ 399";
      desc = "韓系印花設計，版型寬鬆顯瘦，青春感滿滿。";
      imgMain = "images/acc/PatternT-shirt.jpg";
      img1 = "images/acc/PatternT-shirt.jpg";
      img2 = "images/acc/pocketT-shirt.jpg";
      img3 = "images/acc/LinenShirt.jpg";
    }
  %>

  <!-- 商品內容 -->
  <main class="main-content">
    <div class="container">
      <div class="product-detail">
        <!-- 圖片 -->
        <div class="product-images">
          <div class="main-image">
            <img id="mainImage" src="<%= imgMain %>" alt="<%= name %>">
          </div>
          <div class="thumbnail-images">
            <div class="thumbnail active" onclick="changeMainImage(this, '<%= img1 %>')">
              <img src="<%= img1 %>" alt="縮圖1">
            </div>
            <div class="thumbnail" onclick="changeMainImage(this, '<%= img2 %>')">
              <img src="<%= img2 %>" alt="縮圖2">
            </div>
            <div class="thumbnail" onclick="changeMainImage(this, '<%= img3 %>')">
              <img src="<%= img3 %>" alt="縮圖3">
            </div>
          </div>
        </div>

        <!-- 文字資訊 -->
        <div class="product-info">
          <h1 class="product-title"><%= name %></h1>
          <div class="product-price">
            <span class="current-price"><%= price %></span>
          </div>
          <div class="product-description">
            <p><%= desc %></p>
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
            <button class="btn btn-primary" onclick="addToCart('<%= name %>')">🛒 加入購物車</button>
            <button class="btn btn-secondary">⚡ 立即購買</button>
            <button class="btn btn-outline">♡ 加入願望清單</button>
          </div>
        </div>
      </div>
    </div>
  </main>

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
