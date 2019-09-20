package kr.co.kakao.dao;

import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.kakao.util.IbatisUtils;
import kr.co.kakao.vo.Member;
import kr.co.kakao.vo.PointHistory;

public class MemberDao {

	SqlMapClient sqlMap = IbatisUtils.getSqlMap();

	public void insertMember(Member member) throws Exception {
		sqlMap.insert("insertMember", member);
	}

	public Member getMemberById(String id) throws Exception {
		return (Member) sqlMap.queryForObject("getMemberById", id);
	}

	public void insertRegistPoint(PointHistory pointHistory) throws Exception {
		sqlMap.insert("insertRegistPoint", pointHistory);
	}

	public Member findMemberIdPwdByEmail(Map<String, String> map) throws Exception {
		return (Member) sqlMap.queryForObject("findMemberIdPwdByEmail", map);
	}
	
	public void updatePwd(Map<String, Object> pwdMap) throws Exception{
		sqlMap.update("updatePwd", pwdMap);
	}
	
}
