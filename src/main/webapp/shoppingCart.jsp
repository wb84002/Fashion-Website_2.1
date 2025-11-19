<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>

<%!
  // 定義 CartItem 類別來儲存商品資訊
  public class CartItem {
    private String name;
    private int price;
    private int quantity;
    private String size; 

    // Constructor 
    public CartItem(String name, int price, String size, int quantity) {
      this.name = name;
      this.price = price;
      this.size = size;
      this.quantity = quantity;
    }

    // Getters
    public String getName() { return name; }
    public int getPrice() { return price; }
    public int getQuantity() { return quantity; }
    public String getSize() { return size; }
    
    
    // Setters/Utilities
    public void setQuantity(int quantity) { this.quantity = quantity; }
    public void addQuantity(int amount) { this.quantity += amount; }
    public int getTotalPrice() { return price * quantity; }
    
    // 覆寫 equals 和 hashCode，使相同名稱和尺寸的商品視為同一項
    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null || getClass() != obj.getClass()) return false;
        CartItem item = (CartItem) obj;
        return name.equals(item.name) && size.equals(item.size);
    }
    @Override
    public int hashCode() {
        return name.hashCode() * 31 + size.hashCode();
    }
  }

  // 輔助方法：將整數金額格式化為 NT$ 格式
  public String formatCurrency(int amount) {
    NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(Locale.TAIWAN);
    return currencyFormat.format(amount).replace("NT$", "NT$ ");
  }
%>

<%
  // 取得或建立 Session 中的購物車 (List<CartItem>)
  List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
  if (cart == null) {
    cart = new ArrayList<>();
    session.setAttribute("cart", cart);
  }

  // 處理移除商品的請求 (格式: remove=商品名稱|尺寸)
  String removeItem = request.getParameter("remove");
  if (removeItem != null && removeItem.contains("|")) {
    String[] parts = removeItem.split("\\|");
    if (parts.length == 2) {
      String removeItemName = parts[0];
      String removeItemSize = parts[1];
      
      Iterator<CartItem> iterator = cart.iterator();
      while (iterator.hasNext()) {
        CartItem item = iterator.next();
        if (item.getName().equals(removeItemName) && item.getSize().equals(removeItemSize)) {
          iterator.remove();
          break;
        }
      }
    }
    // 移除後重導向以避免使用者重新整理時再次移除
    response.sendRedirect("shoppingCart.jsp");
    return;
  }
  
  // 處理清空購物車的請求
  String clearCart = request.getParameter("clear");
  if (clearCart != null && clearCart.equals("true")) {
      session.removeAttribute("cart");
      response.sendRedirect("shoppingCart.jsp");
      return;
  }

  // 處理加入商品的請求（來自 productPage.jsp 的 AJAX）
  String addItemName = request.getParameter("itemName");
  String addItemPriceStr = request.getParameter("itemPrice");
  String addItemQuantityStr = request.getParameter("quantity"); 
  String addItemSize = request.getParameter("size");           
  
  // 檢查是否為 AJAX 請求
  if (addItemName != null && addItemPriceStr != null && addItemQuantityStr != null && addItemSize != null) {
    try {
        int addItemPrice = Integer.parseInt(addItemPriceStr);
        int addItemQuantity = Integer.parseInt(addItemQuantityStr);
        
        // 建立新商品的暫時物件用於比對
        CartItem newItem = new CartItem(addItemName, addItemPrice, addItemSize, addItemQuantity);
        boolean found = false;

        // 檢查購物車中是否已有相同商品 (名稱和尺寸都相同)
        for (CartItem item : cart) {
            if (item.equals(newItem)) {
                item.addQuantity(addItemQuantity); // 數量疊加
                found = true;
                break;
            }
        }
        
        // 如果購物車中沒有此商品，則新增
        if (!found) {
            cart.add(newItem);
        }

        // 成功加入後回傳 JSON 訊息給 AJAX
        out.print("{\"status\":\"success\", \"message\":\"已將 " + addItemName + " (" + addItemSize + ") 加入購物車，數量: " + addItemQuantity + "。\"}");
        return; // 終止 JSP 頁面後續渲染
        
    } catch (NumberFormatException e) {
        out.print("{\"status\":\"error\", \"message\":\"商品價格或數量格式錯誤。\"}");
        return; 
    }
  }

  // 計算購物車總金額 (非 AJAX 請求時才計算)
  int grandTotal = 0;
  for (CartItem item : cart) {
    grandTotal += item.getTotalPrice();
  }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>購物車</title>
<Link rel="stylesheet" href="css/shoppingCart.css">
 <link rel="stylesheet" href="css/home.css"/>
</head>

<body>
	<%@include file="components/header.jsp"%>

	<main class="auth-container">
		<!-- <h1 class="site-title">購物車</h1> -->
		
	<ul style="display: flex; gap: 12px; list-style: none; padding: 0; margin: 20px 0 30px 0; justify-content: center;">
      <li style="font-weight: bold; color: #4CAF50;">訂單明細確認</li>
      <li>----------</li>
      <li>填寫付款資料</li>
      <li>----------</li>
      <li>購買完成</li>
    </ul>

    <% if (cart.isEmpty()) { %>
        <p style="text-align: center; font-size: 1.2em; color: #555;">您的購物車是空的！快去<a href="home.jsp">選購商品</a>吧！</p>
    <% } else { %>
        <table class="cart-table">
            <thead>
                <tr>
                    <th>商品名稱/規格</th>
                    <th>單價</th>
                    <th>數量</th>
                    <th>小計</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
                <% 
                for (CartItem item : cart) { 
                    // 為了移除功能，我們需要將名稱和尺寸編碼在 URL 參數中
                    String encodedRemoveParam = java.net.URLEncoder.encode(item.getName() + "|" + item.getSize(), "UTF-8");
                %>
                <tr>
                    <td>
                        <%= item.getName() %>
                        <br><span style="font-size: 0.9em; color: #666;">尺寸: <%= item.getSize() %></span>
                    </td>
                    <td><%= formatCurrency(item.getPrice()) %></td>
                    <td><%= item.getQuantity() %></td>
                    <td><%= formatCurrency(item.getTotalPrice()) %></td>
                    <td>
                        <a href="shoppingCart.jsp?remove=<%= encodedRemoveParam %>" class="action-btn">移除</a>
                    </td>
                </tr>
                <% } %>
            </tbody>
            <tfoot>
                <tr class="total-row">
                    <td colspan="3" style="text-align: right;">總計</td>
                    <td colspan="2"><%= formatCurrency(grandTotal) %></td>
                </tr>
            </tfoot>
        </table>
        
        <div style="margin-top: 30px; overflow: hidden;">
            <a href="shoppingCart.jsp?clear=true" class="action-btn clear-cart-btn">清空購物車</a>
            <a href="#" class="checkout-btn" onclick="alert('進入結帳流程...');">前往結帳 (<%= formatCurrency(grandTotal) %>)</a>
        </div>
    <% } %>
    
  </main>
</body>
</html>

