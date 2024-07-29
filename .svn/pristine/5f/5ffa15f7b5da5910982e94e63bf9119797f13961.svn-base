package com.qms.pplan.service;

import com.qms.pplan.dao.PplanDao;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qms.pplan.dao.PplanDao;
import com.qms.pplan.vo.PplanVO;

@Service
public class PplanService {

    @Autowired
    PplanDao pplanDao;

    // 생산 계획 조회
    public List<PplanVO> selectPlanList(PplanVO vo) throws Exception {
        return pplanDao.selectPlanList(vo);
    }

    // 생산 계획 저장
    public int insertPlanInfo(PplanVO vo) throws Exception {
        return pplanDao.insertPlanInfo(vo);
    }

    // 생산 계획 조회 (Excel)
    public List<HashMap<String, Object>> selectPlanListExcel(PplanVO vo) throws Exception {
        return pplanDao.selectPlanListExcel(vo);
    }

    // 생산 계획 삭제
    public int deletePlanInfo(PplanVO vo) throws Exception {
        return pplanDao.deletePlanInfo(vo);
    }
}
