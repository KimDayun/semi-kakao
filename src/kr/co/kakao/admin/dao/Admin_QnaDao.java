package kr.co.kakao.admin.dao;

import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.kakao.util.IbatisUtils;
import kr.co.kakao.vo.Criteria;
import kr.co.kakao.vo.Qna;

public class Admin_QnaDao {

	private SqlMapClient sqlMap = IbatisUtils.getSqlMap();
	
	// qna 리스트 뽑아오기 정렬, 검색, 페이징
	public List<Qna> getAllQna(Criteria c) throws Exception{
		return (List<Qna>)sqlMap.queryForList("getAllQna", c);
	}
	
	// 모든 qna뽑아오기
	public int getCountQna(Criteria c) throws Exception{
		return (Integer)sqlMap.queryForObject("countAllQna", c);
	}
	
	// 넘버로 qna뽑아오기
	public Qna getQnaByNo(int QnaNo) throws Exception{
		return (Qna)sqlMap.queryForObject("getQnaByNo", QnaNo);
	}
	
	// 넘버 업데이트
	public void updateQna(Qna qna) throws Exception{
		sqlMap.update("updateQna", qna);
	}
	
	// 리플, qna 조인해서 카운터 가져오기(리플달린게 있나 확인용)
	public int getCountQnaNReply(int qnaNo) throws Exception{
		return (Integer)sqlMap.queryForObject("getCountQnaNReply", qnaNo);
	}
	
	// 금일 생성된 qna보여주기 메인페이지 사용
	public List<Qna> getQnaByToday() throws Exception{
		return (List<Qna>)sqlMap.queryForList("getQnaByToday");
	}
}
