package kr.co.link.vo;

import java.util.Date;
import java.util.List;

public class BlogSubCategory {
	private Integer no;
	private String title;
	private String visibility;
	private Date createDate;
	private Integer blogNo;
	private List<BlogCategory> blogCategory;
	
	public List<BlogCategory> getBlogCategory() {
		return blogCategory;
	}
	public void setBlogCategory(List<BlogCategory> blogCategory) {
		this.blogCategory = blogCategory;
	}
	public Integer getNo() {
		return no;
	}
	public void setNo(Integer no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getVisibility() {
		return visibility;
	}
	public void setVisibility(String visibility) {
		this.visibility = visibility;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Integer getBlogNo() {
		return blogNo;
	}
	public void setBlogNo(Integer blogNo) {
		this.blogNo = blogNo;
	}
	
	
	
}
