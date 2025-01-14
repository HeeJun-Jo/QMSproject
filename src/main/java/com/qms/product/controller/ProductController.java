package com.qms.product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qms.common.service.ExcelService;
import com.qms.product.service.ProductService;
import com.qms.product.vo.ProductVO;
import com.qms.util.Constant;
import com.qms.util.ExcelConstant;

import jakarta.servlet.http.HttpServletResponse;



@Controller
public class ProductController {

	@Autowired	ProductService service;
	
	@Autowired
	ExcelService excelService;

	
	@RequestMapping("/product/productlist")
	public String product(Model model) throws Exception{
		model.addAttribute("BASE_YEAR",Constant.BASE_YEAR);
		return "product/product01";
	}
	@RequestMapping("/product/productSearch")
    @ResponseBody
    public  ProductVO productSearch (@ModelAttribute("ProductVO") ProductVO vo) throws Exception{
	

		int totalPage = service.selectProductCount(vo);			
		
		List <ProductVO> list = service.selectProductList(vo);
				
		vo.setPrdList(list);
		vo.setTotal(totalPage); //총 데이터수.
		vo.setStartPage(vo.getStartPage()); 
		vo.setCurrentPage(vo.getCurrentPage());//현재페이지
		
				
		
		return vo;
	}	

			@RequestMapping("/product/createExcel")
			@ResponseBody
		    public Workbook  downloadExcel(@ModelAttribute("ProductVO") ProductVO vo, HttpServletResponse response) throws Exception {
		        // 데이터 조회
		        List<ProductVO> list = service.selectProductListExcel(vo);

		        // 파일 이름 설정
		        String fileName = "product.xlsx";
		        
		        // 시트 데이터와 헤더 맵 설정
		        Map<String, List<?>> dataMap = new HashMap<>();
		        dataMap.put("productList", list);
		        
		        // 사용자 지정 헤더 맵 설정
		        Map<String, Map<String, String>> headerMap = new HashMap<>();
		        headerMap.put("productList", ExcelConstant.getProductListHeaderMap());

		        // 엑셀 파일 생성 및 다운로드
		        return excelService.downloadExcel(response, dataMap, fileName, headerMap);
		    }
			
	
	
}
	
