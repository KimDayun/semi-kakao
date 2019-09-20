package kr.co.kakao.dao;

import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.kakao.util.IbatisUtils;
import kr.co.kakao.vo.Cart;
import kr.co.kakao.vo.CartInfo;

public class CartDao {

	private SqlMapClient sqlMap = IbatisUtils.getSqlMap();
	
	@SuppressWarnings("unchecked")
	public List<CartInfo> getCartsByMemberNo(int memNo) throws Exception{
		return (List<CartInfo>) sqlMap.queryForList("getCartsByMemberNo", memNo);
	}
	
	public void deletecartproductByCartNo(int cartNo) throws Exception{
		sqlMap.delete("deletecartproductByCartNo",cartNo);
	}
	
	public void updateCartAmount(Cart cart) throws Exception {
		sqlMap.update("updateCartAmount", cart);
	}
}
