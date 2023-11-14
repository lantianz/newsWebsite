package newsWebsite.jdbc.dao;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import newsWebsite.jdbc.model.User;
import newsWebsite.jdbc.utils.JDBCUtils;

public class UserDao {
	
	//登录,成功返回true,失败返回false
	public boolean login(String userid,String password)throws Exception{
		QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
		User user1 = null;
		user1 = queryRunner.query("select * from user where user_id = ? and password = ?", new BeanHandler<User>(User.class),userid,password);
		if(user1 != null) {
			return true;
		}else {
			return false;
		}
	}
	
	//增加用户,账户ID已使用返回false,成功插入返回true
	public boolean addUser(String userid,String password) throws SQLException {
		QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
		User user1 = null;
		user1 = queryRunner.query("select * from user where user_id = ?", new BeanHandler<User>(User.class),userid);
		if(user1 != null) {			
			return false;
		}else {
			queryRunner.update("insert into user values(?,?,?,?,?)",userid,"未命名用户",password,"保密",null);
			return true;
		}
	}
	
	//删除用户,用户不存在返回false,成功删除返回true
	public boolean deleteUser(String userid) throws SQLException {
		QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
		User user1;
		user1 = queryRunner.query("select * from user where user_id = ?", new BeanHandler<User>(User.class),userid);
		if(user1 != null) {
			queryRunner.update("delete from user where user_id = ?",userid);
			return true;
		}else {
			return false;
		}
	}
	
	//修改用户信息
	public boolean updateUser(User user) throws SQLException {
		QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
		User user1;
		user1 = queryRunner.query("select * from user where user_id = ?", new BeanHandler<User>(User.class),user.getUser_id());
		if(user1 != null) {
			queryRunner.update("update user set user_name=?,password=?,sex=?,birthdate=? where user_id = ?",user.getUser_name(),user.getPassword(),user.getSex(),user.getBirthdate(),user.getUser_id());
			return true;
		}else {
			return false;
		}
		
	}
	
	//取得用户信息
	public User getUser(String userid) throws SQLException {
		QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
		User user;
		user = queryRunner.query("select * from user where user_id = ?", new BeanHandler<User>(User.class),userid);
		return user;
	}
	
}
