package kr.co.kakao.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import kr.co.jhta.mvc.annotation.Controller;
import kr.co.jhta.mvc.annotation.RequestMapping;
import kr.co.jhta.mvc.servlet.ModelAndView;
import kr.co.kakao.dao.CartDao;
import kr.co.kakao.dao.DetailDao;
import kr.co.kakao.util.Cookies;
import kr.co.kakao.vo.Cart;
import kr.co.kakao.vo.Category;
import kr.co.kakao.vo.Likes;
import kr.co.kakao.vo.Member;
import kr.co.kakao.vo.Product;
import sun.invoke.empty.Empty;
import sun.nio.cs.ext.ISCII91;

@Controller
public class DetailController {

	DetailDao detailDao = new DetailDao();
	
	@RequestMapping("/product/detail.kakao")
	public ModelAndView detail(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("product/pro_detail.jsp");
		
		int no = Integer.parseInt(req.getParameter("no"));
		String memsts = "N";
		Cookies cookies = new Cookies(req, res);
		cookies.addValue("recent", String.valueOf(no));
		cookies.sendCookie("recent");
		
		
		List<String> values = cookies.getValues("recent");
		List<Product> recentProducts = new ArrayList<Product>();
		for (String value : values) {
			Product product = detailDao.getDetailProductsByNo(Integer.parseInt(value));
			recentProducts.add(product);
		}
		mav.addAttribute("recentProducts", recentProducts);
		
		
		// 상품 상세조회
		Product products = detailDao.getDetailProductsByNo(no);
		mav.addAttribute("products", products);
		
		// 카테고리 이름 가져오기
		Category categories = detailDao.getCateNameByNo(no);
		mav.addAttribute("categories", categories);
		// 추천상품 가져오기
		List<Product> productsByCateNo = detailDao.getProductsByCateNo(no);
		mav.addAttribute("productsByCateNo", productsByCateNo);
		
		// 찜, 장바구니 상태값 변경
		HttpSession session = req.getSession();
		Member member = (Member)session.getAttribute("LOGINMEMBER");
		mav.addAttribute("member", member);
		
		if(member != null) {
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("productNo", no);
			map.put("memberNo", member.getNo());
			
			List<Cart> cartInfo = detailDao.changeCartSts(map);
			Likes likeInfo = detailDao.changeLikeSts(map);
			mav.addAttribute("cartInfo", cartInfo);
			mav.addAttribute("likeInfo", likeInfo);
			
			
			if(memsts.equals("N")) {
				memsts = "Y";
			}
			mav.addAttribute("memsts", memsts);
			
			String cartsts = "N";
			for(Cart cart:cartInfo) {
				if(cartsts != null && cart.getProduct().getNo() == no) {
					cartsts="Y";
				} else {
					cartsts="N";
				}
			}
			mav.addAttribute("cartsts", cartsts);
			
			String likests="N";
			if(likeInfo != null) {
				likests="Y";
			} else {
				likests="N";
			}
			mav.addAttribute("likests", likests);
		}
		return mav;
	}
	
	@RequestMapping("/product/insertlike.kakao")
	public ModelAndView insertlike(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		int proNo = Integer.parseInt(req.getParameter("no"));
		Product pro = new Product();
		pro.setNo(proNo);
		
		HttpSession session = req.getSession();
		Member member = (Member)session.getAttribute("LOGINMEMBER");
		
		Likes like = new Likes();
		like.setProduct(pro);
		like.setMember(member);
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("memberNo", member.getNo());
		map.put("productNo", proNo);
		
		Likes likes = detailDao.changeLikeSts(map);
		
		if(likes != null) {
			detailDao.deleteLike(like);
		} else {
			detailDao.insertProductByLike(like);
		}
		
		mav.setViewName("redirect:detail.kakao?no="+proNo);
		
		return mav;
	}
	
}
