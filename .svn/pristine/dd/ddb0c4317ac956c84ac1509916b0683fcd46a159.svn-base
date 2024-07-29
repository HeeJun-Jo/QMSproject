<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>BOM 조회</title>
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
    <script src="/assets/js/common.js"></script>
  <script src="/assets/js/jquery-3.7.1.js"></script>
<style>
#bomModal table {
	bottom-margin: 30px;
}
  #bomModal table input[type="text"] {
    width: 100px;  /* 원하는 크기로 조정하세요 */
    padding: 2px;  /* 원하는 패딩 값으로 조정하세요 */
  }
</style>
</head>

<body>

  <%@ include file="../layout/menu.jsp" %>

<main id="main" class="main">

	<section class="section">
		<div class="row">
			<div class="col-lg-12">

				<div class="card">
					<div class="card-body" style="padding-top: 20px;">
						<!-- General Form Elements -->
						<form id="searchform">
							<input type='hidden' id='currentPage' name='currentPage' value=1>
							<table class="col-lg-12">
								<tr>
									 <td style="width:80px;">
                      				<label for="goodsName" class="col-sm-4 col-form-label">품번</label>
               						   </td>
                 					 <td style="width:200px;">
                    			  <input type="text" class="form-control" id="itemCd" name="itemCd">
                  					</td>
									<td style="width:80px;">
                      				<label for="goodsName" class="col-sm-2 col-form-label">품명</label>
               						   </td>
                 					 <td style="width:200px;">
                    			  <input type="text" class="form-control" id="itemName" name="itemName">
                  					</td>
									<td style="width:200px;">
									<th scope="col">제품유형</th>
               						  <td>
                 						 <select id="itemType" name="itemType" >
                   							<option value=>=== 선택 ===</option>
                   							<option value="FING">완제품</option>
                         					<option value="SFIN">반제품</option>
                         					<option value="COMP">원재료</option>
                 						 </select>
               						  </td>
									<td rowspan="2">
										<button type="button" class="btn btn-info" onclick="BomSearch(1);">조회</button>
										<button type="button" class="btn btn-info" onclick="newOrder();">신규</button>
										<button type="button" class="btn btn-dark" onclick="excelWrite();">엑셀</button>
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
				<div class="card">
					<div class="card-body">
						<!-- Table with hoverable rows -->
						<form id = "searchform">
						<table class="table table-hover" id="bomListTable">
							<thead>
								<tr>
									<th scope="col">No</th>
									<th scope="col">품목코드</th>
									<th scope="col">품목명</th>
									<th scope="col">Box단위</th>
									<th scope="col">생산라인</th>
									<th scope="col">Box규격</th>
									<th scope="col">재료수</th>
									<th scope="col">등록일</th>
								</tr>
							</thead>
							<tbody id="tbody">
							</tbody>
						</table>
						</form>
						<!-- End Table with hoverable rows -->
						<nav aria-label="Page navigation example">
							<ul class="pagination" id="BomPaging">
								
							</ul>
						</nav>
						<!-- End Pagination with icons -->

					</div>
				</div>
			</div>
		</div>
	</section>
</main>
<!-- BOM 모달 시작 -->
      <div class="modal fade" id="bomModal" tabindex="-1">
       <div class="modal-dialog modal-xl modal-dialog-centered">
         <div class="modal-content">
           <div class="modal-header" >
             <h5 class="modal-title" style="text-align:center; width:100%">BOM 등록/수정</h5>
             <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
           </div>
           <div class="modal-body">
           <input type="hidden" id="commitType" name="commitType" value="0">
           <form id="bomSearchform">
           <table style="width:100%; height:100%;">
			<tr>
               <th scope="col">품번</th>
               <td><input type="text" id="itemCd1" name="itemCd"></td>
               <th scope="col">품명</th>
               <td><input type='text' id="itemName1" name="itemName" readonly></td>
               <td><button type="button" class="btn btn-primary" onclick="bomDtlSearch();">조회</button></td>
               <td><button type="button" class="btn btn-primary" onclick="addBtn();">+</button></td>
            </tr>
           </table>
           <table class="table table-hover">
             <thead>
               <tr>
                 <th scope="col">자재품번</th>
                 <th scope="col">자재명</th>
                 <th scope="col">BOM LEVEL</th>
                 <th scope="col">제품(자재)유형</th>
                 <th scope="col">투입수량</th>
                 <th scope="col">단위</th>
                 <th scope="col">삭제</th>
               </tr>
             </thead>
             <tbody id="modaltbody">
             </tbody>
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
     <!-- BOM 모달 끝 -->

<form id="hiddenform">
	<input type="hidden" id="item" name="itemCd">
	<input type="hidden" id="cnt" name="cnt">
</form>


<script src="/assets/js/paging.js"></script> 


<script>

	// BOM저장하기
	function commit(){
		call_server(bomSearchform, "/bom/insertBom", insertBom);
	}
	function insertBom(count){
		if(count>0){
			alert("수정완료");
			$('#bomModal').modal('hide');
			search();
		}else{
			alert("수정실패");
		}
	}

	// Bom 조회하기
	function BomSearch(no){
		$('#currentPage').val(no);
		call_server(searchform,'/bom/selectBomList',selectBomList);
	}
	function selectBomList(vo){
		list = vo.bomlist;
		$('#tbody').empty();
		for(var i=0;i<list.length;i++){
			str="<tr onclick=\"bomDetail('"+list[i].itemCd+"');\" style=\"cursor:pointer;\">";
			str+="<th scope=\"row\">"+((Number(vo.currentPage)-1)*vo.countPerPage+(i+1))+"</th>";
			str+="<td>"+list[i].itemCd+"</td>";
			str+="<td>"+list[i].itemName+"</td>";
			str+="<td>"+list[i].unitType+"</td>";
			str+="<td>"+list[i].plantLine+"</td>";
			str+="<td>"+list[i].boxType+"</td>";
			str+="<td>"+list[i].bomCnt+"</td>";
			str+="<td>"+list[i].regDt+"</td>"; 
			str+="</tr>";
			$('#tbody').append(str);	
		}
		setPaging(BomPaging, vo.startPage, vo.endPage, 'BomSearch');
	}
	// Bom 상세조회
	function bomDetail(cd){
		$('#item').val(cd);
		call_server(hiddenform, "/bom/getBomDtl", getBomDtl)
	}
	
	function getBomDtl(vo){
		$('#bomSearchform')[0].reset();
		$('#modaltbody').empty();
		$('#itemCd1').val(vo.itemCd);
		$('#itemName1').val(vo.itemName);
		list = vo.bomDtlList;
		for(var i = 0; i < list.length; i++){
			str = "<tr>";
			str += "<td><div class=\"icon\"><i class=\"ri-search-2-line\" onclick='popup("+cnt+");' style=\"cursor:pointer;\"></i>";
			str += "<input type=\"text\" id=\"sitemCd"+i+"\"name=\"dtlList["+i+"].sitemCd\" value='"+list[i].sitemCd+"' readonly><div class=\"label\"></div></div></td>";
			str += "<td><input type=\"text\" id=\"sitemName"+i+"\" value='"+list[i].sitemName+"' readonly></td>";
			str += "<td><select id=\"bomLevel"+i+"\" name=\"dtlList["+i+"].bomLevel\"><option value=''>== 선택 ==</option><option value=\"1\">1</option><option value=\"2\">2</option><option value=\"3\">3</option></select></td>";
			str += "<td><input type=\"text\" id=\"itType"+i+"\" value='"+list[i].itemType+"'></td>";
			str += "<td><input type=\"text\" id=\"insQty"+i+"\"name=\"dtlList["+i+"].insQty\" value='"+list[i].insQty+"'></td>";
			str += "<td><input type=\"text\" id=\"unitType"+i+"\" value='"+list[i].unitType+"'></td>";
			str += "<td><button type=\"button\" class=\"btn btn-secondary\" onclick=\"delTr(this);\">삭제</button></td>"; 
			str += "</tr>";
			$('#modaltbody').append(str);
			$('#bomLevel'+i).val(list[i].bomLevel);
			cnt++;
		}
		
		$('#bomModal').modal('show');
	}
	// 신규 등록 화면
	function newOrder(){
		$('#bomSearchform')[0].reset();
		$('#modaltbody').empty();
		$('#bomModal').modal('show');
	}
	var cnt = 0;
	// BOM 추가
	function addBtn(){
        var str =  "<tr>";
        str += "<td>";
        str += "<div class=\"icon\">";
        str += "<i class=\"ri-search-2-line\" onclick='popup("+cnt+");' style=\"cursor:pointer;\"></i>";
        str += "<input type='text' id=\"sitemCd"+cnt+"\" name='dtlList["+cnt+"].sitemCd'>";
        str += "<div class=\"label\"></div>";
        str += "</div>";
        str += "</td>";
        str += "<td>";
        str += "<input type=\"text\" id=\"sitemName"+cnt+"\" >";
        str += "</td>";
        str += "<td>";
        str += "<select id=\"bomLevel"+cnt+"\" name=\"dtlList["+cnt+"].bomLevel\">";
        str += "<option value=''>== 선택 ==</option>";
        str += "<option value='1'>1</option>";
        str += "<option value='2'>2</option>";
        str += "<option value='3'>3</option>";
        str += "</select>";
        str += "</td>";
        str += "<td><input type=\"text\" id=\"itType"+cnt+"\"></td>";
        str += "<td><input type=\"text\" id=\"insQty"+cnt+"\" name=\"dtlList["+cnt+"].insQty\"></td>";
        str += "<td><input type=\"text\" id=\"unitType"+cnt+"\"></td>";
        str += "<td><button type=\"button\" class=\"btn btn-secondary\" onclick=\"delTr(this);\">삭제</button></td>";
        str += "</tr>";
        $('#modaltbody').append(str);
        cnt++;
    }
	// BOM 삭제
	function delTr(obj){
    	$(obj).closest("tr").remove();
	}
	// BOM 모달 조회
	function bomDtlSearch(){
		call_server(bomSearchform, "/bom/getBomDtl", getBomDtl)
		$('#bomSearchform')[0].reset();
		$('#modaltbody').empty();
	}
	// BOM DTL 선택
	function popup(cnt){
		$('#cnt').val(cnt);
		var popup = window.open("/bom/bomPopup", "상세보기", "width=800, height=800");
	}
	function receiveItemData(item, cnt) {
		$('#sitemCd'+cnt+'').val(item.itemCd);
		$('#sitemName'+cnt+'').val(item.itemName);
		$('#itType'+cnt+'').val(item.itemType);
		$('#unitType'+cnt+'').val(item.unitType);
		$('#bomLevel'+cnt+'').val('');
		$('#insQty'+cnt+'').val('');
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
		    url: "/bom/createExcel",
		    xhrFields:{
		        responseType: 'blob'
		    },
		    success: function (result) {
		        var blob = result;
		        var downloadUrl = URL.createObjectURL(blob);
		        var a = document.createElement("a");
		        a.href = downloadUrl;
		        a.download = "bom.xlsx";
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
 