package kr.co.link.vo;

import java.util.Date;

public class BlogBoardLikes {
	private Integer no;
	private Integer boardNo;
	private Integer blogNo;
	private Date createDate;
	
	public Integer getNo() {
		return no;
	}
	public void setNo(Integer no) {
		this.no = no;
	}
	public Integer getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(Integer boardNo) {
		this.boardNo = boardNo;
	}
	public Integer getBlogNo() {
		return blogNo;
	}
	public void setBlogNo(Integer blogNo) {
		this.blogNo = blogNo;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	
}
