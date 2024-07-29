<!-- Child.html -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>기안서 작성 팝업창</title>
 <!-- Vendor CSS Files -->
<link href="/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="/assets/vendor/quill/quill.snow.css" rel="stylesheet">
<link href="/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
<link href="/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="/assets/vendor/simple-datatables/style.css" rel="stylesheet">
<style>
    body { font-family: Arial, sans-serif; margin: 20px; }
    h5 { margin-bottom: 20px; }
    .container { width: 100%; max-width: 800px; margin: 0 auto; }
    .form-group { display: flex; align-items: center; margin-bottom: 8px; }
    .form-label { flex: 0 0 auto; margin-right: 8px; }
    .form-control { max-width: 200px; padding: 8px; border: 1px solid #ccc; border-radius: 4px; font-size: 14px; }
    .btn { padding: 8px 16px; font-size: 14px; font-weight: bold; text-align: center; text-decoration: none; color: #fff; border: none; border-radius: 4px; cursor: pointer; }
    .btn-primary { background-color: #007bff; }
    .btn-info { background-color: #17a2b8; }
    table { border: solid 1.5px black; border-collapse: collapse; width: 100%; font-size: 14px; margin-top: 20px; }
    thead { background-color: #f2f2f2; text-align: center; font-weight: bold; }
    th, td { padding: 10px; border: 1px solid #ddd; text-align: center; }
    tbody tr:hover { background-color: #f1f1f1; }
</style>
</head>
<body>
<form id="popupform">
<input type="hidden" id="currentPage" name="currentPage">
    <h5>사용자 조회</h5>
    <main class="container">
        <div class="row">
            <div class="col-8">
                <div class="form-group">
                    <label for="userName" class="form-label">사용자명</label>
                    <input type="text" id="userName" name="userName" class="form-control">
                </div>
            </div>
            <div class="col-4 d-flex justify-content-end">
                <button class="btn btn-primary" type="button" onclick="userSearch();">조회</button>
            </div>
        </div>
        <table class="user__list" id="userTable">
            <thead>
                <tr>
                    <th>NO</th>
                    <th>성명</th>
                    <th>부서</th>
                    <th>직위</th>
                    <th>퇴사여부</th>
                    <th>선택</th>
                </tr>
            </thead>
            <tbody>
                <!-- 여기에 사원 목록이 동적으로 추가될 예정 -->
            </tbody>
        </table>
    </main>
    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center" id="userPaging"></ul>
    </nav>
</form>

<script src="/assets/js/paging.js"></script>
<script src="/assets/js/common.js"></script>
<script src="/assets/js/jquery-3.7.1.js"></script>
<script>
		function userSearch(no) {
			if (no === undefined) {
	            $('#currentPage').val(1);
	        } else {
	            $('#currentPage').val(no);
	        }
			call_server(popupform, "/approve/userSearch", getUserList);
	    }
		
		var userlist;
		
		function getUserList(vo) {
			userlist = vo.userlist;
			list = vo.userlist;
			
		    $('#userTable > tbody').empty();
		    for (var i = 0; i < list.length; i++) {
		        var str = "<tr>";
		        str+="<th scope=\"row\">"+((Number(vo.currentPage)-1)*vo.countPerPage+(i+1))+"</th>";	
		        str += "<td>" + list[i].userName + "</td>";
		        str += "<td>" + list[i].deptName + "</td>";
		        str += "<td>" + list[i].comName + "</td>";
		        str += "<td>" + list[i].leaveYn + "</td>";
		        str += "<td><button type='button' class='btn btn-info' onclick='sendData(\"" + i + "\");'>선택</button></td>";
		        str += "</tr>";
		        $('#userTable > tbody').append(str);
		    }
		    setPaging(userPaging, vo.startPage, vo.endPage,'userSearch' );	       	
		}

		
		function sendData(idx) {
			window.opener.setUserInfo(userlist[idx]);
		}
		
		
</script>
</body>
</html>
