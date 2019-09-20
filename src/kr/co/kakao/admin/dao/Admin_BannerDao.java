package kr.co.kakao.admin.dao;

import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.kakao.vo.Criteria;
import kr.co.kakao.vo.Product;
import kr.co.kakao.util.IbatisUtils;
import kr.co.kakao.vo.Banner;

public class Admin_BannerDao {

	private SqlMapClient sqlMap = IbatisUtils.getSqlMap();
	
	// 총 배너 갯수
	public int getCountAllBanner() throws Exception{
		return (Integer)sqlMap.queryForObject("getCountAllBanner");
	}
	
	// 페이징, 검색기능한 배너 기능
	public List<Banner> getAllBannerByRange(Criteria c) throws Exception{
		return (List<Banner>)sqlMap.queryForList("getAllBannerByRange", c);
	}
	
	// 번호로 배너 조회하기
	public Banner getBannerByNo(int bannerNo) throws Exception{
		return (Banner)sqlMap.queryForObject("getBannerByNo", bannerNo);
	}
	
	// 배너 추가하기
	public void addBanner(Banner banner) throws Exception{
		sqlMap.insert("addBanner", banner);
	}
	
	// 배너 업데이트
	public void updateBanner(Banner banner) throws Exception {
		sqlMap.update("updateBanner", banner);
	}
	
	// 배너 삭제
	public void deleteBanner(int bannerNo) throws Exception{
		sqlMap.delete("deleteBanner", bannerNo);
	}
	
	// 배너등록에 보일 상품
	public List<Product> getAllProduct() throws Exception{
		return (List<Product>)sqlMap.queryForList("getAllProduct");
	}
}
