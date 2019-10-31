package kr.co.link.vo;

import java.util.Date;

public class BlogTheme {
	private Integer no;
	private String fileName;
	private Date createDate;
	private Integer themeOrder;
	
	public Integer getThemeOrder() {
		return themeOrder;
	}
	public void setThemeOrder(Integer themeOrder) {
		this.themeOrder = themeOrder;
	}
	public Integer getNo() {
		return no;
	}
	public void setNo(Integer no) {
		this.no = no;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	
}
