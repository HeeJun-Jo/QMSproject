package com.qms.approve.service;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.qms.approve.dao.ApproveDao;
import com.qms.approve.vo.AprvVO;
import com.qms.common.service.FileService;
import com.qms.table.vo.approve.AprvFileVO;
import com.qms.table.vo.approve.AprvLineVO;
import com.qms.table.vo.common.FileVO;
import com.qms.user.vo.UserVO;

@Service
public class ApproveService {

	@Autowired
	ApproveDao dao;
	
	@Autowired
	FileService fileService;
	
	public int selectApproveCount() throws Exception{
		return dao.selectApproveCount();
	}
	// 결재진행중/결재완료 조회
	public List<AprvVO> selectApproveList(AprvVO vo) throws Exception{
		return dao.selectApproveList(vo);
	}
	// 나의기안서 조회
	public List<AprvVO> selectMyApproveList(AprvVO vo) throws Exception{
		return dao.selectMyApproveList(vo);
	}
	// 결재진행중/결재완료 페이징
	public int selectTotalAprvCount(AprvVO vo)throws Exception{
		return dao.selectTotalAprvCount(vo);
	}
	// 나의기안서 페이징
	public int selectTotalMyAprvCount(AprvVO vo)throws Exception{
		return dao.selectTotalMyAprvCount(vo);
	}
	// 기안서 상세조회
	public AprvVO selectApproveDtl(AprvVO vo)throws Exception{
		return dao.selectApproveDtl(vo);
	}
	// 기안서 라인조회
	public List<AprvLineVO> selectAprvLineList(AprvVO vo)throws Exception{
		return dao.selectAprvLineList(vo);
	}
	// 기안서 파일조회
	public List<AprvFileVO> selectAprvFileList(AprvVO vo)throws Exception{
		return dao.selectAprvFileList(vo);
	}
	
	// 기안서 결제하기
	@Transactional
	public int updateProcessing(AprvVO vo)throws Exception{
		
		if(vo.getAprvType().equals("0")) {
			// 결재중 -> 결재완료
			dao.updateApproved(vo);
			// 대기 -> 결재중
			dao.updateApproving(vo);
		}else {
			// 결재중 -> 반려
			dao.updateAprvReject(vo);
		}
		// 문서상태 -> 결재완료
		dao.updateDocApproved(vo);
		
		// 문서상태 -> 반려
		dao.updateDocReject(vo);
		
		return 1;
	}

	
	//기안서등록.
	@Transactional
	public int insertApprove(AprvVO vo, UserVO uservo) throws Exception {
        // 여기에 비즈니스 로직을 구현합니다.
        String docNo = dao.selectNewDocNo();
        vo.setDocNo(docNo);
        int c = dao.insertDocWirte(vo);
        List<AprvLineVO> linelist = vo.getLinelist();
        for (int i = 0; i < linelist.size(); i++) {
            AprvLineVO aprvLineVO = linelist.get(i);
            aprvLineVO.setDocNo(docNo);
            aprvLineVO.setAprvType("01");
            if (i == 0) {
                aprvLineVO.setAprvStatus(vo.getAprvStatus());
            } else {
                aprvLineVO.setAprvStatus("01");
            }
            aprvLineVO.setRegUserId(uservo.getUserId());
            dao.insertAprvLine(aprvLineVO);
        }
        List<MultipartFile> atcfilelist = vo.getAtcfilelist();
        if (atcfilelist != null) {
            for(int i=0;i<atcfilelist.size();i++) {
                if(atcfilelist.get(i)!=null && !atcfilelist.get(i).isEmpty()) {
                    FileVO filevo = new FileVO();
                    AprvFileVO aprvFileVO = new AprvFileVO();
                    aprvFileVO.setDocNo(docNo);
                    Calendar calendar = Calendar.getInstance();
                    int year = calendar.get(Calendar.YEAR);
                    int month = calendar.get(Calendar.MONTH) + 1;
                    String datePath = String.format("%04d%02d", year, month);
                    filevo.setMiddlePath("approve/" + datePath);
                    filevo.setFile(atcfilelist.get(i));
                    filevo = fileService.createFile(filevo);
                    aprvFileVO.setFilePath(filevo.getFilePath());
                    aprvFileVO.setFileName(filevo.getOrgFileNm());
                    aprvFileVO.setFileSize(filevo.getFileSize());
                    aprvFileVO.setRegUserId(uservo.getUserId());
                    dao.insertAprvFile(aprvFileVO);
                }
            }
        }
        return c;
    }

}
