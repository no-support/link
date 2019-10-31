package kr.co.link.vo;

import java.util.Date;
import java.util.List;

import kr.co.link.util.DateUtils;
import kr.co.link.util.DateUtilsJH;

public class BandJoin {

	private Integer writeNo;
	private Integer JoinNo;
	private Integer joinItemNo;
	private String title;
	private Date startDate;
	private List<String> hangmoc;
	private String hangmocSmall;
	private Integer pepleLimit;
	private String endTimeCheck;
	private Date endDate;
	private Integer endTime;
	private Integer joinCount;
	
	public Integer getWriteNo() {
		return writeNo;
	}
	public void setWriteNo(Integer writeNo) {
		this.writeNo = writeNo;
	}
	public Integer getJoinNo() {
		return JoinNo;
	}
	public void setJoinNo(Integer joinNo) {
		JoinNo = joinNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getStartDate() {
		return startDate;
	}
	public String getStartDateStr() {
		if (startDate == null) {
			return "";
		}
		return DateUtilsJH.dateToString(startDate);
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public List<String> getHangmoc() {
		return hangmoc;
	}
	public void setHangmoc(List<String> hangmoc) {
		this.hangmoc = hangmoc;
	}
	public String getHangmocSmall() {
		return hangmocSmall;
	}
	public void setHangmocSmall(String hangmocSmall) {
		this.hangmocSmall = hangmocSmall;
	}
	public Integer getPepleLimit() {
		return pepleLimit;
	}
	public void setPepleLimit(Integer pepleLimit) {
		this.pepleLimit = pepleLimit;
	}
	public String getEndTimeCheck() {
		return endTimeCheck;
	}
	public void setEndTimeCheck(String endTimeCheck) {
		this.endTimeCheck = endTimeCheck;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public Integer getEndTime() {
		return endTime;
	}
	public void setEndTime(Integer endTime) {
		this.endTime = endTime;
	}
	public Integer getJoinCount() {
		return joinCount;
	}
	public void setJoinCount(Integer joinCount) {
		this.joinCount = joinCount;
	}
	public Integer getJoinItemNo() {
		return joinItemNo;
	}
	public void setJoinItemNo(Integer joinItemNo) {
		this.joinItemNo = joinItemNo;
	}
	
	
}
