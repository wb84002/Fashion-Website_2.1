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
<link rel="stylesheet" href="css/ProductCategoryPage.css" />
<link rel="stylesheet" href="css/productPage.css" />
</head>

<body>
	<%@include file="components/header.jsp"%>
	<!-- ===== 分類區 ===== -->
	<
	<div class="wrap">
		>
		<h2>${categoryName}</h2>
		<div class="panel p-t grid">
			<c:forEach items="${lists}" var="product">
				<article class="card">
					<img src="${product.image_url1}" alt="">
					<div class="meta">
						<div class="name">${product.productName}</div>
						<div class="price">NT$ ${product.price}</div>
						<div>
							<a class="btn btn-primary" href="">查看</a>
						</div>
					</div>
				</article>
			</c:forEach>
		</div>
	</div>
	<!-- ===== Footer ===== -->
	<footer class="footer">
		<p>© 2025 Women Fashion Style. All rights reserved.</p>
	</footer>

	<script src="js/homePage.js" defer></script>
</body>
</html>
