<%@page import="newsWebsite.jdbc.model.News"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/admint.css">
<title>Delete by ID</title>
</head>
<body>
	
	<form action="QueryServlet" method="post">
		<div class="layui-form-item">
			<div class="layui-inline">
				<div class="layui-input-inline">
					<input type="number" oninput="if(value.length>11)value=value.slice(0,11)" placeholder="根据新闻ID查询" name="news_id" id="news_id" class="layui-input" required="required">
				</div>
			</div>
			<div class="layui-inline">
				<button type="submit" class="layui-btn1 layui-btn-sm layui-btn-normal">查询</button>
			</div>
		</div>
	</form>
<%
	News news = (News) session.getAttribute("news");
	if(news != null){
	%>	
	<div class="search_result">
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
    		<tr>
    			<td><%=news.getNews_id() %></td>
    			<td><%=news.getTitle() %></td>
    			<td><%=news.getAuthor() %></td>
    			<td><%=news.getPublish_date() %></td>
    			<td>
    			<input id="6" value="6" type="hidden" class="weui-input">
    			<form action="DeleteNewsServlet" method="post">
    				<input type="text" value="<%=news.getNews_id() %>" name="news_id" id="news_id" class="dele">
    				<input type="text" value="nolist" name="boo" id="boo" class="dele">
    				<button type="submit" class="layui-btn layui-btn-sm layui-btn-normal">删除</button>
    			</form>
    			</td>
    		</tr>
    	</tbody>
    	</table>
	</div>
<%
	}else{

		}
	%>
	
</body>
</html>