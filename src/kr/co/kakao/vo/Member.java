package kr.co.kakao.vo;

import java.util.Date;

public class Member {

	private int no;
	private String id;
	private String pwd;
	private String name;
	private String phone;
	private String email;
	private int point;
	private String postalCode;
	private String address;
	private String detailAddress;
	private String usedYn;
	private String birth;
	private Date createDate;
	private int totalBuyPrice;
	private int orderCount;
	private PointHistory pointHistory;
	
	public Member() {
		
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDetailAddress() {
		return detailAddress;
	}

	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}

	public String getUsedYn() {
		return usedYn;
	}

	public void setUsedYn(String usedYn) {
		this.usedYn = usedYn;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public int getTotalBuyPrice() {
		return totalBuyPrice;
	}

	public void setTotalBuyPrice(int totalBuyPrice) {
		this.totalBuyPrice = totalBuyPrice;
	}

	public int getOrderCount() {
		return orderCount;
	}

	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}

	public PointHistory getPointHistory() {
		return pointHistory;
	}

	public void setPointHistory(PointHistory pointHistory) {
		this.pointHistory = pointHistory;
	}
}
