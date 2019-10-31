package kr.co.link.form;

import java.util.Date;

public class AccountBookExpenseForm {

	private int termNos;
	private Date date;
	private String detail;
	private Integer cash;
	private Integer card;
	private Integer category;
	private String tag;
	
	public AccountBookExpenseForm() {}

	

	public int getTermNos() {
		return termNos;
	}
	public void setTermNos(int termNos) {
		this.termNos = termNos;
	}





	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public Integer getCash() {
		return cash;
	}

	public void setCash(Integer cash) {
		this.cash = cash;
	}

	public Integer getCard() {
		return card;
	}

	public void setCard(Integer card) {
		this.card = card;
	}

	public Integer getCategory() {
		return category;
	}

	public void setCategory(Integer category) {
		this.category = category;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}
	
}
