package kr.co.link.vo;

import java.util.Date;

public class BlogNeighbor {
	private Integer no;
	private Integer blogNo;
	private String type;
	private String status;
	private String message;
	private Date createDate;
	
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Integer getNo() {
		return no;
	}
	public void setNo(Integer no) {
		this.no = no;
	}
	public Integer getBlogNo() {
		return blogNo;
	}
	public void setBlogNo(Integer blogNo) {
		this.blogNo = blogNo;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
}
