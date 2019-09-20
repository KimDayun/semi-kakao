package kr.co.kakao.vo;

public class CartInfo {

	private int cartNo;				//장바구니번호
	private int productAmount;		//상품수량
	private int memberNo; 			//회원번호
	private int productNo; 			//상품번호
	private String productName; 	//상품이름
	private int price;		 		//상품가격
	private String imgName;			//상품이미지
	private int totalPrice;			//상품 합계
	private int deliveryFee = 2000;		//배송비
	
	public int getCartNo() {
		return cartNo;
	}
	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}
	public int getProductAmount() {
		return productAmount;
	}
	public void setProductAmount(int productAmount) {
		this.productAmount = productAmount;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getImgName() {
		return imgName;
	}
	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	public int getTotalPrice() {
		int totalPrice = productAmount*price;
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getDeliveryFee() {
		return deliveryFee;
	}
	/*
	 * public void setDeliveryFee(int deliveryFee) { this.deliveryFee = deliveryFee;
	 * }
	 */
	

	
	
	
}
