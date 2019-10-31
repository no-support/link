package kr.co.link.vo;

import java.util.Date;

public class SeriesVod {

	private Integer no;
	private SeriesCategory category;
	private String img;
	private Integer runningTime;
	private Date airStartDate;
	private Date airFinishedDate;
	private String grade;
	private String actor;
	private String director;
	private String descriptrion;
	private String title;
	private Date createDate;
	private String isFinished;
	private Integer price;
	
	public SeriesVod() {
	}

	public Integer getNo() {
		return no;
	}

	public void setNo(Integer no) {
		this.no = no;
	}

	public SeriesCategory getCategory() {
		return category;
	}

	public void setCategory(SeriesCategory category) {
		this.category = category;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public Integer getRunningTime() {
		return runningTime;
	}

	public void setRunningTime(Integer runningTime) {
		this.runningTime = runningTime;
	}

	public Date getAirStartDate() {
		return airStartDate;
	}

	public void setAirStartDate(Date airStartDate) {
		this.airStartDate = airStartDate;
	}

	public Date getAirFinishedDate() {
		return airFinishedDate;
	}

	public void setAirFinishedDate(Date airFinishedDate) {
		this.airFinishedDate = airFinishedDate;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getActor() {
		return actor;
	}

	public void setActor(String actor) {
		this.actor = actor;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getDescriptrion() {
		return descriptrion;
	}

	public void setDescriptrion(String descriptrion) {
		this.descriptrion = descriptrion;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getIsFinished() {
		return isFinished;
	}

	public void setIsFinished(String isFinished) {
		this.isFinished = isFinished;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}
	
}
