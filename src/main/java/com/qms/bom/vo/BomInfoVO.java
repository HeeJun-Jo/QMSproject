package com.qms.bom.vo;

import java.util.List;

import com.qms.table.vo.common.BaseVO;

import lombok.Data;

@Data
public class BomInfoVO extends BaseVO{
	
	public String itemCd;
	public String useYn;
	public String regDt;
	public String regUserId;
	public String updDt;
	public String updUserId;
	public String sitemCd;
	public String bomLevel;
	public String upSitemCd;
	public String insQty;
	public String sitemName;
	
	public List<BomInfoVO> bomDtlList;
	public List<BomInfoVO> dtlList;
	
	// 조건 추가
	public String itemName;
	public String itemType;
	public String unitType;
	
}
