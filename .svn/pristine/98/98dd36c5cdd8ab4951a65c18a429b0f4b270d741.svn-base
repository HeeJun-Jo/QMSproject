package com.qms.receive.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.qms.receive.vo.PartnerVO;
import com.qms.receive.vo.RcvVO;
import com.qms.table.vo.receive.RcvInfoVO;

@Repository
public interface RcvDao {

	// 거래처 조회 페이징
	public int selectTotalPartnerCount(PartnerVO vo)throws Exception;
	
	// 거래처 조회
	public List<PartnerVO> selectPartnerList(PartnerVO vo)throws Exception;
	
	// 입고 조회 페이징
	public int selectTotalRcvCount(RcvVO vo)throws Exception;
	
	// 입고 조회
	public List<RcvVO> selectRcvList(RcvVO vo)throws Exception;
	
	// 품목정보 리스트
	public List<RcvVO> selectRcvDtlList(RcvVO vo)throws Exception;
	
	// 모달 헤더
	public RcvVO selectRcvDtl(RcvVO vo)throws Exception;
	
	// RCV_NO MAX값 가져오기
	public String selectMaxRcvNo(RcvVO vo)throws Exception;
	
	// 기존 RCV_INFO 삭제
	public int deleteRcv(RcvVO vo)throws Exception;
		
	// 기존 RCV_ITEM 삭제
	public int deleteRcvList(RcvVO vo)throws Exception;
	
	// RCV_INFO 등록
	public int insertNewRcv(RcvVO vo)throws Exception;
	
	// RCV_ITEM 등록
	public int insertNewRcvList(RcvVO vo)throws Exception;
}
