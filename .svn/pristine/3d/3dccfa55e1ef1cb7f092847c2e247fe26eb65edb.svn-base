package com.qms.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qms.table.vo.user.UserInfoVO;
import com.qms.user.service.UserService;
import com.qms.user.vo.UserVO;
import com.qms.util.Constant;

@Controller
public class UserController {
	
	@Autowired
	UserService service;
	
	
	@RequestMapping("/approve/aprvpop01")
	public String aprvpop01() throws Exception {
		return "/approve/aprvpop01";
	}
	
	@RequestMapping("/approve/userSearch")
	@ResponseBody
	public UserVO search(@ModelAttribute("UserVO") UserVO vo) throws Exception {
		vo.setComGrpCd(Constant.POSITION_CD);
	    int totalPage = service.selectUserSearchCount(vo); 
	    
	    List<UserInfoVO> list = service.selectUserSearch(vo);
	    vo.setUserlist(list);
	    vo.setTotal(totalPage); // 총 데이터 수.
	    vo.setStartPage(vo.getStartPage());
	    vo.setCurrentPage(vo.getCurrentPage()); // 현재 페이지

	    return vo;
	}
	
}