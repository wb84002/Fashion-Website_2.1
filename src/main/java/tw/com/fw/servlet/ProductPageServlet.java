package tw.com.fw.servlet;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

import tw.com.fw.dao.ProductDao;
import tw.com.fw.dao.daoImlp.ProductDaoImpl;
import tw.com.fw.model.Product;

@WebServlet("/ProductPageServlet")
public class ProductPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDao dao = new ProductDaoImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 這是用ProductPageServlet?pd_id= 查詢
//		String pd_id = request.getParameter("pd_id");
//		System.out.println("ProductPageServlet_pd_id = " + pd_id);
//		List<Product> lists;
//
//		if (pd_id == null || pd_id.isEmpty()) {
//			lists = dao.query();
//		} else {
//			lists = dao.getProductById(pd_id);
//		}
		
		// 1. 這是用ProductPageServlet?pd_group_by_id= 查詢(取得商品群組ID)
		String pd_group_by_id = request.getParameter("pd_group_by_id");
		System.out.println("ProductPageServlet_pd_group_by_id = " + pd_group_by_id);
		
		
		// 2. 取得使用者選擇的顏色和尺寸
		String selectedColor = request.getParameter("selectedColor");
		String selectedSize = request.getParameter("selectedSize");
		
		List<Product> allProducts;

		if (pd_group_by_id == null || pd_group_by_id.isEmpty()) {
			allProducts = dao.query();
		} else {
			allProducts = dao.getProductByGroupById(pd_group_by_id);
		}
				
		if (allProducts != null && !allProducts.isEmpty()) {
			// 3. 提取不重複的顏色列表
			List<String> availableColors = allProducts.stream()
					.map(Product::getColor)
					.distinct()
					.collect(Collectors.toList());
			
			// 4. 提取不重複的尺寸列表
			List<String> availableSizes = allProducts.stream()
					.map(Product::getSize)
					.distinct()
					.collect(Collectors.toList());
			
			// 5. 如果使用者沒有選擇，預設使用第一個顏色和尺寸
			if (selectedColor == null || selectedColor.isEmpty()) {
				selectedColor = availableColors.get(0);
			}
			
			if (selectedSize == null || selectedSize.isEmpty()) {
				selectedSize = availableSizes.get(0);
			}
			
			// 6. 根據選擇的顏色和尺寸，找到對應的商品
			Product currentProduct = null;
			for(Product p: allProducts) {
				if (p.getColor().equals(selectedColor) && p.getSize().equals(selectedSize)) {
					currentProduct = p;
					break;
				}
			}
					
			
			// 7. 如果找不到，就使用第一筆資料
			if (currentProduct == null) {
				currentProduct = allProducts.get(0);
				selectedColor = currentProduct.getColor();
				selectedSize = currentProduct.getSize();
			}
			
			// 8. 將資料傳遞到 JSP
            request.setAttribute("currentProduct", currentProduct);
            request.setAttribute("availableColors", availableColors);
            request.setAttribute("availableSizes", availableSizes);
            request.setAttribute("selectedColor", selectedColor);
            request.setAttribute("selectedSize", selectedSize);
            request.setAttribute("pd_group_by_id", pd_group_by_id);
			
            System.out.println("ProductPageServlet_當前商品: " + currentProduct.getProduct_id());
            System.out.println("ProductPageServlet_選擇的顏色: " + selectedColor);
            System.out.println("ProductPageServlet_選擇的尺寸: " + selectedSize);
            System.out.println("ProductPageServlet_可用顏色: " + availableColors);
            System.out.println("ProductPageServlet_可用尺寸: " + availableSizes);            
		}
			
		// request.setAttribute("lists", lists);
		// System.out.println("ProductPageServlet_list:" + lists);
		request.getRequestDispatcher("ProductPage.jsp").forward(request, response);
}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}


