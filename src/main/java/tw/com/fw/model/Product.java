package tw.com.fw.model;

import java.util.Objects;

//model 用來放資料庫的資料
public class Product {
	private Integer product_id;
	private String product_groupby_id;
	private String product_name;
	private String color;
	private String size;
	private String category;
	private String description;
	private Integer price;
	private Integer stock;
	private String image_url_1;
	private String image_url_2;
	private String image_url_3;
	private String product_url;
	
    public Product() {}
    
    public Product(Integer product_id, String product_groupby_id, String product_name, String color, 
                   String size, String category, String description, Integer price, Integer stock, 
                   String image_url_1, String image_url_2, String image_url_3, String product_url) {
        this.product_id = product_id;
        this.product_groupby_id = product_groupby_id;
        this.product_name = product_name;
        this.color = color;
        this.size = size;
        this.category = category;
        this.description = description;
        this.price = price;
        this.stock = stock;
        this.image_url_1 = image_url_1;
        this.image_url_2 = image_url_2;
        this.image_url_3 = image_url_3;
        this.product_url = product_url;
    }
    
	public Integer getProduct_id() {
		return product_id;
	}
	
	public void setProduct_id(Integer product_id) {
		this.product_id = product_id;
	}
	
	public String getProduct_groupby_id() {
		return product_groupby_id;
	}
	
	public void setProduct_groupby_id(String product_groupby_id) {
		this.product_groupby_id = product_groupby_id;
	}
	
	public String getProduct_name() {
		return product_name;
	}
	
	public void setProduct_name(String product_name) {  // ✅ 修正：原本是 setProductName
		this.product_name = product_name;
	}
	
	public String getColor() {
		return color;
	}
	
	public void setColor(String color) {
		this.color = color;
	}
	
	public String getSize() {
		return size;
	}
	
	public void setSize(String size) {
		this.size = size;
	}
	
	public String getCategory() {
		return category;
	}
	
	public void setCategory(String category) {
		this.category = category;
	}
	
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	public Integer getPrice() {
		return price;
	}
	
	public void setPrice(Integer price) {
		this.price = price;
	}
	
	public Integer getStock() {
		return stock;
	}
	
	public void setStock(Integer stock) {
		this.stock = stock;
	}
	
	// ✅ 修正：getter 方法名稱改成大寫開頭
	public String getImage_url_1() {  // 原本是 getimage_url_1()
		return image_url_1;
	}
	
	public void setImage_url_1(String image_url_1) {  // 原本是 setimage_url_1()
		this.image_url_1 = image_url_1;
	}
	
	public String getImage_url_2() {  // 原本是 getimage_url_2()
		return image_url_2;
	}
	
	public void setImage_url_2(String image_url_2) {  // 原本是 setimage_url_2()
		this.image_url_2 = image_url_2;
	}
	
	public String getImage_url_3() {  // 原本是 getimage_url_3()
		return image_url_3;
	}
	
	public void setImage_url_3(String image_url_3) {  // 原本是 setimage_url_3()
		this.image_url_3 = image_url_3;
	}
	
	public String getProduct_url() {
		return product_url;
	}
	
	public void setProduct_url(String product_url) {
		this.product_url = product_url;
	}
	
	@Override
	public int hashCode() {
		return Objects.hash(product_id, product_groupby_id, product_name, color, size, category, 
				price, stock, description, image_url_1, image_url_2, image_url_3, product_url);
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Product other = (Product) obj;
		return Objects.equals(category, other.category) 
				&& Objects.equals(description, other.description)
				&& Objects.equals(image_url_1, other.image_url_1) 
				&& Objects.equals(image_url_2, other.image_url_2)
				&& Objects.equals(image_url_3, other.image_url_3) 
				&& Objects.equals(price, other.price)
				&& Objects.equals(product_id, other.product_id) 
				&& Objects.equals(product_name, other.product_name)
				&& Objects.equals(product_url, other.product_url) 
				&& Objects.equals(size, other.size)
				&& Objects.equals(stock, other.stock) 
				&& Objects.equals(product_groupby_id, other.product_groupby_id)
				&& Objects.equals(color, other.color);
	}
	
	@Override
	public String toString() {
		return "Product [product_id=" + product_id + ", product_groupby_id=" + product_groupby_id 
				+ ", product_name=" + product_name + ", color=" + color + ", size=" + size 
				+ ", category=" + category + ", description=" + description + ", price=" + price 
				+ ", stock=" + stock + ", image_url_1=" + image_url_1 + ", image_url_2=" + image_url_2 
				+ ", image_url_3=" + image_url_3 + ", product_url=" + product_url + "]";
	}
}