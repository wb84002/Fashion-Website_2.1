<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="tw.com.fw.model.User" %>
<%
 	User auth=(User)request.getSession().getAttribute("auth");
 	//if(auth != null){
 	//	request.setAttribute("auth", auth);
 	//}
 	
 	 // 安全地拿名字（避免 null）
    String username = "";
    if (auth != null && auth.getName() != null && !auth.getName().isEmpty()) {
        username = auth.getName();
    }
 %>
        
<!-- ===== Header ===== -->
  <header class="topbar">
    <div class="brand">Women Fashion<br/>Style</div>
    <nav class="mainnav">
      <a href="#home">首頁</a>
      <a href="ProductCategoryPageServlet?category=Clothes">上衣</a>
      <a href="ProductCategoryPageServlet?category=Pants">下衣</a>
      <a href="ProductCategoryPageServlet?category=Bags">包包</a>
    </nav>
    
    <div class="actions">
    	<% if(auth != null) { %>
            <span>您好，<%= username %>!</span>
            <!-- 登出按鈕直接送 GET 到 Servlet -->
            <button onclick="location.href='userServlet?action=logout'">登出</button>
        <% } else { %>
            <button onclick="location.href='Login.jsp'">登入</button>
        <% } %>
      <button aria-label="search">🔍</button>
      <button aria-label="favorites">♡</button>
      <button aria-label="cart">🛒</button>
    </div>
  </header>