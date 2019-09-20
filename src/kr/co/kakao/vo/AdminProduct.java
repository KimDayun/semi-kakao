package kr.co.kakao.vo;

import java.util.Date;

public class AdminProduct {
	
	private int no;
	private String name;
	private int price;
	private String info;
	private String imgName;
	private int stock;
	private String globalYn;
	private String soldoutYn;
	private Date createDate;
	private String character;
	private String sellYn;
	private int catNo;
	private String cateName;
	private String subCateName;
	
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
	public String getCateName() {
		return cateName;
	}
	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
	public String getSubCateName() {
		return subCateName;
	}
	public void setSubCateName(String subCateName) {
		this.subCateName = subCateName;
	}
	
	public int getCatNo() {
		return catNo;
	}
	public void setCatNo(int catNo) {
		this.catNo = catNo;
	}
	
}

