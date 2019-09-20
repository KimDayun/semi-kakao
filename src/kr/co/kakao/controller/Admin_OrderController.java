package kr.co.kakao.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jhta.mvc.annotation.Controller;
import kr.co.jhta.mvc.annotation.RequestMapping;
import kr.co.jhta.mvc.servlet.ModelAndView;
import kr.co.jhta.mvc.view.JSONView;
import kr.co.kakao.admin.dao.Admin_OrderDao;
import kr.co.kakao.admin.dao.Admin_OrderProductDao;
import kr.co.kakao.dao.OrderDao;
import kr.co.kakao.util.CommonUtils;
import kr.co.kakao.vo.Criteria;
import kr.co.kakao.vo.Order;
import kr.co.kakao.vo.OrderProducts;
import kr.co.kakao.vo.Pagination;

@Controller
public class Admin_OrderController {

	Admin_OrderDao orderDao = new Admin_OrderDao();
	Admin_OrderProductDao orderProductDao = new Admin_OrderProductDao();
	
	// 주문 리스트 불러오기, 검색, 페이징, 정렬
	@RequestMapping("/admin/order/list.kakao")
	public ModelAndView list(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/order/admin-order-list.jsp");
		
		int pno = CommonUtils.stringToNumber(req.getParameter("pno"),1);
		int size = CommonUtils.stringToNumber(req.getParameter("size"), 10);
		String sort = req.getParameter("sort");
		String opt = req.getParameter("opt");
		String keyword = req.getParameter("keyword");
		
		Criteria criteria = new Criteria();
		criteria.setSize(size);
		if(sort != null && !sort.isEmpty()) {
			criteria.setSort(sort);
		}else {
			criteria.setSort("ALLNEW");
		}
		criteria.setBeginIndex((pno - 1)*size + 1);
		criteria.setEndIndex(pno * size);
		
		if(keyword != null && !keyword.isEmpty()) {
			criteria.setKeyword(keyword);
			criteria.setOption(opt);
		}
		List<Order> orders = orderDao.getAllOrder(criteria);
		int records = orderDao.getCountOrder(criteria);
		if(records == 0) {
			records = 1;
		}
		
		Pagination pagination = new Pagination(pno, size, records);
		
		mav.addAttribute("orders", orders);
		mav.addAttribute("pagination", pagination);

		return mav;
	}
	
//	주문관리 상세정보
	@RequestMapping("/admin/order/detail.kakao")
	public ModelAndView detail(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/order/admin-order-detail.jsp");
		
		int orderNo = Integer.parseInt(req.getParameter("no"));
		
		Order orderInfo = orderDao.getOrderByNo(orderNo);
		List<OrderProducts> orderProducts = orderProductDao.getOrderProductByOrderNo(orderNo);
		
		mav.addAttribute("orderInfo", orderInfo);
		mav.addAttribute("orderProducts", orderProducts);
		

		return mav;
	}
	
//	리스트 송장 입력하기
	@RequestMapping("/admin/order/listInvoiceNumAdd.kakao")
	public ModelAndView invoiceAdd(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView mav = new ModelAndView();
		String invoice = req.getParameter("invoice");
		int orderNo = Integer.parseInt(req.getParameter("no"));

		Order order = orderDao.getOrderByNo(orderNo);
		order.setInvoiceNumber(invoice);
		order.setStatus("배송중");
		
		orderDao.updateOrderByNo(order);
		Order order2 = orderDao.getOrderByNo(orderNo);
		
		mav.addAttribute("order2", order2);
		mav.setView(new JSONView());

		return mav;
	}
	
//	detail 송장 입력하기
	@RequestMapping("/admin/order/detailInvoiceNumAdd.kakao")
	public ModelAndView detailInvoiceAdd(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView mav = new ModelAndView();
		String invoice = req.getParameter("invoice");
		int orderNo = Integer.parseInt(req.getParameter("no"));
		int pno = Integer.parseInt(req.getParameter("pno"));

		Order order = orderDao.getOrderByNo(orderNo);
		order.setInvoiceNumber(invoice);
		order.setStatus("배송중");
		
		orderDao.updateOrderByNo(order);
		Order order2 = orderDao.getOrderByNo(orderNo);
		
		mav.addAttribute("order2", order2);
		mav.setViewName("redirect:detail.kakao?pno="+pno+"&no="+orderNo);

		return mav;
	}
	
	// 주문상태 변경
	@RequestMapping("/admin/order/orderStatusUpdate.kakao")
	public ModelAndView orderStatusUpdate(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView mav = new ModelAndView();
		
		int orderNo = Integer.parseInt(req.getParameter("no"));
		int pno = Integer.parseInt(req.getParameter("pno"));
		String alert = "N";
		
		Order order = orderDao.getOrderByNo(orderNo);
		if(order.getStatus().equals("입금확인")) {
			order.setStatus("배송준비중");
		} else if(order.getStatus().equals("배송중")) {
			order.setStatus("배송완료");
		} else if(order.getStatus().equals("배송준비중")) {
			alert = "Y";
		}
		
		orderDao.updateOrderByNo(order);
		mav.addAttribute("alert", alert);
		mav.addAttribute("status", order.getStatus());
		
		mav.setView(new JSONView());
		/* mav.setViewName("redirect:detail.kakao?pno="+pno+"&no="+orderNo); */

		return mav;
	}
	
//	리스트에서 상태 변경
	@RequestMapping("/admin/order/listOrderStatusUpdate.kakao")
	public ModelAndView listOrderStatusUpdate(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView mav = new ModelAndView();
		
		/* int orderNo = Integer.parseInt(req.getParameter("no")); */
		
		String[] orderNo = req.getParameter("no").split(",");
		
		int pno = Integer.parseInt(req.getParameter("pno"));
		String alert = "N";
		
		ArrayList<Map<String, Object>> statuses = new ArrayList<Map<String, Object>>();
		
		for(String odNo:orderNo) {
			Map<String, Object> orderStatus = new HashMap<String, Object>();
			int orderNum = Integer.parseInt(odNo);
			
			Order order = orderDao.getOrderByNo(orderNum);
			
			if(order.getStatus().equals("입금확인")) {
				order.setStatus("배송준비중");
			} else if(order.getStatus().equals("배송중")) {
				order.setStatus("배송완료");
			} else if(order.getStatus().equals("배송준비중")) {
				alert = "Y";
			}
			
			orderStatus.put("orNo", odNo);
			orderStatus.put("orStatus", order.getStatus());
			orderDao.updateOrderByNo(order);
			statuses.add(orderStatus);
		}
		
		mav.addAttribute("alert", alert);
		mav.addAttribute("status", statuses);
		
		mav.setView(new JSONView());

		return mav;
	}
}
