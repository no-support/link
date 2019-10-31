package kr.co.link.vo;

public class TvPlaylist {

	private Integer no;
	private String title;
	private TvChannel tvChannel;
	
	public TvPlaylist() {
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

	public TvChannel getTvChannel() {
		return tvChannel;
	}

	public void setTvChannel(TvChannel tvChannel) {
		this.tvChannel = tvChannel;
	}
	
	
}
