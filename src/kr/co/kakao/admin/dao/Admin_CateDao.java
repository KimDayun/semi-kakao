package kr.co.kakao.admin.dao;

import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.kakao.util.IbatisUtils;
import kr.co.kakao.vo.Category;

public class Admin_CateDao {

	private SqlMapClient sqlMap = IbatisUtils.getSqlMap();
		
	public List<Category> getAllCate() throws Exception {
		
		return sqlMap.queryForList("getAllCate");
		
	}
	
	// 대분류로 소분류 조회
	public List<Category> getCateByParentNo(int no) throws Exception {
		return (List<Category>) sqlMap.queryForList("getCateByParentNo", no);
	}
}
