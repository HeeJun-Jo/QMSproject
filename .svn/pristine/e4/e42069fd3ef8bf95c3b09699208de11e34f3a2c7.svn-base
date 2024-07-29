package com.qms.common.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.qms.plan.vo.PlanInfoVO;

@Repository
public interface ExcelDao {
	
	public List<Map<String, Object>> selectItemListTOexcel(Map<String, Object> parameters) throws Exception;
	
	public List<Map<String, Object>> selectPartnerListTOexcel(Map<String, Object> parameters) throws Exception;
	
	public List<Map<String, Object>> selectReceiveListTOexcel(Map<String, Object> parameters) throws Exception;
	
	public List<Map<String, Object>> selectUserListTOexcel(Map<String, Object> parameters) throws Exception;
	
	// 계획/주문수량 엑셀
	public List<Map<String, Object>> selectQtyToExcel(PlanInfoVO vo) throws Exception ;
	 
	// 계획수량 엑셀
	public List<Map<String, Object>> selectPlanQtyToExcel(PlanInfoVO vo) throws Exception;
}
