package kr.co.kakao.dao;

import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.kakao.util.IbatisUtils;
import kr.co.kakao.vo.Store;

public class StoreDao {

	private SqlMapClient sqlmap = IbatisUtils.getSqlMap();
	
	public List<Store> selectAllStore() throws Exception{
		return sqlmap.queryForList("selectAllStore");
	}
	
	public List<Store> selectStoresByCity(String local) throws Exception{
		return sqlmap.queryForList("selectStoresByCity", local);
	}
}
