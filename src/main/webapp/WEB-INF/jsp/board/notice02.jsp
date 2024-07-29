<%@ page contentType = "text/html; charset=UTF-8"%>
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
             <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">홈</a></li>
                    <li class="breadcrumb-item">자재관리</li>
                    <li class="breadcrumb-item active">일정관리</li>
                </ol>
            </nav>
        </div><!-- End Page Title -->

        <section class="section">
            <form id="searchform">
            
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">일정조회</h5>
                        <div class="col-md-3">
                            <label for="planYear" class="form-label text-end">년월</label>
                            <div class="input-group">
                                <select id="planDtYY" name="planDtYY" class="form-select">
                                    <option value="">== 년 ==</option>
                                </select>
                                <select id="planDtMM" name="planDtMM" class="form-select">
                                    <option value="">== 월 ==</option>
                                </select>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-sm-12 text-end">
                                <button type="button" class="btn btn-info" onclick="searchCalender();">조회</button>
                            </div>
                        </div>
                    </div>
                </div>

                <table id="calendar">
                    <thead>
                        <tr>
                            <th width="200px"><font color="#ed5353">일</font></th>
                            <th width="200px"> 월 </th>
                            <th width="200px"> 화 </th>
                            <th width="200px"> 수 </th>
                            <th width="200px"> 목 </th>
                            <th width="200px"> 금 </th>
                            <th width="200px"><font color="#009de0">토</font></th>
                            
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </form>
        </section>
    </main>

    <!-- Modal -->
    <div class="modal fade" id="calendarTable" tabindex="-1" aria-labelledby="boardInfoLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="boardInfoLabel">일정상세</h5>
                   
                </div>
                <div class="modal-body">
                    <form id="dataform">
                       <input type="hidden" id="userId" name="userId">
                       <input type="hidden" id="scSeq" name="scSeq"> 
                       <input type="hidden" id="scStTm" name="scStTm">
                       <input type="hidden" id="scEnTm" name="scEnTm">
                        <table class="table table-hover" id="calendarDtl">
                            <tr>
                                <th scope="col">일자</th>
                                <td><input type="date"  id="dateM" name="dateM"></td>
                                <td colspan="5" class="add-btn-cell">
                                 <button type="button" class="btn btn-primary" onclick="insertSc();" id="savebtn" style = float:right>저장</button>
                                 <button type="button" class="btn btn-secondary" onclick="searchData();" id="searchbtn" style = float:right >조회</button>
                           
                                 </td>
                            </tr>
                            <tr>
                                <th scope="col">상세일정</th>
                                  <td colspan="5" class="add-btn-cell">
			                    <button type="button" class="btn btn-primary" onclick="addBtn();" style = float:right >+</button>
			                   </td>
                                </tr>
                                <tr>
                                
                                  <th>시작일시</th>
                                  <th>종료일시</th>
                                  <th> 일정 </th>
                                  <th> 상태 </th>
                                  <th> 삭제 </th> 
                                
                            </tr>
                        </table>
                    </form>
                </div>
                <div class="modal-footer">
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
    
    searchCalender();
    
    $(document).ready(function() {
        var baseYear = ${BASE_YEAR};
        var nw = new Date();
        var currentYear = nw.getFullYear();
        var currentMonth = nw.getMonth() + 1;
        
        if (currentMonth < 10) {
            currentMonth = "0" + currentMonth;
        }

        for (var i = baseYear; i <= currentYear; i++) {
            $('#planDtYY').append("<option value='" + i + "'>" + i + "</option>");
        }
        $('#planDtYY').val(currentYear);

        for (var i = 1; i <= 12; i++) {
            var mth = i < 10 ? "0" + i : i;
            $('#planDtMM').append("<option value='" + mth + "'>" + mth + "월</option>");
        }
        $('#planDtMM').val(currentMonth);

        searchCalender();
    
          
    });
        
    function searchCalender() {

    	call_server(searchform, '/board/scheduleList', searchDtlCal);
    }
    
    function searchDtlCal(vo){
    	
        $("#calendar > tbody").empty(); 

        var selectedYear = parseInt($('#planDtYY').val());
        var selectedMonth = parseInt($('#planDtMM').val()) - 1; 
        
        var firstDate = new Date(selectedYear, selectedMonth, 1);
        var lastDate = new Date(selectedYear, selectedMonth + 1, 0);
        var firstDay = firstDate.getDay();
        var lastDay = lastDate.getDate();

        var $tbody = $("#calendar tbody");

        var row = $("<tr></tr>");
        for (var i = 0; i < firstDay; i++) {
            row.append("<td></td>");
        }
        var schedules=[];
              
        for (var i = 1; i <= lastDay; i++) {
            if (firstDay == 7) {
                $tbody.append(row);
                row = $("<tr></tr>");
                firstDay = 0;
                }
            
            var dayCell = $("<td class='date' onclick='showDetail("+i+")'>" + i +getSched(vo.scList, i)+ "</td>");
            
            row.append(dayCell);
            
            firstDay++;
        }

        if (firstDay != 0) {
            for (var i = firstDay; i < 7; i++) {
                row.append("<td></td>");
            }
            $tbody.append(row);
        }
    }
    
    function getSched(list, dd){
		if(dd<10){
			dd="0"+dd;
		}
    	dd = $('#planDtYY').val()+"-"+$('#planDtMM').val()+"-"+dd;
		var str="";
		
    	for(var i=0;i<list.length;i++){
			if(list[i].scStDt<=dd && list[i].scEnDt>=dd){
				str+="<br>";
				str+=list[i].content;
			}
		}
		
    	return str;
    	  

    }
    

    function showDetail(dd) {
        var selectedYear = $('#planDtYY').val();
        var selectedMonth = $('#planDtMM').val();
        var selectedDate = selectedYear + '-' + selectedMonth + '-' + (dd < 10 ? '0' + dd : dd);

        $('#dateM').val(selectedDate);
        $('#calendarDtl').find("tr:gt(2)").remove();
  
        searchData();
        $('#calendarTable').modal('show');
    }


    var cnt = 0;
    function addBtn() {
        addRowLine(null, cnt);
        cnt++;
    }
   

     var scLineIdx=0;
    function addRowLine(vo) {
    	
    	
        var str = "<tr><input name='scLineList["+scLineIdx+"].scSeq' class='form-control'>";
       
        str += "<td><input type='date' name='scLineList["+scLineIdx+"].scStDt' class='form-control'><select name='scLineList["+scLineIdx+"].scStTmHr'>";
        for(var i=9; i<=18; i++) {
            str += i < 10 ? "<option value='0"+i+"'>0"+i+"</option>" : "<option value='"+i+"'>"+i+"</option>";
        }
        str += "</select><select name='scLineList["+scLineIdx+"].scStTmMin'>";
        for(var i=0; i<=5; i++) {
            str += "<option value='"+i+"0'>"+i+"0</option>";
        }
        str += "</select></td>";
        str += "<td><input type='date' name='scLineList["+scLineIdx+"].scEnDt' class='form-control'><select name='scLineList["+scLineIdx+"].scEnTmHr'>";
        for(var i=9; i<=18; i++) {
            str += i < 10 ? "<option value='0"+i+"'>0"+i+"</option>" : "<option value='"+i+"'>"+i+"</option>";
        }
        str += "</select><select name='scLineList["+scLineIdx+"].scEnTmMin'>";
        for(var i=0; i<=5; i++) {
            str += "<option value='"+i+"0'>"+i+"0</option>";
        }
        str += "</select></td>";
        str += "<td><input type='text' name='scLineList["+scLineIdx+"].content' class='form-control'></td>";
        str += "<td><select name='scLineList["+scLineIdx+"].scStatus' class='form-control'><option value='01'>완료</option><option value='02'>미완료</option></select></td>";
        str += "<td><button type='button' class='btn btn-primary' onclick='delTr(this);'>삭제</button></td>";
        str += "</tr>";
        $('#calendarDtl').append(str);
        
        scLineIdx++;
    }

    function delTr(btn) {
        $(btn).closest('tr').remove();
    }

    function insertSc() {
              
       call_server(dataform, '/board/insertSc', insertSchedule)
    }

    function insertSchedule(cnt) {
        if(cnt > 0) {
            alert("저장되었습니다.");
        } else {  
            alert("저장중 오류가 발생하였습니다.");
        }
        $('#calendarTable').modal('hide');
        searchCalender();
    }
 
    function searchData(){
       call_server(dataform, '/board/scheduleList', sData)
    }
 	
    function sData(vo) {
        var list = vo.scList;
        
        console.log(list);
        
        $('#calendarDtl').find("tr:gt(2)").remove(); 

        for (var i = 0; i < list.length; i++) {
            var str = "<tr>";
            
            str += "<input type='hidden' name='scList[" + i + "].scSeq' value='" + list[i].scSeq + "' class='form-control'>";
            str += "<td><input type='date' name='scList[" + i + "].scStDt' class='form-control' value='" + list[i].scStDt + "'>";
            str += "<select name='scList[" + i + "].scStTmHr'>";
          
            for (var hr = 9; hr <= 18; hr++) {
                var hrValue = hr < 10 ? "0" + hr : hr;
                var selected = (hrValue == list[i].scStTm.substring(0,2)) ? "selected" : "";
                str += "<option value='" + hrValue + "' " + selected + ">" + hrValue + "</option>";
            }
            
            str += "</select><select name='scList[" + i + "].scStTmMin'>";
            for (var min = 0; min <= 5; min++) {
                var minValue = min + "0";
                var selected = (minValue == list[i].scStTm.substring(2,4)) ? "selected" : "";
                str += "<option value='" + minValue + "' " + selected + ">" + minValue + "</option>";
            }
            str += "</select></td>";

            
            str += "<td><input type='date' name='scList[" + i + "].scEnDt' class='form-control' value='" + list[i].scEnDt + "'>";
            str += "<select name='scList[" + i + "].scEnTmHr'>";
            for (var hr = 9; hr <= 18; hr++) {
                var hrValue = hr < 10 ? "0" + hr : hr;
                var selected = (hrValue == list[i].scEnTm.substring(0,2)) ? "selected" : "";
                str += "<option value='" + hrValue + "' " + selected + ">" + hrValue + "</option>";
            }
            str += "</select><select name='scList[" + i + "].scEnTmMin'>";
            for (var min = 0; min <= 5; min++) {
                var minValue = min + "0";
                var selected = (minValue == list[i].scEnTm.substring(2,4)) ? "selected" : "";
                str += "<option value='" + minValue + "' " + selected + ">" + minValue + "</option>";
            }
            str += "</select></td>";

            
            str += "<td><input type='text' name='scList[" + i + "].content' class='form-control' value='" + list[i].content + "'></td>";

            
            str += "<td><select name='scList[" + i + "].scStatus' class='form-control'>";
            var statusOptions = {
                "01": "완료",
                "02": "미완료"
            };
            for (var key in statusOptions) {
                var selected = (key == list[i].scStatus) ? "selected" : "";
                str += "<option value='" + key + "' " + selected + ">" + statusOptions[key] + "</option>";
            }
            str += "</select></td>";

            
            str += "<td><button type='button' class='btn btn-primary' onclick=\"deleteSc("+list[i].scSeq+");\">삭제</button></td>";
            str += "</tr>";

            $('#calendarDtl').append(str);
        }
    }

    
    function deleteSc(seq){
        $('#scSeq').val(seq);
        if (confirm("정말 삭제하시겠습니까??") == true){    
   	    }else{   
   	     return false;
   	     }
        call_server(dataform, '/board/delscheduleList', delsData);
     }
          
    function delsData(cnt) {
    	
        if(cnt > 0) {
            alert("삭제되었습니다.");
        } else {  
            alert("삭제중 오류가 발생하였습니다.");
        }
        $('#calendarTable').modal('hide');
        searchCalender();
    }
    
    </script>
</body>
</html>
