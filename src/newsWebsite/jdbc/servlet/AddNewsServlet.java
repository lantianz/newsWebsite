package newsWebsite.jdbc.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import newsWebsite.jdbc.dao.NewsDao;
import newsWebsite.jdbc.model.News;

public class AddNewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String n_id = request.getParameter("news_id");
		int news_id = Integer.parseInt(n_id);
		System.out.println(news_id);
		String title = request.getParameter("title");
		String over_view = request.getParameter("over_view");
		String date = request.getParameter("publish_date");
		String publish_date = date.substring(0, 10)+" "+date.substring(11)+":00";
		String author = request.getParameter("author");
		String s_id = request.getParameter("section_id");
		int section_id = Integer.parseInt(s_id);
		String content = request.getParameter("content");
		NewsDao newsDao = new NewsDao();
		News news = new News();
		news.setNews_id(news_id);
		news.setTitle(title);
		news.setOver_view(over_view);
		news.setPublish_date(publish_date);
		news.setAuthor(author);
		news.setSection_id(section_id);
		news.setContent(content);
		try {
			boolean bool = newsDao.addNews(news);
			//判断是否登录成功
			if(bool){//成功
				request.setAttribute("news",news);
				request.setAttribute("info"," 添加成功！");
				request.getRequestDispatcher("message_add.jsp").forward(request, response);
			}else {//失败
				request.setAttribute("info"," 错误:请重新添加！");
				request.getRequestDispatcher("message_add.jsp").forward(request, response);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
