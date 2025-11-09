<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Women Fashion Style</title>
  <link rel="stylesheet" href="css/home.css"/>
  <link rel="stylesheet" href="css/productPage.css"/>
</head>

<body>
  <%@include file="components/header.jsp"%>
  
  <!-- ===== Hero ===== -->
  
  <section id="home" class="hero">
    <img src="images/acc/cover.jpg" alt="Hero">
    <div class="overlay">
      <div class="copy">
        <span class="badge">新品登場</span>
        <h1 style="margin:10px 0 6px 0;">夏日</h1>
        <p style="opacity:.92">把可愛角色融入日常設計，透氣耐穿、輕鬆穿搭。</p>
      </div>
    </div>
  </section>

  <!-- ===== 上衣區 ===== -->
  <section id="tops" class="wrap">
    <h2>上衣</h2>
    <div class="tabs">
      <input type="radio" name="cat" id="tab-t" checked>
      <label for="tab-t">T恤</label>
      <input type="radio" name="cat" id="tab-shirt">
      <label for="tab-shirt">襯衫</label>

      <div class="panels">
        <!-- T恤 -->
        <div class="panel p-t grid">
          <article class="card">
            <img src="images/acc/roundnetT-shirt.jpg" alt="純色圓領T">
            <div class="meta">
              <div class="name">純色圓領T</div>
              <div class="price">NT$ 299</div>
              <div>
                <a class="btn btn-primary" href="productPage.jsp?id=1">查看</a>
                <a class="btn add-cart" href="#" onclick="addToCart('純色圓領T')">加入購物車</a>
              </div>
            </div>
          </article>

          <article class="card">
            <img src="images/acc/pocketT-shirt.jpg" alt="口袋短T">
            <div class="meta">
              <div class="name">口袋短T</div>
              <div class="price">NT$ 329</div>
              <div>
                <a class="btn btn-primary" href="productPage.jsp?id=2">查看</a>
                <a class="btn" href="#" onclick="addToCart('口袋短T')">加入購物車</a>
              </div>
            </div>
          </article>

          <article class="card">
            <img src="images/acc/PatternT-shirt.jpg" alt="寬鬆印花T">
            <div class="meta">
              <div class="name">寬鬆印花T</div>
              <div class="price">NT$ 399</div>
              <div>
                <a class="btn btn-primary" href="productPage.jsp?id=5">查看</a>
                <a class="btn" href="#" onclick="addToCart('寬鬆印花T')">加入購物車</a>
              </div>
            </div>
          </article>
        </div>

        <!-- 襯衫 -->
        <div class="panel p-shirt grid">
          <article class="card">
            <img src="images/acc/LinenShirt.jpg" alt="亞麻襯衫">
            <div class="meta">
              <div class="name">亞麻襯衫</div>
              <div class="price">NT$ 799</div>
              <div>
                <a class="btn btn-primary" href="productPage.jsp?id=A2001">查看</a>
                <a class="btn" href="#" onclick="addToCart('亞麻襯衫')">加入購物車</a>
              </div>
            </div>
          </article>

          <article class="card">
            <img src="images/acc/StripedShirt.jpg" alt="條紋襯衫">
            <div class="meta">
              <div class="name">條紋襯衫</div>
              <div class="price">NT$ 699</div>
              <div>
                <a class="btn btn-primary" href="productPage.jsp?id=A2002">查看</a>
                <a class="btn" href="#" onclick="addToCart('條紋襯衫')">加入購物車</a>
              </div>
            </div>
          </article>
        </div>
      </div>
    </div>
  </section>

  <!-- ===== 下衣區 ===== -->
  <section id="bottoms" class="wrap">
    <h2>下衣</h2>
    <div class="grid">
      <article class="card">
        <img src="images/acc/bottoms1.jpg" alt="高腰直筒牛仔褲">
        <div class="meta">
          <div class="name">高腰直筒牛仔褲</div>
          <div class="price">NT$ 899</div>
          <div>
            <a class="btn btn-primary" href="productPage.jsp?id=B1001">查看</a>
            <a class="btn" href="#" onclick="addToCart('高腰直筒牛仔褲')">加入購物車</a>
          </div>
        </div>
      </article>

      <article class="card">
        <img src="images/acc/bottoms2.jpg" alt="A字短裙">
        <div class="meta">
          <div class="name">A字短裙</div>
          <div class="price">NT$ 699</div>
          <div>
            <a class="btn btn-primary" href="productPage.jsp?id=B1002">查看</a>
            <a class="btn" href="#" onclick="addToCart('A字短裙')">加入購物車</a>
          </div>
        </div>
      </article>

      <article class="card">
        <img src="images/acc/bottoms3.jpg" alt="針織長裙">
        <div class="meta">
          <div class="name">針織長裙</div>
          <div class="price">NT$ 899</div>
          <div>
            <a class="btn btn-primary" href="productPage.jsp?id=B1003">查看</a>
            <a class="btn" href="#" onclick="addToCart('針織長裙')">加入購物車</a>
          </div>
        </div>
      </article>
    </div>
  </section>

  <!-- ===== 包包區 ===== -->
  <section id="bags" class="wrap">
    <h2>包包</h2>
    <div class="grid">
      <article class="card">
        <img src="images/acc/Bag2.jpg" alt="托特包">
        <div class="meta">
          <div class="name">厚帆布托特包</div>
          <div class="price">NT$ 690</div>
          <div>
            <a class="btn btn-primary" href="productPage.jsp?id=C1001">查看</a>
            <a class="btn" href="#" onclick="addToCart('厚帆布托特包')">加入購物車</a>
          </div>
        </div>
      </article>

      <article class="card">
        <img src="images/acc/Bag1.jpg" alt="小方包">
        <div class="meta">
          <div class="name">小方包（黑）</div>
          <div class="price">NT$ 990</div>
          <div>
            <a class="btn btn-primary" href="productPage.jsp?id=C1002">查看</a>
            <a class="btn" href="#" onclick="addToCart('小方包（黑）')">加入購物車</a>
          </div>
        </div>
      </article>

      <article class="card">
        <img src="images/acc/Bag3.jpg" alt="肩背水桶包">
        <div class="meta">
          <div class="name">肩背水桶包</div>
          <div class="price">NT$ 1,290</div>
          <div>
            <a class="btn btn-primary" href="productPage.jsp?id=C1003">查看</a>
            <a class="btn" href="#" onclick="addToCart('肩背水桶包')">加入購物車</a>
          </div>
        </div>
      </article>
    </div>
  </section>

  <!-- ===== Footer ===== -->
  <footer class="footer">
    <p>© 2025 Women Fashion Style. All rights reserved.</p>
  </footer>

  <script src="js/home.js" defer></script>
</body>
</html>
