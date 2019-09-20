package kr.co.kakao.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ibatis.sqlmap.engine.mapping.sql.dynamic.elements.IsEmptyTagHandler;

import kr.co.jhta.mvc.annotation.Controller;
import kr.co.jhta.mvc.annotation.RequestMapping;
import kr.co.jhta.mvc.servlet.ModelAndView;
import kr.co.kakao.admin.dao.Admin_MemberDao;
import kr.co.kakao.admin.dao.Admin_OrderDao;
import kr.co.kakao.vo.Member;
import kr.co.kakao.vo.Notice;

@Controller
public class Admin_MemberController {

	private Admin_MemberDao memberDao = new Admin_MemberDao();
	
	// 멤버페이지 리스트
	@RequestMapping("/admin/member/list.kakao")
	public ModelAndView list(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/member/admin-member-list.jsp");
		
		// 페이지번호를 받아온다
		int pno = Integer.parseInt(req.getParameter("pno"));
				
		// 게시글을 10개씩 끊어줄 변수
		int begin = (pno - 1) * 10 + 1;
		int end = pno * 10;
				
		// 시작과 끝을 넣을 map 생산
		Map<String, Integer> map = new HashMap<String, Integer>();

		// 1의 단위 페이징 페이지수 시작
		int pageBigin = ((int)Math.ceil((double)pno/10));
		// 11 부터의 페이징 페이지수 시작
		int pageBegin = (pageBigin >= 2 ? pageBigin*10 - 9:pageBigin);
		//System.out.println(pageBegin);
		// 페이징 10개씩 끊을 끝 수
		int pageEnd = pageBigin * 10;
				
		// list에 페이지 시작과 끝을 넣어준다.
		map.put("begin", begin);
		map.put("end", end);

		// 10개씩 끊어서 게시글 가져온다
		List<Member> members = memberDao.getMemberAllRange(map);
				
		
		Admin_OrderDao orderDao = new Admin_OrderDao();
		Map<String, Integer>orderCount = new HashMap<String, Integer>();
		Map<String, Integer>totalPrice = new HashMap<String, Integer>();
		
		for(Member member : members) {
			int orderCounts = orderDao.countOrderByMemberNo(member.getNo());
			member.setOrderCount(orderCounts);
			Integer totalPrices = orderDao.totalOrderPriceByMemberNo(member.getNo());
			member.setTotalBuyPrice(totalPrices);
		}

		// 뽑아온 게시글을 보내준다.
		mav.addAttribute("members", members);
				
		// 총 게시글 수
		int totalCount = memberDao.getTotalMembers();
		// 총 페이지 수 결정
		int totalPage = (totalCount % 10 == 0 ? totalCount/10 : totalCount/10 + 1);
				
		mav.addAttribute("totalPrice", totalPrice);
		mav.addAttribute("orderCount", orderCount);
		mav.addAttribute("totalPage", totalPage);
		mav.addAttribute("pno", pno);
		mav.addAttribute("pageBegin", pageBegin);
		mav.addAttribute("pageEnd", pageEnd);

		return mav;
	}
	
	// 멤버페이지 디테일
	@RequestMapping("/admin/member/detail.kakao")
	public ModelAndView detail(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/member/admin-member-detail.jsp");
		int memNo = Integer.parseInt(req.getParameter("no"));
		int pno = Integer.parseInt(req.getParameter("pno"));
		Member member = memberDao.getMemberByNo(memNo);
		
		mav.addAttribute("member", member);
		mav.addAttribute("pno", pno);

		return mav;
	}
	
	// 멤버 디테일에서 사용여부 변경
	@RequestMapping("/admin/member/detailUpdate.kakao")
	public ModelAndView detailUpdate(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView mav = new ModelAndView();
		
		int pno = Integer.parseInt(req.getParameter("pno"));
		int no = Integer.parseInt(req.getParameter("no"));
		
		Member member = memberDao.getMemberByNo(no);
		if("Y".equals(member.getUsedYn())){
			member.setUsedYn("N");
		} else if ("N".equals(member.getUsedYn())) {
			member.setUsedYn("Y");
		} 
		
		memberDao.updateMemberByNo(member);
		
		mav.setViewName("redirect:detail.kakao?pno="+pno+"&no="+no);
		
		

		return mav;
	}
	
	// 수정폼 호출
	@RequestMapping("/admin/member/updateForm.kakao")
	public ModelAndView updateForm(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/member/admin-member-update.jsp");
		
		int pno = Integer.parseInt(req.getParameter("pno"));
		int no = Integer.parseInt(req.getParameter("no"));
		
		Member member = memberDao.getMemberByNo(no);
		
		mav.addAttribute("member", member);
		mav.addAttribute("pno", pno);
		return mav;
	}
	
	// 전체수정
	@RequestMapping("/admin/member/updateAll.kakao")
	public ModelAndView updateAll(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView mav = new ModelAndView();
		
		int pno = Integer.parseInt(req.getParameter("pno"));
		int no = Integer.parseInt(req.getParameter("no"));
		
		String phone = req.getParameter("userPhone");
		String email = req.getParameter("userEmail");
		String name = req.getParameter("userName");
		String address = req.getParameter("userAddress");
		int point = Integer.parseInt(req.getParameter("userPoint"));
		String birth = req.getParameter("userBirth");
		
		Member member = memberDao.getMemberByNo(no);
		member.setPhone(phone);
		member.setEmail(email);
		member.setName(name);
		member.setAddress(address);
		member.setPoint(point);
		member.setBirth(birth);
		
		memberDao.updateMemberByNo(member);
		
		mav.setViewName("redirect:detail.kakao?pno="+pno+"&no="+no);

		return mav;
	}
	
	// 리스트에서 선택 삭제
	@RequestMapping("/admin/member/listDelete.kakao")
	public ModelAndView listDelete(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		int pno = Integer.parseInt(req.getParameter("pno"));
		
		String[] memberNo = req.getParameterValues("memberNo");
		
		if(memberNo != null) {
			for(String no:memberNo) {
				Member member = memberDao.getMemberByNo(Integer.parseInt(no));
				if("Y".equals(member.getUsedYn())){
					member.setUsedYn("N");
				} else if ("N".equals(member.getUsedYn())) {
					member.setUsedYn("Y");
				} else {
					mav.setViewName("redirect:list.kakao?pno="+pno);
	
					return mav;
				}
				memberDao.updateMemberByNo(member);
			}
		} else {
			mav.setViewName("redirect:list.kakao?pno="+pno);
		}
		return mav;
	}
}
