package kr.co.link.vo;

import java.util.List;

public class BlogCategory {
	private Integer no;
	private String title;
	private String showType;
	private String orders;
	private String visibility;
	private Integer subCategoryNo;
	private List<BlogBoard> boards;
	
	public List<BlogBoard> getBoards() {
		return boards;
	}
	public void setBoards(List<BlogBoard> boards) {
		this.boards = boards;
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
	public String getShowType() {
		return showType;
	}
	public void setShowType(String showType) {
		this.showType = showType;
	}
	public String getOrders() {
		return orders;
	}
	public void setOrders(String orders) {
		this.orders = orders;
	}
	public String getVisibility() {
		return visibility;
	}
	public void setVisibility(String visibility) {
		this.visibility = visibility;
	}
	public Integer getSubCategoryNo() {
		return subCategoryNo;
	}
	public void setSubCategoryNo(Integer subCategoryNo) {
		this.subCategoryNo = subCategoryNo;
	}
	
	
}
