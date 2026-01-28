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
public class ProductDaoImpl implements ProductDao {

	private Connection conn = DBUtils.getDataBase().getConnection();
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	//定義的query() 方法
	@Override
	public List<Product> query() {
	    return queryAll();
	}
		
	// 依據category，查詢商品，用於產品目錄
	@Override
	public List<Product> getProductByCategory(String category) {

	    System.out.println("[DAOImp] category param = [" + category + "]");
		List<Product> list = new ArrayList<>();
		String categorysql = "SELECT * FROM product_menu WHERE category = ?";
		
		try (PreparedStatement ps = conn.prepareStatement(categorysql)) {
			ps.setString(1, category);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Product product = new Product();
				product.setProduct_id(rs.getInt("pd_id"));
				product.setProduct_groupby_id(rs.getString("pd_group_by_id"));				
				product.setProduct_name(rs.getString("product_name"));
				product.setCategory(rs.getString("category"));
				product.setPrice(rs.getInt("price"));
				product.setImage_url_1(rs.getString("image_url1"));
				System.out.println("productDaoImpl:"+product);
				list.add(product);
			}		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// 依據產品ID，查詢該產品相關資訊
	@Override
	public List<Product> getProductById(String pd_id) {
		System.out.println("[DAOImpl] pd_id = [" + pd_id + "]");
		List<Product> list = new ArrayList<Product>();
		String querySQL = "SELECT * FROM product_detail WHERE pd_id=?";
		try (PreparedStatement ps = conn.prepareStatement(querySQL)){			
			ps.setString(1, pd_id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Product product = new Product();
				product.setProduct_id(rs.getInt("pd_id"));
				product.setProduct_groupby_id(rs.getString("pd_group_by_id"));				
				product.setProduct_name(rs.getString("pd_name"));
				product.setColor(rs.getString("pd_color"));
				product.setSize(rs.getString("pd_size"));
				product.setCategory(rs.getString("pd_category"));
				product.setPrice(rs.getInt("pd_price"));
				product.setStock(rs.getInt("pd_stock"));
				product.setDescription(rs.getString("pd_description"));
				product.setImage_url_1(rs.getString("pd_image_url1"));
				product.setImage_url_2(rs.getString("pd_image_url2"));
				product.setImage_url_3(rs.getString("pd_image_url3"));
				product.setProduct_url(rs.getString("pd_product_url"));
				System.out.println("productDaoImpl:"+product);
				list.add(product);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}	
	
	// 依據產品pd_group_by_id，查詢該產品相關資訊
	@Override
	public List<Product> getProductByGroupById(String pd_group_by_id) {
		System.out.println("[DAOImpl] pd_group_by_id = [" + pd_group_by_id + "]");
		List<Product> list = new ArrayList<Product>();
		String querySQL = "SELECT * FROM product_detail WHERE pd_group_by_id=?";
		try (PreparedStatement ps = conn.prepareStatement(querySQL)){
			ps.setString(1, pd_group_by_id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Product product = new Product();
				product.setProduct_id(rs.getInt("pd_id"));
				product.setProduct_groupby_id(rs.getString("pd_group_by_id"));				
				product.setProduct_name(rs.getString("pd_name"));
				product.setColor(rs.getString("pd_color"));
				product.setSize(rs.getString("pd_size"));
				product.setCategory(rs.getString("pd_category"));
				product.setPrice(rs.getInt("pd_price"));
				product.setStock(rs.getInt("pd_stock"));
				product.setDescription(rs.getString("pd_description"));
				product.setImage_url_1(rs.getString("pd_image_url1"));
				product.setImage_url_2(rs.getString("pd_image_url2"));
				product.setImage_url_3(rs.getString("pd_image_url3"));
				product.setProduct_url(rs.getString("pd_product_url"));
				System.out.println("productDaoImpl:"+product);
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
		String addSQL = "INSERT INTO product (pd_groupby_id, pd_name, pd_color, pd_size, pd_category, pd_price, pd_stock, pd_description,"
				+ " pd_image_url_1, pd_image_url_2, pd_image_url_3, pd_product_url) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			ps = conn.prepareStatement(addSQL);
			ps.setString(1, product.getProduct_groupby_id());
			ps.setString(2, product.getProduct_name());
			ps.setString(3, product.getColor());
			ps.setString(4, product.getSize());
			ps.setString(5, product.getCategory());
			ps.setInt(6, product.getPrice());
			ps.setInt(7, product.getStock());
			ps.setString(8, product.getDescription());
			ps.setString(9, product.getImage_url_1());
			ps.setString(10, product.getImage_url_2());
			ps.setString(11, product.getImage_url_3());
			ps.setString(12, product.getProduct_url());

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
				product.setProduct_id(rs.getInt("product_id"));
				product.setProduct_groupby_id(rs.getString("product_groupby_id"));				
				product.setProduct_name(rs.getString("product_name"));
				product.setColor(rs.getString("color"));
				product.setSize(rs.getString("size"));
				product.setCategory(rs.getString("category"));
				product.setPrice(rs.getInt("price"));
				product.setStock(rs.getInt("stock"));
				product.setDescription(rs.getString("description"));
				product.setImage_url_1(rs.getString("image_url_1"));
				product.setImage_url_2(rs.getString("image_url_2"));
				product.setImage_url_3(rs.getString("image_url_3"));
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
		String updateSQL = "UPDATE product SET pd_groupby_id=? pd_name=?, pd_color=?, pd_size=?, pd_category=?, pd_price=?, pd_stock=?, pd_description=?,"
				+ " pd_image_url_1=?, pd_image_url_2=?, pd_image_url_3=?, pd_product_url=? WHERE product_id=?";
		try {
			ps = conn.prepareStatement(updateSQL);
			ps.setString(1, product.getProduct_groupby_id());
			ps.setString(2, product.getProduct_name());
			ps.setString(3, product.getColor());
			ps.setString(4, product.getSize());
			ps.setString(5, product.getCategory());
			ps.setInt(6, product.getPrice());
			ps.setInt(7, product.getStock());
			ps.setString(8, product.getDescription());
			ps.setString(9, product.getImage_url_1());
			ps.setString(10, product.getImage_url_2());
			ps.setString(11, product.getImage_url_3());
			ps.setString(12, product.getProduct_url());

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