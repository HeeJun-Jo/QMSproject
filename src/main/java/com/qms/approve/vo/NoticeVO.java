package com.qms.approve.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.qms.table.vo.approve.NoticeInfoVO;

import lombok.Data;

@Data
public class NoticeVO extends NoticeInfoVO {
	
	private String userName;
	private String deptCd;
	private String deptName;
	private String noticeTypeName;
	
	private String modifyYn;			//수정여부

	private List<NoticeInfoVO> noticelist;
	
	@JsonIgnore
	private MultipartFile atcFile;
	
	@JsonIgnore
	private List<MultipartFile> fileList;
	
	
}

