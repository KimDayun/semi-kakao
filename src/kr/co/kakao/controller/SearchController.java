package kr.co.kakao.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.jhta.mvc.annotation.Controller;
import kr.co.jhta.mvc.annotation.RequestMapping;
import kr.co.jhta.mvc.servlet.ModelAndView;
import kr.co.kakao.dao.SearchDao;
import kr.co.kakao.vo.Category;
import kr.co.kakao.vo.Criteria;
import kr.co.kakao.vo.Member;
import kr.co.kakao.vo.Pagination;
import kr.co.kakao.vo.Product;

@Controller
public class SearchController {

	private SearchDao searchDao = new SearchDao();
	
	/* 검색 기능 */
	@RequestMapping("/product/search.kakao")
	public ModelAndView search(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("product/search.jsp");
		
		String keyword = req.getParameter("keyword");
		String sort = req.getParameter("sort");
		
		if (sort == null || sort.equals("")) {
			sort = "신상품순";
		}
		
		Criteria criteria = new Criteria();
		criteria.setKeyword(keyword);
		criteria.setSort(sort);
		
		HttpSession session = req.getSession();
		Member member = (Member) session.getAttribute("LOGINMEMBER");
		if (member != null) {
			criteria.setMemberNo(member.getNo());
		}
		
		
		
		int pno = 1;
		try {
			pno = Integer.parseInt(req.getParameter("pno"));
		} catch(Exception e) {
			
		}
		
		criteria.setBeginIndex((pno-1)*12 + 1);
		criteria.setEndIndex(pno*12);

		List<Product> products = searchDao.getProductsBySearch(criteria);
		int count = searchDao.getProductCountBySearch(criteria);
		mav.addAttribute("products", products);
		mav.addAttribute("cnt", count);
		
		Pagination pagination = new Pagination(pno, 12, count);
		mav.addAttribute("pagination", pagination);
		
		return mav;
	}
}
