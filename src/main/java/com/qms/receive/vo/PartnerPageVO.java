package com.qms.receive.vo;

import java.util.List;

import com.qms.partner.vo.PartnerVO;

import lombok.Data;

@Data
public class PartnerPageVO extends PartnerVO{
	

	private List<PartnerVO> partnerList;
	
}
