package newsWebsite.jdbc.utils;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

/*
 * 改写工具类,用于连接池 
 */

public class JDBCUtils {
	//创建连接池，只创建一次
	private static final ComboPooledDataSource dataSource = new ComboPooledDataSource();
	
	/*
	* 获得连接方法
	*/
	public static Connection getConnection() throws SQLException {
		return dataSource.getConnection();
	}
	
	/*
	 * 获得连接池方法  
	 */
	public static DataSource getDataSource() {
		return dataSource;
	}
	
	/*
	 * 释放资源的方法
	 */
	public static void relese(Statement stmt,Connection conn) {
		if(stmt!=null) {
			try {
				stmt.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
			stmt=null;
		}
		if(conn!=null) {
			try {
				conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
			conn=null;
		}
	}
	
	public static void relese(ResultSet rs,Statement stmt,Connection conn) {
		if(rs!=null) {
			try {
				rs.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
			rs=null;
		}
		if(stmt!=null) {
			try {
				stmt.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
			stmt=null;
		}
		if(conn!=null) {
			try {
				conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
			conn=null;
		}
	}

	
}
