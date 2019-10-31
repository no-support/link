package kr.co.link.vo;

import java.util.List;

public class BandNbbang {

	private Integer nbbNo;
	private Integer nbbItemNo;
	private Integer price;
	private Integer writeNo;
	private List<String> people;
	private String person;
	private Integer personCount;
	
	public Integer getNbbNo() {
		return nbbNo;
	}
	public void setNbbNo(Integer nbbNo) {
		this.nbbNo = nbbNo;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public Integer getWriteNo() {
		return writeNo;
	}
	public void setWriteNo(Integer writeNo) {
		this.writeNo = writeNo;
	}
	public List<String> getPeople() {
		return people;
	}
	public void setPeople(List<String> people) {
		this.people = people;
	}
	public String getPerson() {
		return person;
	}
	public void setPerson(String person) {
		this.person = person;
	}
	public Integer getPersonCount() {
		return personCount;
	}
	public void setPersonCount(Integer personCount) {
		this.personCount = personCount;
	}
	public Integer getNbbItemNo() {
		return nbbItemNo;
	}
	public void setNbbItemNo(Integer nbbItemNo) {
		this.nbbItemNo = nbbItemNo;
	}
	
	@Override
	public String toString() {
		return "BandNbbang [nbbNo=" + nbbNo + ", price=" + price + ", writeNo=" + writeNo + ", people=" + people
				+ ", person=" + person + ", psersonCount="+"]";
	}
	
	
}
