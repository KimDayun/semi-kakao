package kr.co.kakao.vo;

import java.util.Date;

public class Product {

	private int no;
	private String name;
	private int price;
	private String info;
	private int cateNo;
	private String imgName;
	private int stock;
	private String globalYn;
	private String soldoutYn;
	private Date createDate;
	private String character;
	private String sellYn;
	private int cnt;

	public Product() {
		
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

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public int getCateNo() {
		return cateNo;
	}

	public void setCateNo(int cateNo) {
		this.cateNo = cateNo;
	}

	public String getImgName() {
		return imgName;
	}

	public void setImgName(String imgName) {
		this.imgName = imgName;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public String getGlobalYn() {
		return globalYn;
	}

	public void setGlobalYn(String globalYn) {
		this.globalYn = globalYn;
	}

	public String getSoldoutYn() {
		return soldoutYn;
	}

	public void setSoldoutYn(String soldoutYn) {
		this.soldoutYn = soldoutYn;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getCharacter() {
		return character;
	}

	public void setCharacter(String character) {
		this.character = character;
	}

	public String getSellYn() {
		return sellYn;
	}

	public void setSellYn(String sellYn) {
		this.sellYn = sellYn;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
}
