<%@page import="newsWebsite.jdbc.model.News"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/admint.css">
<title>Add News</title>
</head>
<body>
	<div class="layui-card-header">发布新闻</div>
	<form action="AddNewsServlet" method="post">
	<table class = "addnewstable" style="margin-left: 30px ;cellpadding:5; width:100%">
				<tbody><tr>
					<td>
						<label>新闻ID：</label>
					</td>
					<td>
						<input type="number" oninput="if(value.length>11)value=value.slice(0,11)" name="news_id" id="news_id" class="input-xxlarge" required="required">
					</td>
				</tr>
				<tr>
					<td>
						<label>新闻标题：</label>
					</td>
					<td>
						<input type="text" id="title" name="title" hiddenObject.value = "无">
					</td>
				</tr>
				<tr>
					<td>
						<label>新闻概述：</label>
					</td>
					<td>
						<input type="text" id="over_view" name="over_view" hiddenObject.value = "无">
					</td>
				</tr>
				<tr>
					<td>
						<label>新闻日期：</label>
					</td>
					<td>
						<input type="datetime-local" id="publish_date" name="publish_date" value="2000-01-01T00:00:00">
					</td>
				</tr>
				<tr>
					<td>
						<label>新闻作者：</label>
					</td>
					<td>
						<input type="text" id="author" name="author" hiddenObject.value="无">
					</td>
				</tr>
				<tr>
					<td>
						<label>新闻板块：</label>
					</td>
					<td>
						<select id="section_id" name="section_id">
							<option value="1">请选择新闻板块</option>
							
								<option value="2">国内新闻</option>
							
								<option value="3">国际新闻</option>
							
								<option value="4">军事新闻</option>
							
								<option value="5">金融新闻</option>
							
								<option value="6">体育新闻</option>
							
						</select>
					</td>
				</tr>
				
				<tr>
					<td valign="top">
						<label>新闻内容：</label>
					</td>
					<td>
						<textarea class="ckeditor" style = "height:150px;overflow:auto;" id="content" name="content" ></textarea>
					</td>
				</tr>
				<tr>
					<td>
						<input type="hidden" id="newsId" name="newsId" hiddenObject.value="无">&nbsp;
					</td>
					<td>
						<input type="submit" class="layui-btn2 layui-btn-sm layui-btn-normal" value="提交">&nbsp;&nbsp;
						<input type="button" class="layui-btn3 layui-btn-sm layui-btn-normal" value="返回" onclick="javascript:history.back()">&nbsp;&nbsp;<font id="error" color="red"></font>
					</td>
				</tr>
				
			</tbody></table>
	</form>	
</body>
</html>