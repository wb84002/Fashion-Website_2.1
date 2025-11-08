<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="tw.com.fw.model.Product"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Women Fashion Style</title>
<link rel="stylesheet" href="css/ProductCategoryPage_try.css" />
<link rel="stylesheet" href="css/productPage.css" />
</head>

<body>
	<%@include file="components/header.jsp"%>

	<!-- ===== 分類區 ===== -->
	<section id="Clothes" class="wrap">
		<h2>上衣</h2>
		<div class="panel p-t grid">
			<c:forEach items="${productList}" var="list">
				<article class="card">
					<img src="${list.image_url1}" alt="${list.product_name}">
					<div class="meta">
						<div class="name">純色圓領T</div>
						<div class="price">NT$ 399</div>
						<div>
							<a class="btn btn-primary"
								href="productPage.jsp?id=A1001">查看</a> <a
								class="btn add-cart" href="#"
								onclick="addToCart('純色圓領T')">加入購物車</a>
						</div>
					</div>
				</article>
		
	</c:forEach>
</div>
	</section>
	
	<!-- ===== Footer ===== -->
	<footer class="footer">
		<p>© 2025 Women Fashion Style. All rights reserved.</p>
	</footer>

	<script src="js/homePage.js" defer></script>
</body>
</html>
