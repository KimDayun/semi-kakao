package kr.co.kakao.dao;



import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;


import kr.co.kakao.util.IbatisUtils;
import kr.co.kakao.vo.Cart;
import kr.co.kakao.vo.Category;
import kr.co.kakao.vo.Likes;
import kr.co.kakao.vo.Product;

public class DetailDao {
	
	private SqlMapClient sqlMap = IbatisUtils.getSqlMap();
	
	// 상품 상세조회
	public Product getDetailProductsByNo(int no) throws Exception {
		return (Product) sqlMap.queryForObject("getDetailProductsByNo", no);
	}
	// 카테고리 이름 가져오기
	public Category getCateNameByNo(int no) throws Exception {
		return (Category) sqlMap.queryForObject("getCateNameByNo", no);
	}
	// 추천상품 가져오기
	@SuppressWarnings("unchecked")
	public List<Product> getProductsByCateNo(int detailNo) throws Exception {
		return (List<Product>) sqlMap.queryForList("getProductsByCateNo", detailNo);
	}
	// 카트에 담기
	public void insertProductByCart(Cart cart) throws Exception {
		sqlMap.insert("insertProductByCart", cart);
	}    
	
	// 찜하기
	public void insertProductByLike(Likes like) throws Exception {
		sqlMap.insert("insertProductByLike", like);
	}
	// 장바구니 아이콘 상태변경
	@SuppressWarnings("unchecked")
	public List<Cart> changeCartSts(Map<String, Integer> cartsts) throws Exception{
		return(List<Cart>) sqlMap.queryForList("changeCartSts", cartsts);
	}
	// 찜 아이콘 상태변경
	@SuppressWarnings("unchecked")
	public Likes changeLikeSts(Map<String, Integer> likests) throws Exception{
		return (Likes) sqlMap.queryForObject("changeLikeSts", likests);
	}
	// 찜하기 삭제
	public void deleteLike(Likes like) throws Exception{
		sqlMap.delete("deleteLike", like);
	}
	
}
