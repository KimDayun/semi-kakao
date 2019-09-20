package kr.co.kakao.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.jhta.mvc.annotation.Controller;
import kr.co.jhta.mvc.annotation.RequestMapping;
import kr.co.jhta.mvc.servlet.ModelAndView;
import kr.co.kakao.dao.CartDao;
import kr.co.kakao.dao.MainDao;
import kr.co.kakao.vo.Cart;
import kr.co.kakao.vo.CartInfo;
import kr.co.kakao.vo.Member;
import kr.co.kakao.vo.OrderInfo;

@Controller
public class CartController {
	

	CartDao cartDao = new CartDao();
	
	//장바구니 상품 조회
	@RequestMapping("/cart/cart.kakao")
	public ModelAndView cart(HttpServletRequest req, HttpServletResponse res) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("cart/cart.jsp");
		
		// 로그인한 사용자의 정보를 조회한다.
		HttpSession session = req.getSession();
		Member member = (Member)session.getAttribute("LOGINMEMBER");
		
		if (member == null) {
			mav.setViewName("redirect:/kakao/member/loginform.kakao?result=deny");
			return mav;
		}
		
		// 로그인한 사용자의 정보에서 사용자 번호를 조회한다.
		int memberNo = member.getNo();
		// DAO를 활용해서 사용자번호에 해당하는 장바구니 정보를 조회한다.
		List<CartInfo> carts = cartDao.getCartsByMemberNo(memberNo);
		// 조회된 장바구니 정보를 ModelAndView에 저장한다.
		mav.addAttribute("carts", carts);
		for(CartInfo cart:carts) {
			System.out.println(cart.getPrice());
			System.out.println(cart.getProductAmount());
		}
		
		return mav;
	}
	
	//장바구니 상품 삭제
	@RequestMapping("/cart/delete.kakao")
	public ModelAndView deletecart(HttpServletRequest req, HttpServletResponse res) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("cart/cart.jsp");
		
		// 로그인한 사용자의 정보를 조회한다.
		HttpSession session = req.getSession();
		Member member = (Member)session.getAttribute("LOGINMEMBER");
		
		if (member == null) {
			mav.setViewName("redirect:/kakao/member/loginform.kakao?result=fail");
			return mav;
			}
			
			
			String[] values= req.getParameterValues("pro-check");		  
			
			for(String value  : values) {
				int cartNo = Integer.parseInt(value);
				cartDao.deletecartproductByCartNo(cartNo);
			}
			
			mav.setViewName("redirect:cart.kakao");
			
			//장바구니에 담긴 상품개수 표시
			List<CartInfo> carts = cartDao.getCartsByMemberNo(member.getNo());
			session.setAttribute("countCarts", carts.size());
			
		
		
		
		
	
		
		return mav;
		
	}
}
