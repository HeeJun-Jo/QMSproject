package com.qms.bom.vo;

import java.util.List;

import com.qms.item.vo.ItemVO;

import lombok.Data;

@Data
public class BomPageVO extends BomInfoVO{

	public List<ItemVO> bomlist;
}
