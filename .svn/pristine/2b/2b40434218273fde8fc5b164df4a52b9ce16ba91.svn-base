package com.qms.item.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qms.code.service.CodeService;
import com.qms.common.service.ExcelService;
import com.qms.excel.ExcelVO;
import com.qms.item.service.ItemService;
import com.qms.item.vo.ItemPageVO;
import com.qms.item.vo.ItemVO;
import com.qms.table.vo.common.ComCodeVO;
import com.qms.table.vo.item.ItemInfoVO;
import com.qms.table.vo.user.UserInfoVO;
import com.qms.util.ExcelConstant;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@Controller
public class ItemController {
	
	@Autowired
	ItemService service;
	@Autowired
	CodeService cdservice;
	@Autowired
	ExcelService excelService;

	@RequestMapping("/item/itemList")
	public String goodsList() throws Exception{
		return "/item/item01";
	}
	// 제품유형 콤보박스
	@RequestMapping("/item/getItemType")
	@ResponseBody
	public ItemVO getItemType()throws Exception{
		ItemVO itvo = new ItemVO();
		ComCodeVO vo = new ComCodeVO();
		
		vo.setComGrpCd("IT01");
		List<ComCodeVO> list1 = cdservice.selectComCodeList(vo);
		itvo.setItemTypeList(list1);
		
		vo.setComGrpCd("IT02");
		List<ComCodeVO> list2 = cdservice.selectComCodeList(vo);
		itvo.setUnitTypeList(list2);
		
		vo.setComGrpCd("IT03");
		List<ComCodeVO> list3 = cdservice.selectComCodeList(vo);
		itvo.setBoxTypeList(list3);
		
		vo.setComGrpCd("IT04");
		List<ComCodeVO> list4 = cdservice.selectComCodeList(vo);
		itvo.setPlantLineList(list4);
		
		vo.setComGrpCd("IT05");
		List<ComCodeVO> list5 = cdservice.selectComCodeList(vo);
		itvo.setLocationList(list5);

		return itvo;
	}
	
	// 제품 조회하기
	@RequestMapping("/item/getItemList")
	@ResponseBody
	public ItemPageVO getItemList(@ModelAttribute("ItemInfoVO") ItemInfoVO vo)throws Exception{
		
		int totalPage = 0;
		
		ItemPageVO itempagevo = new ItemPageVO();
		totalPage = service.selectTotalItemCount(vo);
		List<ItemInfoVO> list = service.selectItemList(vo);
		
		itempagevo.setItemlist(list);
		itempagevo.setTotal(totalPage); // 총 데이터 수
		itempagevo.setStartPage(vo.getStartPage());
		itempagevo.setCurrentPage(vo.getCurrentPage()); // 현재 페이지
		
		return itempagevo;
	}
	
	// 제품 상세조회
	@RequestMapping("/item/getItemDtl")
	@ResponseBody
	public ItemInfoVO getItemDtl(@ModelAttribute("ItemInfoVO")ItemInfoVO vo)throws Exception{
		ComCodeVO comvo = new ComCodeVO();
		
		vo = service.selectItemDtl(vo);
		
		return vo;
	}
	
	// 제품 수정/등록
	@RequestMapping("/item/commitItem")
	@ResponseBody
	public int commitItem(@ModelAttribute("ItemVO")ItemVO vo)throws Exception{
		
		int cnt = 0;

		if(vo.getCommitType().equals("1")) {
			if(vo.getSubconYn() == null) {
				vo.setSubconYn("N");
			}
			cnt += service.insertItem(vo);
		}else{
			if(vo.getSubconYn() == null) {
				vo.setSubconYn("N");
			}
			cnt += service.updateItem(vo);
		}
		return cnt;
	}

	// item엑셀 저장
	@RequestMapping("/item/createExcel")
	@ResponseBody
    public Workbook  downloadExcel(@ModelAttribute("ItemVO") ItemVO vo, HttpServletResponse response) throws Exception {
        // 데이터 조회
        List<ItemVO> list = service.selectItemListExcel(vo);

        // 파일 이름 설정
        String fileName = "item.xlsx";
        
        // 시트 데이터와 헤더 맵 설정
        Map<String, List<?>> dataMap = new HashMap<>();
        dataMap.put("itemList", list);
        
        // 사용자 지정 헤더 맵 설정
        Map<String, Map<String, String>> headerMap = new HashMap<>();
        headerMap.put("itemList", ExcelConstant.getItemHeaderMap());

        // 엑셀 파일 생성 및 다운로드
        return excelService.downloadExcel(response, dataMap, fileName, headerMap);
    }
	
	
	// 엑셀 업로드
	@RequestMapping("/item/excelUpload")
	@ResponseBody
	public int excelUpload(@ModelAttribute ExcelVO vo, HttpServletRequest request)throws Exception{
		HttpSession session  = request.getSession();
	    UserInfoVO uservo = (UserInfoVO) session.getAttribute("MallUser");
	    vo.setRegUserId(uservo.getUserId());
		
		// 엑셀 파일을 읽고 첫 번째 시트를 가져온다.
		XSSFWorkbook workbook = new XSSFWorkbook(vo.getExcelFile().getInputStream());
	    XSSFSheet worksheet = workbook.getSheetAt(0);
	    
	    // 셀 데이터를 문자열로 변환
	    DataFormatter formatter = new DataFormatter();
	    int cnt = 0;
	    
	    // 행만큼의 길이 설정하고 셀 데이터 넣기 위한 리스트 선언
	    for (int i = 1; i < worksheet.getPhysicalNumberOfRows(); i++) { // 헤더 부분 다음 행을 가져오기 위해 i=1로 선언
	        XSSFRow row = worksheet.getRow(i); 
	        List<String> cellDataList = new ArrayList<>();
	        
	        // 조회하는 첫 번째 열이 비어있는 경우 반복문 종료
	        if(formatter.formatCellValue(row.getCell(1)) == "") {
	        	break;
	        }
	        // 각 열의 셀 데이터만큼 길이 설정, 위에 선언한 리스트에 각 셀의 데이터 삽입
	        for (int j = 1; j < row.getPhysicalNumberOfCells(); j++) {// NO 부분 다음 열을 가져오기 위해 j=1로 선언 
	        	String cellValue = formatter.formatCellValue(row.getCell(j));
	        	vo.setItemCd(formatter.formatCellValue(row.getCell(1)));
		        cellDataList.add(cellValue);
	        }
	        // 세션에 접속된 아이디를 리스트에 추가
	        cellDataList.add(vo.getRegUserId());
	        // 기존에 있던 데이터면 지우고 각 리스트 db에 저장
	        service.deleteExcel(vo);
	        cnt += service.insertExcel(cellDataList);
	        
	    }
	    workbook.close();

		return cnt;
	}
	

}
