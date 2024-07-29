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
</style>
</head>

<body>

	

  

  <main id="main" class="main">
    <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
              <h2 class="card-title"></h2>
               <div>
               <form id="searchform">
               <input type="hidden" id="currentPage" name="currentPage">
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
    </section>
    <nav aria-label="Page navigation example">
      <ul class="pagination" id="itemPaging">
      </ul>
    </nav>
  </main><!-- End #main -->
  <form id="hiddenform">
  	<input type='hidden' id='item' name='itemCd'>
  </form>

<script>

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
			str = "<tr onclick=\"chooseItem("+i+");\" style=\"cursor:pointer;\" data-index=\"2\">";
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
	// 아이템 선택
	function chooseItem(idx) {
        if (window.opener && !window.opener.closed) {
            window.opener.receiveItemData(list[idx]);
            window.close();
        }
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