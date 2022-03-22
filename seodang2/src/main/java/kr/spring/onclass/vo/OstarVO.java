package kr.spring.onclass.vo;

public class OstarVO {
	private int ostar_num;
	private int user_num;
	private int on_num;
	private String rating;
	private String text;
	
	
	public String getRating() {
		return rating;
	}
	public void setRating(String rating) {
		this.rating = rating;
	}
	public int getOstar_num() {
		return ostar_num;
	}
	public void setOstar_num(int ostar_num) {
		this.ostar_num = ostar_num;
	}
	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	public int getOn_num() {
		return on_num;
	}
	public void setOn_num(int on_num) {
		this.on_num = on_num;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	
	
}
