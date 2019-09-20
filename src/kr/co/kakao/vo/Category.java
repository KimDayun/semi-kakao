	package kr.co.kakao.vo;

public class Category {

	private int no;
	private String name;
	private int parentNo;
	private String engName;
	
	public Category() {
		
	}
	
	public String getEngName() {
		return engName;
	}
	
	public void setEngName(String engName) {
		this.engName = engName;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getParentNo() {
		return parentNo;
	}

	public void setParentNo(int parentNo) {
		this.parentNo = parentNo;
	}
}
