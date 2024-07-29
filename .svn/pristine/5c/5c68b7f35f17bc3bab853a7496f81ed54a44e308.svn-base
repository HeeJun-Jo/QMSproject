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
      <h1>주문관리</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">홈</a></li>
          <li class="breadcrumb-item">주문관리</li>
          <li class="breadcrumb-item active">주문조회</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section">
      <div class="card">
        <div class="card-body" >
          <h5 class="card-title">주문조회</h5>
          	<form id="searchform">
          	<input type='hidden' id='currentPage' name='currentPage' value='1'>
            <div class="row mb-1">
              <label for="title" class="col-sm-1 col-form-label">배송일</label>
                                
              <div class="col-sm-2">
                 <input type="date" class="form-control" name="deliveryDtFrom">
		         </div>
		         <div class="col-sm-2">
		       <input type="date" class="form-control" name="deliveryDtTo">

              </div>
            
              <label for="title" class="col-sm-1 col-form-label">품번</label>
              <div class="col-sm-1">
                <input type="text" class="form-control" id="itemCd" name="itemCd">
              </div>
             
              <label for="title" class="col-sm-1 col-form-label">거래처</label>
              <div class="col-sm-2">
              
               <input type="text" class="form-control" id="compName" name="compName">
               <button type ="button"  onclick="partnerPopup(1);" ><img src='/assets/img/button.jfif'></button>
                 
                 </div>
              
              <div class="col-sm-12 text-end">
                <button type="button" class="btn btn-info" onclick="searchOrder();">조회</button>
                <button type="button" class="btn btn-primary" onclick="newOrder();">신규</button>
                 
              </div>
            </div>
            </form>
            </div>
            </div>
        
   

      <div class="card">
        <div class="card-body">
          <h5 class="card-title"></h5>
           <form id="dataform" > 
          <table class="table table-hover" id="ordListTable">
        
            <thead>
              <tr>
                <th scope="col">NO</th>
                <th scope="col">주문번호</th>
                <th scope="col">거래처명</th>
                <th scope="col">품번</th>
                <th scope="col">품명</th>
                <th scope="col">품목단가</th>
                <th scope="col">판매수량</th>
                <th scope="col">판매단가</th>
                <th scope="col">상태</th>
                <th scope="col">배송일</th>
                <th scope="col">등록일</th>
              </tr>
            </thead>
             <tbody>
              <!-- Data rows go here -->
            </tbody>
          </table>
          <nav aria-label="Page navigation example">
			<ul class="pagination" id="orderPaging">

			</ul>
		  </nav>
          </form>
        </div>
      </div>
       
      <!-- Modal -->
      <div class="modal fade" id="orderDtlTable" tabindex="-1" aria-labelledby="boardInfoLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl modal-dialog-centered">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="boardInfoLabel">주문 등록/수정</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
            <form id="orderform" >
            <input type='hidden' id='orderNo' name='orderNo'>
            <input type='hidden' id='orderQty' name='orderQty'>
            <input type='hidden' id='orderPrice' name='orderPrice'>
            
			  <div class="container mt-5">
			    <table class="table table-hover" id="orderDtlTb">
			        <thead>
			            <tr>
			             <td id = "saveTxt"><td>
			                <th scope="col" class="col-sm-1">거래처코드</th>
			                <td><input type="text" onclick="partnerPopup(2);" id="compCdM" name="compCd" class="form-control"></td>
			                <th scope="col" class="col-sm-1">배송일</th>
			                <td><input type="date" class="form-control" id="deliveryDtM" name="deliveryDt"></td>
			                <th scope="col" class="col-sm-1">주문상태</th>
			                <td><input type="text" id="orderStatusM" name="orderStatus" class="form-control"  readonly></td>
			            </tr>
			            <tr>
			                <th scope="col" class="col-sm-1 col-form-label">품목정보</th>
			                <td colspan="5" class="add-btn-cell">
			                    <button type="button" class="btn btn-secondary" onclick="addBtn();">+</button>
			                </td>
			            </tr>
			            <tr>
			                <th scope="col">NO</th>
			                <th scope="col" >품번</th>
			                <th scope="col" >품명</th>
			                <th scope="col" >박스규격</th>
			                <th scope="col" >BOX수량</th>
			                <th scope="col" >단가</th>
			                <th scope="col" >판매수량</th>
			                <th scope="col" >판매단가</th>
			                <th scope="col">삭제</th>
			            </tr>
			            
			        </thead>
			       
			        <tbody>
			            <!-- New rows will be added here -->
			        </tbody>
			    </table>
			     
     		</div>
     		</form>
		</div>
		<div class="modal-footer">
		    <button type="button" class="btn btn-primary" id ="complete" onclick="complete();" data-bs-dismiss="modal">발송완료</button>
		    <button type="button" class="btn btn-primary" id ="inbtn" onclick="saveOrder();" data-bs-dismiss="modal">저장</button>
		    <button type="button" class="btn btn-primary" id ="upbtn" onclick="repairOrder();" data-bs-dismiss="modal">수정</button>
		    <button type="button" class="btn btn-primary" data-bs-dismiss="modal">닫기</button>
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
    
        function searchOrder(pno){
        	
        	if(pno==undefined){
        		$('#currentPage').val(1);
        	}else{
        		$('#currentPage').val(pno);	
        	}
        	
        	 
        	call_server(searchform,'/order/orderSearch',getOrderList);
        	
        }
        
        function getOrderList(vo) {
        	
            var list = vo.orderlist;
           
            $('#ordListTable > tbody').empty();

            var orderNoCount = {};
            for (var i = 0; i < list.length; i++) {
                var orderNo = list[i].orderNo;
                if (orderNo in orderNoCount) {
                    orderNoCount[orderNo]++;
                  
                } else {
                    orderNoCount[orderNo] = 1;
                }
            }

            for (var i = 0; i < list.length; i++) {
                var str = "<tr>";
                str += "<th scope=\"row\">" + ((Number(vo.currentPage) - 1) * vo.countPerPage + (i + 1)) + "</th>";
              
                if (i === 0 || list[i].orderNo !== list[i - 1].orderNo) {
                    var rowspan = orderNoCount[list[i].orderNo];
                    str += "<td rowspan=\"" + rowspan + "\"  onclick=\"orderDetail('" + list[i].orderNo + "');\" style=\"cursor:pointer;\">" + list[i].orderNo + "</td>";
                    str += "<td rowspan=\"" + rowspan + "\">" + list[i].compName + "</td>";
                }
                str += "<td>" + list[i].itemCd + "</td>";
                str += "<td>" + list[i].itemName + "</td>";
                str += "<td>" + list[i].unitPrice + "</td>";
                str += "<td>" + list[i].orderQty + "</td>";
                str += "<td>" + list[i].orderPrice + "</td>";
                str += "<td>" + list[i].orderStatusNm + "</td>";
                str += "<td>" + list[i].deliveryDt + "</td>";
                str += "<td>" + list[i].regDt + "</td>";
                str += "</tr>";
                
                $('#ordListTable').append(str);
               
            }
            
            setPaging(orderPaging, vo.startPage, vo.endPage, 'searchOrder');
        }
        
        function newOrder(){
            
        	$('#compCdM').val("");
        	$('#deliveryDtM').val("");
        	
        	
        	$('#orderDtlTb > tbody').empty();
        	$('#orderDtlTable').modal('show');    	
        	$('#upbtn').hide();
        	$('#complete').hide();
        	$('#inbtn').show();
        }
        
        function saveOrder(){

         
        	call_server(orderform,'/order/insertOrder',getUpdateOrder);
           }
        
        function repairOrder(){

           
         	call_server(orderform,'/order/updateOrder',getUpdateOrder);
           }
       
        
        
        function complete(){
          
     			
         	call_server(orderform,'/order/upOrderStatus',getUpdateOrder); 
           
     	}  	  	
        
       
      
        	       
        function getUpdateOrder(cnt){
            
        	   if(cnt>0){
	     		   alert("저장되었습니다.");
	     		  $('#orderDtlTable').modal('hide');
	     		       		   
	     	   }else{
	     		   alert("저장시 오류가 발생하였습니다.");
	     	   }
        	   searchOrder(); 
	     }
        
        
               
        
        function orderDetail(no){
        	
        	$('#orderNo').val(no);
        	
        	call_server(orderform,'/order/orderDtl',getOrderDtlList);
        }
        
        
        function getOrderDtlList(vo){
        	console.log(vo);
        	var list = vo.orderDtlList;
        	  $('#orderDtlTb > tbody').empty();
        	  cnt = list.length;
        	 for (var i = 0; i < list.length; i++) {
                 
        		 addRowItem(list[i], i);
        		 
        		 $('#orderStatusM').val(list[i].orderStatusNm);
        		 $('#compCdM').val(list[i].compCd);
                 $('#deliveryDtM').val(list[i].deliveryDt);
             
        	 }
        	 $('#inbtn').hide();
        	 $('#upbtn').show();
        	 $('#complete').show();
        	 $('#orderDtlTable').modal('show');
        	 
        	 if ($('#orderStatusM').val() == "대기") {
        		    $('#upbtn').prop('disabled', false); 
        		    $('#complete').prop('disabled', false); 
        		} else if ($('#orderStatusM').val() == "완료") {
        		    $('#complete').prop('disabled', true); 
        		    $('#upbtn').prop('disabled', true); 
        		}
             
        
        setPaging(orderPaging, vo.startPage, vo.endPage, 'orderDetail');
    }

        
        var row1;
    	function partnerPopup(no){
    		row1 = no;
    		window.open('/receive/partnerSearch','popup',"width=800, height=800");
    		
    	}	
    	function receivePartnerData(item){
		//	console.log(item);
    		if(row1 == 1){
    			$('#compName').val(item.compName);
    			
    		}else{
                
    			$('#compCdM').val(item.compCd);
    		    		
         	}
    	 }
    
    	var cnt = 0;

     	
     	function addBtn() {
     		addRowItem(null, cnt);
     	    cnt++;
     	       	 
     	  }
     	
     	
     	function addRowItem(vo, c){
			if(vo==null){
				vo = new Object();
				vo.itemCd='';
				vo.itemName='';
				vo.boxType='';
				vo.boxQty='';
				vo.unitPrice='';
				vo.orderQty='';
				vo.orderPrice='';
			}
     		var str = "<tr>";
     	    str += "<td>" + c + "</td>"; 
     	    str += "<td><input type='text' name='orderlist["+c+"].itemCd'     id='itemCd"+c+"'     style='width:100px;' class='form-control' value='" + vo.itemCd + "' onclick ='popup("+c+");'></td>";
     	    str += "<td><input type='text' name='orderlist["+c+"].itemName'   id='itemName"+c+"'   style='width:100px;' class='form-control' value='" + vo.itemName + "' readonly></td>";
     	    str += "<td><input type='text' name='orderlist["+c+"].boxType'    id='boxType"+c+"'    style='width:100px;' class='form-control' value='" + vo.boxType + "' readonly></td>";
     	    str += "<td><input type='text' name='orderlist["+c+"].boxQty'     id='boxQty"+c+"'     style='width:100px;' class='form-control' value='" + vo.boxQty + "' readonly></td>";
     	    str += "<td><input type='text' name='orderlist["+c+"].unitPrice'  id='unitPrice"+c+"'  style='width:100px;' class='form-control' value='" + vo.unitPrice + "' readonly></td>";
     	    str += "<td><input type='text' name='orderlist["+c+"].orderQty'   id='orderQty"+c+"'   style='width:100px;' class='form-control' value='" + vo.orderQty + "' ></td>";
     	    str += "<td><input type='text' name='orderlist["+c+"].orderPrice' id='orderPrice"+c+"' style='width:100px;' class='form-control' value='" + vo.orderPrice + "' ></td>";
     	    str += "<td><button type='button' class='btn btn-secondary' onclick='delTr(this);'>삭제</button></td>";
     	    str += "</tr>";
     	    $('#orderDtlTb').append(str);
     	    
     	   
     	}
     	
     	
     	function delTr(btn) {
     	    $(btn).closest('tr').remove();
     	   // updateRowNumbers();
     	}

     	var activeCnt;
     	function popup(cnt){
    		//$('#cnt').val(cnt);
    		activeCnt=cnt;
    		var popup = window.open("/bom/bomPopup", "상세보기", "width=800, height=800");
    	}
    	function receiveItemData(item) {
    		$('#itemCd'+activeCnt).val(item.itemCd);
    		$('#itemName'+activeCnt).val(item.itemName);
    		$('#boxType'+activeCnt).val(item.boxType);
    		$('#boxQty'+activeCnt).val(item.boxQty);
    		$('#unitPrice'+activeCnt).val(item.unitPrice);
    	} 
     	
   /* 

     	function updateRowNumbers() {
     	    $('#orderDtlTb tbody tr').each(function(index) {
     	        $(this).find('td:first').text(index + 1);
     	    });
     	    cnt = $('#orderDtlTb tbody tr').length + 1;
     	}
     */
        
      </script>
    </section>
  </main>

  <!-- Template Main JS File -->
  <script src="/assets/js/main.js"></script>
</body>
</html>
