package kr.co.link.vo;

import java.util.Date;

public class SeriesOrder {

	private Integer no;
	private SeriesEpisode episode;
	private User user;
	private Date createDate;

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public SeriesOrder() {
	}

	public Integer getNo() {
		return no;
	}
	public void setNo(Integer no) {
		this.no = no;
	}
	public SeriesEpisode getEpisode() {
		return episode;
	}
	public void setEpisode(SeriesEpisode episode) {
		this.episode = episode;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	
}
