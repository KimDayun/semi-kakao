package kr.co.kakao.dao;

import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.kakao.util.IbatisUtils;
import kr.co.kakao.vo.Criteria;
import kr.co.kakao.vo.Product;

public class SearchDao {
	private SqlMapClient sqlMap = IbatisUtils.getSqlMap();

	@SuppressWarnings("unchecked")
	public List<Product>getProductsBySearch(Criteria keyword) throws Exception{
		
		return (List<Product>) sqlMap.queryForList("getProductsBySearch", keyword);
	}
	
	public int getProductCountBySearch(Criteria keyword) throws Exception {
		return (Integer) sqlMap.queryForObject("getProductCountBySearch", keyword);
	}
}
