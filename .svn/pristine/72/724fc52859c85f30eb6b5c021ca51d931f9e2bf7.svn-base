<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>기안서 작성</title>
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
      margin-bottom: 0;
    }
  </style>
</head>

<body>

 	<%@ include file="../layout/menu.jsp" %>
	<%@ include file="../layout/footer.jsp" %>
  <main id="main" class="main container">
	<form id="aprv01form" enctype="multipart/form-data">
    <section class="section">
      <div id="full">
        <div id="screen_left">
          <div id="screenleft-1" class="table-section">
            <table>
              <tr>
                <th scope="col" id="docNoLabel">문서번호</th>
                <td><input type="text" class="input-box" id="docNo" name="docNo" readonly></td>
                <th scope="col" id="regDtLabel">등록일</th>
                <td><input type="date" class="input-box" id="regDt" name="regDt" readonly></td>
              </tr>
              <tr>
                <th scope="col" id="userNameLabel">등록자</th>
                <td>
                  <input type="text" class="input-box" id="userName" name="userName" readonly>
                </td>
                <th scope="col" id="deptNameLabel">부서</th>
                <td><input type="text" class="input-box" id="deptName" name="deptName" readonly></td>
              </tr>
              <tr>
                <th scope="col">문서유형</th>
                <td>
                  <select id="docType" name="docType" class="input-box">
                    <option value="">선택</option>
                  </select>
                </td>
                <th scope="col">보존기한</th>
                <td>
                  <select id="preserveYear" name="preserveYear" class="input-box">
                    <option value="">선택</option>
                  </select>
                </td>
              </tr>
              <tr>
                <th scope="col">문서종류</th>
                <td>
                  <select id="docClass" name="docClass" class="input-box" >
                    <option value="">선택</option>
                  </select>
                </td>
                <th scope="col">문서상태</th>
                <td>
                  <select id="docStatus" name="docStatus" class="input-box" onFocus="this.initialSelect = this.selectedIndex;" onChange="this.selectedIndex = this.initialSelect;">
                    <option value="">선택</option>
                  </select>
                </td>
              </tr>
            </table>
          </div>
          <div id="screenleft-2" class="table-section">
		    <table id="approvalTable">
		        <tr>
		            <th scope="col">결재라인</th>
		            <td colspan='6'>
		                <button type="button" class="btn btn-info" onclick="openPop()">+</button>
		            </td>
		        </tr>
		        <tr>
		            <th scope="col">NO</th>
		            <th scope="col">성명</th>
		            <th scope="col">부서</th>
		            <th scope="col">직위</th>
		            <th scope="col">결재유형</th>
		            <th scope="col">상태</th>
		            <th scope="col">삭제</th>
		        </tr>
		    </table>
		</div>
          	<div id="screenleft-3" class="table-section">
	        <table id="fileTable">
	            <thead>
                <tr>
                    <th scope="col">첨부파일</th>
                    <td>
                        <button type="button" class="btn btn-info" id="addFileBtn">+</button>
                    </td>
                </tr>
                <tr>
                    <th scope="col">NO</th>
                    <th scope="col">파일명</th>
                    <th scope="col">파일크기(Kbyte)</th>
                    <th scope="col">삭제</th>
                </tr>
            </thead>
            <tbody>
                <!-- Files will be added here -->
            </tbody>
        </table>
    	</div>
        </div>
        <div id="screen_right">
          <table class="table-section">
            <tr>
              <th scope="col">제목</th>
              <td><input type="text" class="input-box" id="title" name="title"></td>
            </tr>
            <tr>
              <th scope="col">내용</th>
              <td><textarea id="content" name="content" rows="18" class="input-box"></textarea></td>
            </tr>
          </table>
          <div class="d-flex justify-content-end">
            <button type="button" class="btn btn-info" onclick="validateAndSave('02')">상신</button>
            <button type="button" class="btn btn-info" onclick="validateAndSave('01')">임시저장</button>
            <input type='hidden' id="aprvStatus" name="aprvStatus">
          </div>
        </div>
      </div>
    </section>
    </form>
  </main>
<script src="/assets/js/common.js"></script>
<script src="/assets/js/jquery-3.7.1.js"></script>
<script>
		//문서 정보 가져오는 함수 호출
		inBox();
		
		// 문서 정보를 가져와서 화면에 표시하는 함수
		function inBox() {
		  call_server(aprv01form, "/approve/selectCombData", inAprv01);
		}
		
		// 문서 정보를 가져와서 화면에 표시하는 콜백 함수
		function inAprv01(vo) {
		    $('#regDt').val(new Date().toISOString().substring(0, 10));
		    $('#userName').val(vo.userName);
		    $('#deptName').val(vo.deptName);
		    
		    setCombData(vo.typelist, docType);
		    setCombData(vo.yearlist, preserveYear);
		    setCombData(vo.classlist, docClass);
		    setCombData(vo.statuslist, docStatus);
		    
		    $('#docStatus option:eq(1)').prop("selected",true);
		    //$('#docStatus').prop("disabled",true);
		    
		}
			    
		
		// 선택 목록을 설정하는 함수
		function setCombData(list, id){
		    for(var i = 0; i < list.length; i++){
		        var str = "<option value='" + list[i].comCd + "'>" + list[i].comName + "</option>";
		        $(id).append(str);
		    }
		}

		// 팝업 열기 함수	  
		function openPop() {
		  var popup = window.open('/approve/aprvpop01', '사용자 조회 팝업', 'width=600px,height=500px,scrollbars=yes');
		}
		
		// 행 번호를 추적하는 전역 변수
		var rowNum = 1;
		
		function setUserInfo(data) {
			console.log(data);
		      var str = "<tr>";
		      str += "<td>" + (rowNum++) + "</td>"; 
		      str += "<td><input type='hidden' name='linelist["+(rowNum-2)+"].userId' value='"+data.userId+"'>" + data.userName + "</td>";
		      str += "<td>" + data.deptName + "</td>";
		      str += "<td>" + data.comName + "</td>";
		      str += "<td>" + '결재' + "</td>";
		      str += "<td>" + '대기' + "</td>";
		      str += "<td><button type='button' class='btn btn-danger' onclick='deleteRow(this)'>삭제</button></td>";
		      str += "</tr>";
		      
		      $('#approvalTable').append(str);
		      
		}
		// 삭제 버튼 클릭 시 해당 행을 삭제하는 함수
		function deleteRow(button) {
		    var row = button.parentNode.parentNode; // 삭제할 행 요소를 가져옵니다.
		    row.remove(); // 해당 행을 삭제합니다.

		    // 행 번호를 다시 설정하기 위해 모든 행을 다시 번호 매기기
		    rowNum = 1;
		    $('#approvalTable tr').each(function(index) {
		        if (index > 1) { // 헤더 행은 제외
		            $(this).find('td:first').text(rowNum);
		            rowNum++;
		        }
		    });
		}
		
		// 행 번호를 추적하는 전역 변수
		var fileRowNum = 1;

		$(document).ready(function() {
		    // 파일 추가 버튼 클릭 이벤트
		    $('#addFileBtn').click(function() {
		        // 파일 입력 요소를 생성
		        var $fileInput = $('<input type="file" style="display: none;">');
		        $fileInput.on('change', function(event) {
		            var file = event.target.files[0];
		            if (file) {
		            	var fileSize = (file.size / 1024).toFixed(2) + ' KB'; // 파일 크기를 KB 단위로 변환
		                var fileName = file.name; // 파일 이름 가져오기 추가

		                // 파일 정보를 테이블에 추가
		                var str = "<tr id='fileRow" + fileRowNum + "'>";
		                str += "<td>" + fileRowNum + "</td>"; 
		                str += "<td>" + fileName + "</td>"; // 파일 이름 표시
		                str += "<td>" + fileSize + " KB</td>";
		                str += "<td><button type='button' class='btn btn-danger deleteBtn' data-row-id='fileRow" + fileRowNum + "'>삭제</button></td>";
		                $('#fileTable').append(str);

		                // 파일 입력 요소를 숨겨진 상태로 폼에 추가
		                var newFileInput = $fileInput.clone();
		                newFileInput.attr('id', 'fileInput' + fileRowNum);
		                newFileInput.attr('name', 'atcfilelist[' + (fileRowNum - 1) + ']');
		                $('#fileTable').append(newFileInput);

		                // 행 번호 증가
		                fileRowNum++;
		            }
		        });

		        // 파일 선택 창을 엽니다.
		        $fileInput.click();
		    });

		    // 삭제 버튼 클릭 이벤트
		    $('#fileTable').on('click', '.deleteBtn', function() {
		        var rowId = $(this).data('row-id');
		        $('#' + rowId).remove(); // 해당 행 삭제
		        $('#fileInput' + rowId.replace('fileRow', '')).remove(); // 숨겨진 파일 입력 요소 삭제
		    });
		});
        function validateAndSave(status) {
          // 유효성 검사
          if ($('#docType').val() === "") {
            alert("문서유형을 선택해 주세요.");
            $('#docType').focus();
            return false;
          }
          if ($('#preserveYear').val() === "") {
            alert("보존기한을 선택해 주세요.");
            $('#preserveYear').focus();
            return false;
          }
          if ($('#docClass').val() === "") {
            alert("문서종류를 선택해 주세요.");
            $('#docClass').focus();
            return false;
          }
          if ($('#title').val().trim() === "") {
            alert("제목을 입력해 주세요.");
            $('#title').focus();
            return false;
          }
          if ($('#content').val().trim() === "") {
            alert("내용을 입력해 주세요.");
            $('#content').focus();
            return false;
          }
          $('#hdocStatus').val(status);
          $('#aprvStatus').val(status);
          
          document.getElementById('docStatus').value = status;
          document.getElementById('aprvStatus').value = status;
          // 폼 유효성 검사를 수행하고 유효하다면 저장 처리 로직을 호출합니다.
          alert(status === '02' ? '상신이 완료되었습니다.' : '임시저장이 완료되었습니다.');
          call_server(aprv01form, "/approve/insertApproveDoc", saveDataAram);
        }
        
        function saveDataAram(cnt) {
          if(cnt > 0) {
            alert('저장되었습니다.');
          } else {
            alert("오류가 발생하였습니다.");
          }
        }
</script>
</body>
</html>