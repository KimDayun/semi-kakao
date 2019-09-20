package kr.co.kakao.admin.dao;

import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.kakao.util.IbatisUtils;
import kr.co.kakao.vo.AdminMain;
import kr.co.kakao.vo.Criteria;
import kr.co.kakao.vo.Order;

public class Admin_OrderDao {

	private SqlMapClient sqlMap = IbatisUtils.getSqlMap();
	
//	멤버가 구매한 총 수량
	public int countOrderByMemberNo(int memNo) throws Exception{
		return (Integer)sqlMap.queryForObject("countOrderByMemberNo", memNo);
	}
	
//	멤버가 구매한 총 가격
	public int totalOrderPriceByMemberNo(int memNo) throws Exception{
		return (Integer)sqlMap.queryForObject("totalOrderPriceByMemberNo", memNo);
	}
	
//	전체 주문 리스트 출력
	public List<Order> getAllOrder(Criteria c)throws Exception{
		return (List<Order>)sqlMap.queryForList("getAllOrder", c);
	}
	
//  전체 주문 수량
	public int getCountOrder(Criteria c) throws Exception{
		return (Integer)sqlMap.queryForObject("getCountOrder", c);
	}
	
//	주문 상세 정보
	public Order getOrderByNo(int orderNo)throws Exception{
		return (Order)sqlMap.queryForObject("getOrderByNo", orderNo);
	}
	
//	주문 정보 변경
	public void updateOrderByNo(Order order)throws Exception{
		sqlMap.update("updateOrderByNo", order);
	}
	
//	금일 주문 보기
	public List<Order> getOrderByToday() throws Exception{
		return (List<Order>)sqlMap.queryForList("getOrderByToday");
	}
	
//	한달간 총 주문건수 주문금액 메인에 사용
	public AdminMain getOrderMainInfo() throws Exception{
		return (AdminMain)sqlMap.queryForObject("getOrderMainInfo");
	}
}
