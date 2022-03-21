package kr.spring.offclass.vo;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class OffclassVO {
	private int off_num;//클래스 번호
	private int category_num;
	private String off_name;//클래스 이름
	private String off_limit;//클래스 정원
	private String off_price;//클래스 가격
	private String off_content;//클래스 내용
	private MultipartFile off_upload;
	private String off_filename;//파일명
	private byte[] off_uploadfile;
	private int user_num;
	private Date reg_date;
	private Date modify_date;
	private String user_name;
	
	public int getOff_num() {
		return off_num;
	}
	public void setOff_num(int off_num) {
		this.off_num = off_num;
	}
	public int getCategory_num() {
		return category_num;
	}
	public void setCategory_num(int category_num) {
		this.category_num = category_num;
	}
	public String getOff_name() {
		return off_name;
	}
	public void setOff_name(String off_name) {
		this.off_name = off_name;
	}
	public String getOff_limit() {
		return off_limit;
	}
	public void setOff_limit(String off_limit) {
		this.off_limit = off_limit;
	}
	public String getOff_price() {
		return off_price;
	}
	public void setOff_price(String off_price) {
		this.off_price = off_price;
	}
	public String getOff_content() {
		return off_content;
	}
	public void setOff_content(String off_content) {
		this.off_content = off_content;
	}
	public MultipartFile getOff_upload() {
		return off_upload;
	}
	public void setOff_upload(MultipartFile off_upload) {
		this.off_upload = off_upload;
	}
	public String getOff_filename() {
		return off_filename;
	}
	public void setOff_filename(String off_filename) {
		this.off_filename = off_filename;
	}
	public byte[] getOff_uploadfile() {
		return off_uploadfile;
	}
	public void setOff_uploadfile(byte[] off_uploadfile) {
		this.off_uploadfile = off_uploadfile;
	}
	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public Date getModify_date() {
		return modify_date;
	}
	public void setModify_date(Date modify_date) {
		this.modify_date = modify_date;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	@Override
	public String toString() {
		return "OffClassVO [off_num=" + off_num + ", category_num=" + category_num + ", off_name=" + off_name
				+ ", off_limit=" + off_limit + ", off_price=" + off_price + ", off_content=" + off_content
				+ ", off_upload=" + off_upload + ", off_filename=" + off_filename + ", user_num=" + user_num
				+ ", reg_date=" + reg_date + ", modify_date=" + modify_date + ", user_name=" + user_name + "]";
	}
	
}
