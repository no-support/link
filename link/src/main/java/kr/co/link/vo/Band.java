package kr.co.link.vo;

import java.util.Date;

public class Band {

	private Integer no;
	private String name;
	private String photo;
	private String bandTypeOption;
	private Date createDate;
	private Integer joinCount;
	private User user;
	
	public Integer getNo() {
		return no;
	}
	public void setNo(Integer no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	
	public String getBandTypeOption() {
		return bandTypeOption;
	}
	public void setBandTypeOption(String bandTypeOption) {
		this.bandTypeOption = bandTypeOption;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Integer getJoinCount() {
		return joinCount;
	}
	public void setJoinCount(Integer joinCount) {
		this.joinCount = joinCount;
	}
	
	

}
