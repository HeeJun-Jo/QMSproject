package com.qms.approve.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qms.approve.service.NoticeService2;
import com.qms.approve.vo.ApproveVO;
import com.qms.approve.vo.NoticeVO;
import com.qms.approve.vo.ScheduleVO;
import com.qms.table.vo.approve.AprvLineVO;
import com.qms.table.vo.user.UserInfoVO;
import com.qms.util.Constant;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;



@Controller
public class NoticeController2 {

	@Autowired
	NoticeService2 service;
	
	@RequestMapping("/board/list2")
	public String notice2(Model model) throws Exception{
	model.addAttribute("BASE_YEAR",Constant.BASE_YEAR);	
		return "board/notice02";
	}
	

	@RequestMapping("/board/insertSc")
    @ResponseBody
    public int insertSchedule(@ModelAttribute("ScheduleVO") ScheduleVO vo,  HttpServletRequest request) throws Exception{
					
		HttpSession session = request.getSession();
		UserInfoVO uservo =  (UserInfoVO)session.getAttribute("MallUser");
			
		 List<ScheduleVO> scLineList = vo.getScLineList();
	        for (int i = 0; i < scLineList.size(); i++) {
	        	ScheduleVO scLineVO = scLineList.get(i);
	        	scLineVO.setUserId(uservo.getUserId());
	        	scLineVO.setScStTm(scLineVO.getScStTmHr() + scLineVO.getScStTmMin());
	        	scLineVO.setScEnTm(scLineVO.getScEnTmHr() + scLineVO.getScEnTmMin());
	        	
	        	int a = service.insertScInfo(scLineVO); 
          }

		return 1;
	
    }	
	
	@RequestMapping("/board/scheduleList")
    @ResponseBody
    public ScheduleVO scList(@ModelAttribute("ScheduleVO") ScheduleVO vo,  HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		UserInfoVO uservo =  (UserInfoVO)session.getAttribute("MallUser");
		
		List<ScheduleVO> list = service.selectScList(vo);
		
		vo.setScList(list);
		vo.setUserId(uservo.getUserId());
	
		return vo;
	}
	
	@RequestMapping("/board/delscheduleList")
    @ResponseBody
    public int delSchedule(@ModelAttribute("ScheduleVO") ScheduleVO vo,  HttpServletRequest request) throws Exception{
					
		HttpSession session = request.getSession();
		UserInfoVO uservo =  (UserInfoVO)session.getAttribute("MallUser");
				
		vo.setUserId(uservo.getUserId());
	   
		
		int a = service.deleteSchedule(vo);
   	
		return a;
	
    }
	

}