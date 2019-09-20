package kr.co.kakao.admin.dao;

import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.kakao.util.IbatisUtils;
import kr.co.kakao.vo.Notice;

public class Admin_NoticeDao {

	private SqlMapClient sqlMap = IbatisUtils.getSqlMap();

	// 공지사항 추가
	public void addNotice(Notice notice) throws Exception {
		sqlMap.insert("addNotice", notice);
	}

	// 모든 공지사항 출력
	public List<Notice> getNoticeAll() throws Exception{
		return (List<Notice>)sqlMap.queryForList("getNoticeAll");
	}
	
	// 공지사항 번호로 하나 출력
	public Notice getNoticeByNo(int noticeNo) throws Exception{
		return (Notice)sqlMap.queryForObject("getNoticeByNo", noticeNo);
	}
	
	// 공지사항 번호로 삭제
	public void deleteNoticeByNo(int noticeNo) throws Exception{
		sqlMap.delete("deleteNoticeByNo", noticeNo);
	}
	
	// 공지사항 번호로 업데이트
	public void updateNoticeByNo(Notice notice) throws Exception{
		sqlMap.update("updateNoticeByNo", notice);
	}
	
	// 총 게시글 페이징처리
	public int pagingtotal() throws Exception{
		return (int)sqlMap.queryForObject("totalPaging");
	}
	
	// 범위내에 모든 공지사항 출력
	public List<Notice> getListAllByRange(Map<String, Integer> map) throws Exception{
		return (List<Notice>)sqlMap.queryForList("rangePaging",map);
	}
}
