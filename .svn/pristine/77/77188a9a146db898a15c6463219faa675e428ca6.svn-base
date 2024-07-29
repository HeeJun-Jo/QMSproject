package com.qms.approve.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qms.approve.dao.ApproveDao;
import com.qms.approve.dao.NoticeDao;
import com.qms.approve.vo.NoticeVO;
import com.qms.table.vo.approve.AprvInfoVO;
import com.qms.table.vo.approve.NoticeInfoVO;

@Service
public class NoticeService {

	@Autowired
	NoticeDao dao;

	public int insertNoticeInfo(NoticeVO vo) throws Exception {
		
		return dao.insertNoticeInfo(vo);
	}

	

	public NoticeVO selectNoticeDtl(NoticeVO vo) throws Exception {
		
		return dao.selectNoticeDtl(vo);
	}

	public int updateNoticeInfo(NoticeVO vo) throws Exception {
		
		return dao.updateNoticeInfo(vo);
	}

	public int deleteNoticeInfo(NoticeVO vo) throws Exception {
		// TODO 자동 생성된 메소드 스텁
		return dao.deleteNoticeInfo(vo);
	}
	
	public int selectTotalNoticeCount(NoticeVO vo) throws Exception{
		return dao.selectTotalNoticeCount(vo);
	}

	public List<NoticeInfoVO> selectNoticeInfo(NoticeInfoVO vo) throws Exception{
		return dao.selectNoticeInfo(vo);
	}



	public int deleteNoticeFile(NoticeVO vo) throws Exception {
		return dao.deleteNoticeFile(vo);
	}
	
	}
	
	

