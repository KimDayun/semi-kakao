package kr.co.kakao.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jhta.mvc.annotation.Controller;
import kr.co.jhta.mvc.annotation.RequestMapping;
import kr.co.jhta.mvc.servlet.ModelAndView;
import kr.co.jhta.mvc.view.JSONView;
import kr.co.kakao.admin.dao.Admin_MainDao;
import kr.co.kakao.admin.dao.Admin_OrderDao;
import kr.co.kakao.admin.dao.Admin_OrderProductDao;
import kr.co.kakao.admin.dao.Admin_QnaDao;
import kr.co.kakao.vo.AdminMain;
import kr.co.kakao.vo.Order;
import kr.co.kakao.vo.Qna;

@Controller
public class Admin_MainController {

	Admin_MainDao mainDao = new Admin_MainDao();
	Admin_OrderDao orderDao = new Admin_OrderDao();
	Admin_QnaDao qnaDao = new Admin_QnaDao();
	Admin_OrderProductDao orderProDao = new Admin_OrderProductDao();
	
	// 메인페이지 호출
	@RequestMapping("/admin/main.kakao")
	public ModelAndView main(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/admin-main.jsp");

		List<Order> order = orderDao.getOrderByToday();
		List<Qna> qnas = qnaDao.getQnaByToday();
		
		AdminMain mainInfo = orderDao.getOrderMainInfo();
		mainInfo.setTotalAmount(orderProDao.getOrderProductTotalAmount());
		
		List<String> orderName = orderProDao.getProductNameByMonthOfBest();
		
		mav.addAttribute("orders", order);
		mav.addAttribute("qnas", qnas);
		mav.addAttribute("mainInfo", mainInfo);
		mav.addAttribute("orderNames", orderName);
		
		return mav;
	}
	
	// 메인 주문 그래프 정보
	/*
	 * @RequestMapping("/admin/orderInfo.kakao") public ModelAndView
	 * orderInfo(HttpServletRequest req, HttpServletResponse res) throws Exception {
	 * 
	 * ModelAndView mav = new ModelAndView();
	 * 
	 * List<AdminMain> adminOrderInfo = mainDao.getOrderGrape();
	 * 
	 * mav.addAttribute("orderInfo", adminOrderInfo);
	 * 
	 * mav.setView(new JSONView());
	 * 
	 * return mav; }
	 */
	
	
}
