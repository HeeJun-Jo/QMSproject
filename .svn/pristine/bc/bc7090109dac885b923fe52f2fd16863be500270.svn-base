package com.qms.bom.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qms.bom.service.BomService;
import com.qms.bom.vo.BomInfoVO;
import com.qms.bom.vo.BomPageVO;
import com.qms.code.service.CodeService;
import com.qms.common.service.ExcelService;
import com.qms.item.vo.ItemVO;
import com.qms.table.vo.user.UserInfoVO;
import com.qms.util.ExcelConstant;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class BomController {
	
	@Autowired
	BomService service;
	@Autowired
	CodeService cdservice;
	@Autowired
	ExcelService excelService;

	@RequestMapping("/bom/bomList")
	public String bomList() throws Exception{
		return "/bom/bom01";
	}
	
	// BOM 조회
	@RequestMapping("/bom/selectBomList")
	@ResponseBody
	public BomPageVO selectBomList(@ModelAttribute("ItemVO")ItemVO vo)throws Exception{
		int totalPage = 0;
		
		BomPageVO bompagevo = new BomPageVO();
		totalPage = service.selectTotalBomCount(vo);
		List<ItemVO> list = service.selectBomList(vo);
		
		bompagevo.setBomlist(list);
		bompagevo.setTotal(totalPage); // 총 데이터 수
		bompagevo.setStartPage(vo.getStartPage());
		bompagevo.setCurrentPage(vo.getCurrentPage()); // 현재 페이지
		
		return bompagevo;
	}
	
	// BOM 상세조회
	@RequestMapping("/bom/getBomDtl")
	@ResponseBody
	public BomInfoVO selectBomDtl(@ModelAttribute("BomInfoVO")BomInfoVO vo)throws Exception{
		
		vo = service.selectBomDtl(vo); // 모달 헤더 품명
		
		vo.setBomDtlList(service.selectBomDtlList(vo)); // 모달 바디 DTL 리스트
		
		return vo;
	}
	
	// bom엑셀 저장
	@RequestMapping("/bom/createExcel")
	@ResponseBody
	public Workbook downloadExcel(@ModelAttribute("ItemVO") ItemVO vo, HttpServletResponse response) throws Exception {
	    // 데이터 조회
		List<ItemVO> list = service.selectBomListExcel(vo);

	    // 파일 이름 설정
	    String fileName = "bom.xlsx";

	    // 시트 데이터와 헤더 맵 설정
        Map<String, List<?>> dataMap = new HashMap<>();
        dataMap.put("bomList", list);
        
        // 사용자 지정 헤더 맵 설정
        Map<String, Map<String, String>> headerMap = new HashMap<>();
        headerMap.put("bomList", ExcelConstant.getBomHeaderMap());

        // 엑셀 파일 생성 및 다운로드
        return excelService.downloadExcel(response, dataMap, fileName, headerMap);
	}
	
	// BOM 등록
	@RequestMapping("/bom/insertBom")
	@ResponseBody
	public int insertBom(@ModelAttribute("BomInfoVO")BomInfoVO vo, HttpServletRequest request)throws Exception{
		HttpSession session  = request.getSession();
	    UserInfoVO uservo = (UserInfoVO) session.getAttribute("MallUser");
	    vo.setRegUserId(uservo.getUserId());
		
		
		vo.setBomDtlList(service.selectBomDtlList(vo)); // DTL 존재하는지 확인
		
		if(vo.getBomDtlList().size() == 0) { // 신규 등록
			service.insertNewBomDtl(vo);
			service.insertNewBom(vo);
		}else { 							 // 기존 수정
			service.deleteBom(vo);
			service.insertNewBomDtl(vo);
			service.insertNewBom(vo);
		}
		return 1;
	}
	
	// BOM 팝업
	@RequestMapping("/bom/bomPopup")
	public String bomPopup()throws Exception{
		return "/bom/bom01pop1";
	}
}
