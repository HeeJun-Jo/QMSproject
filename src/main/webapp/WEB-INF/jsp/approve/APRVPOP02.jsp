<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>기안서 상세</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="/assets/img/favicon.png" rel="icon">
  <link href="/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700&family=Nunito:wght@300;400;600;700&display=swap" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="/assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="/assets/vendor/simple-datatables/style.css" rel="stylesheet">

  <!-- Template Main CSS File -->

  
  <!-- Template Main JS File -->
  <script src="/assets/js/jquery-3.7.1.js"></script>
  <script src="/assets/js/common.js"></script>
  

  <!-- Custom CSS File -->
  <style>
    body {
      font-family: 'Nunito', sans-serif;
      background-color: #f0f2f5;
      font-size: 16px;
    }

    .container {
      max-width: 1600px;
      margin: auto;
      padding: 20px;
    }
    .pagetitle {
      margin-bottom: 20px;
      font-size: 24px;
      font-weight: 700;
      color: #333;
    }

    .breadcrumb {
      background-color: transparent;
      padding: 0;
      margin-bottom: 20px;
    }

    .breadcrumb-item + .breadcrumb-item::before {
      content: ">";
      color: #6c757d;
    }

    .section {
      background-color: #ffffff;
      padding: 30px;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    #full {
      display: flex;
      flex-wrap: wrap;
      gap: 20px;
    }

    #screen_left,
    #screen_right {
      flex: 1;
      min-width: 500px;
      background: white;
      border-radius: 8px;
      padding: 20px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    table {
      width: 100%;
      margin-bottom: 20px;
      border-collapse: collapse;
    }

    th, td {
      padding: 10px;
      text-align: left;
      border-bottom: 1px solid #dee2e6;
    }

    th {
      background-color: #f1f1f1;
    }

    .input-box {
      width: 100%;
      padding: 8px;
      border: 1px solid #ced4da;
      border-radius: 4px;
    }

    select, textarea {
      width: 100%;
      padding: 8px;
      border: 1px solid #ced4da;
      border-radius: 4px;
    }

    textarea {
      resize: vertical;
    }

    .btn {
      margin-right: 10px;
    }

    .btn-info {
      background-color: #17a2b8;
      border-color: #17a2b8;
      color: white;
    }

    .btn-info:hover {
      background-color: #138496;
      border-color: #117a8b;
    }

    .table-section {
      margin-bottom: 20px;
    }

    .table-section table {
      margin-bottom: 20;
    }
    .modal {
    	height: 470px;
    	width: 400px;
    	position: fixed; /* 모달을 화면에 고정 */
    	top: 50%; /* 화면의 세로 중앙으로 이동 */
    	left: 50%; /* 화면의 가로 중앙으로 이동 */
    	transform: translate(-50%, -50%); /* 모달의 중심을 정확히 화면 중앙으로 이동 */
    }
  </style>
</head>
  <!-- Vendor JS Files -->
  <script src="/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<body>
  <main id="main" class="main container">
      <div id="full">
        <div id="screen_left">
          <div id="screenleft-1" class="table-section">
           <form id="dataform">
            <table>
              <tr>
                <th scope="col">문서번호</th>
                <td><input type="text" class="input-box" id="docNo" readonly></td>
                <th scope="col">등록일</th>
                <td><input type="text" class="input-box" id="regDt" readonly></td>
              </tr>
              <tr>
                <th scope="col">등록자</th>
                <td><input type="text" class="input-box" id="userName" readonly></td>
                
                <th scope="col">부서</th>
                <td><input type="text" class="input-box" id="deptName" readonly></td>
               
              </tr>
              <tr>
                <th scope="col">문서유형</th>
                <td><input type="text" class="input-box" id="docType" readonly></td>
                <th scope="col">보존기한</th>
                <td><input type="text" class="input-box" id="preserveYear" readonly></td>
              </tr>
              <tr>
                <th scope="col">문서종류</th>
                <td><input type="text" class="input-box" id="docClass" readonly></td>
                <th scope="col">문서상태</th>
                <td><input type="text" class="input-box" id="docStatus" readonly></td>
              </tr>
            </table>
            </form>
          </div>
          <div id="screenleft-2" class="table-section">
            <table>
              <thead>
              <tr>
                <th scope="col">결재라인</th>
              </tr>
              <tr>
                <th scope="col">NO</th>
                <th scope="col">성명</th>
                <th scope="col">직위</th>
                <th scope="col">부서</th>
                <th scope="col">결재유형</th>
                <th scope="col">상태</th>
              </tr>
              </thead>
             <tbody id="line-tbody">
             </tbody>
            </table>
          </div>
          <div id="screenleft-3" class="table-section">
            <table>
             <thead>
              <tr>
                <th scope="col">첨부파일</th>
              </tr>
              <tr>
                <th scope="col">NO</th>
                <th scope="col">파일명</th>
                <th scope="col">파일크기</th>
              </tr>
             </thead>
             <tbody id="file-tbody">
             </tbody>
            </table>
          </div>
        </div>
        <div id="screen_right">
         <form id="aprvform">
          <table class="table-section">
            <tr>
              <th scope="col">제목</th>
              <td><input type="text" class="input-box" id="title" readonly></td>
            </tr>
            <tr>
              <th scope="col">내용</th>
              <td><textarea id="content" rows="18" class="input-box" readonly></textarea></td>
            </tr>
          </table>
          </form>
          <div class="d-flex justify-content-end">
            <button type="button" id="approveButton" class="btn btn-info" onclick = "approveModal();">결재</button>
            <button type="button" id="rejectButton" class="btn btn-info" onclick = "rejectModal();">반려</button>
          </div>
        </div>
      </div>
     <!-- 결재 모달 시작 -->
      <div class="modal fade" id="approveModal" tabindex="-1">
       <div class="modal-dialog modal-xl modal-dialog-centered">
         <div class="modal-content">
           <div class="modal-header">
             <h5 class="modal-title">결재</h5>
             <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
           </div>
           <div class="modal-body">
           <form id="approveform">
           <input type="hidden" id="aprvType" name="aprvType" value="0">
           <input type='hidden' name='docNo' value='${aprvvo.docNo}'>
           <table>
             <tr>
               <td>결재의견</td>
             </tr>
             <tr>
               <td><textarea name="opinion" rows = "5" cols="40"></textarea></td>
             </tr>
           </table>
           </form>
           </div>
           <div class="modal-footer">
             <button type="button" class="btn btn-primary" data-index="0" onclick = 'approve(this);'>결재</button>
             <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
           </div>
         </div>
       </div>
      </div>
     <!-- 결재 모달 끝 -->
     <!-- 반려 모달 시작 -->
      <div class="modal fade" id="rejectModal" tabindex="-1">
       <div class="modal-dialog modal-xl modal-dialog-centered">
         <div class="modal-content">
           <div class="modal-header">
             <h5 class="modal-title">반려</h5>
             <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
           </div>
           <div class="modal-body">
           <form id="rejectform">
           <input type="hidden" id="aprvType1" name="aprvType" value="0">
           <input type='hidden' name='docNo' value='${aprvvo.docNo}'>
           	<table>
             <tr>
               <td>반려의견</td>
             </tr>
             <tr>
               <td><textarea name="opinion" rows = "5" cols="40"></textarea></td>
             </tr>
           </table>
           </form>
           </div>
           <div class="modal-footer">
             <button type="button" class="btn btn-primary" data-index="1" onclick = 'reject(this);'>반려</button>
             <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
           </div>
         </div>
       </div>
      </div>
     <!-- 반려 모달 끝 -->
  <form id="hiddenform">
  	<input type='hidden' id='docNo' name='docNo' value='${aprvvo.docNo}'>
  	<input type='hidden' id='userId' name='userId' value='${vo.userId}'>
  </form>
  </main>
<script>
	// 상세 조회
	$(function() {
		//alert($('#docNo').val());
		call_server(hiddenform, "/approve/getApproveDtl", getApproveDtl);
	});
	
	function getApproveDtl(vo){
		$('#approveButton').prop('disabled', true);
		$('#rejectButton').prop('disabled', true);
		
		$('#docNo').val(vo.docNo);
		$('#regDt').val(vo.regDt);
		$('#userName').val(vo.userName);
		$('#deptName').val(vo.deptName);
		$('#docType').val(vo.docType);
		$('#preserveYear').val(vo.preserveYear);
		$('#docClass').val(vo.docClass);
		$('#docStatus').val(vo.docStatus);
		$('#title').val(vo.title);
		$('#content').val(vo.content);
		
		var list = vo.linelist;
		for(var i = 0; i < list.length; i++){
			str = "<tr>";
			str += "<td>"+(i+1)+"</td>";
			str += "<td>"+list[i].userName+"</td>";
			str += "<td>"+list[i].positionCd+"</td>";
			str += "<td>"+list[i].deptName+"</td>";
			str += "<td>"+list[i].docType+"</td>";
			str += "<td>"+list[i].docStatus+"</td>";
			str += "</tr>";
			$('#line-tbody').append(str);
			if(list[i].docStatus == "결재중" && list[i].userId == $('#userId').val()){
				$('#approveButton').prop('disabled', false);
				$('#rejectButton').prop('disabled', false);
			}
		}
		var list1 = vo.filelist;
		for(var i = 0; i < list1.length; i++){
			str = "<tr>";
			str += "<td>"+(i+1)+"</td>";
			str += "<td>"+list1[i].fileName+"</td>";
			str += "<td>"+list1[i].fileSize+"</td>";
			str += "</tr>";
			$('#file-tbody').append(str);
		}
	}
	// 기안서 결재/반려하기
	function approveModal(){
		$('#approveModal').modal('show');
	}
	function approve(button){
		$('#aprvType').val($(button).data('index'));
		call_server(approveform, "/approve/updateApprove", updateApprove);
	}
	
	function rejectModal(){
		$('#rejectModal').modal('show');
	}
	function reject(button){
		$('#aprvType1').val($(button).data('index'));
		call_server(rejectform, "/approve/updateApprove", updateReject);
	}
	
	function updateApprove(cnt){
		if(cnt>0){
			alert("결재완료");
			$('#approveModal').modal('hide');
			window.close();
			window.opener.location.reload();
		}else{
			alert("결재실패");
		}
	}
	function updateReject(cnt){
		if(cnt>0){
			alert("반려완료");
			$('#rejectModal').modal('hide');
			window.close();
			window.opener.location.reload();
		}else{
			alert("반려실패");
		}
	}
</script>
