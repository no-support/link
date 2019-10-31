package kr.co.link.form;

import org.springframework.web.multipart.MultipartFile;

public class BlogUpdateForm {
	private String title;
	private MultipartFile mainImg;
	private String description;
	private String nickName;
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
	public String getTopic() {
		return topic;
	}
	public void setTopic(String topic) {
		this.topic = topic;
	}
	
}
