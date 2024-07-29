package com.qms.order.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qms.order.service.OrderService;
import com.qms.order.vo.OrderVO;
import com.qms.table.vo.user.UserInfoVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;



@Controller
public class OrderController {

	@Autowired
	OrderService service;
	
	
	@RequestMapping("/order/list")
	public String order() throws Exception{
		
		return "order/order01";
	}
	
	@RequestMapping("/order/orderSearch")
    @ResponseBody
    public OrderVO getOrderList(@ModelAttribute("OrderVO") OrderVO vo, HttpServletRequest request  ) throws Exception {
		HttpSession session = request.getSession();
		UserInfoVO uservo =  (UserInfoVO)session.getAttribute("MallUser");
		
		vo.setUserId(uservo.getUserId());                                      
		
	    int totalPage = service.selectTotalOrderCount(vo); 
	
		List<OrderVO> list = service.selectOrderlist(vo);
		
		vo.setOrderlist(list);
		vo.setTotal(totalPage); //총 데이터수.
		vo.setStartPage(vo.getStartPage()); 
		vo.setCurrentPage(vo.getCurrentPage());//현재페이지
		
		
		return vo;
	
    }
	
	@RequestMapping("/order/orderDtl")
    @ResponseBody
    public OrderVO getOrderDtlList(@ModelAttribute("OrderVO") OrderVO vo, HttpServletRequest request  ) throws Exception {
		HttpSession session = request.getSession();
		UserInfoVO uservo =  (UserInfoVO)session.getAttribute("MallUser");
		
		vo.setUserId(uservo.getUserId());                                      
		
	    int totalPage = service.selectTotalOrderCount(vo); 
	
	    List<OrderVO> list = service.selectOrderDtlList(vo);
		
	    vo.setOrderDtlList(list);
		vo.setTotal(totalPage); //총 데이터수.
		vo.setStartPage(vo.getStartPage()); 
		vo.setCurrentPage(vo.getCurrentPage());//현재페이지
		
		
		return vo;
		
    }
	
	
	
	@RequestMapping("/receive/searchPartner")
	@ResponseBody
	public String searchPartner() throws Exception{
		return "/receive/receive01pop1";
	}
	
	@RequestMapping("/order/updateOrder")
    @ResponseBody
    public int updateOrder(@ModelAttribute("OrderVO") OrderVO vo, HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		UserInfoVO uservo =  (UserInfoVO)session.getAttribute("MallUser");
		
		vo.setUserId(uservo.getUserId());     
		
		int a = service.deleteOrder(vo);
		// 방법1
		for(int i=0;i<vo.getOrderlist().size();i++) {
	    if(vo.getOrderlist().get(i).getItemCd()!=null) {	
	    	vo.setItemCd(vo.getOrderlist().get(i).getItemCd());
	    	vo.setOrderQty(vo.getOrderlist().get(i).getOrderQty());
	    	vo.setOrderPrice(vo.getOrderlist().get(i).getOrderPrice());
	    	service.updateOrderList(vo);
		    }
	    service.insertOrderDt(vo);
		}
		return a;
	
    }
	
	@RequestMapping("/order/insertOrder")
    @ResponseBody
    public int insertOrder(@ModelAttribute("OrderVO") OrderVO vo, HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		UserInfoVO uservo =  (UserInfoVO)session.getAttribute("MallUser");
		
		vo.setUserId(uservo.getUserId());     
		
		 String maxOrderNo = service.selectMaxOrderNo(vo);
		vo.setOrderNo(maxOrderNo);
		   service.insertOrderInfo(vo);
		
		for(int i=0;i<vo.getOrderlist().size();i++) {
			if(vo.getOrderlist().get(i).getItemCd()!=null) {	
				vo.setItemCd(vo.getOrderlist().get(i).getItemCd());
				vo.setOrderQty(vo.getOrderlist().get(i).getOrderQty());
				vo.setOrderPrice(vo.getOrderlist().get(i).getOrderPrice());
				service.updateOrderList(vo);
				}
		
	}
				
		return 1;
	
    }
	
	@RequestMapping("/order/upOrderStatus")
    @ResponseBody
    public int upOrderStatus(@ModelAttribute("OrderVO") OrderVO vo) throws Exception{ 
	
	int a = service.upOrderStatus(vo);
	
	return  a ;
	}
	
	
	
	}