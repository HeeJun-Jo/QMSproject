package com.qms.item.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qms.excel.ExcelVO;
import com.qms.item.dao.ItemDao;
import com.qms.item.vo.ItemVO;
import com.qms.table.vo.item.ItemInfoVO;

@Service
public class ItemService {

	@Autowired
	ItemDao dao;
	
	// 제품 조회하기
	public List<ItemInfoVO> selectItemList(ItemInfoVO vo) throws Exception{
		return dao.selectItemList(vo);
	}
	
	// 페이징
	public int selectTotalItemCount(ItemInfoVO vo)throws Exception{
		return dao.selectTotalItemCount(vo);
	}
	
	// 제품 상세조회
	public ItemInfoVO selectItemDtl(ItemInfoVO vo)throws Exception{
		return dao.selectItemDtl(vo);
	}
	
	// 제품 신규등록
	public int insertItem(ItemVO vo)throws Exception{
		return dao.insertItem(vo);
	}
	
	// 제품 수정
	public int updateItem(ItemVO vo)throws Exception{
		return dao.updateItem(vo);
	}
	
	// 제품 조회하기(Excel용)
	public List<ItemVO> selectItemListExcel(ItemVO vo) throws Exception{
		return dao.selectItemListExcel(vo);
	}
	
	// 기존 데이터 삭제
	public int deleteExcel(ExcelVO vo)throws Exception{
		return dao.deleteExcel(vo);
	}
	
	// 엑셀 업로드
	public int insertExcel(List<String> cellDataList)throws Exception{
		return dao.insertExcel(cellDataList);
	}
}
