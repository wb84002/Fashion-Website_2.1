package tw.com.fw.model;

//model 用來放資料庫的資料
public class Product {
	private Integer productId;
	private String productName;
	private String size;
	private String category;
	private String description;
	private Integer price;
	private Integer stock;
	private String image_url1;
	private String image_url2;
	private String image_url3;
	private String product_url;
	
	

    public Product() {}
    public Product(Integer productId, String productName, String size, String category, String description, Integer price,
    		Integer stock, String image_url1, String image_url2, String image_url3, String product_url) {
        this.productId = productId;
        this.productName = productName;
        this.size = size;
        this.category = category;
        this.description = description;
        this.price = price;
        this.stock = stock;
        this.image_url1 = image_url1;
        this.image_url2 = image_url2;
        this.image_url3 = image_url3;
        this.product_url = product_url;
    }

    public Integer getProductId() { return productId; }
    public void setProductId(Integer productId) { this.productId = productId; }

    public String getProductName() { return productName; }
    public void setProductName(String productName) { this.productName = productName; }

    public String getSize() { return size; }
    public void setSize(String size) { this.size = size; }
    
    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public Integer getPrice() { return price; }
    public void setPrice(Integer price) { this.price = price; }

    public Integer getStock() { return stock; }
    public void setStock(Integer stock) { this.stock = stock; }

    public String getImage_url1() { return image_url1; }
    public void setImage_url1(String image_url1) { this.image_url1 = image_url1; }
    
    public String getImage_url2() { return image_url2; }
    public void setImage_url2(String image_url2) { this.image_url2 = image_url2; }
    
    public String getImage_url3() { return image_url3; }
    public void setImage_url3(String image_url3) { this.image_url3 = image_url3; }
    
    public String getProduct_url() { return product_url; }
    public void setProduct_url(String product_url) { this.product_url = product_url; }

    @Override
    public String toString() {
        return "Product [productId=" + productId + ", productName=" + productName + ", size=" + size + ", category=" + category 
        		+ ", price=" + price + ", stock=" + stock + ", description=" + description +
        		", image_url1=" + image_url1 + ", image_url2=" + image_url2 +
        		", image_url3=" + image_url3 + ", product_url=" + product_url + "]";
    }
}