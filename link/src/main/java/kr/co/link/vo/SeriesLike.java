package kr.co.link.vo;

import java.util.Date;

public class SeriesLike {

	private Integer no;
	private SeriesVod vod;
	private User user;
	private Date createDate;

	
	public SeriesLike() {
	}

	public Integer getNo() {
		return no;
	}

	public void setNo(Integer no) {
		this.no = no;
	}

	public SeriesVod getVod() {
		return vod;
	}

	public void setVod(SeriesVod vod) {
		this.vod = vod;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	
}
