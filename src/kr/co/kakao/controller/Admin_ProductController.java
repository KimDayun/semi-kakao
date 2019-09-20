package kr.co.kakao.controller;



import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.jhta.mvc.annotation.Controller;
import kr.co.jhta.mvc.annotation.RequestMapping;
import kr.co.jhta.mvc.servlet.ModelAndView;
import kr.co.jhta.mvc.view.JSONView;
import kr.co.kakao.admin.dao.Admin_CateDao;
import kr.co.kakao.admin.dao.Admin_ProductDao;
import kr.co.kakao.dao.CategoryDao;
import kr.co.kakao.util.CommonUtils;
import kr.co.kakao.vo.AdminProduct;
import kr.co.kakao.vo.Banner;
import kr.co.kakao.vo.Category;
import kr.co.kakao.vo.Criteria;
import kr.co.kakao.vo.Pagination;
import kr.co.kakao.vo.Product;

@Controller
public class Admin_ProductController {
	
	// 상품리스트, 페이징
	@RequestMapping("/admin/product/list.kakao")
	public ModelAndView paginglist(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/product/admin-product-list.jsp");
		
		int pno = CommonUtils.stringToNumber(req.getParameter("pno"), 1);
		int size = CommonUtils.stringToNumber(req.getParameter("size"), 10);
		String sort = req.getParameter("sort");
		String opt = req.getParameter("opt");
		String keyword = req.getParameter("keyword");
		
		Criteria criteria = new Criteria();
		criteria.setSize(size);
		if(sort != null && !sort.isEmpty()) {
			criteria.setSort(sort);
		} else {
			criteria.setSort("ALLNEW");
		}
		criteria.setBeginIndex((pno - 1)*size + 1);
		criteria.setEndIndex(pno*size);
		if (keyword != null && !keyword.isEmpty()) {
			criteria.setOption(opt);
			criteria.setKeyword(keyword);
		}
		
		int records = productDao.getCountList(criteria);
		List<Product> products = productDao.getProductPagingList(criteria);
		Pagination pagination = new Pagination(pno, size, records);
		
		mav.addAttribute("products", products);
		mav.addAttribute("pagination", pagination);

		return mav;
	}

	// 상품관리 수정 페이지에서 대분류 - 소분류 불러오기
	private Admin_ProductDao productDao = new Admin_ProductDao();
	Admin_CateDao adminCateDao = new Admin_CateDao();
	
	@RequestMapping("/admin/product/cate.kakao")
	public ModelAndView cate(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mav = new ModelAndView();
		int cateno = Integer.parseInt(req.getParameter("cateNo"));
		List<Category> categories = adminCateDao.getCateByParentNo(cateno);
		
		mav.addAttribute("categories", categories);
		mav.setView(new JSONView());
		
		return mav;
	}
	
	
	// 상품 등록하기
	@RequestMapping("/admin/product/add.kakao")
	public ModelAndView add(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView mav = new ModelAndView();
		
		String saveDirectory = "C:\\projects\\web_workspace\\kakao\\WebContent\\test\\image";
	    String encoding = "utf-8";
	    int sizeLimit = 10*1024*1024;
	    MultipartRequest mr = new MultipartRequest(req, saveDirectory, sizeLimit, encoding, new DefaultFileRenamePolicy());

	    int pno = Integer.parseInt(mr.getParameter("pno"));
	    
		String name = mr.getParameter("productname");
		System.out.println(name);
		int price = Integer.parseInt(mr.getParameter("price"));
		System.out.println(price);
		String info = mr.getParameter("contents");
		System.out.println(info);
		int cate_number = Integer.parseInt(mr.getParameter("subCateName"));
		System.out.println(cate_number);
		String img = mr.getFilesystemName("imageFile");
		System.out.println(img);
		int stock = Integer.parseInt(mr.getParameter("stock"));
		System.out.println(stock);
		String global_yn = mr.getParameter("globalYn");
		if(global_yn == null) {
			global_yn = "N";
		}
		System.out.println(global_yn);
		String soldout_yn = mr.getParameter("soldoutYn");
		if(soldout_yn == null) {
			soldout_yn = "N";
		}
		System.out.println(soldout_yn);
		String character = mr.getParameter("character");
		System.out.println(character);
		String sell_yn = mr.getParameter("sellYn");
		if(sell_yn == null) {
			sell_yn = "N";
		}
		System.out.println(sell_yn);

		Product product = new Product();
		product.setName(name);
		product.setPrice(price);
		product.setInfo(info);
		product.setCateNo(cate_number);
		product.setImgName(img);
		product.setStock(stock);
		product.setGlobalYn(global_yn);
		product.setSellYn(sell_yn);

		product.setSoldoutYn(soldout_yn);
		product.setCharacter(character);

		productDao.addProduct(product);
		mav.addAttribute("pno", pno);

		mav.setViewName("redirect:list.kakao?pno="+pno);

		return mav;

	}
	
	// 상품등록 페이지 열기
	@RequestMapping("/admin/product/form.kakao")
	public ModelAndView form(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView mav = new ModelAndView();
		
		int pno = Integer.parseInt(req.getParameter("pno"));
		
		mav.setViewName("admin/product/admin-product-form.jsp");
		
		mav.addAttribute("pno", pno);
		return mav;
	}

	// 디테일 페이지 열기
	@RequestMapping("/admin/product/detail.kakao")
	public ModelAndView detail(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/product/admin-product-detail.jsp");

		int no = Integer.parseInt(req.getParameter("no"));
		int pno = Integer.parseInt(req.getParameter("pno"));
		AdminProduct adminproduct = productDao.getProductByNo(no);

		mav.addAttribute("pno", pno);
		mav.addAttribute("product", adminproduct);

		return mav;
	}

	// 디테일 페이지에서 판매여부 N으로 변경(삭제)
	@RequestMapping("/admin/product/deleteProduct.kakao")
	public ModelAndView detailUpdate(HttpServletRequest req, HttpServletResponse res) throws Exception {

	ModelAndView mav = new ModelAndView();
	
	int no = Integer.parseInt(req.getParameter("no"));
	
	AdminProduct adminproduct = productDao.getProductByNo(no);
	
	String str = adminproduct.getSellYn();
	if(str.equals("Y")) {
		adminproduct.setSellYn("N");
	} else if(str.equals("N")) {
		adminproduct.setSellYn("Y");
	}
	
	productDao.updateProductByNo(adminproduct);
	
	mav.setViewName("redirect:detail.kakao?no="+no);
	
	return mav;
}
	
	// 상품관리 폼 열기
	@RequestMapping("/admin/product/updateform.kakao")
	public ModelAndView updateForm(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/product/admin-product-update.jsp");
		
		int pno = Integer.parseInt(req.getParameter("pno"));
		int no = Integer.parseInt(req.getParameter("no"));
		AdminProduct adminproduct = productDao.getProductByNo(no);
		
		mav.addAttribute("pno", pno);
		mav.addAttribute("product", adminproduct);
		
		return mav;
	}
	
	// 리스트에서 표시여부 변경하기
		@RequestMapping("/admin/product/listUpdate.kakao")
		public ModelAndView listUpdate(HttpServletRequest req, HttpServletResponse res) throws Exception {

			ModelAndView mav = new ModelAndView();
			
			int pno = Integer.parseInt(req.getParameter("pageNo"));
			
			if(pno == 0) {
				mav.setViewName("redirect:list.kakao?pno=1");
				return mav;
			}
			
			String[] productNo = req.getParameterValues("productNo");
			
			if(productNo == null) {
				mav.setViewName("redirect:list.kakao?pno=1");
				return mav;
			}
			
			for(String no:productNo) {
				int num = Integer.parseInt(no);
				AdminProduct adminproduct = productDao.getProductByNo(num);
				if(adminproduct.getSellYn().equals("Y")) {
					adminproduct.setSellYn("N");
				} else {
					adminproduct.setSellYn("Y");
				}
				productDao.updateProductByNo(adminproduct);
			}
			
			mav.setViewName("redirect:list.kakao?pno="+pno);


			return mav;
		} 
	// 상품관리 업데이트
	@RequestMapping("/admin/product/update.kakao")
	public ModelAndView update(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		
		String saveDirectory = "C:\\projects\\web_workspace\\kakao\\WebContent\\test\\image";
	    String encoding = "utf-8";
	    int sizeLimit = 10*1024*1024;
	    // multipartRequest 생성
	    MultipartRequest mr = new MultipartRequest(req, saveDirectory, sizeLimit, encoding, new DefaultFileRenamePolicy());
	    int pno = Integer.parseInt(mr.getParameter("pno"));
	    
		int productNo = Integer.parseInt(mr.getParameter("no"));
		AdminProduct product = productDao.getProductByNo(productNo);
		System.out.println(productNo);
		
		int catNo = Integer.parseInt(mr.getParameter("no"));
		String name = mr.getParameter("name");
		String globalYn = mr.getParameter("globalYn");
		String soldoutYn = mr.getParameter("soldoutYn");
		String sellYn = mr.getParameter("sellyn");
		String character = mr.getParameter("character");
		int price = Integer.parseInt(mr.getParameter("price"));
		int stock = Integer.parseInt(mr.getParameter("stock"));
		String imgName = CommonUtils.nullToString(mr.getFilesystemName("imageFile"), "zero");
		String info = mr.getParameter("info");
		
		product.setName(name);
		
		if (globalYn == null) {
			product.setGlobalYn("N");
		} else {
			product.setGlobalYn(globalYn);
		}
		product.setSoldoutYn(soldoutYn);
		if (globalYn == null) {
			product.setGlobalYn("N");
		} else {
			product.setGlobalYn(globalYn);
		}
		product.setSellYn(sellYn);
		if (sellYn == null) {
			product.setSellYn("N");
		} else {
			product.setSellYn(sellYn);
		}
		
		if(!imgName.equals("zero")) {
			product.setImgName(imgName);
		}
		product.setNo(catNo);
		product.setPrice(price);
		product.setStock(stock);
		product.setInfo(info);
		product.setCharacter(character);
		
		productDao.updateProductByNo(product);
		
		mav.setViewName("redirect:detail.kakao?pno="+pno+"&no="+productNo);
		
		return mav;
		
		
	}
}



