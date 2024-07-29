<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Components / Tabs - NiceAdmin Bootstrap Template</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="/assets/img/favicon.png" rel="icon">
  <link href="/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="/assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="/assets/vendor/simple-datatables/style.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="/assets/css/style.css" rel="stylesheet">

  <!-- Template Main JS File -->
  <script src="/assets/js/main.js"></script>
  <script src="/assets/js/common.js"></script>
  <script src="/assets/js/jquery-3.7.1.js"></script>
  <!-- =======================================================
  * Template Name: NiceAdmin
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Updated: Mar 17 2024 with Bootstrap v5.3.3
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
  <style>
 #modaltable tr {
  margin-bottom: 20px;
}

#itemModal table td{
  margin-right: 20px;
}

#excelModal {
	width:450px;
	height:300px;
	position: fixed;
    top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}
</style>
</head>

<body>

	
  <%@ include file="../layout/menu.jsp" %>	
  

  <main id="main" class="main">

	<div class="pagetitle">
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">홈</a></li>
          <li class="breadcrumb-item">자재관리</li>
          <li class="breadcrumb-item active">제품조회</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
              <h2 class="card-title"></h2>
               <div>
               <form id="searchform">
               <input type="hidden" id="currentPage" name="currentPage" value='1'>
               	<table class="col-lg-12" >
              	 <tr>
              		<td>
		              <div class="row mb-2">
		                 <label for="inputText" class="col-sm-2 col-form-label">품번</label>
		                 <div class="col-sm-4">
		                   <input type="text" class="form-control" id="itemCd" name="itemCd">
		                 </div>
		               </div>
              		<td>
              		<td>
		              <div class="row mb-2">
		                 <label for="inputText" class="col-sm-2 col-form-label">품명</label>
		                 <div class="col-sm-4">
		                   <input type="text" class="form-control" id="itemName" name="itemName">
		                 </div>
		               </div>
              		<td>
              		<td rowspan="2">
		              <div class="row mb-4">
		                 <label for="inputText" class="col-sm-3 col-form-label">제품유형</label>
		                 <div class="col-sm-2">
		                   <select id="itemType" name="itemType" >
   							 <option value=>===선택===</option>
		                   </select>
		                 </div>
		               </div>		
              		</td>
              		<td>
              			<button type="button" class="btn btn-info" onclick = 'itemSearch(1);'>조회</button>
              			<button type="button" class="btn btn-info" data-index="1" onclick = 'insertItem(this);'>신규</button>
              			<button type="button" class="btn btn-dark" onclick="excelWrite();">엑셀</button>
              			<button type="button" class="btn btn-secondary" onclick = 'excelUpload();'>엑셀업로드</button>
              		</td>
              	 </tr>
               	</table>
               	</form>
               </div>
                <div>
                  <table class="table table-hover">
                    <thead>
                  	  <tr>
                    	<th scope="col">No</th>
                    	<th scope="col">품목코드</th>
                    	<th scope="col">품목명</th>
                    	<th scope="col">단위</th>
                    	<th scope="col">생산라인</th>
                    	<th scope="col">BOX규격</th>
                    	<th scope="col">재고위치</th>
                    	<th scope="col">등록일</th>
                  	  </tr>
                    </thead>
                	<tbody id="tbody">
                	</tbody>
                  </table>
                </div>
              </div><!-- End Default Tabs -->
            </div>
          </div>
        </div>
       <!-- 결재 모달 시작 -->
      <div class="modal fade" id="itemModal" tabindex="-1">
       <div class="modal-dialog modal-xl modal-dialog-centered">
         <div class="modal-content">
           <div class="modal-header" >
             <h5 class="modal-title" style="text-align:center; width:100%">제품등록/수정</h5>
             <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
           </div>
           <div class="modal-body">
           <form id="itemform">
           <input type="hidden" id="commitType" name="commitType" value="0">
           <table id="modaltable" style="width:100%; height:100%;">
             <tr>
               <th scope="col">품번</th>
               <td><input type="text" id="itemCd1" name="itemCd"></td>
               <th scope="col">품명</th>
               <td><input type='text' id="itemName1" name="itemName"></td>
             </tr>
             <tr>
               <th scope="col">제품유형</th>
               <td>
                 <select id="itemType1" name="itemType" >
                   <option value=>=== 선택 ===</option>
                 </select>
               </td>
               <th scope="col">제품단위</th>
               <td>
                 <select id="unitType" name="unitType" >
                   <option value=>=== 선택 ===</option>
                 </select>
               </td>
             </tr>
             <tr>
               <th scope="col">HSCODE</th>
               <td><input type='text' id="hscode" name="hscode"></td>
               <th scope="col">BOX규격</th>
               <td>
                 <select id="boxType" name="boxType" >
                   <option value=>=== 선택 ===</option>
                 </select>
               </td>
             </tr>
             <tr>
               <th scope="col">무게(g)</th>
               <td><input type='text' id="weight" name="weight"></td>
               <th scope="col">BOX수량</th>
               <td><input type='text' id="boxQty" name="boxQty"></td>
             </tr>
             <tr>
               <th scope="col">생산라인</th>
               <td>
                 <select id="plantLine" name="plantLine" >
                   <option value=>=== 선택 ===</option>
                 </select>
               </td>
               <th scope="col">단가</th>
               <td><input type='text' id="unitPrice" name="unitPrice"></td>
             </tr>
             <tr>
               <th scope="col">재고위치</th>
               <td>
                 <select id="stocklocation" name="location" >
                   <option value=>=== 선택 ===</option>
                 </select>
               </td>
               <th scope="col">하도급여부</th>
               <td><input type='checkbox' id="subconYn" name="subconYn" value="N"></td>
             </tr>
           </table>
           </form>
           </div>
           <div class="modal-footer">
             <button type="button" class="btn btn-primary" onclick = 'commit();'>저장</button>
             <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
           </div>
         </div>
       </div>
      </div>
     <!-- 결재 모달 끝 -->
     <!-- 엑셀 모달 시작 -->
      <div class="modal fade" id="excelModal" tabindex="-1">
       <div class="modal-dialog modal-xl modal-dialog-centered">
         <div class="modal-content">
           <div class="modal-header" >
             <h5 class="modal-title" style="text-align:center; width:100%">품목 엑셀 업로드</h5>
             <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
           </div>
           <div class="modal-body">
           <form id="excelform" method="POST" enctype="multipart/form-data">
           <table id="modaltable" style="width:100%; height:100%;">
            <tr>
              <th>엑셀파일</th>
              <td><input type="file" id="excelFile" name="excelFile" accept=".xlsx, .xls"></td>
            </tr>
           </table>
           </form>
           </div>
           <div class="modal-footer">
             <button type="button" class="btn btn-primary" onclick = 'upload();'>엑셀업로드</button>
             <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
           </div>
         </div>
       </div>
      </div>
     <!-- 엑셀 모달 끝 -->
    </section>
    <nav aria-label="Page navigation example">
      <ul class="pagination" id="itemPaging">
      </ul>
    </nav>
  </main><!-- End #main -->
  <form id="hiddenform">
  	<input type='hidden' id='item' name='itemCd'>
  </form>
<script src="http://malsup.github.com/jquery.form.js"></script>
<script>

	// 엑셀 업로드
	function excelUpload(){
		$('#excelform')[0].reset();
		$('#excelModal').modal('show');
	}
	function upload(){
		var file = $('#excelFile').val();
		
		if(file == "" || file == null){
			alert("파일을 선택해주세요.");
			return false;
		}else if(!checkFileType(file)){
			alert("엑셀 파일만 업로드 가능합니다.");
			return false;
		}
		
		if(confirm("업로드 하시겠습니까")){
			excelCall_server(excelform, "/item/excelUpload", uploadExcel);
		}
	}
	// 엑셀 파일인지 확인
	function checkFileType(filePath){
		var fileFormat = filePath.split(".");
		if(fileFormat.indexOf("xls") > -1 || fileFormat.indexOf("xlsx") > -1){
			return true;
		}else{
			return false;
		}
	}
	function uploadExcel(cnt){
		if(cnt>0){
			alert("총 "+cnt+"개의 데이터를 입력했습니다");
			$('#excelModal').modal('hide');
			search();
		}else{
			alert("업로드실패");
		}
	}
	// 콤보박스
	$(function() {
   		call_server(hiddenform, "/item/getItemType", getItemType);
	});
	function getItemType(itvo){
		// 제품유형
		setData(itvo.itemTypeList, itemType);
		setData(itvo.itemTypeList, itemType1);
		
		// 제품단위
		setData(itvo.unitTypeList, unitType);
		
		// BOX규격
		setData(itvo.boxTypeList, boxType);
		
		// 생산라인
		setData(itvo.plantLineList, plantLine);
		
		// 재고위치
		setData(itvo.locationList, stocklocation);

	}
	function setData(list, id){
		for(var i = 0; i < list.length; i++){
			$(id).append("<option value='"+list[i].comCd+"'>"+list[i].comName+"</option>");
		}
	}
	// 제품조회하기
	function itemSearch(no){
		$('#currentPage').val(no);
		call_server(searchform, "/item/getItemList", getItemList)
	}
	function getItemList(vo){
		list = vo.itemlist;
		$('#tbody').empty();
		for(var i = 0; i < list.length; i++){
			str = "<tr onclick=\"itemDetail('"+list[i].itemCd+"', this);\" style=\"cursor:pointer;\" data-index=\"2\">";
			str += "<th scope=\"row\">"+((Number(vo.currentPage)-1)*vo.countPerPage+(i+1))+"</th>";
			str += "<td>"+list[i].itemCd+"</td>";
			str += "<td>"+list[i].itemName+"</td>";
			str += "<td>"+list[i].unitType+"</td>";
			str += "<td>"+list[i].plantLine+"</td>";
			str += "<td>"+list[i].boxType+"</td>";
			str += "<td>"+list[i].location+"</td>";
			str += "<td>"+list[i].regDt+"</td>";
			str += "</tr>";
			$('#tbody').append(str);
		}
		setPaging(itemPaging, vo.startPage, vo.endPage, 'itemSearch');
	}
	// 제품 상세조회
	function itemDetail(cd, button){
		$('#commitType').val($(button).data('index'));
		$('#item').val(cd);
		call_server(hiddenform, "/item/getItemDtl", getItemDtl)
	}
	function getItemDtl(vo){
		$('#itemform')[0].reset();
		$('#itemCd1').val(vo.itemCd);
		$('#itemName1').val(vo.itemName);
		$('#itemType1').val(vo.itemType);
		$('#unitType').val(vo.unitType);
		$('#hscode').val(vo.hscode);
		$('#boxType').val(vo.boxType);
		$('#weight').val(vo.weight);
		$('#boxQty').val(vo.boxQty);
		$('#plantLine').val(vo.plantLine);		
		$('#unitPrice').val(vo.unitPrice);		
		$('#stocklocation').val(vo.location);
		if(vo.subconYn == "Y"){
			  $("#subconYn").prop("checked", true);
		}else{
			  $("#subconYn").prop("checked", false);
		}
		$('#itemModal').modal('show');
	}
	
	// 제품 수정/등록
	function insertItem(button){
		$('#commitType').val($(button).data('index'));
		$('#itemform')[0].reset();
		$('#itemModal').modal('show');
	}
	function commit(){
		if($('#subconYn').prop("checked")){
			$('#subconYn').val("Y");
		}
		call_server(itemform, "/item/commitItem", commitItem)
	}
	function commitItem(cnt){
		if($('#commitType').val() == "1"){
			if(cnt>0){
				alert("등록완료");
				$('#itemModal').modal('hide');
				search();
			}else{
				alert("등록실패");
			}
		}else{
			if(cnt>0){
				alert("수정완료");
				$('#itemModal').modal('hide');
				search();
			}else{
				alert("수정실패");
			}
		}
	}
	// Excel파일 다운로드
	function excelWrite() {
	    // 서버에 엑셀 파일 생성 요청 보내기
	    var formData = new FormData($(searchform)[0]);
	    
	    $.ajax({
	    	data : formData,
		    type: "POST",
		    contentType: false,
	        processData: false,
		    url: "/item/createExcel",
		    xhrFields:{
		        responseType: 'blob'
		    },
		    success: function (result) {
		        var blob = result;
		        var downloadUrl = URL.createObjectURL(blob);
		        var a = document.createElement("a");
		        a.href = downloadUrl;
		        a.download = "item.xlsx";
		        document.body.appendChild(a);
		        a.click();
		    }
		});
	
		alert('엑셀파일 다운로드되었습니다.');
	    
	}


</script>
<script src="/assets/js/paging.js"></script>
  <%@ include file="../layout/footer.jsp" %>
  
  <!-- Vendor JS Files -->
  <script src="/assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="/assets/vendor/chart.js/chart.umd.js"></script>
  <script src="/assets/vendor/echarts/echarts.min.js"></script>
  <script src="/assets/vendor/quill/quill.min.js"></script>
  <script src="/assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="/assets/vendor/php-email-form/validate.js"></script>
</body>

</html>