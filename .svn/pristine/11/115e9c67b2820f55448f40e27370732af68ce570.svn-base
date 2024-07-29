package com.qms.pplan.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qms.common.service.ExcelService;
import com.qms.pplan.service.PplanService;
import com.qms.pplan.vo.PplanVO;
import com.qms.user.vo.UserVO;
import com.qms.util.ExcelConstant;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class PplanController {

	@Autowired
	PplanService service;
	
	@Autowired
	ExcelService excelservice;
	
	@RequestMapping("/pplan")
	public String pplanwrite() throws Exception{
		return "pplan/pplan";
	}
	
	@RequestMapping("/pplan/selectPlanList")
	@ResponseBody
	public PplanVO search(@ModelAttribute("PplanVO") PplanVO vo) throws Exception {
	    List<PplanVO> list = service.selectPlanList(vo);
	    vo.setPlanlist(list);
	    return vo;
	}
	
	@RequestMapping("/pplan/insertPlan")
	@ResponseBody
	public int insertPlan(PplanVO vo, HttpServletRequest request) throws Exception {
	    // 현재 세션에서 로그인한 사용자 정보 가져오기
	    HttpSession session = request.getSession();
	    UserVO uservo = (UserVO) session.getAttribute("MallUser");

	    // 사용자 정보를 생산계획 VO에 설정
	    vo.setRegUserId(uservo.getUserId());

	    // 생산계획 삭제
	    int c = service.deletePlanInfo(vo);

	    // 생산계획 저장
	    c = service.insertPlanInfo(vo);

	    // 처리된 행의 수 반환
	    return c;
	}
	
	// pplan 엑셀 저장
    @RequestMapping("/pplan/createExcel")
    @ResponseBody
    public Workbook downloadExcel(@ModelAttribute("PplanVO") PplanVO vo, HttpServletResponse response) throws Exception {
        // 데이터 조회
        int dayCount = 0;
        List<HashMap<String, Object>> list = service.selectPlanListExcel(vo);
        for (HashMap<String, Object> map : list) {
            String[] dayQty = map.get("ALL_QTY").toString().split(",");
            dayCount = dayQty.length;
            for (String dayQtyEntry : dayQty) {
                String[] colQty = dayQtyEntry.split("-");
                map.put("d" + colQty[0], colQty[1] + "/" + colQty[2]);
            }
        }

        // 파일 이름 설정
        String fileName = "pplan.xlsx";

        // 시트 데이터와 헤더 맵 설정
        Map<String, List<?>> dataMap = new HashMap<>();
        dataMap.put("pplanList", list);

        // 사용자 지정 헤더 맵 설정
        Map<String, String> header = ExcelConstant.getPplanHeaderMap();
        for (int i = 1; i <= dayCount; i++) {
            String key = (i < 10) ? "d0" + i : "d" + i;
            String value = (i < 10) ? "0" + i + "일" : i + "일";
            header.put(key, value);
        }

        Map<String, Map<String, String>> headerMap = new HashMap<>();
        headerMap.put("pplanList", header);

        // 엑셀 파일 생성 및 다운로드
        return excelservice.downloadExcel(response, dataMap, fileName, headerMap);
    }

}
