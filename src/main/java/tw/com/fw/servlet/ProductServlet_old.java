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

@WebServlet("/productServlet")
public class ProductServlet_old extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDao dao = new ProductDaoImlp();

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

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
