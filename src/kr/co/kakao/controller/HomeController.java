package kr.co.kakao.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.jhta.mvc.annotation.Controller;
import kr.co.jhta.mvc.annotation.RequestMapping;
import kr.co.jhta.mvc.servlet.ModelAndView;
import kr.co.jhta.mvc.view.JSONView;
import kr.co.kakao.dao.CategoryDao;
import kr.co.kakao.dao.MainDao;
import kr.co.kakao.vo.Banner;
import kr.co.kakao.vo.Cart;
import kr.co.kakao.vo.Criteria;
import kr.co.kakao.vo.Member;
import kr.co.kakao.vo.Product;

@Controller
public class HomeController {
	
	@RequestMapping("/main.kakao")
	public ModelAndView main(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("main.jsp");
		MainDao dao = new MainDao();
		CategoryDao categoryDao = new CategoryDao();
		
		HttpSession session = req.getSession();
		Member member = (Member) session.getAttribute("LOGINMEMBER");

		Criteria c = new Criteria();
		// 카트상품 개수
		if (member != null) {
			int countCarts = dao.countCartsByMemberNo(member.getNo());
			session.setAttribute("countCarts", countCarts);
			c.setMemberNo(member.getNo());
		} 
		
		// 배너
		List<Banner> banners = dao.getAllBanners();
		mav.addAttribute("banners", banners);
		
		// 신상품
		List<Product> newProducts = dao.getNewProducts(c);
		mav.addAttribute("newProducts", newProducts);
		
		// 라이언
		List<Product> ryanProducts = dao.getRyanProducts(c);
		mav.addAttribute("ryanProducts", ryanProducts);
		
		// 어피치
		List<Product> apeachProducts = dao.getApeachProducts(c);
		mav.addAttribute("apeachProducts", apeachProducts);
		
		// 인기상품
		List<Product> likeProducts = dao.getLikeProducts(c);
		mav.addAttribute("likeProducts", likeProducts);
		
		return mav;
		
	}
}
