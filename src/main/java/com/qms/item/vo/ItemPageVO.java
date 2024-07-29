package com.qms.item.vo;

import java.util.List;

import com.qms.table.vo.item.ItemInfoVO;

import lombok.Data;

@Data
public class ItemPageVO extends ItemVO{
	
	private List<ItemInfoVO> itemlist;
}
