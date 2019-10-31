package kr.co.link.vo;

import java.util.Date;

public class TvHistory {

	private Integer no;
	private Tv tv;
	private Integer playtime;
	private User user;
	private Date createDate;
	
	
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public TvHistory() {
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
	public Integer getPlaytime() {
		return playtime;
	}
	public void setPlaytime(Integer playtime) {
		this.playtime = playtime;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	
}
