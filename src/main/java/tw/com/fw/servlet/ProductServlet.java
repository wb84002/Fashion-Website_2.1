package tw.com.fw.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import tw.com.fw.dao.ProductDao;
import tw.com.fw.dao.daoImlp.ProductDaoImlp;
import tw.com.fw.model.Product;

@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDao dao = new ProductDaoImlp();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 取得home.jsp傳來的參數
		String category = request.getParameter("category");
		
		String categoryName = "";

		// 依照類別顯示中文名稱
		if (category.equals("Clothes")) {
			categoryName = "上衣";
		} else if (category.equals("Pants")) {
			categoryName = "下衣";
		} else if (category.equals("Bags")) {
			categoryName = "包包";
		} else {
			categoryName = "全部";
		}

	
	
	// 從資料庫查詢該分類的商品清單
	List<Product> productList = dao.getProductByCategory(category);
	// 將資料放入request屬性，讓JSP能使用EL顯示
	request.setAttribute("category", category);
	request.setAttribute("categoryName", categoryName);
	request.setAttribute("productList", productList);
	
	// 導到ProductCategoryPage.jsp顯示結果
	request.getRequestDispatcher("ProductCategoryPage.jsp").forward(request, response);
}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
	
	

	
/* 暫時保留
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String status = request.getParameter("status");

		if (status.equals("getAll")) {
			List<Product> lists = dao.queryAll();
			request.setAttribute("lists", lists);
			request.getRequestDispatcher("edit.jsp").forward(request, response);
		} else if (status.equals("delete")) {
			int productId = Integer.parseInt(request.getParameter("product_id"));
			dao.deleteProduct(productId);
			List<Product> lists = dao.queryAll();
			request.setAttribute("lists", lists);
			request.getRequestDispatcher("edit.jsp").forward(request, response);
		} else if (status.equals("update")) {
			Product product = new Product();
			product.setProductId(Integer.parseInt(request.getParameter("product_id")));
			product.setProductName(request.getParameter("product_name"));
			product.setSize(request.getParameter("size"));
			product.setCategory(request.getParameter("category"));
			product.setDescription(request.getParameter("description"));
			product.setPrice(Integer.parseInt(request.getParameter("price")));
			product.setStock(Integer.parseInt(request.getParameter("stock")));
			product.setImage_url1(request.getParameter("image_url1"));
			product.setImage_url2(request.getParameter("image_url2"));
			product.setImage_url3(request.getParameter("image_url3"));
			product.setProduct_url(request.getParameter("product_url"));

			dao.updateProduct(product);
			request.getRequestDispatcher("productServlet?status=getAll").forward(request, response);
		} else if (status.equals("add")) {
			Product product = new Product();
			product.setProductId(Integer.parseInt(request.getParameter("product_id")));
			product.setProductName(request.getParameter("product_name"));
			product.setSize(request.getParameter("size"));
			product.setCategory(request.getParameter("category"));
			product.setDescription(request.getParameter("description"));
			product.setPrice(Integer.parseInt(request.getParameter("price")));
			product.setStock(Integer.parseInt(request.getParameter("stock")));
			product.setImage_url1(request.getParameter("image_url1"));
			product.setImage_url2(request.getParameter("image_url2"));
			product.setImage_url3(request.getParameter("image_url3"));
			product.setProduct_url(request.getParameter("product_url"));

			dao.addProduct(product);
			request.getRequestDispatcher("add.jsp").forward(request, response);
		}
	}
*/

