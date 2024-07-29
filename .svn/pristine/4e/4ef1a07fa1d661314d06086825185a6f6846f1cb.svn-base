package com.qms.item.dao;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.qms.excel.ExcelVO;
import com.qms.item.vo.ItemVO;
import com.qms.table.vo.item.ItemInfoVO;

@Repository
public interface ItemDao {

	// 제품 조회하기
	public List<ItemInfoVO> selectItemList(ItemInfoVO vo)throws Exception;
	
	// 페이징
	public int selectTotalItemCount(ItemInfoVO vo)throws Exception;
	
	// 제품 상세조회
	public ItemInfoVO selectItemDtl(ItemInfoVO vo)throws Exception;
	
	// 제품 신규등록
	public int insertItem(ItemVO vo)throws Exception;
	
	// 제품 수정
	public int updateItem(ItemVO vo)throws Exception;
	
	// 제품 조회하기(Excel용)
	public List<ItemVO> selectItemListExcel(ItemVO vo)throws Exception;
	
	// 기존 데이터 삭제
	public int deleteExcel(ExcelVO vo)throws Exception;
	
	// 엑셀 업로드
	public int insertExcel(List<String> cellDataList)throws Exception;
	
	
}
