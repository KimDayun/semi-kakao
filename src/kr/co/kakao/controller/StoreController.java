package kr.co.kakao.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jhta.mvc.annotation.Controller;
import kr.co.jhta.mvc.annotation.RequestMapping;
import kr.co.jhta.mvc.servlet.ModelAndView;
import kr.co.kakao.dao.StoreDao;
import kr.co.kakao.vo.Store;

@Controller
public class StoreController {
	
	StoreDao storeDao = new StoreDao();

	@RequestMapping("/store/storelist.kakao")
	public ModelAndView storelist(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("store/storelist.jsp");
		
		List<Store> stores = storeDao.selectAllStore();
		mav.addAttribute("stores", stores);

		return mav;
	}
	
	@RequestMapping("/store/localstore.kakao")
	public ModelAndView localstore(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("store/localstore.jsp");
		
		String local = req.getParameter("local");
		
		List<Store> stores = storeDao.selectStoresByCity(local);
		mav.addAttribute("stores", stores);
		mav.addAttribute("local", local);
		
		return mav;
	}
}
