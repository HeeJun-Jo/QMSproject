package com.qms.bom.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qms.bom.dao.BomDao;
import com.qms.bom.vo.BomInfoVO;
import com.qms.item.vo.ItemVO;

@Service
public class BomService {

	@Autowired
	BomDao dao;
	
	// BOM 조회하기
	public List<ItemVO> selectBomList(ItemVO vo)throws Exception{
		return dao.selectBomList(vo);
	}
	
	// 페이징
	public int selectTotalBomCount(ItemVO vo)throws Exception{
		return dao.selectTotalBomCount(vo);
	}
	
	// BOM 상세조회
	public BomInfoVO selectBomDtl(BomInfoVO vo)throws Exception{
		return dao.selectBomDtl(vo);
	}
	
	// BOM 자재리스트 조회
	public List<BomInfoVO> selectBomDtlList(BomInfoVO vo)throws Exception{
		return dao.selectBomDtlList(vo);
	}
	
	// BOM_DTL 삭제
	public int deleteBom(BomInfoVO vo)throws Exception{
		return dao.deleteBom(vo);
	}
	
	// BOM_DTL 신규 등록
	public int insertNewBomDtl(BomInfoVO vo)throws Exception{
		return dao.insertNewBomDtl(vo);
	}
	
	// BOM_INFO 신규 등록
	public int insertNewBom(BomInfoVO vo)throws Exception{
		return dao.insertNewBom(vo);
	}
	
	// BOM Excel 조회하기
	public List<ItemVO> selectBomListExcel(ItemVO vo)throws Exception{
		return dao.selectBomListExcel(vo);
	}
}
