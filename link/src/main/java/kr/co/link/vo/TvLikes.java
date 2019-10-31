package kr.co.link.vo;

import java.util.Date;

public class TvLikes {

	private Integer no;
	private Tv tv;
	private Date createDate;
	private User user;
	public TvLikes() {
		super();
	}
	public Integer getNo() {
		return no;
	}
	public void setNo(Integer no) {
		this.no = no;
	}
	public Tv getTv() {
		return tv;
	}
	public void setTv(Tv tv) {
		this.tv = tv;
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
	
	
}
