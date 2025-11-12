package tw.com.fw.servlet;


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

@WebServlet("/ProductPageServlet")
public class ProductPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDao dao = new ProductDaoImlp();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String id = request.getParameter("id");
		System.out.println("id = " + id);
		List<Product> lists;

		if (id == null || id.isEmpty()) {
			lists = dao.query();
		} else {
			lists = dao.getProductById(id);
		}

		request.setAttribute("lists", lists);		
		request.getRequestDispatcher("productPage.jsp").forward(request, response);
}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}


