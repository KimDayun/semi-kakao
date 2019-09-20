package kr.co.kakao.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.jhta.mvc.annotation.Controller;
import kr.co.jhta.mvc.annotation.RequestMapping;
import kr.co.jhta.mvc.servlet.ModelAndView;
import kr.co.jhta.mvc.view.JSONView;
import kr.co.kakao.dao.CategoryDao;
import kr.co.kakao.dao.MainDao;
import kr.co.kakao.dao.MemberDao;
import kr.co.kakao.vo.Cart;
import kr.co.kakao.vo.Category;
import kr.co.kakao.vo.Criteria;
import kr.co.kakao.vo.Member;
import kr.co.kakao.vo.Pagination;
import kr.co.kakao.vo.Product;

@Controller
public class CategoryController {
	
	CategoryDao categoryDao = new CategoryDao();
	MemberDao mamberDao = new MemberDao();
	MainDao dao = new MainDao();
	
	@RequestMapping("/product/addcart.kakao")
	public ModelAndView addcart(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();

		int pno = Integer.parseInt(req.getParameter("pno"));
		int amount = 1;
		try {
			amount = Integer.parseInt(req.getParameter("amount"));
		} catch (Exception e) {}
		
		// 장바구니처리
		HttpSession session = req.getSession();
		Member member = (Member) session.getAttribute("LOGINMEMBER");
		
		if (member == null) { 
			mav.addAttribute("data", "loginfail");
		} else {
			Cart cart = new Cart();
			Product product = new Product();
			product.setNo(pno);
			
			cart.setProduct(product);
			cart.setMember(member);
			cart.setProductAmount(amount);
			
			int counts = categoryDao.getCartCounts(cart);
			if (counts == 0) {
				categoryDao.addCart(cart);
			} else {
				categoryDao.updateCartCount(cart);
			}
			
			mav.addAttribute("data", "success");
			
			// 카트상품 개수 갱신
			if (member != null) {
				int countCarts = dao.countCartsByMemberNo(member.getNo());
				session.setAttribute("countCarts", countCarts);
			} 
		}
		
		
		mav.setView(new JSONView());

		return mav;
	}
	
	@RequestMapping("/product/cate_list.kakao")
	public ModelAndView list(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("product/cate_list.jsp");
		
		// 카테고리배너이름
		int catno = Integer.parseInt(req.getParameter("catno"));
		Category category = categoryDao.getCategoryByNo(catno);
		mav.addAttribute("category", category);

		String type = req.getParameter("type");
		String global = req.getParameter("global");
		String character = req.getParameter("character");
		String sort = req.getParameter("sort");
		mav.addAttribute("type", type);
		mav.addAttribute("global", global);

		if (type == null) {
			type = "A";
		}
		
		if (character == null || character.equals("")) {
			character = "";
		}
		
		if (sort == null || sort.equals("")) {
			sort = "신상품순";
		}
		
		
		
		Criteria criteria = new Criteria();
		criteria.setCategoryNo(catno);
		criteria.setType(type);
		criteria.setGlobal(global);
		criteria.setCharacter(character);
		criteria.setSort(sort);
		
		HttpSession session = req.getSession();
		Member member = (Member) session.getAttribute("LOGINMEMBER");
		if (member != null) {
			criteria.setMemberNo(member.getNo());
		}
		
		
		int allCount = categoryDao.getProductCount(criteria);
		mav.addAttribute("cnt", allCount);
		
		int pno = 1;
		try {
			pno = Integer.parseInt(req.getParameter("pno"));
		} catch(Exception e) {
			
		}
		
		criteria.setBeginIndex((pno-1)*12 + 1);
		criteria.setEndIndex(pno*12);
		
		Pagination pagination = new Pagination(pno, 12, allCount);
		mav.addAttribute("pagination", pagination);
		
		List<Product> allProducts = categoryDao.getProducts(criteria);
		mav.addAttribute("allProducts", allProducts);
		if (!type.equals("A")) {
			List<Category> categories = categoryDao.getCategories(criteria);
			mav.addAttribute("Categories", categories);
			
		}

		// 카테고리탭전체
		int parentNo = categoryDao.getParentNoByNo(catno);
		mav.addAttribute("parentNo", parentNo);
		
		return mav;
	}
}
