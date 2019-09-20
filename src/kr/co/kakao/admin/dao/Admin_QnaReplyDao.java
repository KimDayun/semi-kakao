package kr.co.kakao.admin.dao;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.kakao.util.IbatisUtils;
import kr.co.kakao.vo.QnaReply;

public class Admin_QnaReplyDao {

	SqlMapClient sqlMap = IbatisUtils.getSqlMap();
	
	public void addReply(QnaReply reply) throws Exception{
		sqlMap.insert("addReply", reply);
	}
	
	public QnaReply getReplyByNo(int qnaNo)throws Exception{
		return (QnaReply)sqlMap.queryForObject("getReplyByNo", qnaNo);
	}
}
