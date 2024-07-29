package com.qms.excel;


import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@Data
public class ExcelVO {
	@JsonIgnore
	private MultipartFile excelFile;
	private String regUserId;
	private String itemCd;
	
}
