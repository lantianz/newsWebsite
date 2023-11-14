<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = " newsWebsite.jdbc.dao.UserDao" %>
<%@ page import = " newsWebsite.jdbc.model.User" %>
<%@ page import = " newsWebsite.jdbc.model.News" %>
<%@ page import = " newsWebsite.jdbc.dao.NewsDao" %>
<%@ page import = " org.apache.commons.dbutils.QueryRunner" %>
<%@ page import = " org.apache.commons.dbutils.handlers.BeanListHandler" %>
<%@ page import = " newsWebsite.jdbc.utils.JDBCUtils" %>
<%@ page import = " java.util.List" %>
<%@ page import = " java.sql.Date" %>
<%@ page import = " java.text.SimpleDateFormat" %>
<%@ page import = " java.sql.Connection"%>
<%@ page import = " java.sql.Statement"%>
<%@ page import = " java.sql.Timestamp"%>
<%@ page import = " java.sql.DriverManager"%>
<%@ page import = " java.sql.ResultSet" %>
<%@ page import = " newsWebsite.jdbc.dao.CommentDao" %>
<%@ page import = " newsWebsite.jdbc.model.Comment" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//NewsDao newsdao = new NewsDao();
//List<News> list = newsdao.searchNewsByDateTopTen();
//for(News news : list){
//	out.println(news.getPublish_date()+"<br/>");
//}
%>
<%
CommentDao commentDao = new CommentDao();
List<Comment> list = null;
list = commentDao.getCommnetByNewsId(1);
for(Comment comment : list){
	out.println(comment.toString()+"<br/>");
}
%>
</body>
</html>