package com.qms.plan.vo;

import java.util.List;

import com.qms.table.vo.common.BaseVO;

import lombok.Data;

@Data
public class PlanInfoVO extends BaseVO {
	
	private String compCd;
	private String planDt;
	private String itemCd;
	private String planQty;
	private String orderQty;
	
	// 조건추가
	private String compName;
	private String itemName;
	private List<PlanInfoVO> qtyList;

	private String planDtFrom;
	private String planDtTo;
	
	private String sitemCd;
	private String insQty;
	private String boxQty;


	private String planYear;
	private String planMonth;

}
