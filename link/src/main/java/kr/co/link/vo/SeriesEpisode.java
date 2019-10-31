package kr.co.link.vo;

import java.util.Date;

public class SeriesEpisode {

	private Integer no;
	private SeriesVod vod;
	private String title;
	private Date date;
	private String summary;
	private String contents;
	private Date createDate;
	private Integer price;

	public SeriesEpisode() {
	}

	public Integer getNo() {
		return no;
	}

	public void setNo(Integer no) {
		this.no = no;
	}

	public SeriesVod getVod() {
		return vod;
	}

	public void setVod(SeriesVod vod) {
		this.vod = vod;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}
	
}
