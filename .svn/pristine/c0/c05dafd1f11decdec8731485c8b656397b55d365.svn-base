package com.qms.system.controller;





import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qms.system.service.PartnerService;
import com.qms.table.vo.system.PartnerInfoVO;
import com.qms.table.vo.user.UserInfoVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;








@Controller
public class PartnerController {

	@Autowired
	PartnerService service;
	
	
	@RequestMapping("/partner/list")
	public String partner() throws Exception{
		
		return "system/partner01";
	}
	@RequestMapping("/partner/ptnSearch")
    @ResponseBody
    public  PartnerInfoVO ptnSearch (@ModelAttribute("PartnerInfoVO") PartnerInfoVO vo) throws Exception{
	

		int totalPage = service.selectPartnerCount(vo);			
		
		List<PartnerInfoVO> list = service.selectptnlist(vo);
		
		
		
		
		vo.setPartnerList(list);
		vo.setTotal(totalPage); //총 데이터수.
		vo.setStartPage(vo.getStartPage()); 
		vo.setCurrentPage(vo.getCurrentPage());//현재페이지
		
				
		
		return vo;
	}	
	@RequestMapping("/partner/partnerDetail")
    @ResponseBody
    public PartnerInfoVO partnerDetail (@ModelAttribute("PartnerInfoVO") PartnerInfoVO vo) throws Exception{
					
		vo = service.selectPartnerDetail(vo);
		
		vo.setPartnerList(service.selectPartnerDtList(vo));
		return vo;
	}

	//신규 등록.
	@RequestMapping("/partner/ptnInsert")
    @ResponseBody
    public int ptnInsert (@ModelAttribute("PartnerInfoVO") PartnerInfoVO vo, HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		UserInfoVO uservo =  (UserInfoVO)session.getAttribute("MallUser");
				
		vo.setRegUserId(uservo.getUserId());
		
		
		int a = service.insertPartnerInfo(vo);
		
		int c = service.insertPartnerItem(vo);
		
		return a;
	}

	//수정
	@RequestMapping("/partner/partnerUpdate")
    @ResponseBody
    public int partnerUpdate (@ModelAttribute("PartnerInfoVO") PartnerInfoVO vo, HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		UserInfoVO uservo =  (UserInfoVO)session.getAttribute("MallUser");
				
		vo.setRegUserId(uservo.getUserId());
			
		
		//1 거래처 정보 수정.
		service.updatePartnerInfo(vo);
		
		
		//2.거래처 아이템을 삭제.
		service.deletePartnerItem(vo);
		
		//3. 거래처 아이템을 등록.
		//itemCd가 빈값은 list에서 제거한다.
		for(int i=vo.getItemInfoList().size()-1;i>=0;i--) {
			if(vo.getItemInfoList().get(i).getItemCd()==null || vo.getItemInfoList().get(i).getItemCd().equals("") ) {
				vo.getItemInfoList().remove(i);  //
			}
		}
		int c = service.insertPartnerItem(vo);
		
		return 1;
	}
}
	
