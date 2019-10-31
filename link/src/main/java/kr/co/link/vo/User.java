package kr.co.link.vo;

public class User {

	private String id;
	private String name;
	private String password;
	private String nickName;
	private String phone;
	private Integer point;
	private Integer mentalPoint;
	private String isHaveBlog;
	private String nameVisibility;
	private String gender;
	private String genderVisibility;
	private String img;
	
	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getNameVisibility() {
		return nameVisibility;
	}
	
	public void setNameVisibility(String nameVisibility) {
		this.nameVisibility = nameVisibility;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getGenderVisibility() {
		return genderVisibility;
	}

	public void setGenderVisibility(String genderVisibility) {
		this.genderVisibility = genderVisibility;
	}

	public String getIsHaveBlog() {
		return isHaveBlog;
	}

	public void setIsHaveBlog(String isHaveBlog) {
		this.isHaveBlog = isHaveBlog;
	}

	public User() {}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Integer getPoint() {
		return point;
	}

	public void setPoint(Integer point) {
		this.point = point;
	}

	public Integer getMentalPoint() {
		return mentalPoint;
	}

	public void setMentalPoint(Integer mentalPoint) {
		this.mentalPoint = mentalPoint;
	}

	
	
}
