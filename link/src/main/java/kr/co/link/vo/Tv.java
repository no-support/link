package kr.co.link.vo;

import java.util.Date;
import java.util.List;

public class Tv {
	private Integer no;
	private String title;
	private String contents;
	private Integer views;
	private String videoName;
	private Date createDate;
	private TvPlaylist tvPlaylist;
	private Integer playTime;
	private String thumbnail; 
	private int likes;
	private int comments;
	
	
	
	public int getComments() {
		return comments;
	}
	public void setComments(int comments) {
		this.comments = comments;
	}
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public Integer getPlayTime() {
		return playTime;
	}
	public void setPlayTime(Integer playTime) {
		this.playTime = playTime;
	}
	public Tv() {
		super();
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
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Integer getViews() {
		return views;
	}
	public void setViews(Integer views) {
		this.views = views;
	}
	public String getVideoName() {
		return videoName;
	}
	public void setVideoName(String videoName) {
		this.videoName = videoName;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public TvPlaylist getTvPlaylist() {
		return tvPlaylist;
	}
	public void setTvPlaylist(TvPlaylist tvPlaylist) {
		this.tvPlaylist = tvPlaylist;
	}
	
	
}
