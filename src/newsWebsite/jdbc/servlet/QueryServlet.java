package newsWebsite.jdbc.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import newsWebsite.jdbc.dao.NewsDao;
import newsWebsite.jdbc.model.News;

public class QueryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("news_id");
		int news_id = Integer.parseInt(id);
		NewsDao newsDao = new NewsDao();
		News news;
		try {
			news = newsDao.searchNewsById(news_id);
			//判断新闻是否查询成功
			if(news != null){//成功
				request.getSession().setAttribute("news", news);//将管理员对象放到session中
				request.getRequestDispatcher("dnews_id.jsp").forward(request, response);
			}else {//失败
				request.setAttribute("info"," 错误:没有此新闻！");
				request.getRequestDispatcher("message_search.jsp").forward(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
