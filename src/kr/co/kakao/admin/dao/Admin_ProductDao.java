package kr.co.kakao.admin.dao;

import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.kakao.util.IbatisUtils;
import kr.co.kakao.vo.AdminProduct;
import kr.co.kakao.vo.Banner;
import kr.co.kakao.vo.Criteria;
import kr.co.kakao.vo.Notice;
import kr.co.kakao.vo.Product;
import kr.co.kakao.vo.Qna;

public class Admin_ProductDao {

	private SqlMapClient sqlMap = IbatisUtils.getSqlMap();
	
	// 상품리스트 뽑아오기 정렬, 페이징
	@SuppressWarnings("unchecked")
	public List<Product> getProductPagingList(Criteria c) throws Exception{
		return (List<Product>)sqlMap.queryForList("getProductPagingList", c);
	}
	
	// 모든 리스트 뽑아오기
	public int getCountList(Criteria c) throws Exception{
		return (Integer)sqlMap.queryForObject("countAllList", c);
	}
	
	// 상품리스트 추가
	public void addProduct(Product product) throws Exception {
		sqlMap.insert("addProduct", product);
	}

	// 모든 리스트 출력
	@SuppressWarnings("unchecked")
	public List<Product> getProductAll() throws Exception {
		return (List<Product>) sqlMap.queryForList("getProductAll");
	}
	
	// 모든 리스트(소분류,대분류 추가) 출력
	@SuppressWarnings("unchecked")
	public List<Product> getProductList() throws Exception {
		return (List<Product>) sqlMap.queryForList("getProductList");
	}
	// 상품 번호로 하나 출력 
	public AdminProduct getProductByNo(int no) throws Exception{
		return (AdminProduct)sqlMap.queryForObject("getProductByNo", no);
	}

	// 상품관리 번호로 업데이트
	public void updateProductByNo(AdminProduct adminproduct) throws Exception{
		sqlMap.update("updateProductByNo", adminproduct);
	}
	
	// 상품 업데이트
		public void updateProduct(AdminProduct adminproduct) throws Exception {
			sqlMap.update("updateProduct", adminproduct);
		}

}
