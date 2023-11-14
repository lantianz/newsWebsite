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
				if(info.equals(" 添加成功！")){
					%>
					<p><%="继续添加"%></p>
					<%
				}else{
			%>
			<p><%="重新添加"%></p>
			<%
				}	
			%>
		</div>
		<% 
		if(info.equals(" 添加成功！")){
			%>
				<div class="right">
					<a class="relogin" href="add_news.jsp">继续添加></a>
				</div>
			<%
				}else{
			%>
				<div class="right">
					<a class="relogin" href="add_news.jsp">重新添加></a>
				</div>
			<%
				}	
			%>
		
	</div>

</body>
</html>