package newsWebsite.jdbc.test;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.junit.Test;

import newsWebsite.jdbc.utils.JDBCUtils;

public class DBUtilsTest {
	@Test
	public void demo() throws SQLException {
		QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
		
		queryRunner.update("insert into user values('sb',?)", "12123");
	}
	
}
