package kr.co.kakao.dao;

import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.kakao.util.IbatisUtils;
import kr.co.kakao.vo.QnaReply;
import kr.co.kakao.vo.CartInfo;
import kr.co.kakao.vo.Likes;
import kr.co.kakao.vo.Member;
import kr.co.kakao.vo.MyInfo;
import kr.co.kakao.vo.Order;
import kr.co.kakao.vo.OrderInfo;
import kr.co.kakao.vo.PointHistory;
import kr.co.kakao.vo.Qna;

public class MyPageDao {

	private SqlMapClient sqlMap = IbatisUtils.getSqlMap();

	//주문정보 : 배송 개수 조회
		@SuppressWarnings("unchecked")
		public int getDeliveryOrderCount(int memberno) throws Exception{
			return (Integer)sqlMap.queryForObject("getDeliveryOrderCount",memberno);
		}
	
	//주문정보 : 취소 개수 조회
		public int getCancelOrderCount(int memberno) throws Exception{
			return (Integer)sqlMap.queryForObject("getCancelOrderCount",memberno);
		}
	
	//주문정보 : 리스트 조회
		@SuppressWarnings("unchecked")
		public List<OrderInfo> getOrderInfoByOrderNo(int memberno) throws Exception{
			return (List<OrderInfo>)sqlMap.queryForList("getOrderInfoByOrderNo", memberno);
		}
		
	//주문정보: 상세 조회
	
	//주문 취소
		public void deleteorderproductByorderNo(int orderNo) throws Exception{
			sqlMap.delete("deleteorderproductByorderNo",orderNo );
		}
		
		public void deleteOrderByOrderNo(int orderNo) throws Exception{
			sqlMap.delete("deleteOrderByOrderNo", orderNo);
		}
		
		public void updateMemberPoint(Map<String, Integer> map) throws Exception{
			sqlMap.update("updateMemberPoint", map);
		}
		
		public List<PointHistory> selectPointHistoryByOrderNo(Map<String, Integer> map) throws Exception{
			return sqlMap.queryForList("selectPointHistoryByOrderNo", map);
		}
		
		public void deletePointHistoryByOrderNo(int orderNo) throws Exception{
			sqlMap.delete("deletePointHistoryByOrderNo", orderNo);
		}
	
	// 찜 정보 : 조회
		@SuppressWarnings("unchecked")
		public List<Likes> getLikeslistByMemberNo(int memberno) throws Exception{
			return (List<Likes>) sqlMap.queryForList("getLikeslistByMemberNo",memberno );
		}
		
	//찜 취소
		public void deleteLikesproductBylikesno(int likesNo) throws Exception{
			sqlMap.delete("deleteLikesproductBylikesno",likesNo );
		}
				
	// 포인트 정보 : 조회
		@SuppressWarnings("unchecked")
		public List<PointHistory> getMyPointInfoByMemberNo(int memberno) throws Exception{
			return (List<PointHistory>) sqlMap.queryForList("getMyPointInfoByMemberNo" ,memberno );
		}
		
	//개인정보 : 조회	(select my information)
		public MyInfo getMemberInfoByMemberNo(int memberno) throws Exception{
			return (MyInfo)sqlMap.queryForObject("getMemberInfoByMemberNo", memberno);
		}
	
	//개인정보 : 변경	(select my information)
	
	  public void updateMyInfo(MyInfo myinfo) throws Exception{
		  sqlMap.update("updateMyInfo", myinfo);
	  }
	 //개인정보 : 회원 탈퇴
	  public void memberout(int memNo) throws Exception{
		  sqlMap.update("memberout", memNo);
	  }
	  // 1대1 문의 : 문의 등록
	  public void insertQuestion(Qna question)throws Exception{
		  sqlMap.insert("addQuetion", question);
	  }
	  
	  // 1대1 문의 : 답변 등록
	  public void insertAnswer(QnaReply answer) throws Exception{
		  sqlMap.insert("insertAnswer" , answer);
	  }
	  
	  // 1대1 문의 : 질문 조회
	  @SuppressWarnings("unchecked")
	  public List<Qna> getQuestionInfoByMemberNo(int memberno) throws Exception{
		  return (List<Qna>)sqlMap.queryForList("getQuestionInfoByMemberNo",memberno );
	  }
	  
	  // 1대1 문의 : 답변 조회 
	  @SuppressWarnings("unchecked")
	  public List<QnaReply> getAnswerInfoByMemberNo(int memberno) throws Exception{
		  return (List<QnaReply>)sqlMap.queryForList("getAnswerInfoByMemberNo" ,memberno);
	  }
	  
	  // 1대1 문의 : 상세 조회 
	  public QnaReply getdetailInfoByPageNo(int pageNo) throws Exception{
		  return (QnaReply)sqlMap.queryForObject("getdetailInfoByPageNo",pageNo);
	  }
	 


}
