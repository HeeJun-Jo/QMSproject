<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>Components / Tabs - NiceAdmin Bootstrap Template</title>
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
    <style>
        body {
            padding-top: 20px;
            font-family: 'Open Sans', sans-serif;
        }
        .form-row {
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .plan-date-group {
            display: flex;
            align-items: center;
            z-index: 999;
            position: relative;
            background-color: white;
            padding: 10px;
            margin-bottom: 20px;
        }
        .plan-date-group label {
            margin-right: 10px;
        }
        .plan-date-group .form-control {
            width: 150px;
        }
        .center-button {
            text-align: center;
            margin-top: 20px;
            margin-bottom: 20px;
        }
        .table th, .table td {
            vertical-align: middle;
            text-align: center;
        }
        .menu {
            position: relative;
            z-index: 1;
        }
    </style>
</head>
<body>
    <%@ include file="../layout/menu.jsp" %>
    <%@ include file="../layout/footer.jsp" %>
    <form id="searchform" class="container">
        <input type="hidden" id="userId" name="userId">
        <input type="hidden" id="compCd" name="compCd">
        <div class="plan-date-group">
            <label for="planDtFrom" class="col-sm-1 col-form-label">계획일</label>
            <div class="col-sm-2">
                <input type="date" class="form-control" id="planDtFrom" name="planDtFrom">
            </div>
            <label for="planDtTo" class="col-sm-1 col-form-label text-center">~</label>
            <div class="col-sm-2">
                <input type="date" class="form-control" id="planDtTo" name="planDtTo">
            </div>
            <label for="itemCd" class="col-sm-1 col-form-label">품번</label>
            <div class="col-sm-2">
                <input type="text" class="form-control" id="itemCd" name="itemCd">
            </div>
            <label for="compName" class="col-sm-1 col-form-label">거래처</label>
            <div class="col-sm-2">
                <div class="icon">
                    <input type="text" class="form-control" id="compName" name="compName">
                    <i class="ri-search-2-line" style="cursor:pointer;" onclick="partnerPopup()"></i>
                    <div class="label"></div>
                </div>
            </div>
            <div class="col-sm-2">
                <button type="button" class="btn btn-info btn-block" onclick="planSearch();">조회</button>
                <button type="button" class="btn btn-dark" onclick="excelWrite();">엑셀</button>
            </div>
        </div>
        <!-- 생산계획 품목 및 BOM 자재 품목 테이블 -->
        <div class="center-button">
            <button type="button" class="btn btn-info" onclick="planBomSearch();">수량확인</button>
        </div>
        <div class="row">
            <div class="col-md-6">
                <h5>생산계획 품목</h5>
                <div class="left-section">
                    <table class="table table-bordered" id="planTable">
                        <thead class="thead-light">
                            <tr>
                                <th scope="col">NO</th>
                                <th scope="col">품번</th>
                                <th scope="col">품명</th>
                                <th scope="col">계획수량</th>
                                <th scope="col"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- 생산계획 품목 데이터를 여기에 동적으로 추가 -->
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="col-md-6">
                <div class="right-section">
                    <h5>BOM 자재 품목</h5>
                    <table class="table table-bordered" id="bomTable">
                        <thead class="thead-light">
                            <tr>
                                <th scope="col">NO</th>
                                <th scope="col">품번</th>
                                <th scope="col">품명</th>
                                <th scope="col">소요수량</th>
                                <th scope="col">BOX수량</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- BOM 자재 품목 데이터를 여기에 동적으로 추가 -->
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </form>

<script>
    // 현재 날짜와 7일 후 날짜를 입력 필드에 설정하는 함수
    function inBox() {
        var now = new Date();
        var year = now.getFullYear();
        var month = ('0' + (now.getMonth() + 1)).slice(-2); // 두 자리로 표시되도록 포맷팅
        var day = ('0' + now.getDate()).slice(-2); // 두 자리로 표시되도록 포맷팅

        var forDate = year + '-' + month + '-' + day;
        $('#planDtFrom').val(forDate);

        // 7일 뒤 날짜 계산
        var fDate = new Date();
        fDate.setDate(now.getDate() + 6);
        var fYear = fDate.getFullYear();
        var fMonth = ('0' + (fDate.getMonth() + 1)).slice(-2); // 두 자리로 표시되도록 포맷팅
        var fDay = ('0' + fDate.getDate()).slice(-2); // 두 자리로 표시되도록 포맷팅

        var fDate = fYear + '-' + fMonth + '-' + fDay;
        $('#planDtTo').val(fDate);
    }
    inBox();

    // 거래처 조회 팝업 함수
    function partnerPopup() {
        window.open('/receive/partnerSearch', 'popup', 'width=800, height=800');
    }

    function receivePartnerData(item) {
        $('#compName').val(item.compName);
        $('#compCd').val(item.compCd);
    }

    // 제거된 항목을 추적하기 위한 배열
    var removedItems = [];

 // 생산계획 조회 함수
    function planSearch() {
        call_server(searchform, '/plan/planQtyList', planQtyList);
        // 조회 시 BOM 테이블도 초기화
        $('#bomTable tbody').empty();
        // 제거된 항목 초기화
        removedItems = [];
    }

    function planQtyList(list) {
        // 기존 데이터 초기화
        $('#planTable tbody').empty();
        var rowNum = 0;
        // 리스트의 각 항목을 순회하며 테이블 행 생성
        for (var i = 0; i < list.length; i++) {
            var item = list[i]; // 리스트에서 각 아이템을 가져옴
            var str = '<tr>';
            str += '<td>' + (rowNum + 1) + '</td>'; // 순번
            str += "<td><input type='hidden' name='qtyList[" + rowNum + "].itemCd' value='" + item.itemCd + "'>" + item.itemCd + "</td>"; //품번
            str += '<td>' + item.itemName + '</td>'; // 품명
            str += '<td>' + formatNumber(item.planQty) + '</td>'; // 수량 포맷팅
            str += '<td><button type="button" class="btn btn-danger remove-row" data-itemcd="' + item.itemCd + '">제거</button></td>'; // 제거 버튼 추가
            str += '</tr>';

            $('#planTable tbody').append(str); // 테이블에 행 추가
            rowNum++; // rowNum 증가
        }

        // 제거 버튼 클릭 이벤트 핸들러 추가
        $('.remove-row').on('click', function() {
            var itemCd = $(this).data('itemcd'); // 품번 가져오기
            removedItems.push(itemCd); // 제거된 품번을 배열에 추가
            $(this).closest('tr').remove(); // 테이블 행 제거
            $('#bomTable tbody').empty(); // BOM 테이블 초기화
        });
    }

    function planBomSearch() {
        // 모든 항목이 제거된 경우, BOM 리스트를 조회하지 않음
        if ($('#planTable tbody tr').length === 0) {
            $('#bomTable tbody').empty();
            return;
        }
        call_server(searchform, '/plan/planQtyBomList', planBomList);
    }

    function planBomList(list) {
        // 기존 데이터 초기화
        $('#bomTable tbody').empty();
        var rowNum = 0;
        // 리스트의 각 항목을 순회하며 테이블 행 생성
        for (var i = 0; i < list.length; i++) {
            var item = list[i]; // 리스트에서 각 아이템을 가져옴

            // 제거된 항목인지 확인
            if (removedItems.includes(item.sitemCd)) {
                continue; // 제거된 항목이면 건너뜀
            }

            var str = '<tr>';
            str += '<td>' + (rowNum + 1) + '</td>'; // 순번
            str += '<td>' + item.sitemCd + '</td>'; // 품번         
            str += '<td>' + item.itemName + '</td>'; // 품명
            str += '<td>' + formatNumber(item.insQty) + '</td>'; // 소요수량
            str += '<td>' + formatNumber(item.boxQty) + '</td>'; // BOX수량
            str += '</tr>';

            $('#bomTable tbody').append(str); // 테이블에 행 추가
            rowNum++; // rowNum 증가
        }
    }

    // 수량 포맷팅 함수
    function formatNumber(number) {
        return parseInt(number).toLocaleString('en'); // 세 자리마다 쉼표 추가
    }

    function excelWrite() {
        // 서버에 엑셀 파일 생성 요청 보내기
        var formData = new FormData($(searchform)[0]);
        
        $.ajax({
            data : formData,
            type: "POST",
            contentType: false,
            processData: false,
            url: "/planQty/createExcel",
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
                a.download = "planQty_" + month + "월" + ".xlsx";
                document.body.appendChild(a);
                a.click();
            }
        });

        alert('엑셀파일 다운로드되었습니다.');
    }

</script>



</body>
</html>
