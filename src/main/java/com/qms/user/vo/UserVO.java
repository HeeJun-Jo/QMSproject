package com.qms.user.vo;

import java.util.List;
import com.qms.table.vo.common.ComCodeVO;
import com.qms.table.vo.user.UserInfoVO;
import lombok.Data;

@Data
public class UserVO extends UserInfoVO{
	private String deptName;	//부서
	private String comName;		//직급
	private String comGrpCd;	//직위코드 ( 공통코드 : US01 )
	
	
	private List<UserInfoVO> userlist; //유저리스트
	
	private List<ComCodeVO> positionlist; 
	
	
	private String deptCd;	 

	private String positionCd; 	 
	
	private String regDtFrom; 	 
	private String regDtTo; 	 
	
	private String updUserId;
}