package kr.co.link.vo;

import java.util.ArrayList;

public class BandVote {

	private Integer voteNo;
	private String title;
	private ArrayList<String> hangmoc;
	private String hangmocSamll;	// 리스트 하나씩 잘라사 쓸것
	private String everyOneAdd;
	private String MultipleYn;
	private String currentView;
	private String solt;
	private Integer writeNo;
	private Integer voteItemNo;
	private Integer count;
	
	public Integer getVoteNo() {
		return voteNo;
	}
	public void setVoteNo(Integer voteNo) {
		this.voteNo = voteNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public ArrayList<String> getHangmoc() {
		return hangmoc;
	}
	public void setHangmoc(ArrayList<String> hangmoc) {
		this.hangmoc = hangmoc;
	}
	public String getEveryOneAdd() {
		return everyOneAdd;
	}
	public void setEveryOneAdd(String everyOneAdd) {
		this.everyOneAdd = everyOneAdd;
	}
	public String getMultipleYn() {
		return MultipleYn;
	}
	public void setMultipleYn(String multipleYn) {
		MultipleYn = multipleYn;
	}
	public String getCurrentView() {
		return currentView;
	}
	public void setCurrentView(String currentView) {
		this.currentView = currentView;
	}
	public String getSolt() {
		return solt;
	}
	public void setSolt(String solt) {
		this.solt = solt;
	}
	public Integer getWriteNo() {
		return writeNo;
	}
	public void setWriteNo(Integer writeNo) {
		this.writeNo = writeNo;
	}
	public String getHangmocSamll() {
		return hangmocSamll;
	}
	public void setHangmocSamll(String hangmocSamll) {
		this.hangmocSamll = hangmocSamll;
	}
	public Integer getVoteItemNo() {
		return voteItemNo;
	}
	public void setVoteItemNo(Integer voteItemNo) {
		this.voteItemNo = voteItemNo;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	
	
}
