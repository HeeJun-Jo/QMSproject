package com.qms.receive.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qms.receive.service.ReceiveService;
import com.qms.receive.vo.RcvVO;
import com.qms.table.vo.receive.RcvInfoVO;
import com.qms.table.vo.user.UserInfoVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;



@Controller
public class ReceiveController {

	@Autowired
	ReceiveService service;
	
	
	

	@RequestMapping("/receive/list")
	public String receive() throws Exception{
		
		return "receive/receive01";
	}
	
	
	@RequestMapping("/receive/rcvSearch")
    @ResponseBody
    public RcvVO getRcvList(@ModelAttribute("RcvVO") RcvVO vo  ) throws Exception {
	//	HttpSession session = request.getSession();
	//	UserInfoVO uservo =  (UserInfoVO)session.getAttribute("MallUser");
		
	//	vo.setUserId(uservo.getUserId());                                       HttpServletRequest request
		
		//int totalPage = service.selectTotalNoticeCount(vo); 
	
	//	List<RcvInfoVO> list = service.selectRcvInfo(vo);
		
	//	vo.setReceivelist(list);
	//	vo.setTotal(totalPage); //총 데이터수.
	//	vo.setStartPage(vo.getStartPage()); 
	//	vo.setCurrentPage(vo.getCurrentPage());//현재페이지
		
		
		return vo;
	
    }

}