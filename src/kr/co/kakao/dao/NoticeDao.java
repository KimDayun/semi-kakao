package kr.co.kakao.dao;

import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.kakao.util.IbatisUtils;
import kr.co.kakao.vo.Criteria;
import kr.co.kakao.vo.Notice;

public class NoticeDao {

	SqlMapClient sqlMap = IbatisUtils.getSqlMap();

	public List<Notice> selectAllNoticeByRange(Map<String, Integer> map) throws Exception {
		return (List<Notice>) sqlMap.queryForList("selectAllNoticeByRange", map);
	}
	
	public List<Notice> selectAllFaqsByRange(Map<String, Integer> map) throws Exception {
		return (List<Notice>) sqlMap.queryForList("selectAllFaqsByRange", map);
	}
	
	public int getAllFaqs() throws Exception{
		return (int)sqlMap.queryForObject("getAllFaqs");
	}
	
	public int getAllNotices() throws Exception{
		return (int)sqlMap.queryForObject("getAllNotices");
	}
}
