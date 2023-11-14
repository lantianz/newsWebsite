package newsWebsite.jdbc.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import newsWebsite.jdbc.model.Comment;
import newsWebsite.jdbc.model.User;
import newsWebsite.jdbc.utils.JDBCUtils;

public class CommentDao {
	
	//增加评论
	public boolean addComment(Comment comment) throws SQLException {
		QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
		queryRunner.update("insert into comment values(?,?,?,?,?)",comment.getComment_id(),comment.getNews_id(),comment.getContent(),comment.getUser_name(),comment.getComment_date());
		return true;
	}
	
	//根据新闻id查看评论
	public List<Comment> getCommnetByNewsId(int newsId) throws SQLException{
		QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
		List<Comment> list;
		list = queryRunner.query("select * from comment where news_id = ? order by DATE_FORMAT(comment_date,'%y-%m-%d %H:%i:%s') desc", new BeanListHandler<Comment>(Comment.class),newsId);
		return list;
	}
	
	//根据用户名查看评论
	public List<Comment> getCommentByUserName(String userName) throws SQLException{
		QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
		List<Comment> list;
		list = queryRunner.query("select * from comment where user_name = ? order by DATE_FORMAT(comment_date,'%y-%m-%d %H:%i:%s') desc", new BeanListHandler<Comment>(Comment.class),userName);
		return list;
	}
	
	//根据评论id删除评论
	public boolean deleteCommentByCommentId(int commentId) throws SQLException {
		QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
		queryRunner.update("delete from comment where comment_id = ?",commentId);
		return true;
	}
	
	//根据新闻id删除评论
	public boolean deleteCommentByNewsId(int newsId) throws SQLException {
		QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
		queryRunner.update("delete from comment where news_id = ?",newsId);
		return true;
	}
	
	//根据用户名删除评论
	public boolean deleteCommentByUserName(String userName) throws SQLException {
		QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());
		queryRunner.update("delete from comment where user_name = ?",userName);
		return true;
	}
	
}
