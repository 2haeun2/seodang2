package kr.spring.qna.vo;

import kr.spring.util.DurationFromNow;

public class Oqna_replyVO {		//전체게시판 댓글

	private int qnare_num;
	private int qna_num;
	private int user_num;
	private String content;
	private String re_date;
	private String re_mdate;
	
	
	//날짜처리 변경
	public void setRe_date(String re_date) {
		this.re_date = DurationFromNow.getTimeDiffLabel(re_date);
	}
	public void setRe_mdate(String re_mdate) {
		this.re_mdate = DurationFromNow.getTimeDiffLabel(re_mdate);
	}
	
	
	//toString재정의
	@Override
	public String toString() {
		return "Qna_replyVO [qnare_num=" + qnare_num + ", qna_num=" + qna_num + ", user_num=" + user_num + ", content="
				+ content + ", re_date=" + re_date + ", re_mdate=" + re_mdate + "]";
	}	
	
	
	
	public int getQnare_num() {
		return qnare_num;
	}
	public void setQnare_num(int qnare_num) {
		this.qnare_num = qnare_num;
	}
	public int getQna_num() {
		return qna_num;
	}
	public void setQna_num(int qna_num) {
		this.qna_num = qna_num;
	}
	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRe_date() {
		return re_date;
	}

	public String getRe_mdate() {
		return re_mdate;
	}

}
