package newsWebsite.jdbc.model;

public class Comment {
	private int comment_id;
	private int news_id;
	private String content;
	private String user_name;
	private String comment_date;
	
	public int getComment_id() {
		return comment_id;
	}
	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}
	public int getNews_id() {
		return news_id;
	}
	public void setNews_id(int news_id) {
		this.news_id = news_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getComment_date() {
		return comment_date;
	}
	public void setComment_date(String comment_date) {
		this.comment_date = comment_date;
	}
	@Override
	public String toString() {
		return "Comment [comment_id=" + comment_id + ", news_id=" + news_id + ", content=" + content + ", user_name="
				+ user_name + ", comment_date=" + comment_date + "]";
	}
	
	
}
