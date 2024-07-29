<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>입고조회</title>
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
<style>
#rcvModal table {
	bottom-margin: 30px;
}
  #rcvModal table input[type="text"] {
    width: 100px;  /* 원하는 크기로 조정하세요 */
    padding: 2px;  /* 원하는 패딩 값으로 조정하세요 */
  }
</style>
<body>
<%@ include file="../layout/menu.jsp"%>

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
									<td style=  "text-align: right;">
										<div class="row mb-3">
											<label for="inputDate" class="col-sm-1 col-form-label">입고일</label>
											<div class="col-sm-2">
												<input type="date" class="form-control" id="inDtFrom" name="inDtFrom">
											</div>
											~
											<div class="col-sm-2">
												<input type="date" class="form-control" id="inDtTo" name="inDtTo">
											</div>

											<label for="inputText" class="col-sm-2 col-form-label">인보이스 번호</label>
											<div class="col-sm-1">
												<input type="text" class="form-control" id="invoiceNo" name="invoiceNo">
											</div>
											<label for="inputText" class="col-sm-1 col-form-label">거래처</label>
											<div class="col-sm-2">
												<div class="icon" >
												<input type="text" class="form-control" id="compName" name="compName">
												<i class="ri-search-2-line" style="cursor:pointer;" onclick="partnerPopup(1)"></i>
												<div class="label"></div>
												</div>
											</div>
										</div>
									</td>
									<td rowspan="1">
										<button type="button" class="btn btn-info" onclick="rcvSearch(1);">조회</button>
										<button type="button" class="btn btn-info" onclick="newRcv();">신규</button>
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
				<div class="card">
					<div class="card-body">
						<!-- Table with hoverable rows -->
						<table class="table table-hover" id="listTable">
							<thead>
								<tr>
									<th scope="col">No</th>
									<th scope="col">입고일</th>
									<th scope="col">거래처명</th>
									<th scope="col">INVOICE NO</th>
									<th scope="col">총금액(원)</th>
									<th scope="col">품목수</th>
									<th scope="col">등록일</th>
									<th scope="col">다운로드</th>
								</tr>
							</thead>
							<tbody id="tbody">
							</tbody>
						</table>
						<!-- End Table with hoverable rows -->
						<nav aria-label="Page navigation example">
							<ul class="pagination" id="rcvPaging">

							</ul>
						</nav>
						<!-- End Pagination with icons -->

					</div>
				</div>
			</div>
		</div>
	</section>
<div class="modal fade" id="rcvModal" tabindex="-1">
	<div class="modal-dialog modal-xl modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">입고 등록/수정</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
			<form id="modalform">
			 <input type="hidden" id="rcvNo" name="rcvNo">
			  <table class="table table-hover" id="productOrderingDetailTable" >
				<thead>
				  <tr>
					<th scope="row">INVOICE NO</th>
					<td><input type="text" class="form-control" id="invoiceNo1" name="invoiceNo"></td>
					<td colspan="9" style="text-align:right;"><button type="button" class="btn btn-primary" onclick="rcvDtlSearch()">조회</button>
					<button type="button" class="btn btn-info" onclick="commit();">저장</button></td>
				  </tr>
				  <tr>
					<th scope="row">거래처코드</th>
					<td><input type="text" class="form-control" id="compCd1" name="compCd"></td>
					<td>
					  <div class="icon" >
					    <i class="ri-search-2-line" style="cursor:pointer;" onclick="partnerPopup(2)"></i><div class="label"></div>
					  </div>
					</td>
					<th scope="row">거래처명</th>
					<td><input type="text" class="form-control" id="compName1" name="compName"></td>
					<th scope="row">입고일</th>
					<td><div class="col-sm-8"><input type="date" class="form-control" id="inDt" name="inDt"></div>
					</td>
				  </tr>
				  <tr>
				  </tr>
				</thead>
			  </table>
			  <table class="table table-hover">
				<thead>
				  <tr>
					<td colspan="9" style="text-align: right;">
					  <table style = "width: 100%;">
						<tr>
						  <td style = "text-align: left;">품목정보</td>
						  <td style="text-align:right;"><button type="button" class="btn btn-primary" onclick="addButton()">+</button></td>
						</tr>
					  </table>
   					</td>
				  </tr>
				  <tr>
					<th scope="col">NO</th>
					<th scope="col">품번</th>
					<th scope="row">품명</th>
					<th scope="col">박스규격</th>
					<th scope="col">BOX수량</th>
					<th scope="col">입고수량</th>
					<th scope="col">단가</th>
					<th scope="col">재고위치</th>
					<th scope="col">삭제</th>
				  </tr>
				</thead>
				<tbody id="modaltbody">
				</tbody>
			  </table>
			 </form>
			</div>
		</div>
	</div>
</div>
<!-- End Vertically centered Modal-->
</main>
<%@ include file="../layout/footer.jsp"%>

<form id="hiddenform">
	<input type="hidden" id="No" name="invoiceNo">
</form>


<script src="/assets/js/paging.js"></script>
<script src="/assets/js/jquery-3.7.1.js"></script>
<script src="/assets/js/common.js"></script>

</body>
<script>
	// 입고 조회
	function rcvSearch(no){
		$('#currentPage').val(no);
		call_server(searchform, "/receive/selectRcvList", selectRcvList)
	}
	function selectRcvList(rcvvo){
		$('#tbody').empty();
		list = rcvvo.rcvList;
		for(var i = 0; i < list.length; i++){
			str = "<tr onclick=\"rcvDetail('"+list[i].invoiceNo+"');\" style=\"cursor:pointer;\" data-index=\"2\">";
			str += "<th scope=\"row\">"+((Number(rcvvo.currentPage)-1)*rcvvo.countPerPage+(i+1))+"</th>";
			str += "<td>"+list[i].inDt+"</td>";
			str += "<td>"+list[i].compName+"</td>";
			str += "<td>"+list[i].invoiceNo+"</td>";
			str += "<td>"+list[i].inPrice+"</td>";
			str += "<td>"+list[i].inQty+"</td>";
			str += "<td>"+list[i].regDt+"</td>";
			str += "</tr>";
			$('#tbody').append(str);
		}
		setPaging(rcvPaging, rcvvo.startPage, rcvvo.endPage, 'rcvSearch');
	}

	// 수정 모달창
	function rcvDetail(no){
		$('#No').val(no);
		call_server(hiddenform, "/receive/getRcvDtlList", getRcvDtlList)
		$('#modalform')[0].reset();
		$('#modaltbody').empty();
	}
	function getRcvDtlList(vo){
		$('#invoiceNo1').val(vo.invoiceNo);
		$('#compCd1').val(vo.compCd);
		$('#compName1').val(vo.compName);
		$('#inDt').val(vo.inDt);
		$('#rcvNo').val(vo.rcvNo);		
		rowidx = 0;
		list = vo.rcvDtlList;
		for(var i = 0; i < list.length; i++){
		    setRowData(list[i]);
		}
		$('#rcvModal').modal('show');
	}
	
	// 모달 조회 공통쿼리
	var rowidx = 0;
	function setRowData(vo){ 
		if(vo==null){
			vo = new Object();
			vo.itemCd='';
			vo.itemName='';
			vo.boxType='';
			vo.boxQty='';
			vo.inQty = '';
			vo.unitPrice='';
			vo.location='';
		}else{
			console.log(vo);
		}
        var str =  "<tr>";
        str += "<th scope=\"row\">"+(rowidx+1)+"</th>";
        str += "<td><div class=\"icon\">";
        str += "<i class=\"ri-search-2-line\" onclick='itemPopup("+rowidx+");' style=\"cursor:pointer;\"></i>";
        str += "<input type='text' id=\"itemCd"+rowidx+"\" name='rcvDtlList["+rowidx+"].itemCd' value='"+vo.itemCd+"'>";
        str += "<div class=\"label\"></div>";
        str += "</div></td>";
        str += "<td><input type=\"text\" id=\"itemName"+rowidx+"\" value='"+vo.itemName+"'></td>";
        str += "<td><input type=\"text\" id=\"boxType"+rowidx+"\" value='"+vo.boxType+"'></td>";
        str += "<td><input type=\"text\" id=\"boxQty"+rowidx+"\" value='"+vo.boxQty+"'></td>";
        str += "<td><input type=\"text\" id=\"inQty"+rowidx+"\" name=\"rcvDtlList["+rowidx+"].inQty\" value='"+vo.inQty+"'></td>";
        str += "<td><input type=\"text\" id=\"unitPrice"+rowidx+"\" name=\"rcvDtlList["+rowidx+"].unitPrice\" value='"+vo.unitPrice+"'></td>";
        str += "<td><select id=\"location"+rowidx+"\" name=\"rcvDtlList["+rowidx+"].location\"><option value=''>== 선택 ==</option><option value=\"B1 1층\">B1 1층</option><option value=\"B1 2층\">B1 2층</option><option value=\"C 1층\">C 1층</option></select></td>";
        str += "<td><button type=\"button\" class=\"btn btn-secondary\" onclick=\"delTr(this);\">삭제</button></td>";
        str += "</tr>";
        $('#modaltbody').append(str);
	    $('#location'+rowidx).val(vo.location);
	    rowidx++;
	}
	
	// 품목 추가
	function addButton(){
		setRowData(null);
	}
	
	// 품목 삭제
	function delTr(obj){ 
		$(obj).closest('tr').remove();
	}
	
	// 신규 등록 모달창
	function newRcv(){
		$('#rcvNo').val("");
		$('#modalform')[0].reset();
		$('#modaltbody').empty();
		rowidx = 0;
		$('#rcvModal').modal('show');
	}
	
	// 거래처 조회 팝업
	var row1;
	function partnerPopup(no){
		row1 = no;
		window.open('/receive/partnerSearch','popup',"width=800, height=800");
	}
	function receivePartnerData(item){
		if(row1 == 1){
			$('#compName').val(item.compName);
		}else{
			$('#compCd1').val(item.compCd);
			$('#compName1').val(item.compName);
		}
	}
	
	// 품목 조회 팝업
	var row2;
	function itemPopup(no){
		row2 = no;
		window.open('/receive/itemSearch','popup',"width=800, height=800");
	}
	function receiveItemData(item){
		$('#itemCd'+row2).val(item.itemCd);
		$('#itemName'+row2).val(item.itemName);
		$('#boxType'+row2).val(item.boxType);
		$('#boxQty'+row2).val(item.boxQty);
		$('#location'+row2).val(item.location);
	}
	
	// 모달 내부 조회
	function rcvDtlSearch(){
		call_server(modalform, "/receive/getRcvDtlList", getRcvDtlList)
	}
	
	// 입고 등록
	function commit(){
		console.log($('#unitPrice0').val());
		console.log($('#location0').val());
		call_server(modalform, "/receive/insertRcvDtl", insertRcvDtl)
	}
	function insertRcvDtl(cnt){
		if(cnt>0){
			alert("등록/수정완료");
			$('#rcvModal').modal('hide');
			search();
		}else{
			alert("등록/수정실패");
		}
	}
</script>