package com.qms.approve.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qms.approve.dao.BoardDao;
import com.qms.approve.vo.NoticeVO;
import com.qms.table.vo.approve.NoticeInfoVO;

@Service
public class BoardService {

	
	@Autowired
	BoardDao dao;
	public List<NoticeInfoVO> selectnoticeInfo(NoticeVO vo) throws Exception{
		return dao.selectnoticeInfo(vo);
	}

	
	public NoticeVO selectnoticeDetail (NoticeVO vo) throws Exception{
		return dao.selectnoticeDetail(vo);

	}
	public int  insertBoardInfo (NoticeVO vo) throws Exception{
		return dao.insertBoardInfo(vo);
}
	public int  updateBoardInfo (NoticeVO vo) throws Exception{
		return dao.updateBoardInfo(vo);
}
	public int  DeleteBoardInfo (NoticeVO vo) throws Exception{
		return dao.DeleteBoardInfo(vo);
}
	public int  selectNoticeCount (NoticeVO vo) throws Exception{
		return dao.selectNoticeCount(vo);
}


}

