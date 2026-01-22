<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員中心</title>
<Link rel="stylesheet" href="css/Login.css">
<link rel="stylesheet" href="css/home.css"/>
</head>

<body>
	<%@include file="components/header.jsp"%>
	<main class="auth-container">
		<h1 class="site-title">會員中心</h1>

		<nav class="auth-tabs" role="tablist" aria-label="會員選單">
			<button class="tab-button active" data-target="#login" role="tab"
				aria-selected="true">會員登入</button>
			<button class="tab-button" data-target="#register" role="tab"
				aria-selected="false">會員註冊</button>
			<button class="tab-button" data-target="#forgot" role="tab"
				aria-selected="false">忘記密碼</button>
		</nav>

		<section class="tab-panels">
			<form id="login" class="panel active" action="userServlet"
				method="POST" novalidate>
				<h2>會員登入</h2>
				<div class="field">
					<label for="login-email">電子郵件</label> <input id="login-email"
						name="email" type="email" placeholder="you@example.com" required>
					<p class="error" data-error-for="login-email"></p>
				</div>
				<div class="field">
					<label for="login-password">密碼</label> <input id="login-password"
						name="password" type="password" placeholder="至少 6 碼" minlength="6"
						required>
					<p class="error" data-error-for="login-password"></p>
				</div>
				<button type="submit" class="primary">登入</button>
			</form>

			<form id="register" class="panel" novalidate>
				<h2>會員註冊</h2>
				<div class="field">
					<label for="reg-name">姓名</label> <input id="reg-name" name="name"
						type="text" placeholder="王小明" required>
					<p class="error" data-error-for="reg-name"></p>
				</div>
				<div class="field">
					<label for="reg-email">電子郵件</label> <input id="reg-email"
						name="email" type="email" placeholder="you@example.com" required>
					<p class="error" data-error-for="reg-email"></p>
				</div>
				<div class="field">
					<label for="reg-password">密碼</label> <input id="reg-password"
						name="password" type="password" placeholder="至少 6 碼" minlength="6"
						required>
					<p class="error" data-error-for="reg-password"></p>
				</div>
				<div class="field">
					<label for="reg-password2">確認密碼</label> <input id="reg-password2"
						name="password2" type="password" placeholder="再次輸入密碼"
						minlength="6" required>
					<p class="error" data-error-for="reg-password2"></p>
				</div>
				<button type="submit" class="primary">註冊</button>
			</form>

			<form id="forgot" class="panel" novalidate>
				<h2>忘記密碼</h2>
				<div class="field">
					<label for="forgot-email">電子郵件</label> <input id="forgot-email"
						name="email" type="email" placeholder="you@example.com" required>
					<p class="error" data-error-for="forgot-email"></p>
				</div>
				<button type="submit" class="primary">寄送重設連結</button>
			</form>
		</section>
	</main>

	<script src="Login.js"></script>




</body>
</html>