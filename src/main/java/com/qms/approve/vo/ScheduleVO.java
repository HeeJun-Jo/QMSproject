package com.qms.approve.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.qms.table.vo.approve.NoticeInfoVO;

import lombok.Data;

@Data
public class ScheduleVO  {
	
	private String scEnDt;        //끝나는날
	private String scStDt;        //시작일
	private String scSeq;        //사용자
	private String content;       //내용
	private String scStatus;      //진행상태			
    private String scStTm;
    private String scEnTm;
	private String userId;
	private List<ScheduleVO> scList;
	private List<ScheduleVO> scLineList;

	private String scStTmHr;
	private String scStTmMin;
	private String scEnTmHr;
	private String scEnTmMin;
	private String comName;
	private String regDt;
	
}

