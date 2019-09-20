package kr.co.kakao.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jhta.mvc.annotation.Controller;
import kr.co.jhta.mvc.annotation.RequestMapping;
import kr.co.jhta.mvc.servlet.ModelAndView;
import kr.co.kakao.dao.NoticeDao;
import kr.co.kakao.util.CommonUtils;
import kr.co.kakao.vo.Criteria;
import kr.co.kakao.vo.Notice;
import kr.co.kakao.vo.Pagination;

@Controller
public class NoticeController {

	NoticeDao noticeDao = new NoticeDao();

	@RequestMapping("/notice/notice.kakao")
	public ModelAndView notice(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("notice/notice.jsp");

		int pno = Integer.parseInt(req.getParameter("pno"));

		int begin = (pno - 1) * 10 + 1;
		int end = pno * 10;

		Map<String, Integer> map = new HashMap<String, Integer>();

		int pageBigin = ((int) Math.ceil((double) pno / 10));
		int pageBegin = (pageBigin >= 2 ? pageBigin * 10 - 9 : pageBigin);
		int pageEnd = pageBigin * 10;

		map.put("begin", begin);
		map.put("end", end);

		List<Notice> notices = noticeDao.selectAllNoticeByRange(map);

		mav.addAttribute("notices", notices);

		int totalCount = noticeDao.getAllNotices();
		int totalPage = (totalCount % 10 == 0 ? totalCount / 10 : totalCount / 10 + 1);

		mav.addAttribute("totalPage", totalPage);
		mav.addAttribute("pno", pno);
		mav.addAttribute("pageBegin", pageBegin);
		mav.addAttribute("pageEnd", pageEnd);

		return mav;
	}

	@RequestMapping("/notice/faq.kakao")
	public ModelAndView faq(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("notice/faq.jsp");

		int pno = Integer.parseInt(req.getParameter("pno"));
		
		int begin = (pno - 1) * 10 + 1;
		int end = pno * 10;

		Map<String, Integer> map = new HashMap<String, Integer>();

		int pageBigin = ((int) Math.ceil((double) pno / 10));
		int pageBegin = (pageBigin >= 2 ? pageBigin * 10 - 9 : pageBigin);
		int pageEnd = pageBigin * 10;

		map.put("begin", begin);
		map.put("end", end);

		List<Notice> faqs = noticeDao.selectAllFaqsByRange(map);

		mav.addAttribute("faqs", faqs);

		int totalCount = noticeDao.getAllFaqs();
		int totalPage = (totalCount % 10 == 0 ? totalCount / 10 : totalCount / 10 + 1);

		mav.addAttribute("totalPage", totalPage);
		mav.addAttribute("pno", pno);
		mav.addAttribute("pageBegin", pageBegin);
		mav.addAttribute("pageEnd", pageEnd);

		return mav;
	}
}
