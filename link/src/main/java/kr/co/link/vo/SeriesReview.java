package kr.co.link.vo;

import java.util.Date;

public class SeriesReview {

	private Integer no;
	private String contents;
	private Date createDate;
	private SeriesVod vod;
	private User user;

	public SeriesReview() {
	}

	public Integer getNo() {
		return no;
	}

	public void setNo(Integer no) {
		this.no = no;
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
	
	
}
