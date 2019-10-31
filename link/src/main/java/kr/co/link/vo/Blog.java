package kr.co.link.vo;

import java.util.Date;
import java.util.List;

public class Blog {
	private Integer no;
	private String title;
	private String mainImg;
	private String theme;
	private String description;
	private Date createDate;
	private String userId;
	private Integer visits;
	private String backgroundColor;
	private String fontColor;
	private Double opacity;
	private String atagColor;
	private String hrColor;
	private String bodyColor;
	private String firstCol;
	private String secondCol;
	private String thirdCol;
	private Integer layout;
	private String pageNumColor;
	private String pageNumBackgroundColor;
	private String topic;
	private String pageNumBorderColor;
	
	
	public String getPageNumBorderColor() {
		return pageNumBorderColor;
	}
	public void setPageNumBorderColor(String pageNumBorderColor) {
		this.pageNumBorderColor = pageNumBorderColor;
	}
	public String getTopic() {
		return topic;
	}
	public void setTopic(String topic) {
		this.topic = topic;
	}
	public String getPageNumColor() {
		return pageNumColor;
	}
	public void setPageNumColor(String pageNumColor) {
		this.pageNumColor = pageNumColor;
	}
	public String getPageNumBackgroundColor() {
		return pageNumBackgroundColor;
	}
	public void setPageNumBackgroundColor(String pageNumBackgroundColor) {
		this.pageNumBackgroundColor = pageNumBackgroundColor;
	}
	public Integer getLayout() {
		return layout;
	}
	public void setLayout(Integer layout) {
		this.layout = layout;
	}
	public String getFirstCol() {
		return firstCol;
	}
	public void setFirstCol(String firstCol) {
		this.firstCol = firstCol;
	}
	public String getSecondCol() {
		return secondCol;
	}
	public void setSecondCol(String secondCol) {
		this.secondCol = secondCol;
	}
	public String getThirdCol() {
		return thirdCol;
	}
	public void setThirdCol(String thirdCol) {
		this.thirdCol = thirdCol;
	}
	public String getBodyColor() {
		return bodyColor;
	}
	public void setBodyColor(String bodyColor) {
		this.bodyColor = bodyColor;
	}
	public String getHrColor() {
		return hrColor;
	}
	public void setHrColor(String hrColor) {
		this.hrColor = hrColor;
	}
	public String getAtagColor() {
		return atagColor;
	}
	public void setAtagColor(String atagColor) {
		this.atagColor = atagColor;
	}
	public Double getOpacity() {
		return opacity;
	}
	public void setOpacity(Double opacity) {
		this.opacity = opacity;
	}
	public String getBackgroundColor() {
		return backgroundColor;
	}
	public void setBackgroundColor(String backgroundColor) {
		this.backgroundColor = backgroundColor;
	}
	public String getFontColor() {
		return fontColor;
	}
	public void setFontColor(String fontColor) {
		this.fontColor = fontColor;
	}
	public Integer getVisits() {
		return visits;
	}
	public void setVisits(Integer visits) {
		this.visits = visits;
	}
	private List<BlogCategory> categories;
	
	public List<BlogCategory> getCategories() {
		return categories;
	}
	public void setCategories(List<BlogCategory> categories) {
		this.categories = categories;
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
	public String getMainImg() {
		return mainImg;
	}
	public void setMainImg(String mainImg) {
		this.mainImg = mainImg;
	}
	public String getTheme() {
		return theme;
	}
	public void setTheme(String theme) {
		this.theme = theme;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	
}
