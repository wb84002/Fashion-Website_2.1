package tw.com.fw.dao;

import tw.com.fw.model.User;

public interface UserDao {
	//抽象方法
    public User userLogin(String email,String password);
}
