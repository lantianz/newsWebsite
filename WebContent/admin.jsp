<%@page import="newsWebsite.jdbc.model.User"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="zh">
<head>
	<meta charset="UTF-8">
	<title>管理员操作界面</title>
	<link rel="stylesheet" type="text/css" href="css/admint.css">
	<link rel="icon" type="image/x-ico" href="">
	<script src="js/jquery-3.1.1.min.js"></script>
	<script src="js/admin.js"></script>
	
</head>
	
<body>
	<%
		//获取登录成功的用户信息
		User user = (User) session.getAttribute("admin");
		//判断用户是否登录
		if(user != null){
	%>
	<header>
		<div class="title">
			<span>新闻管理操作界面</span>
		</div>
		<nav>
			<div class="userinfo">
				<ul>
					<li><%=user.getUser_id() %></li>
					<li><a href="UserExitServlet">退出登录</a></li>
					<li><a href="index.jsp">返回首页</a></li>
				</ul>
			</div>
		</nav>
	</header>
	
	<main>
		<%
		}else{
			response.sendRedirect("login.html");
		}
		%>
		<div class="container">
			<div class="select">
				<h3>请选择操作</h3>
				<ul id="accordion" class="accordion">
					<li>
						<div id="option_list" class="link">新闻</div>
						<ul class="submenu">
							<li class="active" data-cid="0"><a onclick="addNews()">新闻发布</a></li>
							<li data-cid="1"><a onclick="deleteNews_list()">按照列表删除</a></li>	
							<li data-cid="2"><a onclick="deleteNews_id()">按照ID删除</a></li>				
							<li data-cid="3"><a onclick="">. . .</a></li>							
						</ul>
					</li>
				</ul>
				</div>
	
				<div id="result" class="result">
					<p class="welcome">欢迎使用新闻管理系统！</p>
				</div>
			</div>
	</main>
	<footer>
		<div class="copyright">
			&copy; web应用开发课程设计 <a href="http://www.bing.com/">bing</a>
		</div>
	</footer>

</body>
</html>