package newsWebsite.jdbc.test;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.junit.Test;

import newsWebsite.jdbc.model.News;
import newsWebsite.jdbc.model.Section;
import newsWebsite.jdbc.model.User;
import newsWebsite.jdbc.utils.JDBCUtils;

public class DBUtilsTest2 {
	@Test
	public void demo() throws SQLException {
		QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
	    //User user = queryRunner.query("select * from user where user_id = 111", new BeanHandler<User>(User.class));
	    //Section section  = queryRunner.query("select * from section where section_id = 5", new BeanHandler<Section>(Section.class));
		News news  = queryRunner.query("select * from news where news_id = ?", new BeanHandler<News>(News.class),102);
	    System.out.println(news.getTitle());

	}
	
}
