package newsWebsite.jdbc.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import newsWebsite.jdbc.model.News;
import newsWebsite.jdbc.utils.JDBCUtils;

public class NewsDao {
	
	//添加新闻，若该新闻ID已被占用返回false,否则成功插入并返回true
	public boolean addNews(News news) throws SQLException {
		QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
		News news1 = null;
		news1 = queryRunner.query("select * from news where news_id = ?", new BeanHandler<News>(News.class),news.getNews_id());
		if(news1 != null) {
			return false;
		}else {
			queryRunner.update("insert into news values(?,?,?,?,?,?,?,?,?,?,?,?)",news.getNews_id(),news.getTitle(),news.getOver_view(),news.getContent(),news.getPublish_date(),news.getAuthor(),news.getSection_id(),news.getClick(),news.getIsHead(),news.getIsImage(),news.getImageName(),news.getIsHot());
			return true;
		}
	}
	
	//获取全部新闻
	public List<News> getAllNews() throws SQLException{
		QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
		List<News> list = null;
		list = queryRunner.query("select * from news order by DATE_FORMAT(publish_date,'%y-%m-%d %H:%i:%s') desc", new BeanListHandler<News>(News.class));
		return list;
	}
	
	//根据id搜索新闻，返回的news1对象若为null则新闻不存在
	public News searchNewsById(int id) throws SQLException {
		QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
		News news1 = null;
		news1 = queryRunner.query("select * from news where news_id = ?", new BeanHandler<News>(News.class),id);
		return news1;
	}
	
	//根据完整标题搜索新闻，返回的news1对象若为null则新闻不存在
	public News searchNewsByFullTitle(String title) throws SQLException {
		QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
		News news1 = null;
		news1 = queryRunner.query("select * from news where title = ?", new BeanHandler<News>(News.class),title);
		return news1;
	}
	
	//根据标题包含内容搜索
	public List<News> searchNewsByPartTitle(String partTitle) throws SQLException {
		QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
		List<News> list = null;
		list = queryRunner.query("select * from news where title like '%"+partTitle+"%'", new BeanListHandler<News>(News.class));
	    return list;
	}
	
	//搜索最新发布的十条新闻
	public List<News> searchNewsByDateTopTen() throws SQLException {
		QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
		List<News> list = null;
		list = queryRunner.query("select * from news order by DATE_FORMAT(publish_date,'%y-%m-%d %H:%i:%s') desc limit 10", new BeanListHandler<News>(News.class));
		return list;
	}
	
	//搜索指定板块最新发布的十条新闻
	public List<News> searchNewsBySectionTopTen(int sectionId) throws SQLException{
		QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
		List<News> list = null;
		list = queryRunner.query("select * from news where section_id = ? order by DATE_FORMAT(publish_date,'%y-%m-%d %H:%i:%s') desc limit 10", new BeanListHandler<News>(News.class),sectionId);
		return list;
	}
	
	//搜索点击量最高的六条新闻
	public List<News> searchNewsByClickTopSix() throws SQLException{
		QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
		List<News> list = null;
		list = queryRunner.query("select * from news order by click desc limit 6", new BeanListHandler<News>(News.class));
		return list;
	}
	
	//修改新闻点击量
	public boolean updateClick(int id) throws SQLException {
		QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
		News news1 = null;
		news1 = queryRunner.query("select * from news where news_id = ?", new BeanHandler<News>(News.class),id);
		if(news1 != null) {
			queryRunner.update("update news set click = ? where news_id = ?", news1.getClick()+1,id);
			return true;
		}else {
			return false;
		}
	}
	
	//根据id删除新闻
	public boolean deleteNewsById(int id) throws SQLException {
		QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
		News news1 = null;
		news1 = queryRunner.query("select * from news where news_id = ?", new BeanHandler<News>(News.class),id);
		if(news1 != null) {
			queryRunner.update("delete from news where news_id = ?",id);
			return true;
		}else {
			return false;
		}
	}
	
}
