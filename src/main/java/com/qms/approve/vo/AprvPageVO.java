package com.qms.approve.vo;

import java.util.List;

import com.qms.table.vo.approve.AprvFileVO;
import com.qms.table.vo.approve.AprvInfoVO;
import com.qms.table.vo.approve.AprvLineVO;
import com.qms.table.vo.common.BaseVO;

import lombok.Data;

@Data
public class AprvPageVO extends AprvVO {
	
	private List<AprvVO> aprvList;
}
