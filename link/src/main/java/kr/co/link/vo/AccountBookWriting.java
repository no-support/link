package kr.co.link.vo;

import java.util.Date;

public class AccountBookWriting {

	private int no;
	private String title;
	private String writer;
	private String contents;
	private String publicYN;
	private Date createDate;
	private String userId;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getPublicYN() {
		return publicYN;
	}
	public void setPublicYN(String publicYN) {
		this.publicYN = publicYN;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	
}
