package kr.co.kakao.admin.dao;

import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.kakao.util.IbatisUtils;
import kr.co.kakao.vo.Store;

public class Admin_StoreDao {

	SqlMapClient sqlMap = IbatisUtils.getSqlMap();

	public List<Store> getAllStore() throws Exception {
		return sqlMap.queryForList("getAllStore");
	}

	public Store getStoreByNo(int no) throws Exception {
		return (Store) sqlMap.queryForObject("getStoreByNo", no);
	}

	public void updateStore(Store store) throws Exception {
		sqlMap.update("updateStore", store);
	}

	public int getStoreSeq() throws Exception {
		return (Integer) sqlMap.queryForObject("getStoreSeq");
	}
	
	public void insertStore(Store store) throws Exception{
		sqlMap.insert("insertStore", store);
	}
	
	public void deleteStoreByNo(int no) throws Exception{
		sqlMap.delete("deleteStoreByNo", no);
	}
}
