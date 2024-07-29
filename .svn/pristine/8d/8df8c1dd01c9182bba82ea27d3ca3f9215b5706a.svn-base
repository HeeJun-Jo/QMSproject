package com.qms.plan.controller;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qms.common.service.ExcelService;
import com.qms.plan.service.PlanService;
import com.qms.plan.vo.PlanInfoVO;
import com.qms.product.vo.ProductVO;
import com.qms.table.vo.system.PartnerInfoVO;
import com.qms.table.vo.user.UserInfoVO;
import com.qms.util.Constant;
import com.qms.util.ExcelConstant;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class PlanController {
	@Autowired
	PlanService service;
	
	@Autowired
	ExcelService excelService;
	
	// 생산 계획 등록 페이지
	@RequestMapping("/plan/planList")
	public String planList() throws Exception{
		
		return "/plan/plan01";
	}
	
	// 파트너 조회
	@RequestMapping("/plan/selectPartnerInfo")
	@ResponseBody
	public List<PartnerInfoVO> selectPartnerInfo(@ModelAttribute PlanInfoVO vo)throws Exception{
		
		List<PartnerInfoVO> list = service.selectPartnerInfo(vo);
		
		return list;
	}
	
	// 계획리스트 조회
	@RequestMapping("/plan/selectPlanList")
	@ResponseBody
	public List<PlanInfoVO> selectPlanList(@ModelAttribute PlanInfoVO vo)throws Exception{
		
		List<PlanInfoVO> list = service.selectPlanList(vo);
		
		return list;
	}
	
	// 생산 계획 저장
	@RequestMapping("/plan/insertPlan")
	@ResponseBody
	public int insertPlan(@ModelAttribute("PlanInfoVO")PlanInfoVO vo, HttpServletRequest request)throws Exception{
	    
		HttpSession session  = request.getSession();
	    UserInfoVO uservo = (UserInfoVO) session.getAttribute("MallUser");
	    vo.setRegUserId(uservo.getUserId());
		
		int cnt = 0; 
		
		service.deletePlan(vo);
		
		cnt += service.insertPlan(vo);
		
		return cnt;
	}

	// 소요 자제 조회 페이지
	@RequestMapping("/plan/planQty")
	public String planQtyList() throws Exception{
		
		return "/plan/planQty01";
	}
	
	// 소요 자제 조회
	@RequestMapping("/plan/planQtyList")
	@ResponseBody
	public List<PlanInfoVO> selectPlanQtyList(@ModelAttribute PlanInfoVO vo)throws Exception{
		
		List<PlanInfoVO> list = service.selectPlanQtyList(vo);
		
		return list;
	}
	
	// bom 자재 품목 조회
	@RequestMapping("/plan/planQtyBomList")
	@ResponseBody
	public List<PlanInfoVO> selectPlanQtyBomList(@ModelAttribute PlanInfoVO vo)throws Exception{
		
		List<PlanInfoVO> list = service.selectPlanQtyBomList(vo);
		
		return list;
	}
	// 엑셀 다운로드
		@RequestMapping("/planQty/createExcel")
	    @ResponseBody
	    public Workbook downloadExcel(@ModelAttribute("PlanInfoVO") PlanInfoVO vo, HttpServletResponse response) throws Exception {
	        // 데이터 가져오기
			List<PlanInfoVO> list1 = service.selectPlanQtyListExcel(vo);
	        List<PlanInfoVO> list2 = service.selectPlanQtyBomListExcel(vo);

	        // 파일 이름 설정
	        String fileName = "planQty.xlsx";
	        
	        // 시트별 데이터와 헤더 맵 설정
	        Map<String, List<?>> dataMap = new HashMap<>();
	        dataMap.put("PlanQtyList", list1);
	        dataMap.put("PlanQtyBomList", list2);
	        
	        Map<String, Map<String, String>> headerMap = new HashMap<>();
	        headerMap.put("PlanQtyList", ExcelConstant.getPlanQtyListHeaderMap());
	        headerMap.put("PlanQtyBomList", ExcelConstant.getPlanQtyBomListHeaderMap());
	        
	        // 엑셀 파일 생성 및 다운로드
	        return excelService.downloadExcel(response, dataMap, fileName, headerMap);
	}
	// 계획/주문수량 엑셀 다운로드
    @PostMapping("/plan/PlanOrderQtyExcel")
	public ResponseEntity<byte[]> downloadExcel(@ModelAttribute("PlanInfoVO")PlanInfoVO vo) throws Exception {
	    Map<String, Object> parameters = new HashMap<>();
	    
	    
	    Calendar cal = Calendar.getInstance();

	    cal.set(Integer.parseInt(vo.getPlanYear()),Integer.parseInt(vo.getPlanMonth())-1,1);

	    System.out.println(cal.getActualMaximum(Calendar.DAY_OF_MONTH));

	    

	    String[] headers = Constant.PLAN_HEADER;
	    String[] dateHeaders = new String[cal.getActualMaximum(Calendar.DAY_OF_MONTH)];
	    String[] dateCol = new String[cal.getActualMaximum(Calendar.DAY_OF_MONTH)];
	    
	    List<Map<String, Object>> dataList = excelService.selectQtyToExcel(vo);
	    for(int i = 1; i <=cal.getActualMaximum(Calendar.DAY_OF_MONTH); i++) {
	    	dateHeaders[i-1] = i+"일";
	    	dateCol[i-1] = "d"+i;
	    }
	    
	    String[] arr3 = new String[headers.length + dateHeaders.length];
	    System.arraycopy(headers, 0, arr3, 0, headers.length);
	    System.arraycopy(dateHeaders, 0, arr3, headers.length, dateHeaders.length);
	    
	     
	    
	    //String[] columns = ExcelConstant.PLAN_COLUMN;
	    String[] columns = Constant.PLAN_COLUMN;
	    
	    String[] arrCol = new String[columns.length + dateCol.length];
	    System.arraycopy(columns, 0, arrCol, 0, columns.length);
	    System.arraycopy(dateCol, 0, arrCol, columns.length, dateCol.length);
	    
	    
	    String sheetName = "생산계획관리";
	    String filenName = "PlanOrderQty.xlsx";
	    return excelService.createExcelFile(dataList, arrCol, arr3, filenName , sheetName);
	}
	
	// 생산 계획 조회 페이지
	@RequestMapping("/plan/searchPlan")
	public String searchPlan()throws Exception{
		return "/plan/plan02";
	}
	
	// 계획수량 다운로드
    @PostMapping("/plan/planQtyExcel")
	public ResponseEntity<byte[]> downloadPlanExcel(@ModelAttribute("PlanInfoVO")PlanInfoVO vo) throws Exception {
	    Map<String, Object> parameters = new HashMap<>();
	    
	    
	    Calendar cal = Calendar.getInstance();

	    cal.set(Integer.parseInt(vo.getPlanYear()),Integer.parseInt(vo.getPlanMonth())-1,1);

	    System.out.println(cal.getActualMaximum(Calendar.DAY_OF_MONTH));

	    

	    String[] headers = Constant.PLANQTY_HEADER;
	    String[] dateHeaders = new String[cal.getActualMaximum(Calendar.DAY_OF_MONTH)];
	    String[] dateCol = new String[cal.getActualMaximum(Calendar.DAY_OF_MONTH)];
	    
	    List<Map<String, Object>> dataList = excelService.selectPlanQtyToExcel(vo);
	    for(int i = 1; i <=cal.getActualMaximum(Calendar.DAY_OF_MONTH); i++) {
	    	dateHeaders[i-1] = i+"일";
	    	dateCol[i-1] = "d"+i;
	    }
	    
	    String[] arr3 = new String[headers.length + dateHeaders.length];
	    System.arraycopy(headers, 0, arr3, 0, headers.length);
	    System.arraycopy(dateHeaders, 0, arr3, headers.length, dateHeaders.length);
	    
	     
	    
	    //String[] columns = ExcelConstant.PLAN_COLUMN;
	    String[] columns = Constant.PLANQTY_COLUMN;
	    
	    String[] arrCol = new String[columns.length + dateCol.length];
	    System.arraycopy(columns, 0, arrCol, 0, columns.length);
	    System.arraycopy(dateCol, 0, arrCol, columns.length, dateCol.length);
	    
	    
	    String sheetName = "생산계획수량";
	    String filenName = "PlanQty.xlsx";
	    return excelService.createExcelFile(dataList, arrCol, arr3, filenName , sheetName);
	}
	
	// 생산 실적 조회 페이지
	@RequestMapping("/plan/productPerform")
	public String productPerform() throws Exception{
		return "/plan/plan04";
	}
	
	// 생산 실적 조회
		@RequestMapping("/plan/selectProductInfo")
		@ResponseBody
		public List<ProductVO> selectProductInfo(@ModelAttribute ProductVO vo)throws Exception{
			
			List<ProductVO> list = service.selectProductInfo(vo);
			
			return list;
		}
}
