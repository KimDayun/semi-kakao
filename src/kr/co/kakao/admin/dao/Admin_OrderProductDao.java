package kr.co.kakao.admin.dao;

import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.kakao.util.IbatisUtils;
import kr.co.kakao.vo.OrderProducts;

public class Admin_OrderProductDao {

	SqlMapClient sqlMap = IbatisUtils.getSqlMap();
	
//	주문번호에 해당하는 주문 물건 출력
	public List<OrderProducts> getOrderProductByOrderNo(int orderNo)throws Exception{
		return (List<OrderProducts>)sqlMap.queryForList("getOrderProductByOrderNo", orderNo);
	}
	
//	한달간 주문한 총 물건 개수 메인사용
	public int getOrderProductTotalAmount() throws Exception{
		return (int)sqlMap.queryForObject("getOrderProductTotalAmount");
	}
	
//	한달간 가장 많이 주문한 물건 이름
	public List<String> getProductNameByMonthOfBest() throws Exception{
		return (List<String>)sqlMap.queryForList("getProductNameByMonthOfBest");
	}
}
