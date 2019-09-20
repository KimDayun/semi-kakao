package kr.co.kakao.admin.dao;

import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.kakao.util.IbatisUtils;
import kr.co.kakao.vo.Member;

public class Admin_MemberDao {
	
	SqlMapClient sqlMap = IbatisUtils.getSqlMap();

	// 모든 회원 조회하기
	public List<Member> getMemberAll() throws Exception{
		return (List<Member>)sqlMap.queryForList("getMemberAll");
	}
	
	// 회원번호로 회원 조회
	public Member getMemberByNo(int memNo) throws Exception{
		return (Member)sqlMap.queryForObject("getMemberByNo", memNo);
	}
	
	// 모든 회원수 조회
	public int getTotalMembers() throws Exception{
		return (Integer)sqlMap.queryForObject("getTotalMember");
	}
	
	// 페이징 된 회원 조회
	public List<Member> getMemberAllRange(Map<String, Integer> map) throws Exception{
		return (List<Member>)sqlMap.queryForList("getAllMembersRange", map);
	}
	
	// 멤버 업데이트
	public void updateMemberByNo(Member member) throws Exception{
		sqlMap.update("updateMemberByNo", member);
	}
}
