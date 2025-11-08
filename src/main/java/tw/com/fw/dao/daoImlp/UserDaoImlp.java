package tw.com.fw.dao.daoImlp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import tw.com.fw.dao.UserDao;
import tw.com.fw.model.User;
import tw.com.fw.databaseutils.DBUtils;

public class UserDaoImlp implements UserDao{
	private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;
	
    
    public UserDaoImlp(Connection conn) {
		//super();
    	this.conn = conn;
	}
	
	public UserDaoImlp() {
		 this.conn = DBUtils.getDataBase().getConnection();
		 if (this.conn == null) 
		 {
			 System.out.println("資料庫連線為 null！檢查 DBUtils 或驅動是否有問題");
		 }
	}
    
	@Override
	public User userLogin(String email, String password) {
		User user=null;
		String query="select * from user where email=? and password=?";
		 try {
	            ps=this.conn.prepareStatement(query);
	            ps.setString(1, email);
	            ps.setString(2, password);
	            rs=ps.executeQuery();
	            
	            if(rs.next()) {
	                user=new User();
	                user.setId(rs.getInt("id"));
	                user.setName(rs.getString("name"));
	                user.setEmail(rs.getString("email"));
	                return user;
	            }
	            
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return user;
	    }

}
