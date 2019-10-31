package kr.co.link.vo;

import java.util.List;

public class BandTodo {

	private Integer todoNo;
	private Integer todoItemNo;
	private Integer writeNo;
	private String title;
	private List<String> hangmoc;
	private String hangmocSmall;
	private String everybody;
	private String completYn;
	
	public Integer getTodoNo() {
		return todoNo;
	}
	public void setTodoNo(Integer todoNo) {
		this.todoNo = todoNo;
	}
	public Integer getTodoItemNo() {
		return todoItemNo;
	}
	public void setTodoItemNo(Integer todoItemNo) {
		this.todoItemNo = todoItemNo;
	}
	public Integer getWriteNo() {
		return writeNo;
	}
	public void setWriteNo(Integer writeNo) {
		this.writeNo = writeNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public String getEverybody() {
		return everybody;
	}
	public void setEverybody(String everybody) {
		this.everybody = everybody;
	}
	public String getCompletYn() {
		return completYn;
	}
	public void setCompletYn(String completYn) {
		this.completYn = completYn;
	}
	
	
}
