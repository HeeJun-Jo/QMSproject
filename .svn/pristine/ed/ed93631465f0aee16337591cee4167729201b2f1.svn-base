package com.qms.receive.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qms.receive.dao.RcvDao;
import com.qms.receive.vo.PartnerVO;
import com.qms.receive.vo.RcvVO;
import com.qms.table.vo.receive.RcvInfoVO;

@Service
public class RcvService {

	@Autowired
	RcvDao dao;
	
	// 거래처 조회 페이징
	public int selectTotalPartnerCount(PartnerVO vo)throws Exception{
		return dao.selectTotalPartnerCount(vo);
	}
	
	// 거래처 조회
	public List<PartnerVO> selectPartnerList(PartnerVO vo)throws Exception{
		return dao.selectPartnerList(vo);
	}
	
	// 입고 조회 페이징
	public int selectTotalRcvCount(RcvVO vo)throws Exception{
		return dao.selectTotalRcvCount(vo);
	}
	
	// 입고 조회
	public List<RcvVO> selectRcvList(RcvVO vo)throws Exception{
		return dao.selectRcvList(vo);
	}
	
	// 품목정보 리스트
	public List<RcvVO> selectRcvDtlList(RcvVO vo)throws Exception{
		return dao.selectRcvDtlList(vo);
	}
	
	// 모달 헤더
	public RcvVO selectRcvDtl(RcvVO vo)throws Exception{
		return dao.selectRcvDtl(vo);
	}
	
	// RCV_NO MAX값 가져오기
	public String selectMaxRcvNo(RcvVO vo)throws Exception{
		return dao.selectMaxRcvNo(vo);
	}
	
	// 기존 RCV_INFO 삭제
	public int deleteRcv(RcvVO vo)throws Exception{
		return dao.deleteRcv(vo);
	}
		
	// 기존 RCV_ITEM 삭제
	public int deleteRcvList(RcvVO vo)throws Exception{
		return dao.deleteRcvList(vo);
	}
	
	// RCV_INFO 등록
	public int insertNewRcv(RcvVO vo)throws Exception{
		return dao.insertNewRcv(vo);
	}
	
	// RCV_ITEM 등록
	public int insertNewRcvList(RcvVO vo)throws Exception{
		return dao.insertNewRcvList(vo);
	}
}
