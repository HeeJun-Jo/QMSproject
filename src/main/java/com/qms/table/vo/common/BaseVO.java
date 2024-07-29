package com.qms.table.vo.common;

import lombok.Data;

@Data
public class BaseVO {
	private String regDt;			//등록일
	private String regUserId;		//등록자
	private String updDt;			//수정일
	private String updUserId;		//수정자
	
	// 페이징 처리
	private int total; //전체 게시물 수
	private int countPerPage=10; //페이지 당 출력되는 게시물 수
	private int currentPage=1; //현재 페이지
	private int startPage; //시작 페이지
	private int endPage; //마지막 페이지
	
	public int getStartPage() {
		return currentPage/countPerPage+1; //페이지의 시작 페이지 계산
	}

	public int getEndPage() {
		return (total + countPerPage - 1) / countPerPage; // 페이징의 종료 페이지 계산
	}
}
