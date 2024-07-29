<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

 


<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>월별 소요자재조회</title>
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
  <link href="/assets/css/style.css" rel="stylesheet">
</head>


<body>

 <main id="main" class="main container">

  <div class="pagetitle">
    <h1>월별 소요자재조회</h1>
    <nav>
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="index.html">홈</a></li>
        <li class="breadcrumb-item">생산관리</li>
        <li class="breadcrumb-item active">월별 소요자재조회</li>
      </ol>
    </nav>
  </div><!-- End Page Title -->

  <section class="section">
  <div class="card">
    <div class="card-body">
      <h5 class="card-title">검색 조건</h5>
      <form id="searchform" class="row g-3">
        <input type="hidden" id="currentPage" name="currentPage" value="1">
        <input type='hidden' id='planYear' name='planYear'>
		<input type='hidden' id='planMonth' name='planMonth'>
        <div class="col-md-3">
          <label for="planYear" class="form-label text-end">계획년월</label>
          <div class="input-group">
            <select id="planDtYY" name="planDtYY" class="form-select">
              <option value="">== 년 ==</option>
            </select>
            <select id="planDtMM" name="planDtMM" class="form-select">
              <option value="">== 월 ==</option>
            </select>
          </div>
        </div>
        
        <div class="col-md-6">
          <label for="compName" class="form-label text-end">거래처</label>
          <input type="text" class="form-control" id="compName" name="compName" style="width: 200px;">
        </div>
        
        
       
    	</form>
		</div>

          <div class="row mb-3">
            <div class="col-sm-12 text-end">
              <button type="button" class="btn btn-info" onclick="pdtesearch();">조회</button>
              <button type="button" class="btn btn-primary ms-2" onclick="excelsearch();">엑셀</button>
            </div>
          </div>
        </form>
      </div>
    </div>

    <div class="card mt-4">
      <div class="card-body">
        <h5 class="card-title">조회 결과</h5>
        <form id="dataform">
          <table class="table table-hover" id="pdtListTable">
            <thead>
              <tr>
                <th scope="col">NO</th>
                <th scope="col">품번</th>
                <th scope="col">품명</th>
                <th scope="col">자재품번</th>
                <th scope="col">자재품명</th>
                <th scope="col">생산수량</th>
                <th scope="col">투입수량</th>
                <th scope="col">소요수량</th>
   
   	</tr>
   	

            </thead>
             <tbody>
              
            </tbody>
          </table>
          <nav aria-label="Page navigation example">
			<ul class="pagination" id="PdtPaging">

			</ul>
		  </nav>
          </form>
        </div>
      </div>

      
   
      
      
         
      <script src="/assets/js/paging.js"></script>
      <script src="/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
      <script src="/assets/vendor/simple-datatables/simple-datatables.js"></script>
      <script src="/assets/vendor/quill/quill.min.js"></script>
      <script src="/assets/vendor/tinymce/tinymce.min.js"></script>
      <script src="/assets/js/common.js"></script>
       <script src="/assets/js/jquery-3.7.1.js"></script>
       

      <script>
      
      $(document ).ready(function() {
    	  var baseYear = ${BASE_YEAR};
    	  var nw = new Date();
    	  currentYear = nw.getFullYear();
    	  currentMonth = nw.getMonth()+1;  //0 : 1월, 5:6월, 11:12월
    	  if(currentMonth<10){
    		  currentMonth="0"+currentMonth;
    	  }
    	  
    	  for(var i=baseYear;i<=currentYear;i++){
    	  	 $('#planDtYY').append("<option value='"+i+"'>"+i+"</option>");
    	  }
    	  $('#planDtYY').val(currentYear);
    	  
    	  for(var i=1;i<=12;i++){
    		  if(i<10){
    			  mth = "0"+i;
    		  }else{
    			  mth = i;
    		  }
    	  	$('#planDtMM').append("<option value='"+mth+"'>"+mth+"월</option>");
    	  }
    	  $('#planDtMM').val(currentMonth);
    	});
    
      function pdtesearch(no){
    	  if(no==undefined){
      		$('#currentPage').val(1);
      	}else{
      		$('#currentPage').val(no);	
      	}
    	
    	  call_server (searchform, "/product/productSearch", getProductList )
    	  
      }
      
      function getProductList(vo) {
    	    var list = vo.prdList;
    	    $('#pdtListTable > tbody').empty();
    	    $("#planYear").val($("#planDtYY").val());
            $("#planMonth").val($("#planDtMM").val());
    	    for (var i = 0; i < list.length; i++) {
    	         

    	        var str = "<tr>";
    	        str += "<th scope=\"row\">" + ((Number(vo.currentPage) - 1) * vo.countPerPage + (i + 1)) + "</th>";
    	        str += "<td>" + list[i].itemCd + "</td>";
    	        str += "<td>" + list[i].itemName + "</td>";
    	        str += "<td>" + list[i].sitemCd + "</td>";
    	        str += "<td>" + list[i].sitemName + "</td>";
    	        str += "<td>" + list[i].productQty + "</td>";
    	        str += "<td>" + list[i].insQty + "</td>";
    	        str += "<td>" + list[i].totalQty + "</td>"; 
    	        str += "</tr>";

    	        $('#pdtListTable').append(str);
    	    }

    	    setPaging(PdtPaging, vo.startPage, vo.endPage, 'pdtesearch');
    	}
      
  	// Excel파일 다운로드
  	function excelsearch() {
  	    // 서버에 엑셀 파일 생성 요청 보내기
  	    var formData = new FormData($(searchform)[0]);
  	    
  	    $.ajax({
  	    	data : formData,
  		    type: "POST",
  		    contentType: false,
  	        processData: false,
  		    url: "/product/createExcel",
  		    xhrFields:{
  		        responseType: 'blob'
  		    },
  		    success: function (result) {
  		        var blob = result;
  		        var downloadUrl = URL.createObjectURL(blob);
  		        var a = document.createElement("a");
  		        a.href = downloadUrl;
  		        a.download = "product.xlsx";
  		        document.body.appendChild(a);
  		        a.click();
  		    }
  		});
  	
  		alert('엑셀파일 다운로드되었습니다.');
  	    
  	}

      </script>
    </section>
  </main>

  <!-- Template Main JS File -->
  <script src="/assets/js/main.js"></script>
</body>
</html>
