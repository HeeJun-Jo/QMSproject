package com.qms.approve.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.qms.approve.vo.NoticeVO;
import com.qms.table.vo.approve.NoticeInfoVO;


@Repository
public interface BoardDao {

	public List<NoticeInfoVO> selectnoticeInfo(NoticeInfoVO vo) throws Exception;
	
	public NoticeVO selectnoticeDetail (NoticeVO vo) throws Exception;
	
	public int  insertBoardInfo (NoticeVO vo) throws Exception;
	
	public int  updateBoardInfo(NoticeVO vo) throws Exception;
	
	public int  DeleteBoardInfo (NoticeVO vo) throws Exception;
	
	public int  selectNoticeCount (NoticeVO vo) throws Exception;
}
