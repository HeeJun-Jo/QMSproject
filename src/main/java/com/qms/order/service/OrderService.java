package com.qms.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qms.order.dao.OrderDao;
import com.qms.order.vo.OrderVO;
import com.qms.receive.vo.RcvVO;
import com.qms.table.vo.receive.RcvInfoVO;

@Service
public class OrderService {

	@Autowired
	OrderDao dao;

	public int selectTotalOrderCount(OrderVO vo) throws Exception {
		// TODO 자동 생성된 메소드 스텁
		return dao.selectTotalOrderCount(vo);
	}

	public List<OrderVO> selectOrderlist(OrderVO vo) throws Exception {
		// TODO 자동 생성된 메소드 스텁
		return dao.selectOrderlist(vo);
	}

	public  List<OrderVO> selectOrderDtlList(OrderVO vo) throws Exception {
		// TODO 자동 생성된 메소드 스텁
		return dao.selectOrderDtlList(vo);
	}

	public int insertOrderList(OrderVO vo) throws Exception{
		
		return dao.insertOrderList(vo);
	}

	public int updateOrderList(OrderVO vo) throws Exception {
		// TODO 자동 생성된 메소드 스텁
		return dao.updateOrderList(vo);
	}

	public int deleteOrder(OrderVO vo) throws Exception{
		// TODO 자동 생성된 메소드 스텁
		return dao.deleteOrder(vo);
	}

	public int insertOrderInfo(OrderVO vo) throws Exception {
		// TODO 자동 생성된 메소드 스텁
		return dao.insertOrderInfo(vo);
	}

	public String selectMaxOrderNo(OrderVO vo) throws Exception {
		// TODO 자동 생성된 메소드 스텁
		return dao.selectMaxOrderNo(vo);
	}

	public int insertOrderDt(OrderVO vo) throws Exception {
		return dao.insertOrderDt(vo);
		
	}

	public int upOrderStatus(OrderVO vo) throws Exception {
		// TODO 자동 생성된 메소드 스텁
		return dao.upOrderStatus(vo);
	}

	

}


	
	
	
	

