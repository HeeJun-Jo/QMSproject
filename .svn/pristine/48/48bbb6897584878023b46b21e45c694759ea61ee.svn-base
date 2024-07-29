<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>자재관리</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/remixicon/fonts/remixicon.css" rel="stylesheet">
<style>
    body {
        padding-top: 20px;
    }

    .card {
        margin-bottom: 20px;
    }

    .form-group {
        margin-bottom: 20px;
    }

    .table-section {
        margin-bottom: 20px;
    }

    .table th,
    .table td {
        vertical-align: middle;
        text-align: center;
    }
    .icon {
        position: relative;
        display: inline-block;
    }
    .icon i {
        position: absolute;
        right: 10px;
        top: 50%;
        transform: translateY(-50%);
        cursor: pointer;
    }
    .input-group {
        display: flex;
        flex-direction: column;
    }
    .input-group input {
        margin-bottom: 5px;
    }
</style>
</head>
<body>
<form id="searchform">
	<input type="hidden" id="userId" name="userId">
	<input type="hidden" id="compCd" name="compCd">
    <div class="form-row">
        <div class="form-group col-sm-2">
            <label for="planYear">계획년도</label>
            <select class="form-control" name="planYear" id="planYear" onchange="updateTableHeader()">
                <% 
                int currentYear = java.time.Year.now().getValue(); // 현재 연도 가져오기
                int pastYears = 50; // 과거 연도 범위
                for (int year = currentYear; year >= currentYear - pastYears; year--) { 
                %>
                <option value="<%= year %>"><%= year %>년</option>
                <% } %>
            </select>
        </div>
        <div class="form-group col-sm-2">
            <label for="planMonth">계획월</label>
            <select class="form-control" name="planMonth" id="planMonth" onchange="updateTableHeader()">
                <option value="01">1월</option>
                <option value="02">2월</option>
                <option value="03">3월</option>
                <option value="04">4월</option>
                <option value="05">5월</option>
                <option value="06">6월</option>
                <option value="07">7월</option>
                <option value="08">8월</option>
                <option value="09">9월</option>
                <option value="10">10월</option>
                <option value="11">11월</option>
                <option value="12">12월</option>
            </select>
        </div>
        <div class="form-group col-sm-2">
            <label for="itemCd">품번</label>
            <input type="text" class="form-control" id="itemCd" name="itemCd">
        </div>
        <div class="form-group col-sm-2">
            <label for="compName">거래처</label>
            <div class="icon">
                <input type="text" class="form-control" id="compName" name="compName">
                <i class="ri-search-2-line" onclick="partnerPopup(1)"></i>
            </div>
        </div>
        <div class="form-group col-sm-2">
            <button type="button" class="btn btn-info" onclick="pplanSearch();">조회</button>
            <button type="button" class="btn btn-success" onclick="pplanInsert();">저장</button>
            <button type="button" class="btn btn-dark" onclick="excelWrite();">엑셀</button>
        </div>
    </div>
    <div>
        <table class="table table-bordered" id="planTable">
            <thead class="thead-light" id="planTableHead">
                <tr id="dateHeaderRow">
                    <!-- 날짜 헤더가 여기에 동적으로 추가됩니다 -->
                </tr>
                <tr id="PqtyHeaderRow">
                    <!-- 수량 헤더가 여기에 동적으로 추가됩니다 -->
                </tr>
                <tr id="OqtyHeaderRow">
                    <!-- 수량 헤더가 여기에 동적으로 추가됩니다 -->
                </tr>
            </thead>
            <tbody>
                
            </tbody>
        </table>
    </div>
</form>
<script src="/assets/js/jquery-3.7.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/assets/js/common.js"></script>
<script>
    function inBox() {
        var now = new Date();
        var year = now.getFullYear();
        var month = ('0' + (now.getMonth() + 1)).slice(-2); // 두 자리로 표시되도록 포맷팅
        
        $('#planYear').val(year);
        $('#planMonth').val(month);
        updateTableHeader();
    }

    function updateTableHeader() {
        var year = $('#planYear').val();
        var month = $('#planMonth').val();
        var date = new Date(year, month, 0); // 해당 월의 마지막 날 계산
        var lastDay = date.getDate();

        var dateHeaderRow = $('#dateHeaderRow');
        var PqtyHeaderRow = $('#PqtyHeaderRow');
        var OqtyHeaderRow = $('#OqtyHeaderRow');
        dateHeaderRow.empty();
        PqtyHeaderRow.empty();
        OqtyHeaderRow.empty();

        $('#dateHeaderRow').append("<th rowspan=\"3\" scope=\"col\">No</th>");
        $('#dateHeaderRow').append("<th rowspan=\"3\" scope=\"col\">거래처명</th>");
        $('#dateHeaderRow').append("<th rowspan=\"3\" scope=\"col\">품번</th>");
        $('#dateHeaderRow').append("<th rowspan=\"3\" scope=\"col\">품명</th>");
        
        for (var day = 1; day <= lastDay; day++) {
            var dayStr = ('0' + day).slice(-2); // 두 자리로 표시되도록 포맷팅
            dateHeaderRow.append('<th>' + month + '/' + dayStr + '</th>');
            PqtyHeaderRow.append('<th>주문수량</th>');
            OqtyHeaderRow.append('<th>계획수량</th>');
        }
    }

    inBox();

    // 거래처 조회 팝업
    var row1;
    function partnerPopup(no) {
        row1 = no;
        window.open('/receive/partnerSearch', 'popup', "width=800, height=800");
    }

    function receivePartnerData(item) {
        if (row1 == 1) {
            $('#compName').val(item.compName);
            $('#compCd').val(item.compCd);
        }
    }

    function pplanSearch() {
        call_server(searchform, "/pplan/selectPlanList", planList);
        if($('#compCd').val() == ""){
			alert("거래처를 선택해주세요");
		}
    }

    function planList(vo) {
    	
        var list = vo.planlist; // planlist에서 데이터 추출

        $('#planTable > tbody').empty();
        var year = $('#planYear').val();
        var month = $('#planMonth').val();
        var date = new Date(year, month, 0); // 해당 월의 마지막 날 계산
        var lastDay = date.getDate();

        // 각 compName 및 itemCd에 따른 데이터를 저장할 객체
        var planData = {};

        // 데이터 구조화
        for (var i = 0; i < list.length; i++) {
            var compName = list[i].compName;
            var itemCd = list[i].itemCd;
            var planDt = new Date(list[i].planDt).getDate();
            var planQty = list[i].planQty || 0; // NULL일 경우 0으로 대체
            var orderQty = list[i].orderQty || 0; // NULL일 경우 0으로 대체

            if (!planData[compName]) {
                planData[compName] = {};
            }
            if (!planData[compName][itemCd]) {
                planData[compName][itemCd] = { itemName: list[i].itemName, days: {} };
            }
            planData[compName][itemCd].days[planDt] = { planQty: planQty, orderQty: orderQty };
        }

        var rowCount = 1;
        var qtyCount = 0;
        for (var compName in planData) {
            var compNameRows = Object.keys(planData[compName]).length; // 거래처에 대한 총 행 수 계산
            var firstItemCd = true; // 첫 번째 품번 플래그

            for (var itemCd in planData[compName]) {
                var item = planData[compName][itemCd];
                var str = "<tr>";
                str += "<th>" + rowCount + "</th>";

                // 첫 번째 품번일 때만 rowspan 적용
                if (firstItemCd) {
                    str += "<td rowspan=\"" + compNameRows + "\">" + compName + "</td>";
                    firstItemCd = false;
                }

                str += "<td><input type='hidden' name='item[" + rowCount + "].itemCd' value='" + itemCd + "'>" + itemCd + "</td>";
                str += "<td>" + item.itemName + "</td>";
                rowCount++;
	
                for (var day = 1; day <= lastDay; day++) {
                    var planDt = (year).slice(-2) + '/' + month + '/' + ('0' + day).slice(-2); // 예: "24/06/01"
                    if (item.days[day]) {
                        str += "<td><input type='text' name='qtylist[" + qtyCount + "].planQty' value='" + item.days[day].planQty + "' style='width:50px;'><input type='text' name='qtylist[" + qtyCount + "].orderQty' value='" + item.days[day].orderQty + "' style='width:50px;'></td>";
                        str += "<input type='hidden' name='qtylist[" + qtyCount + "].itemCd' value='" + itemCd + "'><input type='hidden' name='qtylist[" + qtyCount + "].planDt' value='" + planDt + "'>";
                    } else {
                        str += "<td><input type='text' name='qtylist[" + qtyCount + "].planQty' value='0' style='width:50px;'><input type='text' name='qtylist[" + qtyCount + "].orderQty' value='0' style='width:50px;'></td>";
                        str += "<input type='hidden' name='qtylist[" + qtyCount + "].itemCd' value='" + itemCd + "'><input type='hidden' name='qtylist[" + qtyCount + "].planDt' value='" + planDt + "'>";
                    }
                    qtyCount++;
                }


                str += "</tr>";
                $('#planTable > tbody').append(str);
            }
        }
    }

    function pplanInsert() {
        call_server(searchform, "/pplan/insertPlan", insertAram);
    }
    
    function insertAram(cnt) {
        if(cnt > 0) {
            alert('저장되었습니다.');
        } else {
            alert("오류가 발생하였습니다.");
        }
    }
    
    function excelWrite() {
        // 서버에 엑셀 파일 생성 요청 보내기
        var formData = new FormData($(searchform)[0]);
        
        $.ajax({
            data : formData,
            type: "POST",
            contentType: false,
            processData: false,
            url: "/pplan/createExcel",
            xhrFields:{
                responseType: 'blob'
            },
            success: function (result) {
                var now = new Date();
                var month = ('0' + (now.getMonth() + 1)).slice(-2); // 두 자리로 표시되도록 포맷팅
                
                var blob = result;
                var downloadUrl = URL.createObjectURL(blob);
                var a = document.createElement("a");
                a.href = downloadUrl;
                a.download = "pplan_" + month + "월" + ".xlsx";
                document.body.appendChild(a);
                a.click();
            }
        });

        alert('엑셀파일 다운로드되었습니다.');
    }

</script>
</body>
</html>
