package tw.com.fw.dao.daoImlp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import tw.com.fw.model.Product;
import tw.com.fw.dao.ProductDao;
import tw.com.fw.databaseutils.DBUtils;

//實作商品
//**ProductDao"Imlp" 是否改為"Impl"?
public class ProductDaoImlp implements ProductDao {

	private Connection conn = DBUtils.getDataBase().getConnection();
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	// 依據category，查詢商品
	@Override
	public List<Product> getProductByCategory(String category) {
		
		List<Product> list = new ArrayList<>();
		String sql = "SELECT * FROM product WHERE category = ?";
		try (PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setString(1, category);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Product product = new Product();
				product.setProductId(rs.getInt("product_id"));
				product.setProductName(rs.getString("product_name"));
				product.setSize(rs.getString("size"));
				product.setCategory(rs.getString("category"));
				product.setPrice(rs.getInt("price"));
				product.setStock(rs.getInt("stock"));
				product.setDescription(rs.getString("description"));
				product.setImage_url1(rs.getString("image_url1"));
				product.setImage_url2(rs.getString("image_url2"));
				product.setImage_url3(rs.getString("image_url3"));
				product.setProduct_url(rs.getString("product_url"));
				list.add(product);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	// 查詢全部
	@Override
	public List<Product> query() {

		List<Product> list = new ArrayList<Product>();
		try {
			
			String querySQL = "SELECT * FROM product ORDER BY product_id;";
			ps = conn.prepareStatement(querySQL);
			rs = ps.executeQuery();
			while (rs.next()) {
				Product product = new Product();
				product.setProductId(rs.getInt("product_id"));
				product.setProductName(rs.getString("product_name"));
				product.setSize(rs.getString("size"));
				product.setCategory(rs.getString("category"));
				product.setPrice(rs.getInt("price"));
				product.setStock(rs.getInt("stock"));
				product.setDescription(rs.getString("description"));
				product.setImage_url1(rs.getString("image_url1"));
				product.setImage_url2(rs.getString("image_url2"));
				product.setImage_url3(rs.getString("image_url3"));
				product.setProduct_url(rs.getString("product_url"));
				list.add(product);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// 新增產品
	@Override
	public int addProduct(Product product) {
		String addSQL = "INSERT INTO product (product_name, size, category, description, price, stock,"
				+ " image_url1, image_url2, image_url3, product_url) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			ps = conn.prepareStatement(addSQL);
			ps.setString(1, product.getProductName());
			ps.setString(2, product.getSize());
			ps.setString(3, product.getCategory());
			ps.setInt(4, product.getPrice());
			ps.setInt(5, product.getStock());
			ps.setString(6, product.getDescription());
			ps.setString(7, product.getImage_url1());
			ps.setString(8, product.getImage_url2());
			ps.setString(9, product.getImage_url3());
			ps.setString(10, product.getProduct_url());

			return ps.executeUpdate(); // 回傳影響筆數
		} catch (SQLException e) {
			e.printStackTrace();
		} return 0;

	}

	// 查詢全部
	@Override
	public List<Product> queryAll() {

		List<Product> listAll = new ArrayList<Product>();
		try {
			String querySQL = "SELECT * FROM product ORDER BY product;";
			ps = conn.prepareStatement(querySQL);
			rs = ps.executeQuery();
			while (rs.next()) {
				Product product = new Product();
				product.setProductId(rs.getInt("product_id"));
				product.setProductName(rs.getString("product_name"));
				product.setSize(rs.getString("size"));
				product.setCategory(rs.getString("category"));
				product.setPrice(rs.getInt("price"));
				product.setStock(rs.getInt("stock"));
				product.setDescription(rs.getString("description"));
				product.setImage_url1(rs.getString("image_url1"));
				product.setImage_url2(rs.getString("image_url2"));
				product.setImage_url3(rs.getString("image_url3"));
				product.setProduct_url(rs.getString("product_url"));
				listAll.add(product);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listAll;
	}

	// 修改產品
	@Override
	public int updateProduct(Product product) {
		String updateSQL = "UPDATE product SET product_name=?, size=?, category=?, description=?, price=?, stock=?,"
				+ " image_url1=?, image_url2=?, image_url3=?, product_url=? WHERE product_id=?";
		try {
			ps = conn.prepareStatement(updateSQL);
			ps.setString(1, product.getProductName());
			ps.setString(2, product.getSize());
			ps.setString(3, product.getCategory());
			ps.setInt(4, product.getPrice());
			ps.setInt(5, product.getStock());
			ps.setString(6, product.getDescription());
			ps.setString(7, product.getImage_url1());
			ps.setString(8, product.getImage_url2());
			ps.setString(9, product.getImage_url3());
			ps.setString(10, product.getProduct_url());

			return ps.executeUpdate(); // 回傳影響筆數
		} catch (SQLException e) {
			e.printStackTrace();
		} return 0;
	}

	// 刪除產品
	@Override
	public int deleteProduct(int productId) {

		String deleteSQL = "delete from product where product_id=?";
		try {

			ps = conn.prepareStatement(deleteSQL);
			ps.setInt(1, productId);
			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

}