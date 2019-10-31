package kr.co.link.vo;

public class JisikinTag {

	private Integer no;
	private String tagName;
	private Integer jisikinNo;
	private Integer countTag;
	
	public JisikinTag() {}

	
	
	public Integer getCountTag() {
		return countTag;
	}



	public void setCountTag(Integer countTag) {
		this.countTag = countTag;
	}



	public Integer getNo() {
		return no;
	}

	public void setNo(Integer no) {
		this.no = no;
	}

	
	
	public String getTagName() {
		return tagName;
	}

	public void setTagName(String tagName) {
		this.tagName = tagName;
	}

	public Integer getJisikinNo() {
		return jisikinNo;
	}

	public void setJisikinNo(Integer jisikinNo) {
		this.jisikinNo = jisikinNo;
	}
	
	
}
