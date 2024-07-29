package com.qms.product.vo;




import java.util.List;

import com.qms.table.vo.common.BaseVO;

import lombok.Data;

@Data
public class ProductVO extends BaseVO {
	private String itemCd;
	private String itemName;
	private String compCd;
	private String compName;
	private String planDt;
	private String productQty;
	private String insQty;
	private String planYear;
	private String planMonth;
	private String sitemCd;
	private String sitemName;
	private String totalQty;
	
	public List <ProductVO> prdList;
	
	
}

	