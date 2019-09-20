package kr.co.kakao.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.kakao.admin.dao.Admin_BannerDao;
import kr.co.kakao.admin.dao.Admin_ProductDao;
import kr.co.kakao.admin.dao.Admin_QnaDao;
import kr.co.kakao.admin.dao.Admin_QnaReplyDao;
import kr.co.kakao.util.CommonUtils;
import kr.co.kakao.vo.Criteria;
import kr.co.kakao.vo.Pagination;
import kr.co.kakao.vo.Qna;
import kr.co.kakao.vo.QnaReply;
import kr.co.jhta.mvc.annotation.Controller;
import kr.co.jhta.mvc.annotation.RequestMapping;
import kr.co.jhta.mvc.servlet.ModelAndView;


@Controller
public class Admin_QnaController {
	
	Admin_QnaReplyDao replyDao = new Admin_QnaReplyDao();
	Admin_QnaDao qnaDao = new Admin_QnaDao();
	
	// qna리스트 불러오기, 리스트, 페이징
	@RequestMapping("/admin/qna/list.kakao")
	public ModelAndView list(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/qna/admin-qna-list.jsp");
		
		int pno = CommonUtils.stringToNumber(req.getParameter("pno"), 1);
		int size = CommonUtils.stringToNumber(req.getParameter("size"), 10);
		String sort = req.getParameter("sort");
		String opt = req.getParameter("opt");
		String keyword = req.getParameter("keyword");
		
		Criteria criteria = new Criteria();
		criteria.setSize(size);
		if(sort != null && !sort.isEmpty()) {
			criteria.setSort(sort);
		} else {
			criteria.setSort("ALLNEW");
		}
		
		criteria.setBeginIndex((pno - 1)*size + 1);
		criteria.setEndIndex(pno*size);
		
		if (keyword != null && !keyword.isEmpty()) {
			criteria.setOption(opt);
			criteria.setKeyword(keyword);
		}
		int records = qnaDao.getCountQna(criteria);
		if(records == 0) {
			records = 1;
		}
		List<Qna> qnas = qnaDao.getAllQna(criteria);
		
		Pagination pagination = new Pagination(pno, size, records);
		
		mav.addAttribute("qnas", qnas);
		mav.addAttribute("pagination", pagination);
		
		return mav;
	}
	
	// 디테일 불러오기
	@RequestMapping("/admin/qna/detail.kakao")
	public ModelAndView datail(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/qna/admin-qna-detail.jsp");
		
		int QnaNo = Integer.parseInt(req.getParameter("no"));
		
		Qna qna = qnaDao.getQnaByNo(QnaNo);
		
		QnaReply reply = replyDao.getReplyByNo(QnaNo);
		
		mav.addAttribute("reply", reply);
		mav.addAttribute("qna", qna);

		return mav;
	}
	
	// 리플달기
	@RequestMapping("/admin/qna/addReply.kakao")
	public ModelAndView addReply(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView mav = new ModelAndView();
		
		int qnaNo = Integer.parseInt(req.getParameter("qnaNo"));
		int qnaPno = Integer.parseInt(req.getParameter("qnaPno"));

		String contents = req.getParameter("answer");
		
		if(contents!="") {
			QnaReply reply = new QnaReply();
			Qna qna = new Qna();
			qna.setNo(qnaNo);
			reply.setQna(qna);
			reply.setContents(contents);
			
			replyDao.addReply(reply);
			
			int yn = qnaDao.getCountQnaNReply(qnaNo);
			if(yn >= 1) {
				Qna upQna = qnaDao.getQnaByNo(qnaNo);
				upQna.setStatusYn("Y");
				qnaDao.updateQna(upQna);
			}
			
		}
		mav.setViewName("redirect:detail.kakao?pno="+qnaPno+"&no="+qnaNo);

		return mav;
	}

}
