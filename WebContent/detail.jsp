<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = " newsWebsite.jdbc.utils.JDBCUtils" %>
<%@ page import = " java.util.List" %>
<%@ page import = " newsWebsite.jdbc.dao.NewsDao" %>
<%@ page import = " newsWebsite.jdbc.model.News" %>
<%@ page import = " org.apache.commons.dbutils.QueryRunner" %>
<!DOCTYPE html>
<html>
<%
NewsDao newsDao = new NewsDao();
String strNewsId = request.getParameter("num");
int newsId = Integer.parseInt(strNewsId);
News news = newsDao.searchNewsById(newsId);
if(news != null){
	newsDao.updateClick(newsId);
	String title = news.getTitle();
	String overview = news.getOver_view();
	String content = news.getContent();
	String publishDate = news.getPublish_date();
	String author = news.getAuthor();
	
	List<News> clickList = newsDao.searchNewsByClickTopSix();
	int[] clickNewsId = new int[6];
    String[] clickNewsTitle = new String[6];
    int[] clickNewsClick = new int[6];
	int i = 0;
	for(News clicknews : clickList){
		clickNewsId[i] = clicknews.getNews_id(); //System.out.println(clickNewsId[i]);
		clickNewsTitle[i] = clicknews.getTitle(); //System.out.println(clickNewsTitle[i]);
		clickNewsClick[i] = clicknews.getClick();
		i++;
	}
    i = 0;

	pageContext.setAttribute("title", title);
	pageContext.setAttribute("overview", overview);
	pageContext.setAttribute("content", content);
	pageContext.setAttribute("publishDate", publishDate);
	pageContext.setAttribute("author", author);
	
	pageContext.setAttribute("clickNewsId", clickNewsId);
	pageContext.setAttribute("clickNewsTitle", clickNewsTitle);
	pageContext.setAttribute("clickNewsClick", clickNewsClick);
}else{
	 response.sendRedirect("404.html");
}

%>
<head>
    <meta charset="UTF-8">
    <title>${ title }</title>
    <link rel="stylesheet" type="text/css" href="css/reset.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="js/detail.js"></script>
    <script type="text/javascript" src="js/main.js"></script>
    <style type="text/css">
    .rank_title h3{
    line-height:53px;
    font-size:14px;
    color:#000;
    text-indent:52px;
    background:url(images/hit_icon.png) 20px center no-repeat;
    }
    .clickTimes{
	font-size:13px;
	float:right;
	color:#B22222;
	}
    </style>
</head>
<body>
    <div class="header_con">
        <div class="header">
            <a href="index.jsp" class="logo fl"><img src="images/logo.png" alt="logo"></a>          
        </div>
    </div>
    
    <div class="conter_con">
        <div class="detail_con fl">
            <% 
            //out.println(request.getParameter("num")); 
            %>
            <h3>${ title }</h3>
            <div class="detail_about clearfix">
                <span class="time_souce fl">${ publishDate } &nbsp;&nbsp;作者: ${ author }</span>

            </div>

            <p class="summary">
                ${ overview }
            </p>

            <h4>正文</h4>

            <p>${ content }
            
            
                  
        



        
            
            
        </div>
        <div class="rank_con fr">
            <div class="rank_title">
                <h3>点击排行</h3>
            </div>
            <ul class="rank_list">
                <li><span class="first">1</span><a href="detail.jsp?num=${ clickNewsId[0] }">${ clickNewsTitle[0] }<p class="clickTimes">点击:&nbsp;${ clickNewsClick[0] }</p></a></li>
                <li><span class="second">2</span><a href="detail.jsp?num=${ clickNewsId[1] }">${ clickNewsTitle[1] }<p class="clickTimes">点击:&nbsp;${ clickNewsClick[1] }</p></a></li>
                <li><span class="third">3</span><a href="detail.jsp?num=${ clickNewsId[2] }">${ clickNewsTitle[2] }<p class="clickTimes">点击:&nbsp;${ clickNewsClick[2] }</p></a></li>
                <li><span>4</span><a href="detail.jsp?num=${ clickNewsId[3] }">${ clickNewsTitle[3] }<p class="clickTimes">点击:&nbsp;${ clickNewsClick[3] }</p></a></li>
                <li><span>5</span><a href="detail.jsp?num=${ clickNewsId[4] }">${ clickNewsTitle[4] }<p class="clickTimes">点击:&nbsp;${ clickNewsClick[4] }</p></a></li>
                <li><span>6</span><a href="detail.jsp?num=${ clickNewsId[5] }">${ clickNewsTitle[5] }<p class="clickTimes">点击:&nbsp;${ clickNewsClick[5] }</p></a></li>
            </ul>
        </div>
    </div>
    <div class="footer">        
        <div class="footer_links">
            <a href="">关于我们</a>
            <span>|</span>
            <a href="">联系我们</a>
            <span>|</span>
            <a href="">招聘人才</a>
            <span>|</span>
            <a href="">友情链接</a>
        </div>
        <p class="copyright">
            CopyRight © 2022 XXXX信息技术有限公司 All Rights Reserved<br />
电话：010-****888    京ICP备*******8号
        </p>
    </div>
    
    
</body>
</html>