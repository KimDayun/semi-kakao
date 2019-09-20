package kr.co.kakao.controller;

import java.util.ArrayList;
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
import kr.co.kakao.dao.DetailDao;
import kr.co.kakao.dao.OrderDao;
import kr.co.kakao.vo.Cart;
import kr.co.kakao.vo.Member;
import kr.co.kakao.vo.Order;
import kr.co.kakao.vo.OrderProducts;
import kr.co.kakao.vo.PointHistory;
import kr.co.kakao.vo.Product;

@Controller
public class OrderController {

	OrderDao orderDao = new OrderDao();
	DetailDao detailDao = new DetailDao();

	@RequestMapping("/order/updateamount.kakao")
	public ModelAndView updateamount(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();

		String status = req.getParameter("status");
		int productNo = Integer.parseInt(req.getParameter("no"));
		int amount = Integer.parseInt(req.getParameter("amount"));

		HttpSession session = req.getSession();

		Product product = new Product();
		product.setNo(productNo);
		product = detailDao.getDetailProductsByNo(productNo);
		Member member = (Member) session.getAttribute("LOGINMEMBER");

		Cart cart = new Cart();
		cart.setProduct(product);
		cart.setMember(member);
		cart.setProductAmount(amount);

		orderDao.updateAmountByProductNo(cart);

		int sum = 0;

		if ("detail".equals(status)) {
			sum = cart.getProduct().getPrice() * cart.getProductAmount();

		} else {
			List<Cart> carts = orderDao.selectCartsByMemberNo(member.getNo());

			for (Cart c : carts) {
				int price = c.getProduct().getPrice() * c.getProductAmount();
				c.setPrice(price);

				sum += price;
			}
		}

		mav.addAttribute("sum", sum);
		mav.setView(new JSONView());

		return mav;
	}

	@RequestMapping("/order/complete.kakao")
	public ModelAndView complete(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("order/complete.jsp");

		return mav;
	}

	@RequestMapping("/order/order.kakao")
	public ModelAndView order(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();

		String point = req.getParameter("usepoint");
		String shipCountry = req.getParameter("shipping-country");
		String shipName = req.getParameter("shipping-name");
		String shipPhone = req.getParameter("shipping-phone");
		String shipPostalCode = req.getParameter("shipping-postal-code");
		String shipAddress = req.getParameter("shipping-address");
		String shipDetailAddress = req.getParameter("shipping-detail-address");

		HttpSession session = req.getSession();
		Member member = (Member) session.getAttribute("LOGINMEMBER");

		int usePoint = 0;
		Order order = new Order();

		if (point == null || point.trim().equals("")) {
			point = "0";
			usePoint = 0;
		} else {
			point = point.replaceAll(",", "");
			usePoint = Integer.parseInt(point);
		}

		int orderNo = orderDao.getOrderSeq();
		int sum = 0;

		if ("detail".equals(req.getParameter("status"))) {
			int productNo = Integer.parseInt(req.getParameter("pno"));
			int amount = Integer.parseInt(req.getParameter("pamount"));
			// int price = Integer.parseInt(req.getParameter("price"));

			Cart cart = new Cart();
			Product product = new Product();

			cart.setProductAmount(amount);
			cart.setMember(member);
			product = orderDao.selectProductByProductNo(productNo);

			sum = cart.getProductAmount() * product.getPrice();
			order.setNo(orderNo);
			order.setMember(member);
			order.setTotalPrice(sum);
			order.setUsePoint(usePoint);
			order.setFinalPrice(sum - usePoint);
			order.setNation(shipCountry);
			order.setName(shipName);
			order.setPhone(shipPhone);
			order.setPostalCode(shipPostalCode);
			order.setAddress(shipAddress);
			order.setDetailAddress(shipDetailAddress);

			orderDao.insertOrder(order);

			OrderProducts orderProduct = new OrderProducts();
			orderProduct.setProduct(product);
			orderProduct.setAmount(cart.getProductAmount());
			orderProduct.setOrder(order);

			orderDao.insertOrderProduct(orderProduct);
			orderDao.updateProductStock(cart);
		} else {
			List<Cart> carts = orderDao.selectCartsByMemberNo(member.getNo());

			for (Cart c : carts) {
				int price = c.getProduct().getPrice() * c.getProductAmount();
				c.setPrice(price);

				sum += price;

				orderDao.deleteCartByCartNo(c.getNo());
			}

			order.setNo(orderNo);
			order.setMember(member);
			order.setTotalPrice(sum);
			order.setUsePoint(usePoint);
			order.setFinalPrice(sum - usePoint);
			order.setNation(shipCountry);
			order.setName(shipName);
			order.setPhone(shipPhone);
			order.setPostalCode(shipPostalCode);
			order.setAddress(shipAddress);
			order.setDetailAddress(shipDetailAddress);

			orderDao.insertOrder(order);

			for (Cart cart : carts) {
				OrderProducts orderProduct = new OrderProducts();
				Product product = new Product();
				product.setNo(cart.getProduct().getNo());
				orderProduct.setProduct(product);
				orderProduct.setAmount(cart.getProductAmount());
				orderProduct.setOrder(order);

				orderDao.insertOrderProduct(orderProduct);
				orderDao.updateProductStock(cart);
			}
		}

		int changePoint = order.getFinalPrice() / 100;
		int memberPoint = 0;

		PointHistory pointHistory = new PointHistory();
		pointHistory.setOrder(order);
		pointHistory.setMember(member);

		Map<String, Integer> maps = new HashMap<String, Integer>();
		maps.put("memberNo", member.getNo());

		if (usePoint != 0) {
			changePoint = member.getPoint() + changePoint - usePoint;

			pointHistory.setChangePoint(-usePoint);
			orderDao.insertPoint(pointHistory);
			
			memberPoint = changePoint;
		} else {
			memberPoint = changePoint + member.getPoint();
		}
		pointHistory.setChangePoint(changePoint);
		orderDao.insertPoint(pointHistory);

		maps.put("changePoint", memberPoint);
		orderDao.updatePoint(maps);

		mav.setViewName("redirect:complete.kakao");

		return mav;
	}

	@RequestMapping("/order/orderlist.kakao")
	public ModelAndView orderlist(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();

		HttpSession session = req.getSession();
		Member member = (Member) session.getAttribute("LOGINMEMBER");

		if ("cart".equals(req.getParameter("status"))) {
			int sum = 0;

			List<Cart> carts = orderDao.selectCartsByMemberNo(member.getNo());

			for (Cart cart : carts) {
				int price = cart.getProduct().getPrice() * cart.getProductAmount();
				cart.setPrice(price);

				sum += price;
			}

			mav.addAttribute("sum", sum);
			mav.addAttribute("carts", carts);

		} else {
			int proNo = Integer.parseInt(req.getParameter("proNo"));
			int amount = Integer.parseInt(req.getParameter("amount"));
			int price = Integer.parseInt(req.getParameter("price"));
			int sum = 0;

			DetailDao detailDao = new DetailDao();

			Product productBaroGumae = detailDao.getDetailProductsByNo(proNo);

			List<Cart> carts = new ArrayList<Cart>();

			Cart cartBarogumae = new Cart();
			cartBarogumae.setProduct(productBaroGumae);
			cartBarogumae.setProductAmount(amount);
			cartBarogumae.setPrice(price);

			carts.add(cartBarogumae);

			for (Cart cart : carts) {
				price = cart.getPrice() * cart.getProductAmount();
				cart.setPrice(price);

				sum += price;
			}

			mav.addAttribute("sum", sum);
			mav.addAttribute("carts", carts);
		}

		mav.addAttribute("member", member);
		mav.setViewName("order/orderlist.jsp");

		return mav;
	}
}
