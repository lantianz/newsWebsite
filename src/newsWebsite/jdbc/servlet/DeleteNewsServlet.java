package newsWebsite.jdbc.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import newsWebsite.jdbc.dao.NewsDao;

public class DeleteNewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("news_id");
		int news_id = Integer.parseInt(id);
		String b = request.getParameter("boo");
		NewsDao newsDao = new NewsDao();
		try {
			boolean bool = newsDao.deleteNewsById(news_id);
			if(bool){//成功
				HttpSession session = request.getSession();
				session.invalidate();
				request.setAttribute("info"," 删除成功！");
				request.setAttribute("info1",b);
				request.getRequestDispatcher("message_delete.jsp").forward(request, response);
			}else {//失败
				request.setAttribute("info"," 错误:删除失败！");
				request.setAttribute("info1",b);
				request.getRequestDispatcher("message_delete.jsp").forward(request, response);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
