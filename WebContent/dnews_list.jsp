<%@ page import="newsWebsite.jdbc.model.News"%>
<%@ page import="newsWebsite.jdbc.dao.NewsDao"%>
<%@ page import = " java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/admint.css">
<title>Delete by LIST</title>
</head>
<body>
<%
	NewsDao newsDao = new NewsDao();
	List<News> list = newsDao.getAllNews();
	int n = list.size();
	int[] newsId = new  int[n];
	String[] newsTitle = new String[n];
	String[] newsAuthor = new String[n];
	String[] newsDate = new String[n];
    String[] newsOverview = new String[n];
	int i = 0;
	for(News news : list){
		newsId[i] = news.getNews_id();  //System.out.println(newsId[i]);
		newsTitle[i] = news.getTitle(); //System.out.println(newsTitle[i]);
		newsAuthor[i] = news.getAuthor(); //System.out.println(newsAuthor[i]);
		newsDate[i] = news.getPublish_date(); //System.out.println(newsDate[i]);
		newsOverview[i] = news.getOver_view(); //System.out.println(newsOverview[i]);
		i++;
	}%>


	<table class="layui-table">
    	<thead>
    		<tr>
    			<th>新闻ID</th>
    			<th>新闻标题</th>
    			<th>发布人</th>
    			<th>发布时间</th>
    			<th>操作</th>
    		</tr>
    	</thead>
    	
    	<tbody>
    	<%
    		for(int j = 0; j < n; j++){
    	%>
    		<tr>
    			<td><%=newsId[j] %></td>
    			<td><%=newsTitle[j] %></td>
    			<td><%=newsAuthor[j] %></td>
    			<td><%=newsDate[j] %></td>
    			<td>
    			<input id="6" value="6" type="hidden" class="weui-input">
    			<form action="DeleteNewsServlet" method="post">
    				<input type="text" value="<%=newsId[j] %>" name="news_id" id="news_id" class="dele">
    				<input type="text" value="list" name="boo" id="boo" class="dele">
    				<button type="submit" class="layui-btn layui-btn-sm layui-btn-normal">删除</button>
    			</form>
    			</td>
    		</tr>
    	<%
    		}
    	%>
    		
    	</tbody>
    </table>
</body>
</html>