<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../main/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ontact, 서로 연결되는 온라인 공간</title>
    <link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css">
    <script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>  
    <link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
        color: rgb(17,17,17);
        background-color : #f2f2f2;
    }
    a {
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
        background-color : #f2f2f2;
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
    padding: 25px 20px 19px 60px;
    z-index: 2;  
    cursor: pointer;
    font-weight: 500;
    text-decoration: none;
    }
    
    .sidenav ul ul li{
        /* background-color: #e7e7e7; */
    }
    .sidenav ul ul li a {
    cursor: pointer;
    padding: 20px 0;
    padding-left: 60px;
    z-index: 1;
    text-decoration: none;
    font-size: 13px;
    }
    .sidenav ul ul li:hover{
    	background-color : #e7e7e7;
    	color : #5A3673;
    }
    
    .sidenav ul ul li a:hover{
    	font-weight : 700;
    	
    }
    
/* 콘텐츠 */
.contents {
	position: absolute;
	width: 1000px;
	height: 900px;
	left: 210px;
	padding: 40px 0 40px 35px;
	border-left: 1px solid #e7e7e7;
	box-sizing: border-box;
	background-color : white;
}
    .conTitle{
        width: 930px;
        height: 40px;
        line-height: 40px;
        padding-bottom: 20px;
        font-size: 32px;
        border-bottom: 1px solid #e7e7e7;
    }
    .application{
        width: 930px;
        height: 210px;
        padding : 20px 0;
        margin-bottom: 80px;
    }
    .application table{
        width: 930px;
        height: 210px;
        font-size: 14px;
    }
    .application table tr{
        height: 35px;
        line-height: 35px;
    }
    .application table tr:nth-child(3){
        height: 70px;
        line-height: 70px;
    }
    .application table tr:nth-child(4){
        height: 70px;
        line-height: 70px;
        text-align: center;
        border-top: 1px solid #e7e7e7;
    }
    .title{
        width: 100px;
        font-weight: 700;
    }
    .application select{
        border: 1px solid #c0c0c0;
        box-sizing: border-box;
    }
    .application input{
        border: 1px solid #c0c0c0;
        box-sizing: border-box;
    }
    .application table button{
        width: 100px;
        height: 32px;
        background-color: #5A3673;
        color:#F2F2F2;
        border : none;
        border-radius: 3px;
    }
    .option{
        width: 930px;
        height: 50px;
        padding: 20px 0;
        border-top: 1px solid #e7e7e7;
        border-bottom: 1px solid #e7e7e7;
    }
    .option table{
        width: 700px;
        height: 50px;
        font-size : 14px;
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
        width: 480px;
        font-weight : 700;
    }
     .option table input{
        height : 32px;
        border: 1px solid #c0c0c0;
        box-sizing: border-box;
    }
    .option table button{
        width: 100px;
        height: 32px;
        background-color: #5A3673;
        color:#F2F2F2;
        border : none;
        border-radius: 3px;
    }

    .searchgraph{
        width: 930px;
        height: 200px;
        padding: 30px 0;
    }
    .option table #insertDf{
        width: 100px;
        height: 32px;
        background-color: #5A3673;
        color:#F2F2F2;
        border : none;
        border-radius: 3px;
    }
    .lista{
        padding-top: 30px;
        width: 930px;
        height: 360px;
    }
    .lista table{
        width: 930px;
        min-height : 93px;
        font-size: 14px;
        text-align: center;
    }
    .lista table tr{
        height: 30px;
        line-height: 30px;
        border-bottom: 1px solid #e7e7e7;
    }
    .lista table thead{
        font-weight: 700;
    }
    .dfno{
    	width : 40px;
    	text-align : center;
    	border : none;
    }
    .accept{
    	width: 50px;
        height: 25px;
        background-color: #5A3673;
        color:#F2F2F2;
        border : none;
        border-radius: 3px;
        font-size : 11px;
        vertical-align : middle;
    }
    </style>
     <script>
     	 var result='${msg}';
		console.log(result);
		if(result == "success") {
	        alert("승인 되었습니다.");
	    } else if(result == "failed"){
	    	alert("오류가 발생했습니다.");
	    }
		
	    /* $('#insertDf').on('click', function(){
            console.log("들어왔다!!")
            $("#frm").action = "${pageContext.request.contextPath}/dayoff/dayoffins";
        	$("#frm").method = "post";
        	$("#frm").submit();
        }); */
		
        // html dom 이 다 로딩된 후 실행된다.
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
        
       	/* var responseMessage = "<c:out value="${message}" />"; */
       		/* $("#insertDf").on("click", function(){
       		}); */
        
       		$('#insertDf').on('click', function(e){
            	e.preventDefault();
           		if(fnMemberValidation() == false) {
           			return;
           			console.log("false로 들어옴");
           		}else if(fnMemberValidation() == true){
                    console.log("true로 들어옴");
        			confirm("제출하시겠습니까?")
        			if(true){
        	          	   $("#dfIns_frm").submit();
        	        	 alert("제출완료");
        	        }else{
        	        	  return;
        	      	}
             	}else{
              	   return;
              	}
            });
       		
        	 
        function fnMemberValidation(){
         	 if($('#dname option:selected').val() == '' || $('#dname option:selected').val() == 0){
        	   alert("부서를 선택해주세요");
         	   $('#name').focus();
         	   return false;
         	 }
         	 if($.trim($('#uname').val()) == ''){
         	   alert("이름을 입력해주세요");
         	   $('#uname').focus();
         	   return false;
        	  }
         	 if($.trim($('#dayoffStart').val()) == ''){
            	   alert("휴가 시작일을 선택해주세요.");
            	   $('#dayoffStart').focus();
           	   return false;
           	  } 
         	 if($.trim($('#dayoffEnd').val()) == ''){
               	alert("휴가 종료일을 선택해주세요.");
               	$('#dayoffEnd').focus();
              	return false;
             }
         	 if($.trim($('#offdays').val()) == ''){
                 alert("일수를 입력해주세요.");
                 $('#offdays').focus();
                 return false;
              }
         	 if($.trim($('#offreason').val()) == ''){
            	   alert("휴가사유를 입력해주세요");
           	   		$('#offreason').focus();
   	        	   return false;
            	}
         	  return true;
         	 };
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
            <div class="conTitle">휴가 신청 및 조회</div>
            <div class="application">
            <form id="dfIns_frm" action = "${pageContext.request.contextPath}/dayoff/dayoffins" method = "post">
           	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <table>
                    <tr>
                        <td class="title">부서명</td>
                        <td style="width: 230px;">
                            <select style="width: 200px; height: 30px; color : #787878;" id="dname" name="dname">
                                <option value="0">선택하세요</option>
                                    <c:forEach var="dp" items="${deptlist}" varStatus="e">
								    <option value="${dp.dno}">${dp.dname}</option>  
									</c:forEach>
                            </select>
                        </td>
                        <td class="title">성명</td>
                        <td style="width: 230px;"><input type="text" style="width: 200px; height: 30px;" id="uname" name="uname" placeholder="   이름을 입력하세요" autocomplete="off" ></td>
                        <td></td>
                        <td></td>
                    </tr> 
                    <tr>
                        <td class="title">휴가 시작 일자</td>
                        <td style="width: 230px;"><input type="text" style="width: 200px; height: 30px; padding : 0 10px; color : #787878;" id="dayoffStart" name="offstart" placeholder="시작일을 선택하세요" autocomplete="off" ></td>
                        <td class="title">휴가 종료 일자</td>
                        <td style="width: 230px;"><input type="text" style="width: 200px; height: 30px; padding : 0 10px; color : #787878;" id="dayoffEnd" name="offend" placeholder="종료일을 선택하세요" autocomplete="off"></td>
                        <td class="title" style="width: 50px;">일수</td>
                        <td><input type="text" style="width: 50px; height: 30px;" id="offdays" name="offdays" autocomplete="off"></td>
                   
                    </tr>
                    <tr>
                        <td class="title">휴가사유</td>
                        <td colspan="6" style="padding-bottom: 20px;"><input type="text" style="width: 830px; height: 65px;" id="offreason" name="offreason" placeholder="사유를 입력해주세요. (ex) 연차, 병가, 월차 등등)" autocomplete="off"></td>
             
                    </tr>
                    <tr>
                        <td colspan="6"><button id="insertDf" name="insertDf" >신청하기</button></td>
                    <!-- type="submit" -->
                    </tr>
                    </table>
                    </form>
            </div>
            <div class="option">
            <form name="frm">
                <table>
                    <tr>
                        <td>기간 선택</td>
                        <td><input type="text" id="startDate" name="startdate" placeholder="시작일을 선택하세요" autocomplete="off" style="padding : 0 10px; color : #787878;"> 
                        &nbsp;&nbsp;&nbsp; ~ &nbsp;&nbsp;&nbsp; 
                        <input type="text" id="endDate" name="enddate" placeholder="종료일을 선택하세요" autocomplete="off" style="padding : 0 10px; color : #787878;"></td>
                        <td><button type="submit" value="">조회</button></td>
                    </tr>
                </table>
            </form>
            </div>
            <div class="lista">
                <table>
                    <thead>
                    <tr>
                        <td colspan="8" style="text-align: left;">조회결과 <span>${listCount}</span>건</td>
                    </tr>
                    <tr>
                        <th style="width : 80px;">신청번호</th>
                        <th>휴가시작일자</th>
                        <th>휴가종료일자</th>
                        <th>휴가일수</th>
                        <th>사유</th>
                        <th>신청일</th>
                        <th>상태</th>
                        <th></th>
                    </tr>
                    </thead>
                    
                    <form name="updateOwApp_frm">
	                	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	                    <input type="hidden" class="dfnohidden" name="hiddenname"value="">
                   	</form>
                   		
                    <%-- <c:if test="${listCount eq 0}">
						<tr>
							<td colspan="8" align="center"><br>
							<br> 신청내역이 없습니다.<br>
							<br></td>
						</tr>
					</c:if>
					<c:if test="${listCount ne 0}"> --%>
						<c:forEach var="df" items="${list}" varStatus="e">
                    <tr class="parent_td">
                        <td><input type="text" value="${df.dfno}" name="dfno" class="dfno dfno${e.count}"></td>
                        <td>${df.offstart}</td>
                        <td>${df.offend}</td>
                        <td>${df.offdays}</td>
                        <td>${df.offreason}</td>
                        <td>${df.offtime}</td>
                        <td><input type="hidden" value="${df.offapproval}" name="dfno" class="dfno app${e.count}">
                        	<span class="owappval${e.count}"></span>
                        </td>
                        <td>
                        <sec:authorize access="hasRole('ROLE_ADMIN')"> 
                        	<button class="accept${e.count} accept">승인</button>
                       	</sec:authorize>
                        </td>
                    </tr>
                     <script>
		                    $(".accept${e.count}").click(function(){
	                    		var pt = $(".accept${e.count}").parents(".parent_td");
	                    		var dfnoA = pt.find(".dfno${e.count}").val();
	                    		console.log("값을 확인 : " + dfnoA);
	                    		$(".dfnohidden").val(dfnoA);
	                    		goUpdate();
		                    })
		                    
		                    if($(".app${e.count}").val() == 1){
		                    	$(".owappval${e.count}").text("승인 완료");
		                    }else if($(".app${e.count}").val() == 0){
		                    	$(".owappval${e.count}").text("진행 중");
		                    }
	                    </script>
                    </c:forEach>
                     <script type="text/javascript">
							function goUpdate(){
								var updatefrm = document.updateOwApp_frm;
								updatefrm.action="${pageContext.request.contextPath}/dayoff/dfappupd"
								updatefrm.method="post"
								updatefrm.submit();
							}
						</script>
                    <%-- </c:if> --%>
                   <!-- 앞 페이지 번호 처리 -->
					<tr>
						<td colspan="8">
						<c:if test="${currentPage <= 1}">
						&lt; &nbsp;
						</c:if>
						 	<c:if test="${currentPage > 1}">
								<c:url var="dflistprev" value="/dayoff/dflist">
									<c:param name="page" value="${currentPage-1}" />
								</c:url>
								<a href="${dflistprev}">&lt; &nbsp;</a>
							</c:if> 
							<!-- 끝 페이지 번호 처리 -->
							 <c:set var="endPage" value="${maxPage}" /> 
							 <c:forEach
								var="p" begin="${startPage+1}" end="${endPage}">
								<!-- eq : == / ne : != -->
								<c:if test="${p eq currentPage}">
									<font color ="#da0f8e"><b>${p} &nbsp;</b></font>
								</c:if>
								<c:if test="${p ne currentPage}">
									<c:url var="dflistchk" value="/dayoff/dflist">
										<c:param name="page" value="${p}" />
									</c:url>
									<a href="${dflistchk}">${p} &nbsp;</a>
								</c:if>
							</c:forEach> 
							<c:if test="${currentPage >= maxPage}">&gt;
							</c:if>
							<c:if test="${currentPage < maxPage}">
								<c:url var="dflistnext" value="/dayoff/dflist">
									<c:param name="page" value="${currentPage+1}" />
								</c:url>
								<a href="${dflistnext}">&gt;</a>
							</c:if>
							</td>
					</tr>
                </table>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
$(function() {
    //input을 datepicker로 선언
    $.datepicker.setDefaults({
        dateFormat: 'yy-mm-dd' //Input Display Format 변경
        ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
        ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
        ,changeYear: true //콤보박스에서 년 선택 가능
        ,changeMonth: true //콤보박스에서 월 선택 가능                
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
    $('#dayoffStart').datepicker(); 
    $('#dayoffEnd').datepicker(); 
    //초기값을 오늘 날짜로 설정
    /* $('#startDate').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)  
    $('#endDate').datepicker('setDate', 'today'); */          
});
</script>

</body>
</html>