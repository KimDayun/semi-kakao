package kr.co.kakao.dao;

import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.kakao.util.IbatisUtils;
import kr.co.kakao.vo.Cart;
import kr.co.kakao.vo.Order;
import kr.co.kakao.vo.OrderProducts;
import kr.co.kakao.vo.PointHistory;
import kr.co.kakao.vo.Product;

public class OrderDao {

	SqlMapClient sqlMap = IbatisUtils.getSqlMap();

	public List<Integer> selectCartNoByMemberNo(int memberNo) throws Exception {
		return sqlMap.queryForList("selectCartNoByMemberNo", memberNo);
	}

	public void insertOrder(Order order) throws Exception {
		sqlMap.insert("insertOrder", order);
	}

	public void insertOrderProduct(OrderProducts orderProduct) throws Exception {
		sqlMap.insert("insertOrderProduct", orderProduct);
	}

	public List<Cart> selectCartsByMemberNo(int memberNo) throws Exception {
		return sqlMap.queryForList("selectCartsByMemberNo", memberNo);
	}

	public void updateAmountByProductNo(Cart cart) throws Exception {
		sqlMap.update("updateAmountByProductNo", cart);
	}

	public int getOrderSeq() throws Exception {
		return (Integer) sqlMap.queryForObject("getOrderSeq");
	}

	public void deleteCartByCartNo(int cartNo) throws Exception {
		sqlMap.delete("deleteCartByCartNo", cartNo);
	}

	public void insertPoint(PointHistory pointHistory) throws Exception {
		sqlMap.insert("insertPoint", pointHistory);
	}

	public void updatePoint(Map<String, Integer> maps) throws Exception {
		sqlMap.update("updatePoint", maps);
	}

	public void updateProductStock(Cart cart) throws Exception {
		sqlMap.update("updateProductStock", cart);
	}
	
	public Product selectProductByProductNo(int productNo) throws Exception{
		return (Product) sqlMap.queryForObject("selectProductByProductNo", productNo);
	}
}
