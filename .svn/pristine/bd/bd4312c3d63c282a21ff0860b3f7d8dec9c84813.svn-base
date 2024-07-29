package com.qms.pplan.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.qms.pplan.vo.PplanVO;

@Repository
public interface PplanDao {
	
	//생산계획조회
	public List<PplanVO> selectPlanList(PplanVO vo) throws Exception;
	
	//생산계획삭제
	public int deletePlanInfo(PplanVO vo) throws Exception;
	
	//생산계획저장
	public int insertPlanInfo(PplanVO vo) throws Exception;
	
	//생산계획조회 액셀
	public  List<HashMap<String, Object>> selectPlanListExcel(PplanVO vo) throws Exception;

}