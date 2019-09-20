package kr.co.kakao.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jhta.mvc.annotation.Controller;
import kr.co.jhta.mvc.annotation.RequestMapping;
import kr.co.jhta.mvc.servlet.ModelAndView;
import kr.co.kakao.admin.dao.Admin_NoticeDao;
import kr.co.kakao.vo.Notice;
import sun.invoke.empty.Empty;

@Controller
public class Admin_NoticeController {

	private Admin_NoticeDao noticeDao = new Admin_NoticeDao();
	
	/*
	// 공지사항 리스트 불러오기
	@RequestMapping("/admin/notice/list.kakao")
	public ModelAndView list(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/notice/admin-notice-list.jsp");
		
		List<Notice> notices = noticeDao.getNoticeAll();
		mav.addAttribute("notices", notices);
		
		int totalPaging = noticeDao.pagingtotal();
		
		
		return mav;
	}
	*/
	
	// 공지사항 추가하기
	@RequestMapping("/admin/notice/add.kakao")
	public ModelAndView add(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView mav = new ModelAndView();
		
		String title = req.getParameter("title");
		String contents = req.getParameter("contents");
		String category = req.getParameter("category");
		int pno = Integer.parseInt(req.getParameter("pno"));
		
		Notice notice = new Notice();
		notice.setTitle(title);
		notice.setContents(contents);
		notice.setCategory(category);
		
		noticeDao.addNotice(notice);
		
		mav.setViewName("redirect:list.kakao?pno="+pno);

		return mav;
	}
	
	//등록 페이지 열기
	@RequestMapping("/admin/notice/form.kakao")
	public ModelAndView form(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView mav = new ModelAndView();
		
		int pno = Integer.parseInt(req.getParameter("pno"));
		
		mav.setViewName("admin/notice/admin-notice-form.jsp");
		
		mav.addAttribute("pno", pno);
		return mav;
	}
	
	// 공지사항 번호로 삭제하기
	@RequestMapping("/admin/notice/delete.kakao")
	public ModelAndView delete(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView mav = new ModelAndView();
		
		int noticeNo = Integer.parseInt(req.getParameter("no"));
		noticeDao.deleteNoticeByNo(noticeNo);
		mav.setViewName("redirect:list.kakao");

		return mav;
	}
	
	// 리스트에서 체크박스 삭제
	@RequestMapping("/admin/notice/listDelete.kakao")
	public ModelAndView listDetail(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		String[] noticeNo = req.getParameterValues("noticeNo");
		int pno = Integer.parseInt(req.getParameter("pno"));
		if(noticeNo != null) {
			
			for(String no : noticeNo) {
				noticeDao.deleteNoticeByNo(Integer.parseInt(no));
			}
			
		}
		mav.setViewName("redirect:list.kakao?pno="+pno);
		
		return mav;
	}
	
	
	// 디테일 페이지 열기
	@RequestMapping("/admin/notice/detail.kakao")
	public ModelAndView detail(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/notice/admin-notice-detail.jsp");
		
		int noticeNo = Integer.parseInt(req.getParameter("no"));
		int pno = Integer.parseInt(req.getParameter("pno"));
		Notice notice = noticeDao.getNoticeByNo(noticeNo);
		
		mav.addAttribute("pno", pno);
		mav.addAttribute("notice", notice);

		return mav;
	}
	
	// 공지사항 업데이트
	@RequestMapping("/admin/notice/update.kakao")
	public ModelAndView update(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView mav = new ModelAndView();
		
		int pno = Integer.parseInt(req.getParameter("pno"));
		
		int noticeNo = Integer.parseInt(req.getParameter("no"));
		Notice notice = noticeDao.getNoticeByNo(noticeNo);
		System.out.println(noticeNo);
		
		String title = req.getParameter("title");
		String contents = req.getParameter("contents");
		String category = req.getParameter("category");
		
		notice.setTitle(title);
		notice.setCategory(category);
		notice.setContents(contents);
		
		noticeDao.updateNoticeByNo(notice);
		
		mav.setViewName("redirect:detail.kakao?pno="+pno+"&no="+noticeNo);

		return mav;
	}
	
	// 공지사항 폼 열기
	@RequestMapping("/admin/notice/updateForm.kakao")
	public ModelAndView updateForm(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/notice/admin-notice-update.jsp");
	
		int pno = Integer.parseInt(req.getParameter("pno"));
		int noticeNo = Integer.parseInt(req.getParameter("no"));
		Notice notice = noticeDao.getNoticeByNo(noticeNo);
		
		mav.addAttribute("pno", pno);
		mav.addAttribute("notice", notice);
        
		return mav;
	}
	
	// 페이징 처리 리스트 출력
	@RequestMapping("/admin/notice/list.kakao")
	public ModelAndView list(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/notice/admin-notice-list.jsp");
		
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
		List<Notice> notices = noticeDao.getListAllByRange(map);
		
		// 뽑아온 게시글을 보내준다.
		mav.addAttribute("notices", notices);
		
		// 총 게시글 수
		int totalCount = noticeDao.pagingtotal();
		// 총 페이지 수 결정
		int totalPage = (totalCount % 10 == 0 ? totalCount/10 : totalCount/10 + 1);
		
		mav.addAttribute("totalPage", totalPage);
		mav.addAttribute("pno", pno);
		mav.addAttribute("pageBegin", pageBegin);
		mav.addAttribute("pageEnd", pageEnd);

		return mav;
	}
	
	
}
