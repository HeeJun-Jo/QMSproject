package com.qms.receive.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qms.receive.service.RcvService;
import com.qms.receive.vo.PartnerPageVO;
import com.qms.receive.vo.PartnerVO;
import com.qms.receive.vo.RcvVO;
import com.qms.table.vo.receive.RcvInfoVO;
import com.qms.table.vo.user.UserInfoVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class RcvController {

	@Autowired
	RcvService service;
	
	
	// 입고조회
	@RequestMapping("/receive/receiveSearch")
	public String receiveSearch(PartnerVO vo, HttpServletRequest request) throws Exception{
		HttpSession session  = request.getSession();
	    UserInfoVO uservo = (UserInfoVO) session.getAttribute("MallUser");
	    //vo.setRegUserId(uservo.getUserId());
		return "/receive/rcv01";
	}
	
	// 거래처 팝업
	@RequestMapping("/receive/partnerSearch")
	public String partnerSearch() throws Exception{
		return "/receive/receive01pop1";
	}
	
	// 아이템 팝업
	@RequestMapping("/receive/itemSearch")
	public String itemSearch() throws Exception{
		return "/receive/receive01pop2";
	}
	// 입고 조회
	@RequestMapping("/receive/selectRcvList")
	@ResponseBody
	public RcvVO selectRcvList(@ModelAttribute("RcvVO")RcvVO vo)throws Exception{
		int totalPage = 0;
		
		RcvVO rcvvo = new RcvVO();
		totalPage = service.selectTotalRcvCount(vo);
		List<RcvVO> list = service.selectRcvList(vo);
		
		rcvvo.setRcvList(list);
		rcvvo.setTotal(totalPage); // 총 데이터 수
		rcvvo.setStartPage(vo.getStartPage());
		rcvvo.setCurrentPage(vo.getCurrentPage()); // 현재 페이지
		
		return rcvvo;
	}
	
	// 거래처 조회
	@RequestMapping("/receive/getPartnerList")
	@ResponseBody
	public PartnerPageVO getPartnerList(@ModelAttribute("PartnerVO")PartnerVO vo)throws Exception{
		
		int totalPage = 0;
		
		PartnerPageVO pagevo = new PartnerPageVO();
		totalPage = service.selectTotalPartnerCount(vo);
		List<PartnerVO> list = service.selectPartnerList(vo);
		
		pagevo.setPartnerList(list);
		pagevo.setTotal(totalPage); // 총 데이터 수
		pagevo.setStartPage(vo.getStartPage());
		pagevo.setCurrentPage(vo.getCurrentPage()); // 현재 페이지
		
		return pagevo;
	}
	
	// 수정 모달창
	@RequestMapping("/receive/getRcvDtlList")
	@ResponseBody
	public RcvVO getRcvDtlList(@ModelAttribute("RcvVO") RcvVO vo)throws Exception{
		// 모달 헤더
		vo = service.selectRcvDtl(vo);
		
		// 품목 정보 리스트
		vo.setRcvDtlList(service.selectRcvDtlList(vo));
		
		return vo;
	}
	
	// 입고 등록
	@RequestMapping("/receive/insertRcvDtl")
	@ResponseBody
	public int insertRcvDtl(@ModelAttribute("RcvVO")RcvVO vo, HttpServletRequest request) throws Exception{
		HttpSession session  = request.getSession();
	    UserInfoVO uservo = (UserInfoVO) session.getAttribute("MallUser");
	    vo.setRegUserId(uservo.getUserId());
	    
	    if(vo.getRcvNo().isEmpty()) {
	    	
	    	vo.setRcvNo(service.selectMaxRcvNo(vo)); // RCV_NO MAX값 가져오기
	    	
	    	service.insertNewRcv(vo); // RCV_INFO 등록
	    	
	    	service.insertNewRcvList(vo); // RCV_ITEM 등록
	    }else {
	    	service.deleteRcv(vo); // 기존 데이터 삭제
	    	service.deleteRcvList(vo);
	    	
	    	service.insertNewRcv(vo); // RCV_INFO 등록
	    	
	    	service.insertNewRcvList(vo); // RCV_ITEM 등록
	    }
	    
	    return 1;
	}

	
	
}
