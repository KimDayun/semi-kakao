package kr.co.kakao.admin.dao;

import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.kakao.util.IbatisUtils;
import kr.co.kakao.vo.AdminMain;

public class Admin_MainDao {

	SqlMapClient sqlMap = IbatisUtils.getSqlMap();
	
	public List<AdminMain> getOrderGrape()throws Exception{
		return (List<AdminMain>)sqlMap.queryForList("getOrderGrape");
	}
}
