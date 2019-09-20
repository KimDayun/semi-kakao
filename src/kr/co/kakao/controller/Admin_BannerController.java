package kr.co.kakao.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.kakao.admin.dao.Admin_BannerDao;
import kr.co.kakao.admin.dao.Admin_ProductDao;
import kr.co.kakao.util.CommonUtils;
import kr.co.kakao.vo.Banner;
import kr.co.kakao.vo.Criteria;
import kr.co.kakao.vo.Pagination;
import kr.co.kakao.vo.Product;
import kr.co.jhta.mvc.annotation.Controller;
import kr.co.jhta.mvc.annotation.RequestMapping;
import kr.co.jhta.mvc.servlet.ModelAndView;

@Controller
public class Admin_BannerController {

	private Admin_BannerDao bannerDao = new Admin_BannerDao(); 
	Admin_ProductDao proDao = new Admin_ProductDao();
	
	// 배너 정렬, 페이징, 리스트
	@RequestMapping("/admin/banner/list.kakao")
	public ModelAndView list(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/banner/admin-banner-list.jsp");

		int pno = CommonUtils.stringToNumber(req.getParameter("pno"), 1);
		int size = CommonUtils.stringToNumber(req.getParameter("size"), 5);
		String sort = req.getParameter("sort");
		
		Criteria criteria = new Criteria();
		criteria.setSize(size);
		if(sort!= null && !sort.isEmpty()) {
			criteria.setSort(sort);
		} else {
			criteria.setSort("NEW");
		}
		
		criteria.setBeginIndex((pno-1)*size + 1);
		criteria.setEndIndex(pno*size);
		
		int records = bannerDao.getCountAllBanner();
		if(records == 0) {
			records = 1;
		}
		List<Banner> banners = bannerDao.getAllBannerByRange(criteria); 
		
		
		
		Pagination pagination = new Pagination(pno, size, records);
		
		mav.addAttribute("banners", banners);
		mav.addAttribute("pagination", pagination);
		return mav;
	}
	
	// 폼 불러오기
	@RequestMapping("/admin/banner/form.kakao")
	public ModelAndView form(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/banner/admin-banner-form.jsp");
		
		List<Product> products = bannerDao.getAllProduct();
		mav.addAttribute("products", products);

		return mav;
	}
	
	// 디테일 불러오기
	@RequestMapping("/admin/banner/detail.kakao")
	public ModelAndView detail(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/banner/admin-banner-detail.jsp");
		
		int bannerNo = Integer.parseInt(req.getParameter("no"));
		Banner banner = bannerDao.getBannerByNo(bannerNo);
		
		List<Product> products = bannerDao.getAllProduct();
		mav.addAttribute("products", products);
		
		mav.addAttribute("banner", banner);

		return mav;
	}
	
	// 업데이트 폼 열기
	@RequestMapping("/admin/banner/updateForm.kakao")
	public ModelAndView updateForm(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/banner/admin-banner-update.jsp");
		
		int bannerNo = Integer.parseInt(req.getParameter("no"));
		Banner banner = bannerDao.getBannerByNo(bannerNo);
		
		List<Product> products = bannerDao.getAllProduct();
		mav.addAttribute("products", products);
		
		mav.addAttribute("banner", banner);

		return mav;
	}
	
	// 디테일에서 업데이트 하기
	@RequestMapping("/admin/banner/allUpdate.kakao")
	public ModelAndView allUpdate(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView mav = new ModelAndView();
		
		// 파일시스템
		String saveDirectory = "C:\\projects\\web_workspace\\kakao\\WebContent\\test\\image";
		String encoding = "utf-8";
		int sizeLimit = 10*1024*1024;
		// multipartRequest 생성
		MultipartRequest mr = new MultipartRequest(req, saveDirectory, sizeLimit, encoding, new DefaultFileRenamePolicy());
		
		int pno = Integer.parseInt(mr.getParameter("pno"));
		int no = Integer.parseInt(mr.getParameter("no"));
		String bannerTitle = mr.getParameter("bannerTitle");
		String bannerSubTitle = mr.getParameter("bannerSubTitle");
		int productNo = Integer.parseInt(mr.getParameter("productNo"));
		Product product = new Product();
		product.setNo(productNo);
		int bannerPriority = Integer.parseInt(mr.getParameter("bannerPriority"));
		String bannerDispalyYn = CommonUtils.nullToString(mr.getParameter("bannerDispalyYn"), "N");
		String bannerFile = CommonUtils.nullToString(mr.getFilesystemName("bannerFile"), "zero");
		
		Banner banner = bannerDao.getBannerByNo(no);

		if(!bannerFile.equals("zero")) {
			banner.setImgName(bannerFile);
		}
		banner.setTitle(bannerTitle);
		banner.setSubTitle(bannerSubTitle);
		banner.setProduct(product);
		banner.setPriority(bannerPriority);
		banner.setDisplayYn(bannerDispalyYn);
		
		bannerDao.updateBanner(banner);
		
		
		mav.setViewName("redirect:detail.kakao?pno="+pno+"&no="+no);

		return mav;
	}
	
	// 배너 추가하기
	@RequestMapping("/admin/banner/add.kakao")
	public ModelAndView add(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView mav = new ModelAndView();
		
		// 파일시스템
		String saveDirectory = "C:\\projects\\web_workspace\\kakao\\WebContent\\test\\image";
		String encoding = "utf-8";
		int sizeLimit = 10*1024*1024;
		// multipartRequest 생성
		MultipartRequest mr = new MultipartRequest(req, saveDirectory, sizeLimit, encoding, new DefaultFileRenamePolicy());
		
		//담을 배너 생성
		Banner banner = new Banner();

		// pno 생성
		int pno = Integer.parseInt(mr.getParameter("pno"));
		
		// title, subtitle 생성
		String bannerTitle = mr.getParameter("bannerTitle");
		String bannerSubTitle = mr.getParameter("bannerSubTitle");
	
		//product 번호 받아서 product 생성 후 product에 입력
		int productNo = Integer.parseInt(mr.getParameter("productNo"));
		Product product = new Product();
		product.setNo(productNo);
		
		// 우선순위 생성
		int bannerPriority = Integer.parseInt(mr.getParameter("bannerPriority"));
		
		// 유틸사용해서 null 이면 N값 입력하게 만듬
		String bannerDispalyYn = CommonUtils.nullToString(mr.getParameter("bannerDispalyYn"), "N");
		
		// FileSystem 으로 입력
		String bannerFile = mr.getFilesystemName("bannerFile");
		
		banner.setTitle(bannerTitle);
		banner.setSubTitle(bannerSubTitle);
		banner.setProduct(product);
		banner.setPriority(bannerPriority);
		banner.setDisplayYn(bannerDispalyYn);
		banner.setImgName(bannerFile);
	
		
		bannerDao.addBanner(banner);
		
		mav.setViewName("redirect:list.kakao?pno="+pno);

		return mav;
	}
	
	// 배너삭제
	@RequestMapping("/admin/banner/delete.kakao")
	public ModelAndView delete(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView mav = new ModelAndView();
		
		int no = Integer.parseInt(req.getParameter("no"));
		int pno = Integer.parseInt(req.getParameter("pno"));
		
		bannerDao.deleteBanner(no);
		mav.setViewName("redirect:list.kakao?pno="+pno);

		return mav;
	}
	
	// 리스트에서 삭제하기
	@RequestMapping("/admin/banner/listDelete.kakao")
	public ModelAndView listDelete(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView mav = new ModelAndView();
		
		
		int pno = CommonUtils.stringToNumber(req.getParameter("pageNo"), 0);
		
		if(pno == 0) {
			mav.setViewName("redirect:list.kakao?pno=1");
			return mav;
		}
		
		String[] bannerNo = req.getParameterValues("bannerNo");
		
		if(bannerNo == null) {
			mav.setViewName("redirect:list.kakao?pno=1");
			return mav;
		}
		
		for(String no:bannerNo) {
			int num = Integer.parseInt(no);
			bannerDao.deleteBanner(num);
		}
		
		mav.setViewName("redirect:list.kakao?pno="+pno);

		return mav;
	}
	
	// 리스트에서 표시여부 변경하기
	@RequestMapping("/admin/banner/listUpdate.kakao")
	public ModelAndView listUpdate(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView mav = new ModelAndView();
		
		int pno = Integer.parseInt(req.getParameter("pageNo"));
		
		if(pno == 0) {
			mav.setViewName("redirect:list.kakao?pno=1");
			return mav;
		}
		
		String[] bannerNo = req.getParameterValues("bannerNo");
		
		if(bannerNo == null) {
			mav.setViewName("redirect:list.kakao?pno=1");
			return mav;
		}
		
		for(String no:bannerNo) {
			int num = Integer.parseInt(no);
			Banner banner = bannerDao.getBannerByNo(num);
			if(banner.getDisplayYn().equals("Y")) {
				banner.setDisplayYn("N");
			} else {
				banner.setDisplayYn("Y");
			}
			bannerDao.updateBanner(banner);
		}
		
		mav.setViewName("redirect:list.kakao?pno="+pno);


		return mav;
	}
}
