package com.qms.approve.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.qms.approve.vo.AprvVO;
import com.qms.table.vo.approve.AprvFileVO;
import com.qms.table.vo.approve.AprvLineVO;

@Repository
public interface ApproveDao {
	public int selectApproveCount() throws Exception;
	
	// 결재진행중/결재완료 조회
	public List<AprvVO> selectApproveList(AprvVO vo) throws Exception;
		
	// 나의기안서 조회
	public List<AprvVO> selectMyApproveList(AprvVO vo) throws Exception;
	
	// 결재진행중/결재완료 페이징
	public int selectTotalAprvCount(AprvVO vo)throws Exception;
	
	// 나의기안서 페이징
	public int selectTotalMyAprvCount(AprvVO vo)throws Exception;
	
	// 기안서 상세조회
	public AprvVO selectApproveDtl(AprvVO vo)throws Exception;
	
	// 기안서 라인조회
	public List<AprvLineVO> selectAprvLineList(AprvVO vo)throws Exception;
	
	// 기안서 파일조회
	public List<AprvFileVO> selectAprvFileList(AprvVO vo)throws Exception;
	
	// 결재중 -> 결재완료
	public int updateApproved(AprvVO vo)throws Exception;
	
	// 대기 -> 결재중
	public int updateApproving(AprvVO vo)throws Exception;
	
	// 결재중 -> 반려
	public int updateAprvReject(AprvVO vo)throws Exception;
	
	// 문서상태 -> 결재완료
	public int updateDocApproved(AprvVO vo)throws Exception;
	
	// 문서상태 -> 반려
	public int updateDocReject(AprvVO vo)throws Exception;
	
	// 문서 doc 가져오기
	public String selectNewDocNo()throws Exception;
		
	// 문서 임시저장
	public int insertDocWirte(AprvVO vo)throws Exception;
	
	// 라인문서 seq 가져오기
	public String selectMaxAprvSeq(AprvLineVO vo)throws Exception;
			
	// 라인문서 임시저장
	public int insertAprvLine(AprvLineVO vo)throws Exception;
	
	// 파일 seq 가져오기
	public String selectMaxFileSeq(AprvFileVO vo)throws Exception;
				
	// 파일문서 임시저장
	public int insertAprvFile(AprvFileVO vo)throws Exception;
}
