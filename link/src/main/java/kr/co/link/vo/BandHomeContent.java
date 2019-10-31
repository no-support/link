package kr.co.link.vo;

import java.util.Date;

public class BandHomeContent {

	private Integer writeNo;
	private Integer ContentNo;
	private Integer bandNo;
	private String contents;
	private Date createDate;
	private String noticeYn;
	private String reservationYn;
	private String reservationTime;
	private String displaylYn;
	private User user;
	private String contentType;
	private Integer rowNum;
	
	public Integer getWriteNo() {
		return writeNo;
	}
	public void setWriteNo(Integer writeNo) {
		this.writeNo = writeNo;
	}
	public Integer getBandNo() {
		return bandNo;
	}
	public void setBandNo(Integer bandNo) {
		this.bandNo = bandNo;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getNoticeYn() {
		return noticeYn;
	}
	public void setNoticeYn(String noticeYn) {
		this.noticeYn = noticeYn;
	}
	public String getReservationYn() {
		return reservationYn;
	}
	public void setReservationYn(String reservationYn) {
		this.reservationYn = reservationYn;
	}
	public String getReservationTime() {
		return reservationTime;
	}
	public void setReservationTime(String reservationTime) {
		this.reservationTime = reservationTime;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getContentType() {
		return contentType;
	}
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
	public Integer getRowNum() {
		return rowNum;
	}
	public void setRowNum(Integer rowNum) {
		this.rowNum = rowNum;
	}
	public Integer getContentNo() {
		return ContentNo;
	}
	public void setContentNo(Integer contentNo) {
		this.ContentNo = contentNo;
	}
	public String getDisplaylYn() {
		return displaylYn;
	}
	public void setDisplaylYn(String displaylYn) {
		this.displaylYn = displaylYn;
	}
	
	
}
