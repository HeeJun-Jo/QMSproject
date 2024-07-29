package com.qms.system.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qms.system.dao.PartnerDao;
import com.qms.table.vo.system.PartnerInfoVO;

@Service
public class PartnerService {

	@Autowired
	PartnerDao dao;
	public List<PartnerInfoVO> selectptnlist(PartnerInfoVO vo) throws Exception{
		return dao.selectptnlist(vo);
	}
	public int  selectPartnerCount(PartnerInfoVO vo) throws Exception{
		
		
		return dao.selectPartnerCount(vo);	
	}
	public PartnerInfoVO selectPartnerDetail (PartnerInfoVO vo) throws Exception{
		return dao.selectPartnerDetail(vo);
	}
	public int  insertPartnerInfo (PartnerInfoVO vo) throws Exception{
		return dao.insertPartnerInfo(vo);
	}
	public int  updatePartnerInfo (PartnerInfoVO vo) throws Exception{
		return dao.updatePartnerInfo(vo);
	}
	public List<PartnerInfoVO> selectPartnerDtList(PartnerInfoVO vo) throws Exception{
		return dao.selectPartnerDtList(vo);
	}
	public String selectMaxPartner (PartnerInfoVO vo) throws Exception{
		return dao.selectMaxPartner(vo);
	}  
	public int  deletePartnerInfo (PartnerInfoVO vo) throws Exception{
		return dao.deletePartnerInfo(vo);
	}
	public int  deletePartnerItem (PartnerInfoVO vo) throws Exception{
		return dao.deletePartnerItem(vo);
	}
	
	public int insertPartnerItem  (PartnerInfoVO vo) throws Exception{
		return dao.insertPartnerItem(vo);
	}
}



	
	
	

