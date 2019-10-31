package kr.co.link.vo;

import java.util.Date;

import kr.co.link.util.DateUtils;



public class AccountBookTerm {

	private Integer cash;
	private Integer card;
	private Integer no;
	private String detail;
	private Date date;
	private Integer remainAmount;
	private AccountBookCategory category;
	private String memo;
	private String id;
	private String gubun;
	private Date createDate;
	private AccountBookTag tag;
	private Integer totalAmount;
	private String userId;
	private String expense;
	private String income;
	private Integer budget1;
	private Integer expense1;
	private Integer budget2;
	private Integer expense2;
	
	public Integer getBudget1() {
		return budget1;
	}
	public void setBudget1(Integer budget1) {
		this.budget1 = budget1;
	}
	public Integer getExpense1() {
		return expense1;
	}
	public void setExpense1(Integer expense1) {
		this.expense1 = expense1;
	}
	public Integer getBudget2() {
		return budget2;
	}
	public void setBudget2(Integer budget2) {
		this.budget2 = budget2;
	}
	public Integer getExpense2() {
		return expense2;
	}
	public void setExpense2(Integer expense2) {
		this.expense2 = expense2;
	}
	public String getExpense() {
		return expense;
	}
	public void setExpense(String expense) {
		this.expense = expense;
	}
	public String getIncome() {
		return income;
	}
	public void setIncome(String income) {
		this.income = income;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Integer getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(Integer totalAmount) {
		this.totalAmount = totalAmount;
	}
	public AccountBookTag getTag() {
		return tag;
	}
	public void setTag(AccountBookTag tag) {
		this.tag = tag;
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
	public Integer getNo() {
		return no;
	}
	public void setNo(Integer no) {
		this.no = no;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getDateString() {
		return DateUtils.dateToString(date);
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Integer getRemainAmount() {
		return remainAmount;
	}
	public void setRemainAmount(Integer remainAmount) {
		this.remainAmount = remainAmount;
	}
	public AccountBookCategory getCategory() {
		return category;
	}
	public void setCategory(AccountBookCategory category) {
		this.category = category;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getGubun() {
		return gubun;
	}
	public void setGubun(String gubun) {
		this.gubun = gubun;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	
	
	
}
