<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("utf-8"); %>

<% response.setContentType("text/html; charset=utf-8"); %>

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
    font-weight: 700;
    text-decoration: none;
    }
    
    .sidenav ul ul li{
        background-color: #e7e7e7;
    }
    .sidenav ul ul li a {
    cursor: pointer;
    padding: 20px 0;
    padding-left: 60px;
    z-index: 1;
    text-decoration: none;
    font-size: 13px;
    }
    
    /* 콘텐츠 */
    .contents{
        position: absolute;
        width: 1000px;
        height: 950px;
        left: 210px;
        padding : 40px 0 40px 40px;
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
    .search{
        position: absolute;
        width: 200px;
        height: 60px;
        padding: 10px 15px;
        margin-top: 30px;
        line-height: 40px;
        border: 1px solid #e7e7e7;
        box-sizing: border-box;
        border-bottom: 0;
        
    }
    .search input{
        width: 168px;
        height: 30px;
        border: 1px solid #e7e7e7;
        /* border-right: 0; */
        box-sizing: border-box;
    }
    #searchBtn{
        width: 33px;
        height: 30px;
        background-color: white;

        color:#F2F2F2;
        border : 1px solid #e7e7e7;
        /* border-left: 0; */
        box-sizing: border-box;
        vertical-align: middle;   
    }
    #searchBtn img{
        width: 15px;
        height: 15px;
        margin-top: 3px;
    }
    .team{
        position: absolute;
        top: 190px;
        width: 200px;
        height: 400px;
        border: 1px solid #e7e7e7;
        border-bottom: 0;
        box-sizing: border-box;
        
    }
    
    .team ul li:nth-child(1){
        width: 183px;
        margin-left : 0;    
    }
    .team ul li{
        width: 158px;
        height: 40px;
        line-height: 40px;
        padding-left : 25px;
        margin-left : 10px;
    }
    #deptBtn{
        width: 14px;
        height: 14px;
        background-color: white;
        border: 1px solid #d1d1d1;
        box-sizing: border-box;
        font-size: 8px;
        margin: 0;
        padding: 0;
        color: black;
        vertical-align: middle;
    }
    .notyet{
        position: absolute;
        top : 590px;
        width: 200px;
        height: 40px;
        line-height: 40px;
        padding-left: 30px;
        border: 1px solid #e7e7e7;
        border-bottom: 0;
        box-sizing: border-box;
        
    }
    .deptEdit{
        position: absolute;
        top : 630px;
        width: 200px;
        height: 50px;
        line-height: 50px;
        padding-left: 15px;
        float: left;
        border: 1px solid #e7e7e7;
        box-sizing: border-box;
        
    }
    .deptEdit button{
        background-color: white;
        border: none;
        padding-top: 3px;
        margin-top: 10px;
        margin-right: 3px;
    }
    .detail{
        position: absolute;
        width: 710px;
        height: 549px;
        left: 260px;
        margin-top: 30px;
        padding: 15px 15px 0 15px;
        border: 1px solid #e7e7e7;
        box-sizing: border-box;
        
    }
    #firstttl{
        height: 44px;
        line-height: 44px;
       
        font-size: 18px;
        font-weight: 700;
    }
    #detpcount{
        margin-left: 10px;
        font-size: 14px;
        font-weight: 400;
    }
    .detail table{
        width: 678px;
        font-size: 12px;
        text-align: center;
    }
    .detail table th{
    	font-weight: 700;
    }
    .detail table tr{
        height: 36px;
        line-height: 35px;
        border-bottom: 1px solid #e7e7e7;
    }
    .detail table tr:nth-last-child(1){
        height: 37px;
    }
    .detail table tr td{
        padding-left: 10px;
    }
    .move_wrap{
        width: 710px;
        height: 50px;
        line-height: 52px;
    }
    #moveBtn{
        padding: 0;
        margin: 0;
        width: 150px;
        height: 30px;
        background-color: #e7e7e7;
        border: none;
        border-radius: 3px;
    }
    #addDname{
    	display : none;
    	width : 120px;
    	height : 30px;
    	vertical-align : middle;
    	float : left;
    	border: 1px solid #e7e7e7;
    	box-sizing: border-box;
    }
    .goDept{
    	display : none;
    	width : 25px;
    	height : 25px;
    	box-sizing: border-box;
    	background-color : #e7e7e7; 
    	border: none;
    }
    .pickDept{
    	display : none;
    	margin-right : 10px;
   		width : 30px;
   		height : 23px;
   		vertical-align : middle;
   		margin-right : 10px;
   		padding :0;
   		font-size : 11px;
   		background-color : #5A3673;
   		color : white;
   		border : none;
   		border-radius:3px;
    	
    }
    .dnameBtn{
    	width : 100px;
    	height : 35px;
    	/* background-color : white; */
    	border : none;
    	text-align : left;
    }
    .deptSelect{		
    	width : 100px;
    	height : 30px;   
    	border : 1px solid #a2a2a2; 
    	border-radius : 3px;
    	 box-sizing: border-box; 	
    	 margin-right : 5px;
    }

    </style>
    <script>
    	//부서 추가 알림
	    var result1='${message}';
		console.log(result1);
		if(result1 == "success") {
	        alert("부서가 추가되었습니다.");
	    }
		
		//부서 삭제 알림
		var result2='${message2}';
		console.log(result2);
		if(result2 == "success") {
	        alert("부서가 삭제되었습니다.");
	    } else if(result2 == "failed"){
	    	alert("사원이 존재하는 부서는 삭제하실 수 없습니다.");
	    }
		
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
	    	//부서 검색
	        $("#keyword").keyup(function() {
                var k = $(this).val();
                $(".parent_a").hide();
                var temp = $(".parent_a:contains('" + k + "')");
                $(temp).show();
            })
            /* //부서 리스트
       		$(".dname${e.count}").click(function() {
				var frm = document.listDept_frm;
				frm.action = "${pageContext.request.contextPath}/commute/organlist"
				frm.method = "post"
				frm.submit();
			}); */
	        
            //부서 추가        
            $("#addBtn").click(function() {
                $("#addDname").css("display", "block");
                $(".goDept").css("display", "block");   
            })
            $("#addDname").keydown(function(key) {
				if (key.keyCode == 13) {
					var frm = document.dept_add_frm;
					frm.action = "${pageContext.request.contextPath}/commute/deptins"
					frm.method = "get"
					frm.submit();
				}
			});
            
            //부서 삭제
            $("#deleteBtn").click(function() {
            	$(".pickDept").css("display", "inline-block");
				/* var frm = document.dept_frm;
				frm.action = "${pageContext.request.contextPath}/commute/deptdel"
				frm.method = "get"
				frm.submit(); */
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
						<li class="hover"><a href="${pageContext.request.contextPath}/commute/dailylist">출퇴근 관리</a></li>
						<li class="hover"><a href="${pageContext.request.contextPath}/commute/monthlylist">월 근무내역</a></li>
						<li class="hover"><a href="${pageContext.request.contextPath}/overwork/owlist">시간외 근무신청</a></li>
					</ul></li>
				<li class="menu"><a href="">휴가 관리</a>
					<ul class="hide">
						<li class="hover"><a href="${pageContext.request.contextPath}/dayoff/dflist">휴가 신청</a></li>
						<li class="hover"><a href="${pageContext.request.contextPath}/dayoff/calendarlist">휴가 현황</a></li>
					</ul></li>
				<li><a href="${pageContext.request.contextPath}/commute/organlist">조직도</a></li>
            </ul>
        </div>
    <div class="contents">
        <div class="conTitle">조직도</div>
            <div class="article">
                <form action="/commute/organlist" method="get">
                <div class="search">
                    <input type="text" name="keyword" id="keyword" autocomplete="off">
                    
                </div>
                </form>
                <div class="team">
                    <ul>
                        <li style="font-weight: 700;">
                            <button id="deptBtn">
                            	<img src ="${pageContext.request.contextPath}/resources/img/substract.png" style="width: 8px; height: 8px;">
                            </button>
                            &nbsp; ${cname}<span>(${deptlistCount})</span>
                        </li>
                    <%-- <c:if test="${not empty selectDept}"> --%>
					<c:forEach var="dp" items="${selectDept}" varStatus="e">
		                        <li class="parent_a">
		                        <form name="listDept_frm" id="listDept_frm_${dp.dno}" action="${pageContext.request.contextPath}/commute/deptdel" method="post">
	                				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
									<input type ="hidden" value="${dp.dname}" name="dname" class="dname">
									<input type ="hidden" value="${dp.cno}" name="cno" class="cno">
			                        <input type ="hidden" value="${dp.dno}" name="dno" class="dno">
			                        <input type ="hidden" value="${dp.pno}" name="pno" class="pno">
		                        </form>
			                    <button type ="button"name="pickDept" onclick="goList('${dp.dno}');" 
			                        class="pickDept pickDept${e.count}" id="dept${e.count}">삭제</button>
		                        <a href="${pageContext.request.contextPath}/commute/organlist?dname=${dp.dname}">
		                        ${dp.dname}
		                        <input type ="hidden" value="${dp.dno}" name="dno" class="dno">
		                        <input type ="hidden" value="${dp.pno}" name="pno" class="pno">
		                        </a>
		                        </li>
		                        <script>
				                    /* $(".pickDept${e.count}").click(function(){
			                    		goList();
				                    }) */
			                    </script>
	                    
	                        </c:forEach>
	                        <script>
		                        function goList(dno){
		                        	var frmId = "#listDept_frm_"+dno;
		                        	console.log("frmId:" + frmId);
		                        	$(frmId).submit();
		                        }
	                        </script>
                        <%-- </c:if> --%>
                        
                        <li style="padding-left:30px;">
                        <form name="dept_add_frm">
                        	<input type ="text" name="dname" id="addDname">
                        	<input type ="hidden" value="<sec:authentication property="principal.cno" var="cno"/>${cno}" name="cno" id ="cno">
                        </form>
                        </li>
                    </ul>
                </div>
                <div class="notyet">
                    <div><a href="${pageContext.request.contextPath}/commute/organlist">미분류그룹</a></div>
                </div>
                <div class="deptEdit">
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <button id="addBtn"><img src="${pageContext.request.contextPath}/resources/img/add.png" style="width: 19px; height: 20px;"></button>
                    <button id="deleteBtn"><img src="${pageContext.request.contextPath}/resources/img/trash (1).png" style="width: 19px; height: 20px;"></button>
                </sec:authorize>
                </div>
                <div class="detail">
                    <div class="title">
                    <span id="firstttl">${dname}</span>
                    <span id="detpcount">총&nbsp;<span>${userslistCount}</span>명</span>
	                    <!-- <input type="text" id="depttitle" value="" readonly>  -->
                 </div>
                 
                    <form class="change_frm" name="change_frm">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    <div>
                        <table>
                            <tr>
                            	<th style="width : 80px;">
                            	<sec:authorize access="hasRole('ROLE_ADMIN')">
                                	선택
                                </sec:authorize>
                                </th>
                                <th style="width : 80px;">사원번호</th>
                                <th>이름</th>
                                <th>직급</th>
                                <th>이메일</th>
                            </tr>
                            
                        <%-- <c:if test="${userslistCount eq 0}">
							<tr>
								<td colspan="6" align="center">
								<br>사원이 존재하지 않습니다.<br> <br></td>
							</tr>
						</c:if>      --%>
                        <c:if test="${not empty list}">
						<c:forEach var="og" items="${list}" varStatus="status">
						
                            <tr><td>
                            <sec:authorize access="hasRole('ROLE_ADMIN')">
                                <input type="checkbox" name="chk" value="${og.uno}" class="chkbox">
                            </sec:authorize>
                            </td>
                                <td>${og.uno}</td>
                                <td>${og.uname}</td>
                                <td>${og.urank}</td>
                                <td>${og.uemail}</td>
                            </tr>
                        
                        </c:forEach>
                       	</c:if> 
                       
                            <!-- 앞 페이지 번호 처리 -->
					<tr>
						<td colspan="5">
						<c:if test="${currentPage <= 1}">
						&lt; &nbsp;
						</c:if>
						 	<c:if test="${currentPage > 1}">
								<c:url var="oglistprev" value="/commute/organlist">
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
									<font color ="#5A3673"><b>${p} &nbsp;</b></font>
								</c:if>
								<c:if test="${p ne currentPage}">
									<c:url var="oglistchk" value="/commute/organlist">
										<c:param name="page" value="${p}" />
									</c:url>
									<a href="${dflistchk}">${p}&nbsp;</a>
								</c:if>
							</c:forEach> 
							<c:if test="${currentPage >= maxPage}"> &gt;
							</c:if>
							<c:if test="${currentPage < maxPage}">
								<c:url var="oglistnext" value="/commute/organlist">
									<c:param name="page" value="${currentPage+1}" />
								</c:url>
								<a href="${dflistnext}">&gt;</a>
							</c:if>
							</td>
					</tr>
                        </table>
                    </div>
                    
                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <div class="move_wrap">
                        <select name="deptSelect" class="deptSelect">  
	                        <c:forEach var="dp" items="${selectDept}" varStatus="e">
								    <option value="${dp.dno}">${dp.dname}</option>  
							</c:forEach>
						</select>  
                        
                        <button id="moveBtn" onclick="changeDept();">다른 조직으로 이동</button>
                    </div> 
                    </sec:authorize>
                    </form>
                </div>
            </div>
    </div>
</div>
<script>
function checkOneS(a){
    console.log("###checkOneS");
    console.log("###this: " +  a);
    var obj1 = document.getElementsByClassName('dnamechk');
    console.log("###obj1.length: " +  obj1.length);
    for (var i = 0; i < obj1.length; i++) {
       console.log("###obj1[i]: " +  obj1[i]);
       if (obj1[i] != a) {
          obj1[i].checked = false;
       }
    }
 }

 
 function changeDept(){
	 var frm = document.change_frm;
		frm.action = "${pageContext.request.contextPath}/commute/organuserupdate"
		frm.method = "post"
		frm.submit();
 }
 
</script>
</body>
</html>