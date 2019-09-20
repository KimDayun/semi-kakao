package kr.co.kakao.dao;


import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.kakao.util.IbatisUtils;
import kr.co.kakao.vo.Cart;
import kr.co.kakao.vo.Category;
import kr.co.kakao.vo.Criteria;
import kr.co.kakao.vo.Product;

public class CategoryDao {

	private SqlMapClient sqlmap = IbatisUtils.getSqlMap();

	/* 번호로 카테고리 조회 */
	public Category getCategoryByNo(int no) throws Exception {
		return (Category) sqlmap.queryForObject("getCategoryByNo", no);
	}
	
	@SuppressWarnings("unchecked")
	public List<Product> getProducts(Criteria c) throws Exception {
		return (List<Product>) sqlmap.queryForList("getProducts", c);
	}
	
	public int getProductCount(Criteria c) throws Exception {
		return (Integer) sqlmap.queryForObject("getProductCount", c);
	}
	
	@SuppressWarnings("unchecked")
	public List<Category> getCategories(Criteria c) throws Exception {
		return (List<Category>) sqlmap.queryForList("getCategories", c);
	}
	
	// 소분류의 번호로 부모카테고리 번호 조회
	public int getParentNoByNo(int no) throws Exception {
		return (Integer) sqlmap.queryForObject("getParentNoByNo", no);
	}
	
	// 장바구니에 담기
	public void addCart(Cart cart) throws Exception {
		sqlmap.insert("addCart", cart);
	}
	
	public int getCartCounts(Cart cart) throws Exception {
		return (Integer) sqlmap.queryForObject("getCartCounts", cart);
	}
	public void updateCartCount(Cart cart) throws Exception {
		sqlmap.update("updateCartCount", cart);
	}

}