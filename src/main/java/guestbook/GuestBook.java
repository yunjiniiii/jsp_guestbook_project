package guestbook;

public class GuestBook {
	    //사용자가 입력한 정보, 데이터베이스에 접근하고자는 객체(컬럼)
		//관리하는 클래스 (Model 영역 : DO(VO, DTO))
		//멤버 변수 선언 -> 테이블의 컬럼 이름과 매핑
		
		private int gb_id; //자동 증가 ==> 폼태그를 통해서 입력 받지 않음
		private String gb_name;
		private String gb_title;
		private String gb_comment;
		private String gb_date;
		
		//getter/setter
		public int getGb_id() {
			return gb_id;
		}
		public void setGb_id(int gb_id) {
			this.gb_id = gb_id;
		}
		public String getGb_name() {
			return gb_name;
		}
		public void setGb_name(String gb_name) {
			this.gb_name = gb_name;
		}
		public String getGb_title() {
			return gb_title;
		}
		public void setGb_title(String gb_title) {
			this.gb_title = gb_title;
		}
		public String getGb_comment() {
			return gb_comment;
		}
		public void setGb_comment(String gb_comment) {
			this.gb_comment = gb_comment;
		}
		public String getGb_date() {
			return gb_date;
		}
		public void setGb_date(String gb_date) {
			this.gb_date = gb_date;
		}
	
		
		
}
