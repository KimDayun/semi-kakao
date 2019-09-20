package kr.co.kakao.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.codec.digest.MessageDigestAlgorithms;

import kr.co.jhta.mvc.annotation.Controller;
import kr.co.jhta.mvc.annotation.RequestMapping;
import kr.co.jhta.mvc.servlet.ModelAndView;
import kr.co.kakao.admin.dao.Admin_MemberDao;
import kr.co.kakao.dao.CartDao;
import kr.co.kakao.dao.MemberDao;
import kr.co.kakao.dao.MyPageDao;
import kr.co.kakao.vo.Likes;
import kr.co.kakao.vo.Member;
import kr.co.kakao.vo.MyInfo;
import kr.co.kakao.vo.OrderInfo;
import kr.co.kakao.vo.PointHistory;
import kr.co.kakao.vo.Qna;
import kr.co.kakao.vo.QnaReply;

@Controller
public class MyPageController {

	CartDao cartDao = new CartDao();
	MyPageDao mypageDao = new MyPageDao();
	Admin_MemberDao adminMemberDao = new Admin_MemberDao(); // 멤버번호로 멤머정보찾는 메소드가 들어있는 Dao
	MemberDao memberDao = new MemberDao();

	// 주문 리스트
	@RequestMapping("/mypage/mypage.kakao")
	public ModelAndView member(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/orderlist.jsp");

		HttpSession session = req.getSession(); // 로그인한 사용자의 정보 조회
		Member member = (Member) session.getAttribute("LOGINMEMBER");

		if (member == null) // 만약 로그인할때 멤버가 널이면 로그인폼으로 가게함
		{
			mav.setViewName("redirect:/kakao/member/loginform.kakao");
			return mav;
		}

		int memNo = member.getNo();// 로그인한 사용자의 정보에서 사용자 번호를 조회한다.
		member = adminMemberDao.getMemberByNo(memNo); // 멤버번호로 멤버 정보 가져오기
		mav.addAttribute("member", member); // 조회된 주문 정보를 ModelAndView에 저장한다.

		int deliveryCount = mypageDao.getDeliveryOrderCount(memNo); // 멤버번호로 주문수량 정보 가져오기
		mav.addAttribute("deliveryCount", deliveryCount); // 조회된 주문 정보를 ModelAndView에 저장한다.

		int cancelCount = mypageDao.getCancelOrderCount(memNo); // 멤버번호로 취소수량 정보 가져오기
		mav.addAttribute("cancelCount", cancelCount); // 조회된 주문 정보를 ModelAndView에 저장한다.

		List<OrderInfo> orderProducts = mypageDao.getOrderInfoByOrderNo(memNo);// 멤버번호로 주문정보 가져오기
		mav.addAttribute("orderProducts", orderProducts);

		return mav;
	}

	// 주문 상품 삭제하기
	@RequestMapping("/mypage/delete.kakao")
	public ModelAndView deleteOrder(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/orderlist.jsp");

		HttpSession session = req.getSession(); // 로그인한 사용자의 정보 조회
		Member sessionMember = (Member) session.getAttribute("LOGINMEMBER");
		
		Member member = memberDao.getMemberById(sessionMember.getId());

		if (member == null) { // 만약 로그인할때 멤버가 널이면 로그인폼으로 가게함
			mav.setViewName("redirect:/kakao/member/loginform.kakao");
			return mav;
		}

		int orderNo = Integer.parseInt(req.getParameter("orderNo"));
		mypageDao.deleteorderproductByorderNo(orderNo);
		mypageDao.deleteOrderByOrderNo(orderNo);
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("memberNo", member.getNo());
		map.put("orderNo", orderNo);
		List<PointHistory> pointHistory = mypageDao.selectPointHistoryByOrderNo(map);
		
		for(PointHistory ph : pointHistory) {
			if(ph.getChangePoint() > 0) {
				Map<String, Integer> updatePoint = new HashMap<String, Integer>();
				updatePoint.put("point", member.getPoint() - ph.getChangePoint());
				System.out.println("+memberpoint : " + member.getPoint());
				System.out.println("+changepoint : " + ph.getChangePoint());
				System.out.println("+point : " + (member.getPoint() - ph.getChangePoint()));
				updatePoint.put("memberNo", member.getNo());
				mypageDao.updateMemberPoint(updatePoint);
				member.setPoint(member.getPoint() - ph.getChangePoint());
				
				mypageDao.deletePointHistoryByOrderNo(orderNo);
			} else {
				Map<String, Integer> updatePoint = new HashMap<String, Integer>();
				updatePoint.put("point", member.getPoint() + (int)Math.abs(ph.getChangePoint()));
				System.out.println("-memberpoint : " + member.getPoint());
				System.out.println("-changepoint : " + ph.getChangePoint());
				System.out.println("-point : " + (member.getPoint() + (int)Math.abs(ph.getChangePoint())));
				updatePoint.put("memberNo", member.getNo());
				mypageDao.updateMemberPoint(updatePoint);
				member.setPoint(member.getPoint() + (int)Math.abs(ph.getChangePoint()));
				
				mypageDao.deletePointHistoryByOrderNo(orderNo);
			}
			System.out.println("next");
		}

		mav.setViewName("redirect:/kakao/mypage/mypage.kakao");

		return mav;
	}

	// 찜하기
	@RequestMapping("/mypage/likes.kakao")
	public ModelAndView likes(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/likes.jsp");
		HttpSession session = req.getSession(); // 로그인한 사용자의 정보 조회
		Member member = (Member) session.getAttribute("LOGINMEMBER");

		if (member == null) // 만약 로그인할때 멤버가 널이면 로그인폼으로 가게함
		{
			mav.setViewName("redirect:/kakao/member/loginform.kakao");
			return mav;
		}

		int memNo = member.getNo();// 로그인한 사용자의 정보에서 사용자 번호를 조회한다.
		member = adminMemberDao.getMemberByNo(memNo); // 멤버번호로 멤버 정보 가져오기
		mav.addAttribute("member", member); // 조회된 주문 정보를 ModelAndView에 저장한다.

		int deliveryCount = mypageDao.getDeliveryOrderCount(memNo); // 멤버번호로 주문수량 정보 가져오기
		mav.addAttribute("deliveryCount", deliveryCount); // 조회된 주문 정보를 ModelAndView에 저장한다.

		int cancelCount = mypageDao.getCancelOrderCount(memNo); // 멤버번호로 취소수량 정보 가져오기
		mav.addAttribute("cancelCount", cancelCount); // 조회된 주문 정보를 ModelAndView에 저장한다.

		List<Likes> likes = mypageDao.getLikeslistByMemberNo(memNo);
		mav.addAttribute("likes", likes);

		return mav;
	}

	// 찜취소

	@RequestMapping("/mypage/deletelikes.kakao")
	public ModelAndView deletelikes(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/likes.jsp");

		HttpSession session = req.getSession(); // 로그인한 사용자의 정보 조회
		Member member = (Member) session.getAttribute("LOGINMEMBER");

		//
		if (member == null) // 만약 로그인할때 멤버가 널이면 로그인폼으로 가게함
		{
			mav.setViewName("redirect:/kakao/member/loginform.kakao");
			return mav;
		}
		System.out.println("시작");
		String[] values = req.getParameterValues("pro-check");
		for (String value : values) {
			int likesNo = Integer.parseInt(value);
			System.out.println(likesNo);
			mypageDao.deleteLikesproductBylikesno(likesNo);
		}

		mav.setViewName("redirect:likes.kakao");

		return mav;
	}

	// 포인트
	@RequestMapping("/mypage/point.kakao")
	public ModelAndView point(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/point.jsp");

		HttpSession session = req.getSession(); // 로그인한 사용자의 정보 조회
		Member member = (Member) session.getAttribute("LOGINMEMBER");

		if (member == null) // 만약 로그인할때 멤버가 널이면 로그인폼으로 가게함
		{
			mav.setViewName("redirect:/kakao/member/loginform.kakao");
			return mav;
		}

		int memNo = member.getNo();// 로그인한 사용자의 정보에서 사용자 번호를 조회한다.
		member = adminMemberDao.getMemberByNo(memNo); // 멤버번호로 멤버 정보 가져오기
		mav.addAttribute("member", member); // 조회된 주문 정보를 ModelAndView에 저장한다.

		int deliveryCount = mypageDao.getDeliveryOrderCount(memNo); // 멤버번호로 주문수량 정보 가져오기
		mav.addAttribute("deliveryCount", deliveryCount); // 조회된 주문 정보를 ModelAndView에 저장한다.

		int cancelCount = mypageDao.getCancelOrderCount(memNo); // 멤버번호로 취소수량 정보 가져오기
		mav.addAttribute("cancelCount", cancelCount); // 조회된 주문 정보를 ModelAndView에 저장한다.

		MyInfo memberinfo = mypageDao.getMemberInfoByMemberNo(memNo);
		mav.addAttribute("memberinfo", memberinfo);

		List<PointHistory> pointHistory = mypageDao.getMyPointInfoByMemberNo(memNo);
		mav.addAttribute("pointHistory", pointHistory);

		return mav;
	}

	// 개인정보
	@RequestMapping("/mypage/editmyinfo.kakao")
	public ModelAndView getmyinfo(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/editmyinfo.jsp");

		HttpSession session = req.getSession(); // 세션을 가져오기
		Member member = (Member) session.getAttribute("LOGINMEMBER"); // 로그인한 세션에서 LOGINMEMBER 호출해서 member객체 가져오기

		if (member == null) // 만약에 멤버가 널이면 로그인폼으로 가게해라.
		{
			mav.setViewName("redirect:/kakao/member/loginform.kakao");
			return mav;
		}

		int memNo = member.getNo();// 로그인한 멤버의 멤버번호를 가져와
		member = adminMemberDao.getMemberByNo(memNo); // 멤버번호로 멤버 정보 가져오기
		mav.addAttribute("member", member); // 조회된 주문 정보를 ModelAndView에 저장한다.

		int deliveryCount = mypageDao.getDeliveryOrderCount(memNo); // 멤버번호로 주문수량 정보 가져오기
		mav.addAttribute("deliveryCount", deliveryCount); // 조회된 주문 정보를 ModelAndView에 저장한다.

		int cancelCount = mypageDao.getCancelOrderCount(memNo); // 멤버번호로 취소수량 정보 가져오기
		mav.addAttribute("cancelCount", cancelCount); // 조회된 주문 정보를 ModelAndView에 저장한다.

		MyInfo memberinfo = mypageDao.getMemberInfoByMemberNo(memNo); // 멤버번호로 멤버 정보 가져오기
		mav.addAttribute("memberInfo", memberinfo);

		return mav;
	}

	// 개인정보 업데이트
	@RequestMapping("/mypage/update.kakao")
	public ModelAndView updatemyinfo(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/editmyinfo.jsp");

		HttpSession session = req.getSession(); // 세션을 가져오기
		Member member = (Member) session.getAttribute("LOGINMEMBER"); // 로그인한 세션에서 LOGINMEMBER 호출해서 member객체 가져오기

		if (member == null) {// 만약에 멤버가 널이면 로그인폼으로 가게해라.
			mav.setViewName("redirect:/kakao/member/loginform.kakao");
			return mav;
		}

		int memberno = member.getNo();// 로그인한 멤버의 멤버번호를 가져와
		MyInfo memberinfo = mypageDao.getMemberInfoByMemberNo(memberno); // 멤버번호로 멤버 정보 가져오기

		String phone = req.getParameter("phone");
		String pwd = req.getParameter("pwd");
		String birth = req.getParameter("birth");
		String email = req.getParameter("email");
		String address = req.getParameter("address");

		String digestPwd = new DigestUtils(MessageDigestAlgorithms.SHA_1).digestAsHex(pwd);

		memberinfo.setMemPhone(phone);
		memberinfo.setMemPwd(digestPwd);
		memberinfo.setMemBirth(birth);
		memberinfo.setMemEmail(email);
		memberinfo.setMemAddress(address);

		mypageDao.updateMyInfo(memberinfo);
		mav.addAttribute("memberinfo", memberinfo);

		mav.setViewName("redirect:/kakao/mypage/editmyinfo.kakao");
		return mav;
	}

	// 개인정보 : 회원 탈퇴
	@RequestMapping("/mypage/outmember.kakao")
	public ModelAndView memberout(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();

		HttpSession session = req.getSession(); // 세션을 가져오기
		Member member = (Member) session.getAttribute("LOGINMEMBER"); // 로그인한 세션에서 LOGINMEMBER 호출해서 member객체 가져오기

		if (member == null) {// 만약에 멤버가 널이면 로그인폼으로 가게해라.
			mav.setViewName("redirect:/kakao/member/loginform.kakao");
			return mav;
		}

		int memNo = member.getNo();
		mypageDao.memberout(memNo);

		session.invalidate();
		mav.setViewName("redirect:/kakao/main.kakao");

		return mav;
	}

	// QNA : 문의 목록
	@RequestMapping("/mypage/qna.kakao")
	public ModelAndView qna(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/qnalist.jsp");

		HttpSession session = req.getSession(); // 로그인한 사용자의 정보 조회
		Member member = (Member) session.getAttribute("LOGINMEMBER");

		if (member == null) {
			mav.setViewName("redirect:/kakao/member/loginform.kakao");
			return mav;
		}

		int memNo = member.getNo();// 로그인한 사용자의 정보에서 사용자 번호를 조회한다.
		member = adminMemberDao.getMemberByNo(memNo); // 멤버번호로 멤버 정보 가져오기
		mav.addAttribute("member", member); // 조회된 주문 정보를 ModelAndView에 저장한다.

		int deliveryCount = mypageDao.getDeliveryOrderCount(memNo); // 멤버번호로 주문수량 정보 가져오기
		mav.addAttribute("deliveryCount", deliveryCount); // 조회된 주문 정보를 ModelAndView에 저장한다.

		int cancelCount = mypageDao.getCancelOrderCount(memNo); // 멤버번호로 취소수량 정보 가져오기
		mav.addAttribute("cancelCount", cancelCount); // 조회된 주문 정보를 ModelAndView에 저장한다.

		List<Qna> qnalist = mypageDao.getQuestionInfoByMemberNo(memNo);
		mav.addAttribute("qnalist", qnalist);

		// db에서 조회하기

		return mav;
	}

	// QNA : 상세 조회
	@RequestMapping("/mypage/qnadetail.kakao")
	public ModelAndView qnadetail(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/qnadetail.jsp");

		HttpSession session = req.getSession(); // 로그인한 사용자의 정보 조회
		Member member = (Member) session.getAttribute("LOGINMEMBER");
		int memNo = member.getNo();// 로그인한 사용자의 정보에서 사용자 번호를 조회한다.
		member = adminMemberDao.getMemberByNo(memNo); // 멤버번호로 멤버 정보 가져오기
		mav.addAttribute("member", member); // 조회된 주문 정보를 ModelAndView에 저장한다.

		int deliveryCount = mypageDao.getDeliveryOrderCount(memNo); // 멤버번호로 주문수량 정보 가져오기
		mav.addAttribute("deliveryCount", deliveryCount); // 조회된 주문 정보를 ModelAndView에 저장한다.

		int cancelCount = mypageDao.getCancelOrderCount(memNo); // 멤버번호로 취소수량 정보 가져오기
		mav.addAttribute("cancelCount", cancelCount); // 조회된 주문 정보를 ModelAndView에 저장한다.

		int qno = Integer.parseInt(req.getParameter("qno"));
		QnaReply reply = mypageDao.getdetailInfoByPageNo(qno);
		mav.addAttribute("detail", reply);

		return mav;
	}

	// QNA : 문의 등록
	@RequestMapping("/mypage/question.kakao")
	public ModelAndView question(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/questionform.jsp");

		HttpSession session = req.getSession(); // 로그인한 사용자의 정보 조회
		Member member = (Member) session.getAttribute("LOGINMEMBER");

		if (member == null) // 만약 로그인할때 멤버가 널이면 로그인폼으로 가게함
		{
			mav.setViewName("redirect:/kakao/member/loginform.kakao");
			return mav;
		}

		return mav;
	}

	// qna 등록
	@RequestMapping("/mypage/addQna.kakao")
	public ModelAndView addQna(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:qna.kakao");

		HttpSession session = req.getSession(); // 로그인한 사용자의 정보 조회
		Member member = (Member) session.getAttribute("LOGINMEMBER");

		int memberno = member.getNo();// 로그인한 사용자의 정보에서 사용자 번호를 조회한다.
		mav.addAttribute("memberno", memberno);

		String category = req.getParameter("category");
		String title = req.getParameter("title");
		String contents = req.getParameter("contents");

		Qna qna = new Qna();
		qna.setCategory(category);
		qna.setTitle(title);
		qna.setContents(contents);
		qna.setMember(member);

		mypageDao.insertQuestion(qna);

		return mav;
	}

}
