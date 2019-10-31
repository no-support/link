package kr.co.link.form;

import org.springframework.web.multipart.MultipartFile;

public class BlogForm {
	private String title;
	private MultipartFile mainImg;
	private String theme;
	private String description;
	private String nickName;
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
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public MultipartFile getMainImg() {
		return mainImg;
	}
	public void setMainImg(MultipartFile mainImg) {
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
	
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
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
	public Double getOpacity() {
		return opacity;
	}
	public void setOpacity(Double opacity) {
		this.opacity = opacity;
	}
	public String getAtagColor() {
		return atagColor;
	}
	public void setAtagColor(String atagColor) {
		this.atagColor = atagColor;
	}
	public String getHrColor() {
		return hrColor;
	}
	public void setHrColor(String hrColor) {
		this.hrColor = hrColor;
	}
	public String getBodyColor() {
		return bodyColor;
	}
	public void setBodyColor(String bodyColor) {
		this.bodyColor = bodyColor;
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
	public Integer getLayout() {
		return layout;
	}
	public void setLayout(Integer layout) {
		this.layout = layout;
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
	public String getTopic() {
		return topic;
	}
	public void setTopic(String topic) {
		this.topic = topic;
	}
	
	
}
