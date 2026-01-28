package tw.com.fw.servlet;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import tw.com.fw.dao.ProductDao;
import tw.com.fw.dao.daoImlp.ProductDaoImpl;
import tw.com.fw.model.Product;

@WebServlet("/ProductCategoryPageServlet")
public class ProductCategoryPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDao dao = new ProductDaoImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String category = request.getParameter("category");
		System.out.println("ProductCategoryPageServlet_category = " + category);
				List<Product> lists;
		String categoryName = "全部商品";

		if (category == null || category.isEmpty()) {
			lists = dao.query();
		} else {
			switch (category) {
				case "Clothes":
					categoryName = "上衣";
					break;
				case "Pants":
					categoryName = "下衣";
					break;
				case "Bags":
					categoryName = "包包";
					break;
			}
			lists = dao.getProductByCategory(category);
		}
		

		request.setAttribute("lists", lists);
		System.out.println("ProductCategoryPageServlet_list:" + lists);
		request.setAttribute("categoryName", categoryName);
		
		request.getRequestDispatcher("ProductCategoryPage.jsp").forward(request, response);
}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}


