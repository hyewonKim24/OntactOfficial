<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ontact, 서로 연결되는 온라인 공간</title>
    <link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>    
    <!-- 차트 그리기 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js" 
    	integrity="sha512-d9xgZrVZpmmQlfonhQUvTR7lMPtO7NkZMkA0ABN3PHCbKA5nqylQ/yWlFAyY6hYgdF1Qh6nYiuADWwKB4C2WSw==" 
    	crossorigin="anonymous"></script>
   


	
    <!-- <!-- 차트 그리기 
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> 
    차트 링크 
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
    부트스트랩 
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" 
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> 
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" 
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script> 
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" 
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script> -->
        
        
    <style>
    *{
        margin : 0;
    }
    body{
        width : 100%;
        height: 100%;
        position: relative;
        font-size: 14px;
        font-family: Noto Sans KR;
        line-height: 1.15;
    }
    .header{
        position: relative;
        width: 100%;
        height: 60px;
    }
    .header div{
        width: 1200px;
        height: 60px;
        margin: 0 auto;
    }
    /* 본문 */
    .main{
        position: relative;
        width: 1200px;
        height: 100%;
        margin: 0 auto;
    }
    /* 사이드메뉴 */
    .sidenav{
        position: relative;
        width: 210px;
        height: 100%;
        float: left;
    }
    .sidenav ul,
    .sidenav ul li a {
        display: block;
        color: black;
    }
    .sidenav ul li{
        display: block;
        font-size: 16px;
    }
    .sidenav ul ul {
    display: none;
    }
    .sidenav > ul > li > a {
    padding: 19px 20px;
    z-index: 2;  
    cursor: pointer;
    font-weight: 700;
    text-decoration: none;
    }
    .sidenav ul ul li{
        background-color: #e7e7e7;
    }
    .sidenav ul ul li a {
    cursor: pointer;
    padding: 10px 0;
    padding-left: 30px;
    z-index: 1;
    text-decoration: none;
    font-size: 13px;
    }
    /* 콘텐츠 */
    .contents{
        position: absolute;
        width: 970px;
        height: 950px;
        left: 210px;
        padding : 40px 0 40px 40px;
        border-left: 1px solid #e7e7e7;
        box-sizing: border-box;
    }
    .conTitle{
        width: 930px;
        height: 40px;
        line-height: 40px;
        padding-bottom: 20px;
        font-size: 32px;
        border-bottom: 1px solid #e7e7e7;
    }
    .option{
        width: 930px;
        height: 50px;
        padding: 20px 0;
        border-bottom: 1px solid #e7e7e7;
    }
    .option table{
        width: 700px;
        height: 50px;
    }
    .option table td{
        height: 50px;
        line-height: 50px;
    }
    .option table td:nth-child(1){
        width: 100px;
    }
    .option table td:nth-child(2){
        width: 400px;
    }
    .searchgraph{
        width: 930px;
        height: 380px;
        padding: 30px 0;
    }
    .option table button{
        width: 100px;
        height: 32px;
        background-color: #5A3673;
        color:#F2F2F2;
        border : none;
        border-radius: 3px;
    }
    .list{
        width: 930px;
        height: 360px;
    }
    .list table{
        width: 930px;
        height: 360px;
        font-size: 14px;
        text-align: center;
    }
    .list table tr{
        height: 30px;
        line-height: 30px;
        border-bottom: 1px solid #e7e7e7;
    }
    .list table thead{
        font-weight: 700;
    }
    
    </style>
    
    <script>
        $(document).ready(function() {
        $('.sidenav li.menu>a').on('click', function(){
		$(this).removeAttr('href');
		var element = $(this).parent('li');
		if (element.hasClass('open')) {
			element.removeClass('open');
			element.find('li').removeClass('open');
            element.find('ul').slideUp();
		}
		else {
			element.addClass('open');
			element.children('ul').slideDown();
			element.siblings('li').children('ul').slideUp();
			element.siblings('li').removeClass('open');
			element.siblings('li').find('li').removeClass('open');
            element.siblings('li').find('ul').slideUp();
		}
	    });
	
    });
    </script>
</head>
<body>
    <div class="header">
        <div>헤더 들어갈 자리</div>
    </div>
    <div class="main">
        <div class="sidenav">
            <ul>
                <li class="menu"><a href="">근태 관리</a>
                    <ul class="hide">
                        <li><a href="">출퇴근 관리</a></li>
                        <li><a href="">월 근무내역</a></li>
                        <li><a href="">시간외 근무신청</a></li>
                    </ul>
                </li>
                <li class="menu"><a href="">휴가 관리</a>
                    <ul class="hide">
                        <li><a href="">휴가 신청</a></li>
                        <li><a href="">휴가 현황</a></li>
                    </ul>
                </li>
                <li ><a href="">조직도</a></li>
            </ul>
        </div>
    <div class="contents">
        <div class="article">
            <div class="conTitle">월 근무내역</div>
            <div class="option">
                <table>
                    <tr>
                        <td>기간 선택</td>
                        <td><input type="text" id="startDate"> &nbsp;&nbsp;&nbsp; ~ &nbsp;&nbsp;&nbsp; <input type="text" id="endDate"></td>
                        <td><button value="">조회</button></td>
                    </tr>
                </table>
            </div>
            <div class="searchgraph">
                <canvas id="canvas" height="230" width="600"></canvas>
            </div>
            <div class="list">
                <table>
                    <thead>
                    <tr>
                        <td colspan="4" style="text-align: left;">조회결과 00건</td>
                    </tr>
                     <tr>
                        <th>날짜</th>
                        <th>근무시간</th>
                        <th>시간외 근무시간</th>
                        <th>총 근무시간</th>
                    
                    </tr>
                    </thead>
                    <c:if test="${not empty list}">
						<c:forEach var="ml" items="${list}" varStatus="status">
                    <tr>
                        <td>${ml.cdate} </td>
                        <td>${ml.cworktime}</td>
                        <td>${ml.owtime}</td>
                        <th>${ml.total}</th>
                    </tr>
                    </c:forEach>
                    </c:if>
                </table>
            </div>
        </div>
        <div class="row">
            <div class="container">
                <div style="margin-top:20px; margin-left:80px">
                    <select name="selectMonth" id="selectMonth">
                        <option value="1">JAN</option>
                        <option value="2">FEB</option>
                        <option value="3">MAR</option>
                        <option value="4">APR</option>
                        <option value="5">MAY</option>
                        <option value="6">JUN</option>
                        <option value="7">JUL</option>
                        <option value="8">AUG</option>
                        <option value="9">SEP</option>
                        <option value="10">OCT</option>
                        <option value="11">NOV</option>
                        <option value="12">DEC</option>
                    </select>
                    <button id="btn">보기</button>
                </div>
            </div>
            <div id="graph" style="width: 80%; margin: 30px;">
                <div>
                    <canvas id="canvas" height="350" width="600"></canvas>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.js"></script>
<script>
        $(function() {
            //input을 datepicker로 선언
            $.datepicker.setDefaults({
                dateFormat: 'yy-mm-dd' //Input Display Format 변경
                ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
                ,changeYear: true //콤보박스에서 년 선택 가능
                ,changeMonth: true //콤보박스에서 월 선택 가능                
                // ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
                // ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
                // ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
                // ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
                ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
                ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
                ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
                ,minDate: "-48M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                ,maxDate: "+12M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
            });                    
            $('#startDate').datepicker(); 
            $('#endDate').datepicker(); 
            //초기값을 오늘 날짜로 설정
            $('#startDate').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)  
            $('#endDate').datepicker('setDate', 'today');          
        });
        
            var chartLabels = []; // 받아올 데이터를 저장할 배열 선언
            var chartData = []; 
            var month="";
            
            function createChart() {
                var ctx = document.getElementById("canvas").getContext("2d");
                LineChartDemo = Chart.Line(ctx, {
                    data : lineChartData,
                    options : {
                        scales : {
                            yAxes : [ {
                                ticks : {
                                    beginAtZero : true
                                }
                            } ]
                        }
                    }
                });
            }
            
            //selectList로 월을 선택해서 ajax로 받는다.
            $('#selectMonth').change(function() {
                var changeMonth = $('#selectMonth option:selected').val();
                month = changeMonth;
                console.log('month:'+month);
            });
            
            //버튼을 클릭하면 차트가 그려진다. createChart()함수를 안에다 선언해야지 차트값을 받더라...
            $('#btn').click(function(){
                chartLabels = [];
                chartData=[];

                //getJson으로 데이터 
                $.getJSON("${pageContext.request.contextPath}/commute/getDailyVisitor", {
                    month : month
                }, function(data) {
                	console.log("여기 " + data);
                    $.each(data, function(key, value) {
                        
                        chartLabels.push(value.cdate);
                        chartData.push(value.total);
                        console.log("무엇" + chartData);
                    });
                    
                    lineChartData = {
                            labels : chartLabels,
                            datasets : [ {
                                label : "일별 근무시간",
                                backgroundColor:"#bfdaf9",
                                borderColor: "#80b6f4",
                                pointBorderColor: "#80b6f4",
                                pointBackgroundColor: "#80b6f4",
                                pointHoverBackgroundColor: "#80b6f4",
                                pointHoverBorderColor: "#80b6f4",
                                fill: false,
                                borderWidth: 4,
                                data : chartData
                            } ]
     
                        }
                    createChart();
                    
                });
            })
</script>
</body>
</html>