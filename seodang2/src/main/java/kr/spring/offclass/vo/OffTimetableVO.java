package kr.spring.offclass.vo;

import java.sql.Date;

public class OffTimetableVO {
	private int titme_num;
	private int off_num;
	private Date time_date;
	private String time_start;
	private String time_end;
	
	public int getTitme_num() {
		return titme_num;
	}
	public void setTitme_num(int titme_num) {
		this.titme_num = titme_num;
	}
	public int getOff_num() {
		return off_num;
	}
	public void setOff_num(int off_num) {
		this.off_num = off_num;
	}
	public Date getTime_date() {
		return time_date;
	}
	public void setTime_date(Date time_date) {
		this.time_date = time_date;
	}
	public String getTime_start() {
		return time_start;
	}
	public void setTime_start(String time_start) {
		this.time_start = time_start;
	}
	public String getTime_end() {
		return time_end;
	}
	public void setTime_end(String time_end) {
		this.time_end = time_end;
	}
	@Override
	public String toString() {
		return "OffTimetableVO [titme_num=" + titme_num + ", off_num=" + off_num + ", time_date=" + time_date
				+ ", time_start=" + time_start + ", time_end=" + time_end + "]";
	}
	
}
