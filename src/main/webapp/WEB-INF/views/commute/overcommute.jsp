<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../main/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ontact, 서로 연결되는 온라인 공간</title>
    <link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
        height: 1100px;
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
    .application{
        width: 930px;
        height: 280px;
        padding : 20px 0;
        margin-bottom: 80px;
    }
    .application table{
        width: 930px;
        height: 280px;
        font-size: 14px;
    }
    .application table tr:nth-child(1), tr:nth-child(2){
        height: 35px;
        line-height: 35px;
    }
    .application table tr:nth-child(3), tr:nth-child(4){
        height: 70px;
        line-height: 70px;
    }
    .application table tr:nth-child(5){
        height: 70px;
        line-height: 70px;
        text-align: center;
        border-top: 1px solid #e7e7e7;
    }
    .title{
        width: 70px;
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
    #insertOw{
        width: 100px;
        height: 32px;
        background-color: #5A3673;
        color:#F2F2F2;
        border : none;
        border-radius: 3px;
    }
    .list{
        padding-top: 30px;
        width: 930px;
        height: 360px;
    }
    .list table{
        width: 930px;
        min-height : 93px;
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
    .owno{
	    width : 80px;
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
    var result='${message}';
	console.log(result);
	if(result == "success")
	    alert("신청이 완료되었습니다");${message}
    	
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
        
       function fnSubmit(){
       		if(fnMemberValidation() == false) return;
        	if(confirm("제출하시겠습니?")){
        	   alert("제출완료");
        	}else{
        	   return;
        	}
        }	 
        function fnMemberValidation(){
        	 if($.trim($('#name').val()) == ''){
        	   alert("부서를 선택해주세요");
        	   $('#name').focus();
        	   return false;
        	  }
        	  if($.trim($('#email').val()) == ''){
        	   alert("이름을 입력해주세요");
        	   $('#email').focus();
        	   return false;
        	  }
        	  if(!($('#genderM')[0].checked == true || $('#genderW')[0].checked == true)){
        	   alert("휴가 시작일자를 선택해주세요.");
        	   $('#genderM').focus();
        	   return false;
        	  }
        	  
        	  if($('#smsyn').is(':checked') == false){
        	   alert("휴가 종료일자를 선택해주세요");
        	   $('#smsyn').focus();
        	   return false;
        	  }
        	  
        	  if(($.trim($('#zipcode1').val()) == '') || ($.trim($('#zipcode2').val()) == '')){
        	   alert("일수를 입력해주세요");
        	   $('#zipcode1').focus();
        	   return false;
        	  }
        	  if(($.trim($('#zipcode1').val()) == '') || ($.trim($('#zipcode2').val()) == '')){
           	   alert("휴가사유를 입력해주세요");
           	   $('#zipcode1').focus();
           	   return false;
           	  }
        	  
        	  return true;
        	 }
        	
	
    });
    </script>
</head>
<body>
    <div class="headersection">
		<div>헤더 들어갈 자리</div>
	</div>
    <div class="main">
    <div class="sidenav">
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
    </div>
    <div class="contents">
        <div class="article">
            <div class="conTitle">시간외 근무 신청 및 조회</div>
            <div class="application">
            <form action="<c:url value="/overwork/ins"/>" method="get">
                <table>
                    <tr>
                        <td class="title">부서명</td>
                        <td style="width: 250px;">
                            <select style="width: 200px; height: 30px;color : #787878;" name="dno">
                                <option value="0">선택하세요</option>
                                <option value="1">개발팀</option>
                                <option value="2">기획팀</option>
                                <option value="3">영업팀</option>
                                <option value="4">마케팅팀</option>
                            </select>
                        </td>
                        <td class="title">성명</td>
                        <td><input type="text" style="width: 200px; height: 30px;" id="uname" name="uname" placeholder="  이름을 입력하세요" autocomplete="off"></td>
                        
                    </tr>
                    <tr>
                        <td class="title">예정일시</td>
                        <td><input type="Date" style="width: 200px; height: 30px; padding : 0 10px; color : #787878;" id="owstart" name="owdate" placeholder="일자를 선택하세요" autocomplete="off"></td>
                        <td class="title">예상시간</td>
                        <td><input type="text" style="width: 200px; height: 30px;" id="owtime" name="owtime" placeholder="  시간을 입력하세요 ex) 2시간 -> 2" autocomplete="off"></td>
                    </tr>
                    <tr>
                        <td class="title">업무내용</td>
                        <td colspan="3"><input type="text" style="width: 860px; height: 65px;" id="owtitle" name="owtitle" placeholder="  업무 내용을 입력하세요" autocomplete="off"></td>
                        
                    </tr>
                    <tr>
                        <td class="title">사유</td>
                        <td colspan="3" style="padding-bottom: 20px;"><input type="text" style="width: 860px; height: 65px;" id="owreason"name="owreason" placeholder="  사유를 입력하세요" autocomplete="off"></td>
                    </tr>
                    <tr>
                        <td colspan="4"><button type="submit" name="insertOw" id="insertOw">신청하기</button></td>
                    </tr>
                    </table>
               </form>
            </div>
            <div class="option">
            <form action="<c:url value="/overwork/owlist"/>" method="get">
                <table>
                    <tr>
                        <td>기간 선택</td>
                        <td><input type="Date" id="startDate" name="startdate" placeholder="시작일을 선택하세요" autocomplete="off" style="padding : 0 10px; color : #787878;"> 
                        &nbsp;&nbsp;&nbsp; ~ &nbsp;&nbsp;&nbsp; 
                        <input type="Date" id="endDate" name="enddate" placeholder="종료일을 선택하세요" autocomplete="off" style="padding : 0 10px; color : #787878;"></td>
                        <td><button name="submit" >조회</button></td>
                    </tr>
                </table>
               </form>
            </div>
            <div class="list">
                <table>
                    <thead>
	                    <tr>
	                        <td colspan="7" style="text-align: left;">조회결과 <span>${listCount}</span>건</td>
	                    </tr>
	                    <tr>
	                        <th style="width : 80px; text-align : center; ">신청번호</th>
	                        <th>일자</th>
	                        <th>시간</th>
	                        <th>업무내용</th>
	                        <th>사유</th>
	                        <th>승인</th>
	                        <th></th>
	                    </tr>
	                 </thead>
	                <%-- <c:if test="${not empty list}"> --%>
	                	<form name="updateOwApp_frm">
	                		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	                    	<input type="hidden" class="ownohidden" name="hiddenname"value="">
                   		</form>
	                	 
						<c:forEach var="ow" items="${list}" varStatus="e">
	                    <tr class="parent_td">
	                <!-- <form name="updateOwApp_frm_test">  -->   
	                    	<td>
	                    	<input type="text" value="${ow.owno}" name="owno" class="owno owno${e.count}">
	                    	</td>
	                        <td>${ow.owdate}</td>
	                        <td>${ow.owtime}</td>
	                        <td>${ow.owtitle}</td>
	                        <td>${ow.owreason}</td>
	                        <td>${ow.owapproval}</td>
	                        <td>
	                        <sec:authorize access="hasRole('ROLE_ADMIN')">
	                        	<button class="accept${e.count}">승인</button>
                        	</sec:authorize>
                        	</td>
	                    <!-- </form> -->
	                    </tr>
	                    <script>
		                    $(".accept${e.count}").click(function(){
	                    		var pt = $(".accept${e.count}").parents(".parent_td");
	                    		var ownoA = pt.find(".owno${e.count}").val();
	                    		console.log("값을 확인 : " + ownoA);
	                    		$(".ownohidden").val(ownoA);
	                    		goUpdate();
		                    })
	                    </script>
	                     </c:forEach>
	                    <script type="text/javascript">
							function goUpdate(){
								var updatefrm = document.updateOwApp_frm;
								updatefrm.action="${pageContext.request.contextPath}/overwork/owupd"
								updatefrm.method="post"
								updatefrm.submit();
							}
						</script>
                   		
                    <%-- </c:if> --%>
			      <!-- 앞 페이지 번호 처리 -->
					<tr align="center" height="20">
						<td colspan="7">
						<c:if test="${currentPage <= 1}">
						&lt; &nbsp;
						</c:if>
						 	<c:if test="${currentPage > 1}">
								<c:url var="owlistprev" value="/overwork/owlist">
									<c:param name="page" value="${currentPage-1}" />
								</c:url>
								<a href="${owlistprev}">&lt; &nbsp;</a>
							</c:if> 
							<!-- 끝 페이지 번호 처리 -->
							 <c:set var="endPage" value="${maxPage}" /> 
							 <c:forEach
								var="p" begin="${startPage+1}" end="${endPage}">
								<!-- eq : == / ne : != -->
								<c:if test="${p eq currentPage}">
									<font color ="#5A3673" ><b>${p} &nbsp;</b></font>
								</c:if>
								<c:if test="${p ne currentPage}">
									<c:url var="owlistchk" value="/overwork/owlist">
										<c:param name="page" value="${p}" />
									</c:url>
									<a href="${owlistchk}">${p} &nbsp;</a>
								</c:if>
							</c:forEach> 
							<c:if test="${currentPage >= maxPage}">&gt;
							</c:if>
							<c:if test="${currentPage < maxPage}">
								<c:url var="owlistnext" value="/overwork/owlist">
									<c:param name="page" value="${currentPage+1}" />
								</c:url>
								<a href="${owlistnext}">&gt;</a>
							</c:if>
							</td>
					</tr>
                </table>
            </div>
        </div>
    </div>
</div>

</body>
</html>