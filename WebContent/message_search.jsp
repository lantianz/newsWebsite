<%@page import="newsWebsite.jdbc.model.News"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset=UTF-8>
<title>信息</title>
<link rel="stylesheet" type="text/css" href="css/message.css">
<link rel="icon" type="image/x-ico" href="images/stu.ico">
</head>
<body>
	<div class="message">
		<div class="left">
			<%
				//获取提示信息
				String info = (String) request.getAttribute("info");
				//如果提示信息不为空，则输出
				if(info != null){
			%>
			<h3><%=info%></h3>
			<%
				}
				//获取新闻信息
				News news = (News) session.getAttribute("news");
				//判断新闻是否存在
				if(news != null){
					
				}else{
			%>
			<p><%="请重新搜索"%></p>
			<%
				}	
			%>
		</div>
		<div class="right">
			<a class="relogin" href="dnews_id.jsp">重新搜索></a>
		</div>
	</div>

</body>
</html>