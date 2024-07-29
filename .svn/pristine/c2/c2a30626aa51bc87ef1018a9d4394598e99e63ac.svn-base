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
          <li class="breadcrumb-item">생산관리</li>
          <li class="breadcrumb-item active">생산계획등록</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
					<div class="card-body" style="padding-top: 20px;">
						<!-- General Form Elements -->
						<form id="searchform">
							<input type='hidden' id='compCd' name='compCd'>
							<input type='hidden' id='planDt' name='planDt'>
							<input type='hidden' id='planYear' name='planYear'>
							<input type='hidden' id='planMonth' name='planMonth'>
							<table class="col-lg-12">
								<tr>
									<td style=  "text-align: right;">
										<div class="row mb-3">
											<label for="inputDate" class="col-sm-1 col-form-label">계획년월</label>
											<div class="col-sm-1">
												<select id="planDtYY" name="planDtYY">
												  <option value=''>== 년 ==</option>
												  <option value="2024">2024</option>
												  <option value="2023">2023</option>
												  <option value="2022">2022</option>
												</select>
											</div>
											<div class="col-sm-1">
												<select id="planDtMM" name="planDtMM">
												  <option value=''>== 월 ==</option>
												  <option value="1">1월</option>
												  <option value="2">2월</option>
												  <option value="3">3월</option>
												  <option value="4">4월</option>
												  <option value="5">5월</option>
												  <option value="6">6월</option>
												  <option value="7">7월</option>
												  <option value="8">8월</option>
												  <option value="9">9월</option>
												  <option value="10">10월</option>
												  <option value="11">11월</option>
												  <option value="12">12월</option>
												</select>
											</div>
											<label for="inputText" class="col-sm-2 col-form-label">품번</label>
											<div class="col-sm-1">
												<input type="text" class="form-control" id="itemCd" name="itemCd">
											</div>
											<label for="inputText" class="col-sm-1 col-form-label">거래처</label>
											<div class="col-sm-2">
												<div class="icon" >
												<input type="text" class="form-control" id="compName" name="compName">
												<i class="ri-search-2-line" style="cursor:pointer;" onclick="partnerPopup()"></i>
												<div class="label"></div>
												</div>
											</div>
										</div>
									</td>
									<td rowspan="1">
										<button type="button" class="btn btn-info" onclick="planSearch();">조회</button>
										<button type="button" class="btn btn-info" onclick="commit();">저장</button>
										<button type="button" class="btn btn-secondary" id="PlanOrderQtyExcel">엑셀 다운로드</button>
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
          </div>
        </div>
        <div class="card">
		  <div class="card-body">
			<!-- Table with hoverable rows -->
			<form id="tableform">
			<input type='hidden' id='compCd1' name='compCd'>
			<input type='hidden' id='planDt1' name='planDt'>
			<table class="table table-hover" id="planTable">
			  <thead style="width:100%">
				<tr id="date">
			    </tr>
			    <tr id="orderCnt">
			    </tr>
			    <tr id="planCnt">
			    </tr>
			  </thead>
			  <tbody id="tbody">
			  </tbody>
			</table>
			</form>
		  </div>
        </div>
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

	// 저장
	function commit(){
		call_server(tableform, "/plan/insertPlan", insertPlan);
	}
	function insertPlan(cnt){
		if(cnt>0){
			alert("저장완료");
		}else{
			alert("저장실패");
		}
	}
	
	
	// 생산계획조회
	function planSearch(){
		$("#date").empty();
        $("#orderCnt").empty();
        $("#planCnt").empty();
        $("#tbody").empty();
        $("#planYear").val($("#planDtYY").val());
        $("#planMonth").val($("#planDtMM").val());
		if($('#compCd').val() == ""){
			alert("거래처를 선택해주세요");
		}else{
			if($("#planDtYY").val() == "" || $("#planDtMM").val() == ""){
				alert("계획년월을 선택해주세요");
			}else{
				$("#date").empty();
				$("#orderCnt").empty();
				$("#planCnt").empty();
				// 선택한 년, 월의 첫 번째 날짜를 세팅
				var date = new Date($("#planDtYY").val(), $("#planDtMM").val()-1, 1);
				days = [];
				
				// 다음 달의 첫 번째 날짜를 세팅
				var nextMonth = new Date($("#planDtYY").val(), $("#planDtMM").val(), 1);
				
				// 선택한 월의 첫 번째 날짜부터 다음 달 첫 번째 날짜까지 배열에 추가, +1 반복
				while(date < nextMonth){
					days.push(date.getDate());
					date.setDate(date.getDate() + 1);
				}
				str = "<th rowspan=\"3\" scope=\"col\">품번</th>"
				str += "<th rowspan=\"3\" scope=\"col\">품명</th>"
				$("#date").append(str);
				// 해달 월의 날짜만큼 주문수량 계획수량 추가
				for(var i = 0; i < days.length; i++){
					var str1 = "<th scope=\"col\" id=\'"+(i+1)+"\'>"+("0"+date.getMonth()).slice(-2)+""+("0"+(i+1)).slice(-2)+"</th>";
					var str2 = "<td scope=\"col\">주문수량</td>";
					var str3 = "<td scope=\"col\">계획수량</td>";
					$("#date").append(str1);
					$("#orderCnt").append(str2);
					$("#planCnt").append(str3);
				}
				$("#planDt").val((""+date.getFullYear()).slice(2)+"/"+("0"+date.getMonth()).slice(-2));
				$("#planDt1").val((""+date.getFullYear()).slice(2)+"/"+("0"+date.getMonth()).slice(-2));
				call_server(searchform, "/plan/selectPartnerInfo", selectPartnerInfo);
				call_server(searchform, "/plan/selectPlanList", selectPlanList);
			}
		}
	}
	var days = [];
	function selectPartnerInfo(list){
		var cnt = 0;
		for(var i = 0; i < list.length; i++){
			var str = "<tr>";
			str += "<td rowspan=\"2\">"+list[i].itemCd+"</td>";
			str += "<td rowspan=\"2\">"+list[i].itemName+"</td>";
			for(var j = 0; j < days.length; j++){
				v = $("#planDt").val()+"/"+("0"+(j+1)).slice(-2);
				str += "<td><input type=\"text\" size=\"10\" id=\'"+list[i].itemCd+"orderQty"+("0"+(j+1)).slice(-2)+"\' name=\"qtyList["+(j+(cnt*30))+"].orderQty\" value=\"0\"></td>";
				str += "<input type=\"hidden\" name=\"qtyList["+(j+(cnt*30))+"].planDt\" value=\'"+v+"\'>";
				console.log(j+(cnt*30));
				str += "<input type=\"hidden\" name=\"qtyList["+(j+(cnt*30))+"].itemCd\" value=\'"+list[i].itemCd+"\'>";
				
			}
			str += "</tr>";
			str += "<tr>";
			for(var j = 0; j < days.length; j++){
				str += "<td><input type=\"text\" size=\"10\" id=\'"+list[i].itemCd+"planQty"+("0"+(j+1)).slice(-2)+"\' name=\"qtyList["+(j+(cnt*30))+"].planQty\" value=\"0\"></td>";
			}
			str += "</tr>";
			cnt++;
			$("#tbody").append(str);
		}
	}
	function selectPlanList(list){
		for(var i = 0; i < list.length; i++){
			o = ""+list[i].itemCd+"orderQty"+list[i].planDt+"";
			p = ""+list[i].itemCd+"planQty"+list[i].planDt+"";			
			$("#"+o+"").val(list[i].orderQty);
			$("#"+p+"").val(list[i].planQty);
		}
			
	}


	
	var dt = new Date();
	var year = dt.getFullYear();
	var month = dt.getMonth();
	
	$(function(){
		$("#planDtYY").val(year);
		$("#planDtMM").val(month+1);
	})

	// 거래처 조회 팝업
	function partnerPopup(no){
		row1 = no;
		window.open('/receive/partnerSearch','popup',"width=800, height=800");
	}
	function receivePartnerData(item){
		$('#compName').val(item.compName);
		$('#compCd').val(item.compCd);
		$('#compCd1').val(item.compCd);
	}
	$(function(){
		$("#PlanOrderQtyExcel").click(function() {
			excelDownload(searchform, '/plan/PlanOrderQtyExcel', 'PlanOrderQty.xlsx');
		});
	})
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