package kr.co.link.vo;

import java.util.Date;

public class BlogBoardComment {
	private Integer no;
	private String contents;
	private Integer likes;
	private Integer boardNo;
	private Date createDate;
	private Integer parentCommentNo;
	private String userId;
	
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
	public Integer getLikes() {
		return likes;
	}
	public void setLikes(Integer likes) {
		this.likes = likes;
	}
	public Integer getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(Integer boardNo) {
		this.boardNo = boardNo;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	public Integer getParentCommentNo() {
		return parentCommentNo;
	}
	public void setParentCommentNo(Integer parentCommentNo) {
		this.parentCommentNo = parentCommentNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	
	
}
