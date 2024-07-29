package com.qms.item.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.qms.table.vo.common.ComCodeVO;
import com.qms.table.vo.item.ItemInfoVO;

import lombok.Data;

@Data
public class ItemVO extends ItemInfoVO {
	
	// 조건 추가
	private List<ComCodeVO> itemTypeList;
	private List<ComCodeVO> unitTypeList;
	private List<ComCodeVO> boxTypeList;
	private List<ComCodeVO> plantLineList;
	private List<ComCodeVO> locationList;
	
	private String commitType;
	public String bomCnt;
	
	@JsonIgnore
	private MultipartFile excelFile;
}
