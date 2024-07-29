<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

 


<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>거래처조회</title>
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
      <h1>거래처조회</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">홈</a></li>
          <li class="breadcrumb-item">시스템관리</li>
          <li class="breadcrumb-item active">거래처조회</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section">
      <div class="card">
        <div class="card-body" >
          <h5 class="card-title">거래처조회</h5>
          	<form id="searchform">
          	<input type='hidden' id='currentPage' name='currentPage' value='1'>
            <div class="row mb-3">
              <label for="title" class="col-sm-2 col-form-label">등록일</label>
                                
              <div class="col-sm-4">
                 <input type="date" class="form-control" name="regDtFrom">
		         </div>
		         <div class="col-sm-2">
		       <input type="date" class="form-control" name="regDtTo">

              </div>
               </div>
             <div class="row mb-3">
              <label for="title" class="col-sm-2 col-form-label">거래처명</label>
              <div class="col-sm-4">
                <input type="text" class="form-control" id="compNametxt" name="compName">
              </div>
               </div>
               
               <div class="row-mb-3">
              <label for="title" class="col-sm-2 col-form-label">거래처유형</label>
              <div class="col-sm-4">
                <div class="input-group">
                  <input type="text" class="form-control" id="compType" name="compType">
                  <button class="btn btn-primary" type="button" onclick="partnerPopup(1)">
                    <i class="ri-search-2-line"></i>
                  </button>
                </div>
              </div>
            </div>
               
                      
                
                 
               </div>
              <div class="row mb-3">
              <div class="col-sm-12 text-end">
                <button type="button" class="btn btn-info" onclick="ptnsearch();">조회</button>
                <button type="button" class="btn btn-primary" onclick="insertPartner();">신규</button>
              </div>
            </div>
            </form>
            </div>
            </div>
        
   

      <div class="card">
        <div class="card-body">
          <h5 class="card-title"></h5>
           <form id="dataform" > 
          <table class="table table-hover" id="PtnListTable">
        
            <thead>
              <tr>
                <th scope="col">NO</th>
                <th scope="col">거래처코드</th>
                <th scope="col">거래처명</th>
                <th scope="col">거래처유형</th>
                <th scope="col">대표자명</th>
                <th scope="col">연락처</th>
                <th scope="col">이메일</th>
                <th scope="col">담당자명</th>
                <th scope="col">담당자연락처</th>
                <th scope="col">등록일</th>
              </tr>
            </thead>
             <tbody>
              
            </tbody>
          </table>
          <nav aria-label="Page navigation example">
			<ul class="pagination" id="PtnPaging">

			</ul>
		  </nav>
          </form>
        </div>
      </div>

      
        <!-- Modal -->
      <div class="modal fade" id="partnerDtlTable" tabindex="-1" aria-labelledby="boardInfoLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl modal-dialog-centered">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="boardInfoLabel">거래서 등록/수정</h5>
              
            </div>
            <div class="modal-body">
            <form id="ptnDtform" enctype="multipart/form-data">
            	<!--input type ="hidden" id="compCd" name="compCd"-->
               <table class="table table-hover" id="partnerDtl">
               <thead>
                <tr>
                  <th scope="col">거래처코드</th>
                  <td><input type="text" class="form-control" id="compCdtxt" name="compCd" ></td>
                  <td>
					  <div class="icon" >
					    <i class="ri-search-2-line" style="cursor:pointer;" onclick="partnerPopup(2)"></i><div class="label"></div>
					  </div>
				  </td>
                  <th scope="col">거래처명</th>
                  <td ><input style="width: 100px;" type="text" class="form-control" id="compNametxt2" name="compName" ></td>
                </tr>
                <tr>
                  <th scope="col">거래처유형</th>
                  <td>
                    <select class="form-control" id="comptypeYn" name="compType" >
					  <option value="">선택</option>                    
                      <option value="C">C</option>
                      <option value="S">S</option>
                    </select>
                  </td>
                  <th scope="col">사업자번호</th>
                  <td><input type="text" class="form-control" id="bizNotxt" name="bizNo" ></td>
                </tr>
                <tr>
                  <th scope="col">거래여부</th>
                	<td>
                    <select class="form-control" id="tradeYn" name="tradeYn">
					  <option value="">선택</option>					                      
                      <option value="Y">Y</option>
                      <option value="N">N</option>
					</select>
                  </td>
               	  <th scope="col">대표자명</th>
                  <td><input type="text" class="form-control" id="compCeotxt" name="compCeo" ></td>
                </tr>
                  <tr>
                  <th scope="col">연락처</th>
                	<td><input type="text" class="form-control" id="phonetxt" name="phone" ></td>
                <th scope="col">이메일</th>
                  <td><input type="text" class="form-control" id="emailtxt" name="email" ></td>
                </tr>
                  <tr>
                  <th scope="col">주소</th>
                <td><input type="text" class="form-control" id="addrtxt" name="addr" ></td>
                </tr>
                <tr>
                  <th scope="col">담당자명</th>
                <td><input type="text" class="form-control" id="mgrNametxt" name="mgrName" ></td>
                <th scope="col">직위</th>
                  <td><input type="text" class="form-control" id="mgrPositiontxt" name="mgrPosition" ></td>
                </tr>
                <tr>
                  <th scope="col">담당자연락처</th>
                <td><input type="text" class="form-control" id="mgrPhonetxt" name="mgrPhone" ></td>
                </tr>
               </thead>
               </table>
                <table class="table table-hover">
				<thead>
				  <tr>
					<td colspan="9" style="text-align: right;">
					  <table style = "width: 100%;">
						<tr>
						  <td style = "text-align: left;">거래 품목정보</td>
						  <td style="text-align:right;"><button type="button" class="btn btn-primary" onclick="addButton()">+</button></td>
						</tr>
					  </table>
   					</td>
				  </tr>
               	<tr>
                  <th scope="col">NO</th>
                  <th scope="col">품번</th>
                  <th scope="col">품명</th>
                  <th scope="col">박스규격</th>
                  <th scope="col">박스수량</th>
                  <th scope="col">중량</th>
                  <th scope="col">단가</th>
                  <th scope="col">재고위치</th>
                  <th scope="col">삭제</th>
                </tr>
                </thead>
                <tbody id="modalTbody">
				</tbody>
              </table>
              </form>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-info" onclick="ptnsave();"id = "savebtn">저장</button>
              <button type="button" class="btn btn-info" onclick="ptnupdate();"id = "updatebtn">수정</button>
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
    
      	function ptnsearch(no){
      		
      		if(no==undefined){
        		$('#currentPage').val(1);
        	}else{
        		$('#currentPage').val(no);	
        	}
       		
      		call_server (searchform, "/partner/ptnSearch", getptnList);
      	}
      	
      	function getptnList(vo){
      		list  = vo.partnerList;
			$('#PtnListTable > tbody').empty();
             for(var i=0;i<list.length;i++){
            	str="<tr onclick=\"partnerDetail('"+list[i].compCd+"');\" style=\"cursor:pointer;\"></a>";
            	str+="<th scope=\"row\">"+((Number(vo.currentPage)-1)*vo.countPerPage+(i+1))+"</th>";
            	str+="<td>"+list[i].compCd+"</td>";
            	str+="<td>"+list[i].compName+"</td>";
				str+="<td>"+list[i].compType+"</td>";
				str+="<td>"+list[i].compCeo+"</td>";
				str+="<td>"+list[i].phone+"</td>";
				str+="<td>"+list[i].email+"</td>";
				str+="<td>"+list[i].mgrName+"</td>";
				str+="<td>"+list[i].mgrPhone+"</td>";
				str+="<td>"+list[i].regDt+"</td>";
				str+="</tr>";
				$('#PtnListTable').append(str);
      		
      		}
             setPaging(PtnPaging, vo.startPage, vo.endPage,'ptnsearch' );
             
      	}
      	function partnerDetail(cd){
      		$('#compCdtxt').val(cd);
      		
      		$('#modalTbody').empty();
      		
      		
      		call_server (ptnDtform, "/partner/partnerDetail", partnerDt);
      	}
      	function partnerDt(vo){
      		console.log(vo);
      		$('#ptnDtform')[0].reset();
      		$('#modalTbody').empty();
      		$('#compCdtxt').val(vo.compCd);
      		$('#compNametxt2').val(vo.compName);
      		$('#comptypeYn').val(vo.compType);
      		$('#bizNotxt').val(vo.bizNo);
      		$('#tradeYn').val(vo.tradeYn);
      		$('#compCeotxt').val(vo.compCeo);
      		$('#addrtxt').val(vo.addr);
      		$('#phonetxt').val(vo.phone);
      		$('#emailtxt').val(vo.email);
      		$('#mgrNametxt').val(vo.mgrName);
      		$('#mgrPositiontxt').val(vo.mgrPosition);
      		$('#mgrPhonetxt').val(vo.mgrPhone);
      		rowidx = 0;
    		list = vo.partnerList;
    		for(var i = 0; i < list.length; i++){
    		    setRowData(list[i]);
    		}
      		$('#updatebtn').show();
      		$('#savebtn').hide();
      		$('#partnerDtlTable').modal('show');
      		
      	}
      	function insertPartner(){
      		$('#ptnDtform')[0].reset();
      		$('#modalTbody').empty();
      		$('#compCdtxt').val('');
      		$('#compNametxt2').val('');
      		$('#bizNotxt').val('');
      		$('#compCeotxt').val('');
      		$('#phonetxt').val('');
      		$('#emailtxt').val('');
      		$('#mgrNametxt').val('');
      		$('#mgrPositiontxt').val('');
      		$('#mgrPhonetxt').val('');
      		$('#updatebtn').hide();
      		$('#savebtn').show();
      		$('#partnerDtlTable').modal('show');
      	}
      	function ptnsave(){
      		call_server (ptnDtform, "/partner/ptnInsert", ptnsave2)
      		
      	}
      	
      	function ptnsave2(cnt){
      		if(cnt>0){
      			alert("저장되었습니다.");
      		$('#partnerDtlTable').modal('hide');
      		}else{
      		alert("오류가 발생하였습니다.")
      		}
			ptnsearch();
			}
      	
      	
      	function ptnupdate(){
      		call_server (ptnDtform, "/partner/partnerUpdate", Updateptn)
      	}
      	function Updateptn(cnt){
      		
    	  if(cnt>0){
    		  alert("수정되었습니다.");
    		  $('#partnerDtlTable').modal('hide');    	  		
      		}else{
    		  alert("오류가 발생하였습니다.");
	      	}
			ptnsearch();
      		}
     
    	
    	var rowidx = 0;
    	
    	function setRowData(vo){ 
    		console.log(vo);
    		if(vo==null){
    			vo = new Object();
    			vo.itemCd='';
    			vo.itemName='';
    			vo.boxType='';
    			vo.boxQty='';
    			vo.inQty = '';
    			vo.unitPrice='';
    			vo.location='';
    			vo.weight='';
    			vo.unitPrice='';
    		}else{
    			console.log(vo);
    		}
    		
            var str =  "<tr>";
            str += "<th scope=\"row\">"+(rowidx+1)+"</th>";
            str += "<td><div class=\"icon\">";
            str += "<input type='text' id=\"itemCd"+rowidx+"\" name='itemInfoList["+rowidx+"].itemCd' value='"+vo.itemCd+"'style=\"width: 100px;\">";
            str += "<i class=\"ri-search-2-line\" onclick='itemPopup("+rowidx+");' style=\"cursor:pointer;\"></i>";
            str += "<div class=\"label\"></div>";
            str += "</div></td>";
            str += "<td><input type=\"text\" id=\"itemName" + rowidx + "\" value='" + vo.itemName + "' style=\"width: 100px;\"></td>";
            str += "<td><input  type=\"text\" id=\"boxType"+rowidx+"\" value='"+vo.boxType+"'style=\"width: 100px;\"></td>";
            str += "<td><input type=\"text\" id=\"boxQty"+rowidx+"\" value='"+vo.boxQty+"'style=\"width: 100px;\"></td>";
            str += "<td><input type=\"text\" id=\"weight"+rowidx+"\" value='"+vo.weight+"'style=\"width: 100px;\"></td>";
            str += "<td><input type=\"text\" id=\"unitPrice"+rowidx+"\" value='"+vo.unitPrice+"'style=\"width: 100px;\"></td>";
            str += "<td><input type=\"text\" id=\"location"+rowidx+"\" value='"+vo.location+"'style=\"width: 100px;\"></td>";
            str += "<td><button type=\"button\" class=\"btn btn-secondary\" onclick=\"delTr(this);\">삭제</button></td>";
            str += "</tr>";
            $('#modalTbody').append(str);
    	    
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
    	function receiveItemData(vo){
    		console.log(vo);
    		$('#itemCd'+row2).val(vo.itemCd);
    		$('#itemName'+row2).val(vo.itemName);
    		$('#boxType'+row2).val(vo.boxType);
    		$('#boxQty'+row2).val(vo.boxQty);
    		$('#location'+row2).val(vo.location);
    		$('#weight'+row2).val(vo.weight);
    		$('#unitPrice'+row2).val(vo.unitPrice);
    	}
    	
    
        
      </script>
    </section>
  </main>

  <!-- Template Main JS File -->
  <script src="/assets/js/main.js"></script>
</body>
</html>
