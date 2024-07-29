package com.qms.login.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qms.login.service.LoginService;
import com.qms.table.vo.common.MessageVO;
import com.qms.user.vo.UserVO;
import com.qms.util.AesUtil;
import com.qms.util.Constant;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller	
public class LoginController {
	
	
	@Autowired
	LoginService service;
	
	@RequestMapping("/login")
	public String login() throws Exception {
		return "login";
	}
	
	@RequestMapping("/findPwd")
	@ResponseBody
	public UserVO findPwd(@ModelAttribute UserVO vo) throws Exception {
		
		vo = service.selectUserPwdInfo(vo);
		
		String decodedPwd = AesUtil.aesDecode(vo.getUserPwd());
        vo.setUserPwd(decodedPwd);
		
	    return vo;
	}
	
	@RequestMapping("loginProcess")
	@ResponseBody
	public MessageVO loginProcess(@ModelAttribute UserVO vo, HttpServletRequest request) throws Exception{
		
		MessageVO msgvo = new MessageVO();
		vo.setComGrpCd(Constant.POSITION_CD);
		String pwd = AesUtil.aesEncode(vo.getUserPwd());
		System.out.println(pwd);
		
		vo = service.selectUserInfo(vo);
		
		if(vo!=null) {	//등록 아이디일 경우
			if ("Y".equals(vo.getLeaveYn())) {  // 퇴사자 여부 확인
	            msgvo.setResult(false);
	            msgvo.setMsg("퇴사자는 로그인할 수 없습니다.");
			} else if(vo.getUserPwd().equals(pwd)) {  //동일한 패스워드일 경우.
				//세션저장
				HttpSession session = request.getSession();
				 session.setAttribute("MallUser", vo);
				msgvo.setResult(true);
				
			}else {	//패스워드가 동일하지 않을 경우
				msgvo.setResult(false);
				msgvo.setMsg("패스워드가 일치하지 않습니다.");
			}
		}else {  //등록 아이디가 아닐경우
			msgvo.setResult(false);
			msgvo.setMsg("미등록 회원아이디 입니다.");
		}
		return msgvo;
	}
	
	
	@RequestMapping("/logout")
	@ResponseBody
	public int logout(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		 session.setAttribute("MallUser", null);
		return 1;
	}
}
