package kr.co.kakao.dao;

import java.util.List;
import com.ibatis.sqlmap.client.SqlMapClient;
import kr.co.kakao.util.IbatisUtils;
import kr.co.kakao.vo.Banner;
import kr.co.kakao.vo.Criteria;
import kr.co.kakao.vo.Product;
		
	public class MainDao {
		
	private SqlMapClient sqlMap = IbatisUtils.getSqlMap();
		
	@SuppressWarnings("unchecked")
	public List<Banner> getAllBanners() throws Exception{
		return (List<Banner>)sqlMap.queryForList("getAllBanners");
	}
	
	@SuppressWarnings("unchecked")
	public List<Product> getNewProducts(Criteria c) throws Exception{
		return (List<Product>) sqlMap.queryForList("getNewProducts", c);
	}
	
	@SuppressWarnings("unchecked")
	public List<Product> getRyanProducts(Criteria c) throws Exception{
		return (List<Product>) sqlMap.queryForList("getRyanProducts", c);
	}
	
	@SuppressWarnings("unchecked")
	public List<Product> getApeachProducts(Criteria c) throws Exception {
		return (List<Product>) sqlMap.queryForList("getApeachProducts", c);
	}
	
	@SuppressWarnings("unchecked")
	public List<Product> getLikeProducts(Criteria c) throws Exception {
		return (List<Product>) sqlMap.queryForList("getLikeProducts", c);
	}
	
	public int countCartsByMemberNo(int memberNo) throws Exception {
		return (Integer) sqlMap.queryForObject("countCartsByMemberNo", memberNo);
	}
	
	
}
