package com.qms.plan.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.qms.plan.vo.PlanInfoVO;
import com.qms.product.vo.ProductVO;
import com.qms.table.vo.system.PartnerInfoVO;

@Repository
public interface PlanDao {

	public List<PartnerInfoVO> selectPartnerInfo(PlanInfoVO vo)throws Exception;
	
	// 계획리스트 조회
	public List<PlanInfoVO> selectPlanList(PlanInfoVO vo)throws Exception;
	
	// 생산 계획 저장 프로세스
	public int deletePlan(PlanInfoVO vo)throws Exception;
	public int insertPlan(PlanInfoVO vo)throws Exception;
	
	// 생산 실적 조회
	public List<ProductVO> selectProductInfo(ProductVO vo)throws Exception;
	
	// 소요자제 조회
	public List<PlanInfoVO> selectPlanQtyList(PlanInfoVO vo)throws Exception;
		
	// bom 자재 조회
	public List<PlanInfoVO> selectPlanQtyBomList(PlanInfoVO vo)throws Exception;
		
	// 소요자제 Excel
	public List<PlanInfoVO> selectPlanQtyListExcel(PlanInfoVO vo)throws Exception;
		
	// bom 자재 Excel
	public List<PlanInfoVO> selectPlanQtyBomListExcel(PlanInfoVO vo)throws Exception;
}
