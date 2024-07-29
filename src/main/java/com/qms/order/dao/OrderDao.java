package com.qms.order.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.qms.approve.vo.NoticeVO;
import com.qms.order.vo.OrderVO;
import com.qms.receive.vo.RcvVO;
import com.qms.table.vo.approve.NoticeInfoVO;
import com.qms.table.vo.receive.RcvInfoVO;


@Repository
public interface OrderDao {

	int selectTotalOrderCount(OrderVO vo) throws Exception;

	public List<OrderVO> selectOrderlist(OrderVO vo) throws Exception;

	public List<OrderVO> selectOrderDtlList(OrderVO vo) throws Exception;

	int insertOrderList(OrderVO vo) throws Exception;

	int updateOrderList(OrderVO vo) throws Exception;

	int deleteOrder(OrderVO vo) throws Exception;

	int insertOrderInfo(OrderVO vo) throws Exception;

	String selectMaxOrderNo(OrderVO vo) throws Exception;

	int insertOrderDt(OrderVO vo) throws Exception;

	int upOrderStatus(OrderVO vo) throws Exception;

	
	
}
