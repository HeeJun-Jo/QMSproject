<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

 <%@ page import="com.qms.table.vo.user.UserInfoVO" %>
<%
		UserInfoVO uservo = (UserInfoVO)session.getAttribute("MallUser");
		System.out.println("=====================");
		if(uservo!=null){
		System.out.println(uservo.getUserId());
		}
 %>



<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>입고 관리</title>
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

  <%@ include file="../layout/menu.jsp" %>

  <main id="main" class="main container">

    <div class="pagetitle">
      <h1>입고관리</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">홈</a></li>
          <li class="breadcrumb-item">입고관리</li>
          <li class="breadcrumb-item active">입고조회</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section">
      <div class="card">
        <div class="card-body" >
          <h5 class="card-title">입고조회</h5>
          	<form id="searchform">
          	<input type='hidden' id='currentPage' name='currentPage' value='1'>
            <div class="row mb-3">
              <label for="title" class="col-sm-2 col-form-label">입고일</label>
                                
              <div class="col-sm-4">
                 <input type="date" class="form-control" name="inDtFrom">
		         </div>
		         <div class="col-sm-2">
		       <input type="date" class="form-control" name="inDtTo">

              </div>
               </div>
             <div class="row mb-3">
              <label for="title" class="col-sm-2 col-form-label">INVOICE번호</label>
              <div class="col-sm-4">
                <input type="text" class="form-control" id="invoiceNo" name="invoiceNo">
              </div>
               </div>
               
               <div class="row mb-3">
              <label for="title" class="col-sm-2 col-form-label">거래처</label>
               <button type="button" class="btn btn-info" onclick="compSearch();" id="compName" name="compName" style="WIDTH:60pt; HEIGHT:25pt">검색</button>
                 
               </div>
                <div class="row mb-3">
              <div class="col-sm-12 text-end">
                <button type="button" class="btn btn-info" onclick="searchRcv();">조회</button>
                <button type="button" class="btn btn-primary" onclick="newReceive();">신규</button>
                 <button type="button" class="btn btn-primary" onclick="excel();">엑셀</button>
              </div>
            </div>
            </form>
            </div>
            </div>
        
   

      <div class="card">
        <div class="card-body">
          <h5 class="card-title"></h5>
           <form id="dataform" > 
          <table class="table table-hover" id="RcvListTable">
        
            <thead>
              <tr>
                <th scope="col">NO</th>
                <th scope="col">입고일</th>
                <th scope="col">거래처명</th>
                <th scope="col">INVOICE NO</th>
                <th scope="col">총급액(원)</th>
                <th scope="col">품목수</th>
                <th scope="col">등록일</th>
                <th scope="col">다운로드</th>
              </tr>
            </thead>
             <tbody>
              <!-- Data rows go here -->
            </tbody>
          </table>
          <nav aria-label="Page navigation example">
			<ul class="pagination" id="rcvPaging">

			</ul>
		  </nav>
          </form>
        </div>
      </div>
       
      <!-- Modal -->
      <div class="modal fade" id="noticeTable" tabindex="-1" aria-labelledby="boardInfoLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl modal-dialog-centered">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="boardInfoLabel">거래처조회</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
            <form id="noticeform" enctype="multipart/form-data">
             <input type ="hidden" id="noticeSeq" name="noticeSeq">
              <input type="hidden" id="quill_html" name="content">
              <table class="table table-hover" id="noticeDtl">
                  <tr>
                  <th scope="col">거래처코드</th>
                  <td><input type="text" class="form-control"  ></td>
                </tr>
                <tr>
                  <th scope="col">거래처명</th>
                <td><input type="text" class="form-control"  ></td>
                </tr>
           
                <tr>
                  <th scope="col">NO</th>
                  <th scope="col">거래처코드</th>
                  <th scope="col">거래처명</th>
                  <th scope="col">대표자명</th>
                  <th scope="col">사업자번호</th>
                  <th scope="col">연락처</th>
                  <th scope="col">선택</th>
               </tr>
              </table>
              	
              </form>
            </div>
            <div class="modal-footer">
        
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
            </div>
          </div>
        </div>
      </div>
      
        <!-- Modal -->
      <div class="modal fade" id="noticeTable" tabindex="-1" aria-labelledby="boardInfoLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl modal-dialog-centered">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="boardInfoLabel">입고등록</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
            <form id="noticeform" enctype="multipart/form-data">
               <table class="table table-hover" id="noticeDtl">
                <tr>
                  <th scope="col">INVOICE NO</th>
                  <td><input type="text" class="form-control" id="invoiceNo" name="title" ></td>
                </tr>
                <tr>
                  <th scope="col">거래처코드</th>
                  <td><input type="text" class="form-control" id="comCd" name="comCd" ></td>
                </tr>
                <tr>
                  <th scope="col">거래처명</th>
                <td><input type="text" class="form-control" id="compName" name="compName" ></td>
                </tr>
                  <tr>
                  <th scope="col">입고일</th>
                <td><input type="text" class="form-control" id="inDt" name="inDt" ></td>
                </tr>
                <tr>
                 <button type="button" class="btn btn-info" onclick="receiveSearch();">조회</button>
                 <button type="button" class="btn btn-primary" onclick="newReceive();">신규</button>
                </tr>
                <tr>
                  <th scope="col">NO</th>
                  <th scope="col">품번</th>
                  <th scope="col">품명</th>
                  <th scope="col">박스규격</th>
                  <th scope="col">박스수량</th>
                  <th scope="col">입고수량</th>
                  <th scope="col">단가</th>
                  <th scope="col">재고위치</th>
                  <th scope="col">삭제</th>
                </tr>
              </table>
              	
              </form>
            </div>
            <div class="modal-footer">
            
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
            </div>
          </div>
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
    
        function searchRcv(){
        	
       // 	if(no==undefined){
       // 		$('#currentPage').val(1);
       // 	}else{
       // 		$('#currentPage').val(no);	
       // 	}
        	
        	 
        	call_server(searchform,'/receive/rcvSearch',getRcvList);
        	
        }
        
        function getRcvList(vo){
        	
        	list = vo.receivelist;
        	  $('#RcvListTable > tbody').empty();
        	for(var i=0;i<list.length;i++){
        	 
        		str="<tr>";
        	    str+="<th scope=\"row\">"+((Number(vo.currentPage)-1)*vo.countPerPage+(i+1))+"</th>";	
				str+="<td>"+list[i].inDt+"</td>";
				str+="<td>"+list[i].compName+"</td>";
				str+="<td>"+list[i].invoiceNo+"</td>";
				str+="<td>"+list[i].inPrice+"</td>";
				str+="<td>"+list[i].inQty+"</td>";
				str+="<td>"+list[i].regDt+"</td>";
			//	str += "<td><a href=""><img src='/assets/img/filedown.png'></a></td>";
				str+="</tr>";
				$('#RcvListTable').append(str);
        	}
        	 setPaging(rcvPaging, vo.startPage, vo.endPage,'searchRcv' );	       	
        }
               
     
       
        
        
        
      </script>
    </section>
  </main>

  <!-- Template Main JS File -->
  <script src="/assets/js/main.js"></script>
</body>
</html>
