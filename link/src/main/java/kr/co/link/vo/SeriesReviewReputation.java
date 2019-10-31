package kr.co.link.vo;

import java.util.Date;

public class SeriesReviewReputation {

	private Integer no;
	private SeriesReview review;
	private String like;
	private String dislike;
	private User user;
	private Date createDate;

	public SeriesReviewReputation() {
	}

	public Integer getNo() {
		return no;
	}

	public void setNo(Integer no) {
		this.no = no;
	}

	public SeriesReview getReview() {
		return review;
	}

	public void setReview(SeriesReview review) {
		this.review = review;
	}

	public String getLike() {
		return like;
	}

	public void setLike(String like) {
		this.like = like;
	}

	public String getDislike() {
		return dislike;
	}

	public void setDislike(String dislike) {
		this.dislike = dislike;
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
