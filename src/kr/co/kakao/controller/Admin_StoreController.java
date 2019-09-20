package kr.co.kakao.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jhta.mvc.annotation.Controller;
import kr.co.jhta.mvc.annotation.RequestMapping;
import kr.co.jhta.mvc.servlet.ModelAndView;
import kr.co.jhta.mvc.view.JSONView;
import kr.co.kakao.admin.dao.Admin_StoreDao;
import kr.co.kakao.vo.Store;

@Controller
public class Admin_StoreController {

	Admin_StoreDao storeDao = new Admin_StoreDao();
	
	@RequestMapping("/admin/store/deleteStore.kakao")
	public ModelAndView deleteStore(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		String[] stringNo = req.getParameterValues("storeCheck");
		for(int i = 0; i < stringNo.length; i++) {
			int no = Integer.parseInt(stringNo[i]);
			
			storeDao.deleteStoreByNo(no);
		}
		
		mav.setViewName("redirect:list.kakao?pno=1");

		return mav;
	}
	
	@RequestMapping("/admin/store/insertStore.kakao")
	public ModelAndView insertStore(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		int pno = Integer.parseInt(req.getParameter("pno"));
		int no = Integer.parseInt(req.getParameter("no"));
		System.out.println(no);
		
		Store store = new Store();
		store.setNo(no);
		store.setName(req.getParameter("name"));
		store.setCity(req.getParameter("city"));
		store.setAddress(req.getParameter("address"));
		store.setPhone(req.getParameter("phone"));
		store.setBusinessHours(req.getParameter("businessHours"));
		store.setDisplayYn(req.getParameter("displayYn"));
		store.setLatitude(req.getParameter("latitude"));
		store.setLongitude(req.getParameter("longitude"));
		
		storeDao.insertStore(store);
		
		mav.setViewName("redirect:list.kakao?pno="+pno);

		return mav;
	}

	@RequestMapping("/admin/store/form.kakao")
	public ModelAndView form(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("admin/store/admin-store-form.jsp");
		
		int storeSeq = storeDao.getStoreSeq();
		mav.addAttribute("no", storeSeq);
		
		return mav;
	}
	
	@RequestMapping("/admin/store/updateStore.kakao")
	public ModelAndView updateStore(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();

		Store store = new Store();
		store.setNo(Integer.parseInt(req.getParameter("no")));
		store.setName(req.getParameter("name"));
		store.setCity(req.getParameter("city"));
		store.setAddress(req.getParameter("address"));
		store.setPhone(req.getParameter("phone"));
		store.setBusinessHours(req.getParameter("businessHours"));
		store.setDisplayYn(req.getParameter("displayYn"));
		store.setLatitude(req.getParameter("latitude"));
		store.setLongitude(req.getParameter("longitude"));

		storeDao.updateStore(store);

		mav.addAttribute("store", store);
		mav.setView(new JSONView());

		return mav;
	}

	@RequestMapping("/admin/store/detail.kakao")
	public ModelAndView detail(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();

		int no = Integer.parseInt(req.getParameter("no"));

		mav.setViewName("admin/store/admin-store-detail.jsp?no=" + no);

		Store store = storeDao.getStoreByNo(no);
		mav.addAttribute("store", store);

		return mav;
	}

	@RequestMapping("/admin/store/list.kakao")
	public ModelAndView list(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("admin/store/admin-store-list.jsp");

		List<Store> stores = storeDao.getAllStore();

		mav.addAttribute("stores", stores);

		return mav;
	}
}
