package com.qms.approve.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.qms.approve.vo.NoticeVO;
import com.qms.approve.vo.ScheduleVO;
import com.qms.table.vo.approve.NoticeInfoVO;


@Repository
public interface NoticeDao2 {

	int insertScInfo(ScheduleVO vo) throws Exception;

	List<ScheduleVO> selectScList(ScheduleVO vo) throws Exception;

	List<ScheduleVO> selectScLineList(ScheduleVO vo);

	List<ScheduleVO> scLineList(ScheduleVO vo)throws Exception;

	int deleteSchedule(ScheduleVO vo)throws Exception;

	
}
