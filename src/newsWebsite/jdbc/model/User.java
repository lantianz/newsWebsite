package newsWebsite.jdbc.model;

public class User {
		private String user_id;
		private String user_name;
		private String password;
		private String sex;
		private String birthdate;
		
		public String getUser_id() {
			return user_id;
		}
		public void setUser_id(String user_id) {
			this.user_id = user_id;
		}
		public String getUser_name() {
			return user_name;
		}
		public void setUser_name(String user_name) {
			this.user_name = user_name;
		}
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		public String getSex() {
			return sex;
		}
		public void setSex(String sex) {
			this.sex = sex;
		}
		public String getBirthdate() {
			return birthdate;
		}
		public void setBirthdate(String birthdate) {
			this.birthdate = birthdate;
		}
		@Override
		public String toString() {
			return "User [user_id=" + user_id + ", user_name=" + user_name + ", password=" + password + ", sex=" + sex
					+ ", birthdate=" + birthdate + "]";
		}
		
}
