package kr.spring.onclass.vo;

public class OnlikeVO {
	private int onlike_num;
	private int user_num;
	private int on_num;
	private int olike; //찜 상태 , 0 안누름 1 누름
	private int onoff;
	
	/////찜하기 조인
	private String on_name;
	private int on_price;
	
	public String getOn_name() {
		return on_name;
	}
	public void setOn_name(String on_name) {
		this.on_name = on_name;
	}
	public int getOn_price() {
		return on_price;
	}
	public void setOn_price(int on_price) {
		this.on_price = on_price;
	}
	/////찜하기 조인
	
	public int getOnlike_num() {
		return onlike_num;
	}
	public int getOnoff() {
		return onoff;
	}
	public void setOnoff(int onoff) {
		this.onoff = onoff;
	}
	public void setOnlike_num(int onlike_num) {
		this.onlike_num = onlike_num;
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
	public int getOlike() {
		return olike;
	}
	public void setOlike(int olike) {
		this.olike = olike;
	}
	
	
}
