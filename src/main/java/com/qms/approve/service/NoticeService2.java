package com.qms.approve.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qms.approve.dao.NoticeDao2;
import com.qms.approve.vo.ScheduleVO;

@Service
public class NoticeService2 {

	@Autowired
	NoticeDao2 dao;

	public int insertScInfo(ScheduleVO vo) throws Exception {
		// TODO 자동 생성된 메소드 스텁
		return dao.insertScInfo(vo);
	}

	public List<ScheduleVO> selectScList(ScheduleVO vo) throws Exception {
		// TODO 자동 생성된 메소드 스텁
		return dao.selectScList(vo);
	}

	public List<ScheduleVO> scLineList(ScheduleVO vo) throws Exception {
		// TODO 자동 생성된 메소드 스텁
		return dao.scLineList(vo);
	}

	public int deleteSchedule(ScheduleVO vo) throws Exception{
		// TODO 자동 생성된 메소드 스텁
		return dao.deleteSchedule(vo);
	}

}
	
	

