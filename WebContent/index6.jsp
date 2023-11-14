<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = " newsWebsite.jdbc.dao.UserDao" %>
<%@ page import = " newsWebsite.jdbc.model.User" %>
<%@ page import = " newsWebsite.jdbc.model.News" %>
<%@ page import = " org.apache.commons.dbutils.QueryRunner" %>
<%@ page import = " org.apache.commons.dbutils.handlers.BeanListHandler" %>
<%@ page import = " newsWebsite.jdbc.utils.JDBCUtils" %>
<%@ page import = " java.util.List" %>
<%@ page import = " newsWebsite.jdbc.dao.NewsDao" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>军事新闻-旧浪资讯</title>
    <link rel="stylesheet" type="text/css" href="css/reset.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <script type="text/javascript" src="js/main.js"></script>
    <script type="text/javascript" src="js/index.js"></script>
    <style type="text/css">
    .clickTimes{
	font-size:13px;
	float:right;
	color:#B22222;
	}
	.rank_title h3{
    line-height:53px;
    font-size:14px;
    color:#000;
    text-indent:52px;
    background:url(images/hit_icon.png) 20px center no-repeat;
    }
	</style>
</head>
<body>
    <div class="header_con">
        <div class="header">
            <a href="#" class="logo fl"><img src="images/logo.png" alt="logo"></a>
            <ul class="menu fl">
                <li data-cid="0"><a href="index.jsp">最新</a></li>
                <li data-cid="1"><a href="index2.jsp">国内</a></li>
                <li data-cid="2"><a href="index3.jsp">国际</a></li>
                <li data-cid="3"><a href="index4.jsp">军事</a></li>
                <li data-cid="4"><a href="index5.jsp">金融</a></li>
                <li class="active" data-cid="5"><a href="javascript:;">体育</a></li>
            </ul>
            
                
                 
        </div>
    </div>
    
    <%
    NewsDao newsDao = new NewsDao();
	List<News> list = newsDao.searchNewsBySectionTopTen(6);
	List<News> clickList = newsDao.searchNewsByClickTopSix();
	int[] newsId = new  int[10];
	String[] newsTitle = new String[10];
	String[] newsAuthor = new String[10];
	String[] newsDate = new String[10];
    String[] newsOverview = new String[10];
    
    int[] clickNewsId = new int[6];
    String[] clickNewsTitle = new String[6];
    int[] clickNewsClick = new int[6];
	int i = 0;
	for(News news : list){
		newsId[i] = news.getNews_id();  //System.out.println(newsId[i]);
		newsTitle[i] = news.getTitle(); //System.out.println(newsTitle[i]);
		newsAuthor[i] = news.getAuthor(); //System.out.println(newsAuthor[i]);
		newsDate[i] = news.getPublish_date(); //System.out.println(newsDate[i]);
		newsOverview[i] = news.getOver_view(); //System.out.println(newsOverview[i]);
		i++;
	}
	i = 0;
	for(News news : clickList){
		clickNewsId[i] = news.getNews_id(); //System.out.println(clickNewsId[i]);
		clickNewsTitle[i] = news.getTitle(); //System.out.println(clickNewsTitle[i]);
		clickNewsClick[i] = news.getClick();
		i++;
	}
    i = 0;
	pageContext.setAttribute("newsList", list);
	pageContext.setAttribute("newsId", newsId);
	pageContext.setAttribute("newsTitle", newsTitle);
	pageContext.setAttribute("newsAuthor", newsAuthor);
	pageContext.setAttribute("newsDate", newsDate);
	pageContext.setAttribute("newsOverview", newsOverview);
	
	pageContext.setAttribute("clickNewsId", clickNewsId);
	pageContext.setAttribute("clickNewsTitle", clickNewsTitle);
	pageContext.setAttribute("clickNewsClick", clickNewsClick);
    %>    
    
    <div class="conter_con">
        <ul class="list_con fl">
        
            <li id="news0">
                <a href="detail.jsp?num=${ newsId[0] }" class="news_pic fl"><img src="images/s601.jpeg"></a>
                <a href="detail.jsp?num=${ newsId[0] }" class="news_title fl">${ newsTitle[0] }</a>
                <a href="detail.jsp?num=${ newsId[0] }" class="news_detail fl">${ newsOverview[0] }</a>
                <div class="author_info fl">
                    <div class="source fl">
                        作者:${ newsAuthor[0] }
                    </div>
                    <div class="time fl">${ newsDate[0] }</div>
                </div>
            </li>
            
            <li id="news1">
                <a href="detail.jsp?num=${ newsId[1] }" class="news_pic fl"><img src="images/s602.jpeg"></a>
                <a href="detail.jsp?num=${ newsId[1] }" class="news_title fl">${ newsTitle[1] }</a>
                <a href="detail.jsp?num=${ newsId[1] }" class="news_detail fl">${ newsOverview[1] }</a>
                <div class="author_info fl">
                    <div class="source fl">
                        作者:${ newsAuthor[1] }
                    </div>
                    <div class="time fl">${ newsDate[1] }</div>
                </div>
            </li>
            
            <li id="news2">
                <a href="detail.jsp?num=${ newsId[2] }" class="news_pic fl"  ><img src="images/s603.jpeg"></a>
                <a href="detail.jsp?num=${ newsId[2] }" class="news_title fl"  >${ newsTitle[2] }</a>
                <a href="detail.jsp?num=${ newsId[2] }" class="news_detail fl"  >${ newsOverview[2] }</a>
                <div class="author_info fl">
                    <div class="source fl">
                        作者:${ newsAuthor[2] }
                    </div>
                    <div class="time fl">${ newsDate[2] }</div>
                </div>
            </li>
            
            <li id="news3">
                <a href="detail.jsp?num=${ newsId[3] }" class="news_pic fl"><img src="images/s604.jpeg"></a>
                <a href="detail.jsp?num=${ newsId[3] }" class="news_title fl">${ newsTitle[3] }</a>
                <a href="detail.jsp?num=${ newsId[3] }" class="news_detail fl">${ newsOverview[3] }</a>
                <div class="author_info fl">
                    <div class="source fl">
                        作者:${ newsAuthor[3] }
                    </div>
                    <div class="time fl">${ newsDate[3] }</div>
                </div>
            </li>
            
            <li id="news4">
                <a href="detail.jsp?num=${ newsId[4] }" class="news_pic fl"><img src="images/s605.jpeg"></a>
                <a href="detail.jsp?num=${ newsId[4] }" class="news_title fl">${ newsTitle[4] }</a>
                <a href="detail.jsp?num=${ newsId[4] }" class="news_detail fl">${ newsOverview[4] }</a>
                <div class="author_info fl">
                    <div class="source fl">
                        作者:${ newsAuthor[4] }
                    </div>
                    <div class="time fl">${ newsDate[4] }</div>
                </div>
            </li>
            
            <li id="news5">
                <a href="detail.jsp?num=${ newsId[5] }" class="news_pic fl"><img src="images/s606.jpeg"></a>
                <a href="detail.jsp?num=${ newsId[5] }" class="news_title fl">${ newsTitle[5] }</a>
                <a href="detail.jsp?num=${ newsId[5] }" class="news_detail fl">${ newsOverview[5] }</a>
                <div class="author_info fl">
                    <div class="source fl">
                        作者:${ newsAuthor[5] }
                    </div>
                    <div class="time fl">${ newsDate[5] }</div>
                </div>
            </li>
            
            <li id="news6">
                <a href="detail.jsp?num=${ newsId[6] }" class="news_pic fl"><img src="images/s607.jpeg"></a>
                <a href="detail.jsp?num=${ newsId[6] }" class="news_title fl">${ newsTitle[6] }</a>
                <a href="detail.jsp?num=${ newsId[6] }" class="news_detail fl">${ newsOverview[6] }</a>
                <div class="author_info fl">
                    <div class="source fl">
                        作者:${ newsAuthor[6] }
                    </div>
                    <div class="time fl">${ newsDate[6] }</div>
                </div>
            </li>
            
            <li id="news7">
                <a href="detail.jsp?num=${ newsId[7] }" class="news_pic fl"><img src="images/s608.jpg"></a>
                <a href="detail.jsp?num=${ newsId[7] }" class="news_title fl">${ newsTitle[7] }</a>
                <a href="detail.jsp?num=${ newsId[7] }" class="news_detail fl">${ newsOverview[7] }</a>
                <div class="author_info fl">
                    <div class="source fl">
                        作者:${ newsAuthor[7] }
                    </div>
                    <div class="time fl">${ newsDate[7] }</div>
                </div>
            </li>
            
            <li id="news8">
                <a href="detail.jsp?num=${ newsId[8] }" class="news_pic fl"><img src="images/s609.jpeg"></a>
                <a href="detail.jsp?num=${ newsId[8] }" class="news_title fl">${ newsTitle[8] }</a>
                <a href="detail.jsp?num=${ newsId[8] }" class="news_detail fl">${ newsOverview[8] }</a>
                <div class="author_info fl">
                    <div class="source fl">
                        作者:${ newsAuthor[8] }
                    </div>
                    <div class="time fl">${ newsDate[8] }</div>
                </div>
            </li>
            
            <li id="news9">
                <a href="detail.jsp?num=${ newsId[9] }" class="news_pic fl"><img src="images/s610.jpg"></a>
                <a href="detail.jsp?num=${ newsId[9] }" class="news_title fl">${ newsTitle[9] }</a>
                <a href="detail.jsp?num=${ newsId[9] }" class="news_detail fl">${ newsOverview[9] }</a>
                <div class="author_info fl">
                    <div class="source fl">
                        作者:${ newsAuthor[9] }
                    </div>
                    <div class="time fl">${ newsDate[9] }</div>
                </div>
            </li>
            
        </ul>
        
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
            <span>|</span>
            <a href="admin.jsp">进入后台</a>
        </div>
        <p class="copyright">
            CopyRight © 2022 XXXX信息技术有限公司 All Rights Reserved<br />
            电话：010-****888    京ICP备*******8号
        </p>
    </div>

</body>
</html>