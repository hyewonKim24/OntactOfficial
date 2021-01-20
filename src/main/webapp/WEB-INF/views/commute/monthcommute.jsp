<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../main/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ontact, 서로 연결되는 온라인 공간</title>
    <link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css">
    <!-- 차트 그리기 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js" 
    	integrity="sha512-d9xgZrVZpmmQlfonhQUvTR7lMPtO7NkZMkA0ABN3PHCbKA5nqylQ/yWlFAyY6hYgdF1Qh6nYiuADWwKB4C2WSw==" 
    	crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/resources/js/Chart.min.js"></script>	
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
    	color: #111111;
	}
	a{
		text-decoration: none;
		color: #111111;
	}
    
    .headersection {
	position: relative;
	width: 100%;
	height: 60px;
	}
	
	.headersection div {
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
        font-weight : 700;
    }
    .option table td:nth-child(2){
        width: 440px;
        font-weight : 700;
    }
    .option table input{
        height : 32px;
        border: 1px solid #c0c0c0;
        box-sizing: border-box;
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
        max-height: 390px;
    }
    .list table{
        width: 930px;
        min-height : 90px;
        max-height : 403px;
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
    .list table tr:nth-child(3){
       text-align:center;
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
    <div class="headersection">
		<div>헤더 들어갈 자리</div>
	</div>
    <div class="main">
        <div class="sidenav">
            <ul>
                <li class="menu"><a href="">근태 관리</a>
                <ul class="hide">
						<li><a href="${pageContext.request.contextPath}/commute/dailylist">출퇴근 관리</a></li>
						<li><a href="${pageContext.request.contextPath}/commute/monthlylist">월 근무내역</a></li>
						<li><a href="${pageContext.request.contextPath}/overwork/owlist">시간외 근무신청</a></li>
					</ul></li>
				<li class="menu"><a href="">휴가 관리</a>
					<ul class="hide">
						<li><a href="${pageContext.request.contextPath}/dayoff/dflist">휴가 신청</a></li>
						<li><a href="${pageContext.request.contextPath}/dayoff/calendarlist">휴가 현황</a></li>
					</ul></li>
				<li><a href="${pageContext.request.contextPath}/commute/organlist">조직도</a></li>
            </ul>
        </div>
    <div class="contents">
        <div class="article">
            <div class="conTitle">월 근무내역</div>
            <div class="option">
            <form action="<c:url value="/commute/monthlylist"/>" method="get">
                <table>
                    <tr>
                        <td>기간 선택</td>
                        <td><input type="Date" id="startDate" name="startdate" placeholder="시작일을 선택하세요" autocomplete="off" style="width:170px; height:30px; padding : 0 10px; color : #787878;"> 
                        &nbsp;&nbsp;&nbsp; ~ &nbsp;&nbsp;&nbsp; 
                        <input type="Date" id="endDate" name="enddate" placeholder="종료일을 선택하세요" autocomplete="off" style="width:170px; height:30px; padding : 0 10px;color : #787878;"></td>
                        <td><button name="submit">조회</button></td>
                    </tr>
                </table>
                </form>
            </div>
            <div class="searchgraph">
                <canvas id="canvas" height="230" width="600"></canvas>
            </div>
            <div class="list">
                <table>
                    <thead>
                    <tr>
                        <td colspan="4" style="text-align: left;">조회결과 ${listCount }건</td>
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
                        <!-- 앞 페이지 번호 처리 -->
					<tr >
						<td colspan="7">
						<c:if test="${currentPage <= 1}">
						&lt; &nbsp;
						</c:if>
						 	<c:if test="${currentPage > 1}">
								<c:url var="monthlistprev" value="/commute/monthlylist">
									<c:param name="page" value="${currentPage-1}" />
								</c:url>
								<a href="${monthlistprev}">&lt; &nbsp;</a>
							</c:if> 
							<!-- 끝 페이지 번호 처리 -->
							 <c:set var="endPage" value="${maxPage}" /> 
							 <c:forEach
								var="p" begin="${startPage+1}" end="${endPage}">
								<!-- eq : == / ne : != -->
								<c:if test="${p eq currentPage}">
									<font color ="#5A3673"><b>${p} &nbsp;</b></font>
								</c:if>
								<c:if test="${p ne currentPage}">
									<c:url var="monthlistchk" value="/commute/monthlylist">
										<c:param name="page" value="${p}" />
									</c:url>
									<a href="${monthlistchk}">${p} &nbsp;</a>
								</c:if>
							</c:forEach> 
							<c:if test="${currentPage >= maxPage}">  &gt;
							</c:if>
							<c:if test="${currentPage < maxPage}">
								<c:url var="monthlistnext" value="/commute/monthlylist">
									<c:param name="page" value="${currentPage+1}" />
								</c:url>
								<a href="${monthlistnext}"> &gt;</a>
							</c:if>
						</td>
					</tr>
                </table>
            </div>
        </div>
     <%--    <div class="row">
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
        </div> --%>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.js"></script>
<script>
        //그래프 그리기
        //createChart()함수를 안에다 선언해야지 차트값을 받더라...
        $(document).ready(function() {
        /* $('#btn').click(function(){ */
                chartLabels = [];
                chartData=[];
                //getJson으로 데이터 
                $.getJSON("${pageContext.request.contextPath}/commute/getDailyCommute", {
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
            
</script>
</body>
</html>