package com.qms.pdf.vo;
import lombok.Data;

@Data
public class ItextPdfVO {
	//PDF공통적으로 필요한 인자
    private String pdfCode; // pdf 종류가 여러개일 경우 html 을 구분하기 위한 코드
    private String pdfFilePath; // pdf 파일이 저장될 경로(필요하면 사용)
    private String pdfFileName; // pdf 파일명
    
	//인보이스에 들어가는 데이터
	private String rcvNo;			//입고번호*
	private String invoiceNo;		//인보이스번호
	private String shipper;			//송하인
	private String consignee;		//수하인
	private String notiParty;		//착하통지처
	private String portLoad;		// 선적항
	private String finalDest;		//도착지
	private String carrier;			//배이름
	private String remark;			//비고
	private String inQty;           //수량
	private String inPrice;         //객단가
	private String totalPrice;      //총액
	//그 외 필요한 서식 추가

}