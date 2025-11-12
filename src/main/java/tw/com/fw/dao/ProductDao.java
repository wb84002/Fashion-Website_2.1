package tw.com.fw.dao;

import java.util.List;
import tw.com.fw.model.Product;

/**
 * DAO 的目的：把資料庫操作獨立出來， 讓程式更乾淨、容易維護。
 */

public interface ProductDao {

	/*
	 * 新增產品資料到資料庫 回傳值：新增成功的筆數（通常是 1） int可改用boolean，回傳是否修改成功
	 */
	int addProduct(Product product);
	
	// 根據 ID 查詢產品 
	public List<Product> getProductById(String id);

	// (根據 ID) 查詢產品
	List<Product> query();

	// 查詢所有產品
	List<Product> queryAll();

	// 更新產品資訊
	// 回傳值：更新成功的筆數（通常是 1 或 0）
	int updateProduct(Product product);

	// 依照產品ID，刪除該產品資料
	// 回傳值：刪除成功的筆數（通常是 1 或 0）
	int deleteProduct(int productId);
	
	//根據category查詢產品
	public List<Product> getProductByCategory(String category);

}