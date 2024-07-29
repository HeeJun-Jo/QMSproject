package com.qms.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qms.item.vo.ItemVO;
import com.qms.product.dao.ProductDao;
import com.qms.product.vo.ProductVO;




@Service
public class ProductService {

	@Autowired
	ProductDao dao;
	
		public int  selectProductCount(ProductVO vo) throws Exception{
		
		
		return dao.selectProductCount(vo);	
	}
		public List<ProductVO> selectProductList(ProductVO vo) throws Exception{
			return dao.selectProductList(vo);
		}
		public List<ProductVO> selectProductListExcel(ProductVO vo) throws Exception{
			return dao.selectProductListExcel(vo);
		}
}



	
	
	

