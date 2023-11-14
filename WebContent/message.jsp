<%@page import="newsWebsite.jdbc.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset=UTF-8>
<title>错误信息</title>
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
				//获取登录成功的用户信息
				User user = (User) session.getAttribute("user");
				//判断用户是否登录
				if(user != null){
					
				}else{
					//out.print("<script>alert('对不起！您还未登录！');</script>"); 
			%>
			<p><%="对不起！您还未登录！"%></p>
			<%
				}	
			%>
		</div>
		<div class="right">
			<a class="relogin" href="login.html">重新登录></a>
		</div>
	</div>

	<footer>
		<div class="info">
			<ul>
				<li><a href="#">新闻网页</a></li>
				<li><a href="#">帮助与反馈</a></li>
				<li><a href="#">联系我们</a></li>
			</ul>
		</div>
		<div class="copyright">
			&copy; Copyright. All rights reserved. Design by <a
				href="http://www.bing.com">bing</a>
		</div>
	</footer>
</body>
</html>