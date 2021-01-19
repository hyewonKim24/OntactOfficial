<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ include file="../main/header.jsp"%>
<%@ include file="./pjsidebar.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
* {
	margin: 0;
}

body {
	height: 100%;
	position: relative;
	font-size: 14px;
	font-family: Noto Sans KR;
	line-height: 1.15;
	background-color: rgb(242, 242, 242);
}

a {
	text-decoration: none;
	color: #333333;
}

/* 본문 */
.main {
	position: relative;
	width: 1200px;
	height: 100%;
	margin: 0 auto;
}

/* 프로젝트 글 */
.contents {
	position: relative;
	width: 700px;
	height: 100%;
	margin: 80px auto 0 230px;
	box-shadow: 1px 1px 3px 1px #e7e7e7;
	float: left;
}

.public {
	min-width: 100px;
	border: 1px solid #dfe0e4;
	height: 36px;
	line-height: 32px;
	font-size: 12px;
	color: #545557;
	/* text-align: center; */
	font-weight: 700;
	background-color: #fff;
	border-radius: 3px;
	box-sizing: border-box;
	font-family: Noto Sans KR;
	position: relative;
	cursor: pointer;
}

.public span {
	margin-top: 0px;
	margin-left: 3px;
	position: absolute;
}

.public img {
	width: 20px;
	/* position:absolute; */
	margin-right: 2px;
	margin-top: 5px;
	margin-left: 5px;
}

.public_admin {
	min-width: 100px;
	border: 1px solid #dfe0e4;
	height: 36px;
	line-height: 32px;
	font-size: 12px;
	color: #545557;
	/* text-align: center; */
	font-weight: 700;
	background-color: #fff;
	border-radius: 3px;
	box-sizing: border-box;
	font-family: Noto Sans KR;
	position: relative;
	cursor: pointer;
}

.public_admin span {
	margin-top: 0px;
	margin-left: 3px;
	position: absolute;
}

.public_admin img {
	width: 20px;
	/* position:absolute; */
	margin-right: 2px;
	margin-top: 5px;
	margin-left: 5px;
}

.public_setting {
	position: absolute;
	top: 50px;
	right: -1px;
	z-index: 1000;
	width: 230px;
	text-align: left;
	border: 1px solid rgba(34, 35, 37, .2);
	border-radius: 2px;
	background: #fff;
	box-shadow: 1px -1px 4px 0 rgba(0, 0, 0, .15);
}

.public_setting_title {
	height: 29px;
	line-height: 27px;
	text-indent: 12px;
	font-size: 12px;
	color: #828385;
	font-weight: 400;
	border-bottom: 1px solid #dfe0e4;
}

.set_li {
	position: relative;
}

.set_li:hover {
	background-color: #f6f7f8;
}

.set_li_admin {
	position: relative;
}

.set_li_admin:hover {
	background-color: #f6f7f8;
}

.setimg {
	width: 23px;
	top: 14px;
	left: 7px;
	position: absolute;
}

.p_set_con strong {
	display: block;
	font-size: 12px;
	color: #545557;
}

.p_set_con {
	display: block;
	padding: 10px 0 0 40px;
	height: 55px;
	font-size: 11px;
	color: #828385;
	box-sizing: border-box;
	background-repeat: no-repeat;
	background-position: 11px 14px;
	cursor: pointer;
}

.writebtn {
	width: 80px;
	height: 36px;
	background-color: #5A3673;
	border-radius: 3px;
	color: #e7e7e7;
	border: none;
	font-family: Noto Sans KR;
	font-weight: 700;
	vertical-align: middle;
	margin-left: 5px;
	font-size: 14px;
}

.tabs:checked+.tabslabel svg {
	width: 20px;
	height: 20px;
	margin: -5px 10px -5px -5px;
	stroke-width: 6%;
	stroke: #F27781;
}

/*input 클릭시, label 스타일*/
.tabs:checked+.tabslabel {
	color: #F27781;
}

        #tab1:checked~#commonboard,
        #tab2:checked~#task,
        #tab3:checked~#schedule,
	#tab4:checked ~#todo {
	display: block;
}

/* 글 작성 부분 */
.boardHeader {
	height: 60px;
	padding: 25px 12px 0 25px;
}

.writeInfo {
	width: 200px;
	height: 40px;
	float: left;
}

.profileImg {
	width: 40px;
	float: left;
	margin-right: 25px;
}

.writer {
	height: 18px;
	font-size: 14px;
	font-weight: 700;
	padding-top: 5px;
}

.writeDate {
	font-size: 12px;
	font-weight: 400;
	padding-top: 5px;
	color: #c0c0c0;
}

.option {
	width: 60px;
	height: 40px;
	padding-top: 7px;
	margin: 0;
	float: right;
}

.fixNotice {
	width: 18px;
	margin-top: 3px;
	margin-right: 20px;
	float: left;
}

.editoption {
	width: 5px;
	height: 20px;
	margin-top: 3px;
}

.editDropdown {
	display: none;
	width: 145px;
	height: 65px;
	border: 1px solid #e7e7e7;
	box-sizing: border-box;
	font-size: 12px;
	float: right;
	margin-top: 6px;
}

.editDropdown ul {
	padding: 8px 0;
}

.editDropdown ul li {
	padding: 6px 15px;
}

.boardResult {
	width: 650px;
	padding: 7px 25px;
}

.replyCount {
	width: 650px;
	height: 25px;
	margin-top: 30px;
	font-size: 12px;
	color: #c0c0c0;
	text-align: right;
}

.threeBtn {
	width: 650px;
	height: 40px;
	line-height: 40px;
	padding: 0 25px;
	border-top: 1px solid #e7e7e7;
}

.threeBtn ul li {
	float: left;
}

.threeBtn ul li a {
	vertical-align: middle;
	padding-right: 30px;
	font-size: 12px;
	font-weight: 700;
	color: #787878;
}

        
/* 댓글 작성 부분 */
.reply {
	width: 700px;
	padding: 10px 0;
	border-top: 1px solid #e7e7e7;
}

.replyMore {
	background-color: white;
	border: none;
	font-size: 14px;
	color: #5A3673;
	padding: 10px 15px 20px 15px;
}

.defaultReply {
	width: 670px;
	margin: 0 15px;
	padding-bottom: 10px;
}

.replayPfImg {
	width: 34px;
	margin-right: 20px;
	float: left;
}

.replayPfImg2 {
	width: 34px;
	margin-right: 20px;
	float: left;
}

.replyTitle {
	height: 13px;
	font-size: 13px;
	font-weight: 700;
	padding-right: 10px;
}

.replyDate {
	font-size: 13px;
	color: #c0c0c0;
}

.replyEdit {
	float: right;
}

.replyEdit a {
	color: #c0c0c0;
	font-size: 12px;
}

#replyResult {
	width: 643px;
	margin-top: 5px;
}

.replyFrom {
	margin: 10px 0 10px 15px;
}

.replyFrom input {
	width: 550px;
	height: 30px;
	margin: 5px 5px 5px 0;
	box-sizing: border-box;
	vertical-align: middle;
	border: 1px solid #c0c0c0;
}

#replyReg {
	width: 60px;
	height: 30px;
	background-color: #5A3673;
	border-radius: 3px;
	color: #e7e7e7;
	border: none;
	font-family: Noto Sans KR;
}

/* 윤진 : 우측 바 */
.rightBar {
    position: fixed;
    width: 250px;
    height: 100%;
    margin: 80px 0 0 950px;
}

/* 윤진 : 이전화면 버튼 div*/
.rightBar #prevbtn {
    width: 250px;
    height: 60px;
    font-size: 14px;
    display: block;
    margin-bottom: 8px;
    line-height: 60px;
    color: #333333;
    font-weight: 700;
    border-top: 1px solid #fff;
    border-left: 1px solid #ececec;
    border-right: 1px solid #ececec;
    border-bottom: 1px solid #e0e0e0;
    border-radius: 3px;
    background-color: #fff;
    box-sizing: border-box;
}
.rightBar #addmembtn{
    width: 250px;
    height: 60px;
    font-size: 14px;
    display: block;
    margin-bottom: 8px;
    line-height: 60px;
    color: #ffffff;
    font-weight: 700;
    padding-left: 90px;
    border-top: 1px solid #fff;
    border-left: 1px solid #ececec;
    border-right: 1px solid #ececec;
    border-bottom: 1px solid #e0e0e0;
    border-radius: 3px;
    background-color: #f27781;
    box-sizing: border-box;
}
.rightBar #addmembtn img{ 
    width: 23px;
    height: 23px;
    cursor: pointer;
    margin:0 10px;
    transform: translateY(5px);
    box-sizing: border-box;
}
.rightBar #prevbtn>.prevsvg {
    padding: 18px 0 0 30px;
    float: left;
    fill: #111111;
}

.rightBar>#rightbtns {
    clear: both;
    width: 250px;
    height: 70px;
    margin-bottom: 8px;
    border-left: 1px solid #ececec;
    border-right: 1px solid #ececec;
    border-bottom: 1px solid #e0e0e0;
    border-radius: 3px;
    background-color: #fff;
    text-align: center;
    color: #505050;
    font-weight: 500;
}

.rightBar>#rightbtns .rightbtn {
    float: left;
    width: 25%;
    padding: 15px 0;
}

/*윤진 :우측 파일함,업무,일정,할일 아이콘 색,크기 통일*/
.rightsvg {
    width: 23px;
    fill: #444444;
}

/*윤진 : 채팅 div*/
#pjchat {
    width: 250px;
    height: 300px;
    background-color: #fff;
}

#pjchat>#pjmembox {
    height: 90%;
    overflow: hidden;
    padding: 10px 0;
}

/* 윤진 : scrollbar*/
/* 윤진 : width */
::-webkit-scrollbar {
    width: 5px;
}

/* Track */
::-webkit-scrollbar-track {
    background: #e7e7e7;
}

/* Handle */
::-webkit-scrollbar-thumb {
    background: #a2a2a2;
    border-radius: 10px;
}

/* Handle on hover */
::-webkit-scrollbar-thumb:hover {
    background: #505050;
}

/* 윤진 :전체참여자*/
.allpj_title {
    position: relative;
    padding-top: 6px;
    margin: 0 15px 10px 15px;
    height: 20px;
    font-size: 12px;
    color: #343538;
    font-weight: 700;
}

/*윤진 :전체보기 버튼*/
.allpjmem {
    display: block;
    position: absolute;
    top: 5px;
    right: 0;
    font-size: 12px;
    color: #676869;
    font-weight: 400;
}

/* 윤진 :타이틀 : 관리자,내부참여자 */
.part-title {
    font-size: 12px;
    position: relative;
    padding-top: 8px;
    padding-bottom: 8px;
    min-height: 12px;
    margin: 0 15px;
    border-top: 1px solid #e9eaed;
}

/* 윤진 :타이틀 : 프로젝트 멤버 리스트 */
#pjmemlist {
    height: 80%;
    overflow-x: hidden;
}

#pjchat>#pjmembox>#pjmemlist>ul>li {
    position: relative;
    width: 250px;
    height: 50px;
    padding: 8px 20px 8px 20px;
    box-sizing: border-box;
}

/* 윤진 :프로필사진*/
.userimg {
    z-index: 20;
    position: relative;
    top: 0;
    left: 0;
    width: 32px;
    height: 32px;
    content: "";
    display: block;
    border-radius: 32px;
    float: left;
    box-shadow: inset 0 0 0 1px rgba(0, 0, 0, .05);
}

/* 윤진 :프로젝트 멤버 이름*/
.pjusername {
    display: inline-block;
    width: 160px;
    text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden;
    margin: 0px 0 0 10px;
    color: #969696;
    vertical-align: middle;
    margin-top: 7px;
}

/* 윤진 :우측 사이드 채팅 아이콘*/
.chatsvg {
    position: absolute;
    top: 11px;
    right: 20px;
    width: 25px;
}

#chatbtn-fill {
    width: 18px;
    margin-top: 10px;
    transform: translateY(3px);
}

/* 윤진 :우측 하단 채팅 버튼*/
#pjchatbox {
    width: 250px;
    height: 45px;
    position: relative;
    line-height: 40px;
    font-weight: 700;
    font-size: 14px;
    color: #333;
    text-align: center;
    border-top: 1px solid #d7d7d7;
    border-bottom: 1px solid #d7d7d7;
    border-radius: 0 0 0px 0px;
    background-color: #fff;
}

#pjchatbox>.pjchatboxsvg {
    position: absolute;
    top: 11px;
    right: 20px;
    width: 25px;
}
/* 윤진 :할일 리스트*/
.todo-cont {
    width: 95%;
    position: relative;
    padding: 15px 0 15px 0;
    border: 1px solid #e5e6e9;
    background-color: #fbfbfb;
    margin: 0 auto;
}
.todo-title{
    width: 90%;
    padding: 30px 35px 0 30px;
    margin-left: 15px;
}
.todo-list-per{
    margin-right: 45px;
    color: #505050;
}
.todo-list-ing{
    color: #505050;
}
.todo-list-title{
    display: inline-block;
    width: 65%;
    font-size: 16px;
    font-weight: 700;
    color: #333;
    line-height: 18px;
    text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden;
}
.todo-cont-list{
    padding: 30px;
}
.todo-cont-list li{
    height: 40px;
    clear: both;
}
/* 윤진 :체크박스 설정*/
/*unchecked */
.todo-cont-list input[type="checkbox"] {
    display: none;
    width:10%;
}

.todo-cont-list input[type="checkbox"]+label{
    display: inline-block;
    width: 20px; 
    height: 20px;
    margin: 10px 10px 10px 25px;
    vertical-align: middle;
    background: url(${pageContext.request.contextPath}/resources/img/checked-2-01.png) left top no-repeat;
    cursor: pointer;
    background-size: cover;
    float: left;
}
/*checked */
.todo-cont-list input[type="checkbox"]:checked+label {
    background: url(${pageContext.request.contextPath}/resources/img/checked-2-02.png) top no-repeat;
    background-size: cover;
}
/* 윤진 :할일 내용*/
.todo-06{
    padding-left: 20px;
    width: 71%;
    height: 25px;
    min-height: 0px;
    line-height: 25px;
    font-size: 14px;
    border: none;
    margin: 10px 0;
    box-sizing: border-box;
    float:left;
}
/*할일 마감일*/
.todo-07{
   float: left;
   margin: 0 10px;
   line-height: 44px;
   font-weight: 700;
   background-color: tran;
}

.tddate{
	border: none;
	width: 45px;
	text-align: center;
}
/*할일 담당자 */
.todo-08{
    width: 25px;
    margin-top:10px;
}

</style>
</head>
<body>
    <input type="hidden" value="${chatno}" id="chatno" name="chatno">
	<sec:authentication property="principal.username" var="username"/>
	<sec:authentication property="principal.uno" var="uno"/>
	<sec:authentication property="principal.uname" var="uname"/>
    	<input type="hidden" value="${uno}" id="uno" name="uno">
    	<input type="hidden" value="${uname}" id="uname" name="uname">
    	<input type="hidden" value="${pno}" id="pno" name="pno">
	<div class="main">
		<div class="contents">
			<!--할일 글 뿌리기-->
			<c:if test="${not empty todoList}">
				<c:forEach items="${todoList}" var="todoList" >
					<c:if test="${todoList.btype eq 4}">
		                <div class="one">
                            <div class="boardHeader">
                                <div class="writeInfo">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/user-3.png" class="profileImg"></span>
                                    <div class="writer">${todoList.uname }</div>
                                    <div class="writeDate">${todoList.bdate }</div>
                                    <img src="">
                                </div>
                                <div class="option">
                                    <div>
                                        <a href=""><img src="${pageContext.request.contextPath}/resources/img/push-pin.png" class="fixNotice"></a>
                                    </div>
                                    <div>
                                        <a href="" id="dropdown"><img src="${pageContext.request.contextPath}/resources/img/more-1.png" class="editoption"></a>
                                    </div>
                                    <div class="editDropdown">
                                        <ul>
                                            <li><a href="">글 삭제</a></li>
                                            <li><a href="">다른 프로젝트에 올리기</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
				
                            <div class="boardResult">
                                <div class="todo-cont">
                                    <div class="todo-title">
                                        <div class="todo-list-title">${todoList.bname }</div>
                                        <span class="todo-list-per">33%</span>
                                        <span class="todo-list-ing">완료 1 / 전체 3</span>
                                    </div>
                                    <ul class="todo-cont-list">
                                    <c:forEach items="${todoList.todoViewDto }" var="todo" varStatus="e">
                                        <li>
                                            <input type="checkbox" class="todo-05" id="todocheck-${todo.tdno}" name="tdcheck" value="${todo.tdcheck}"><label for="todocheck-${todo.tdno}"></label>
                                    		<input type="hidden" class="tdno" name="tdno" value="${todo.tdno}">
                                            <c:if test="${todo.tdcheck eq 0}">
                                                <script>
                                                    $(function(){
                                                        $("#todocheck-${todo.tdno}").prop("checked", false);
                                                    });
                                                </script>
                                            </c:if>
                                            <c:if test="${todo.tdcheck eq 1}">
                                                <script>
                                                    $(function(){
                                                    	$("#todocheck-${todo.tdno}").prop("checked", true);
                                                    });
                                                </script>	
                                            </c:if>
                                            <script>
                                            // 할일 체크 상태 변경
                                            $(function(){
                                            	$("#todocheck-${todo.tdno}").click(function(){
                                            	var tdno = $(this).parent().children('.tdno').val();
                                            	var pno = $("#pno").val();
                                            	console.log(tdno);
                                            	console.log(pno);
                                                if($(this).is(":checked")==true){
                                                        $.ajax({
                                                            url: "${pageContext.request.contextPath}/project/tdchecktrue",
                                                            data: {
                                                                "tdno" : tdno,
                                                                "pno" : pno
                                                            },
                                                            dataType: "json",
                                                            success:function(data){
                                                                console.log("ajax_todoCheck:"+data+"chk 성공");
                                                            },
                                                            error:function(){
                                                                console.log("ajax_todoCheck: update chk 실패");
                                                            }
                                                        });
                                                }; 
                                                if($(this).is(":checked")==false){
                                                    $.ajax({
                                                        url: "${pageContext.request.contextPath}/project/tdcheckfalse",
                                                        data: {
                                                        	"tdno" : tdno,
                                                            "pno" : pno
                                                        },
                                                        dataType: "json",
                                                        success:function(data){
                                                            console.log("ajax_todoCheck:"+data+"unchk 성공");
                                                        },
                                                        error:function(){
                                                            console.log("ajax_todoCheck: update unchk 실패");
                                                        }
                                                    });
                                                };
                                            });
                                            });
                                            </script>
                                            <div class="todo-06" >${todo.tdcontent}</div>
                                           	<div class="todo-07">
                                            	<input type="text" class="tddate" id="tddate-${todo.tdno}" name="tddate" value="${todo.tddate}" >
                                            </div>
                                            <script>
                                            // 할일 체크 상태 변경
                                            $(function(){
                                            	$("#tddate-${todo.tdno}").click(function(){
                                            		var tdno = ${todo.tdno};
                                            		var tddate = ${todo.tddate};
                                            		$(this).datepicker({
                        				    	        dateFormat: 'mm/dd' //Input Display Format 변경
                        				    	        ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                        				    	        ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
                        				    	        ,changeYear: true //콤보박스에서 년 선택 가능
                        				    	        ,changeMonth: true //콤보박스에서 월 선택 가능                
                        				    	        //,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
                        				    	        //,buttonImage: '${pageContext.request.contextPath}/resources/img/calendar-8.png' //버튼 이미지 경로
                        				    	        //,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
                        				    	        //,buttonText: "마감일" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
                        				    	        ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
                        				    	        ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
                        				    	        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
                        				    	        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
                        				    	        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
                        				    	        ,minDate: "-48M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                        				    	        ,maxDate: "+12M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
                        				    	        ,onSelect: function(date){
                        				    	        	console.log("date : "+date);
                        				    	        	console.log($(this));
                        				    	        	$(this).val(date);
                        				    	        	console.log($(this).val()); 
                        				    	        	
                        				    	        	console.log("Selected date: " + dateText + "; input's current value: " + this.value);
                                        	    	        var pno=${pno};
                                                        	var bno=${tlist.bno};
                                                        	var tstart =dateText;
                                                        	console.log(tstart+"값");
                                                        		$.ajax({
                                            						url: "${pageContext.request.contextPath}/project/tddateupdate",
                                            						data: {
                                            							"tdno" : bno,
                                            							"tddate" : pno
                                            						},
                                            						dataType: "json",
                                            						success:function(data){
                                            							console.log("ajax:"+data+"성공");
                                            						},
                                            						error:function(){
                                            							console.log("update 실패");
                                            						}
                                                        	});
                                        	    	        $(this).change();
                        				    	        }
                        				    	    });
                                            	});
                                           	});
                                            </script>
                                            <img src="${pageContext.request.contextPath}/resources/img/user-3.png" width="20px" class="todo-08">
                                        </li>
                                    </c:forEach>	
                                    </ul>
                                </div>
                                <div class="replyCount">댓글 10개</div>
                            </div>

                            <div class="threeBtn">
                                <ul>
                                    <li>
                                        <a href=""><img src="${pageContext.request.contextPath}/resources/img/like.png" class="like"
                                                style="width: 19px; padding-right: 10px;  padding-bottom : 5px; vertical-align: middle;">좋아요</a>
                                    </li>
                                    <li>
                                        <a href=""><img src="${pageContext.request.contextPath}/resources/img/chat-03.png" class="replyReg"
                                                style="width: 17px; padding-right: 10px;vertical-align: middle;">댓글작성</a>
                                    </li>
                                    <li>
                                        <a href=""><img src="${pageContext.request.contextPath}/resources/img/bookmark.png" class="save"
                                                style="width: 13px; padding-right: 10px; vertical-align: middle;">담아두기</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
            </c:if>
            
            
            
            <!--댓글 -->
            <div class="reply">
                <button class="replyMore">이전 댓글 더보기</button>
                <div class="defaultReply">
                    <span>
                        <img src="${pageContext.request.contextPath}/resources/img/user-3.png" class="replayPfImg">
                    </span>
                    <span class="replyTitle">이혜림</span>
                    <span class="replyDate">202012-18-17:34</span>
                    <span class="replyEdit">
                        <a href="">수정 &nbsp;&nbsp;&nbsp;| </a>
                        <a href=""> &nbsp;&nbsp;&nbsp; 삭제</a>
                    </span>
                    <div id="replyResult">댓글 작성 내용입니다 댓글 작성 내용입니다 댓글 작성 내용입니다</div>
                </div>

                <div class="defaultReply">
                    <span>
                        <img src="${pageContext.request.contextPath}/resources/img/user-3.png" class="replayPfImg">
                    </span>
                    <span class="replyTitle">이혜림</span>
                    <span class="replyDate">202012-18-17:34</span>
                    <span class="replyEdit">
                        <a href="">수정 &nbsp;&nbsp;&nbsp;| </a>
                        <a href=""> &nbsp;&nbsp;&nbsp; 삭제</a>
                    </span>
                    <div id="replyResult">댓글 작성 내용입니다 댓글 작성 내용입니다 댓글 작성 내용입니다</div>
                </div>
                <div class="replyFrom">
                    <span>
                        <img src="${pageContext.request.contextPath}/resources/img/user-2.png" class="replayPfImg2">
                    </span>
                    <input type="text" name="reply" id="replyarea" placeholder="댓글을 입력하세요.">
                    <button id="replyReg">등록</button>
                </div>
            </div>
      	</div>
		<!--우측 사이드바-->
		<div class="rightBar">
			<a href="#">
				<div id="prevbtn">
					<svg version="1.1" class="prevsvg rightsvg"
						xmlns="http://www.w3.org/2000/svg"
						xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
						viewBox="0 0 60 60" style="enable-background: new 0 0 60 60;"
						xml:space="preserve">
                       <path
							d="M2.414,30l13.293-13.293c0.391-0.391,0.391-1.023,0-1.414s-1.023-0.391-1.414,0l-14,14c-0.391,0.391-0.391,1.023,0,1.414
                  l14,14C14.488,44.902,14.744,45,15,45s0.512-0.098,0.707-0.293c0.391-0.391,0.391-1.023,0-1.414L2.414,30z" />
                   </svg>
					이전화면

				</div>
			</a>
			<div id="rightbtns">
				<a href="#">
					<div class="rightbtn btnhover">
						<div>
							<svg version="1.1" class="fileboxsvg rightsvg"
								xmlns="http://www.w3.org/2000/svg"
								xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
								viewBox="0 0 60 60" style="enable-background: new 0 0 60 60;"
								xml:space="preserve">
                           <g>
                               <path d="M60,8.311c0-0.199-0.052-0.382-0.131-0.551c-0.027-0.209-0.112-0.412-0.254-0.579L53.46,0H6.54L0.384,7.182
                          C0.242,7.348,0.157,7.55,0.131,7.76C0.052,7.929,0,8.112,0,8.311V19h3v41h54V19h3V8.311z M7.46,2h45.08l4.286,5H3.174L7.46,2z
                           M55,58H5V19h50V58z M58,17h-1H3H2V9h56V17z" />
                               <path d="M42,23H18v10h24V23z M40,31H20v-6h20V31z" />
                               <path d="M45,38H15v14h30V38z M43,50H17V40h26V50z" />
                               <path d="M22,48h5c0.552,0,1-0.447,1-1s-0.448-1-1-1h-5c-0.552,0-1,0.447-1,1S21.448,48,22,48z" />
                               <path d="M27,44h11c0.552,0,1-0.447,1-1s-0.448-1-1-1H27c-0.552,0-1,0.447-1,1S26.448,44,27,44z" />
                               <path d="M22,44c0.26,0,0.52-0.11,0.71-0.29C22.89,43.52,23,43.26,23,43c0-0.261-0.11-0.521-0.29-0.71c-0.38-0.37-1.04-0.37-1.42,0
                          C21.11,42.479,21,42.739,21,43c0,0.27,0.11,0.52,0.29,0.71C21.48,43.89,21.73,44,22,44z" />
                               <path d="M31.29,46.29C31.11,46.479,31,46.739,31,47c0,0.26,0.11,0.52,0.29,0.71C31.48,47.89,31.74,48,32,48
                          c0.26,0,0.52-0.11,0.71-0.29C32.89,47.52,33,47.26,33,47c0-0.261-0.11-0.521-0.29-0.71C32.34,45.92,31.66,45.92,31.29,46.29z" />
                               <path d="M38,46h-1c-0.552,0-1,0.447-1,1s0.448,1,1,1h1c0.552,0,1-0.447,1-1S38.552,46,38,46z" />
                           </g>
                       </svg>
						</div>
						<div>파일함</div>
					</div>
				</a> <a href="#">
					<div class="rightbtn btnhover">
						<div>
							<svg version="1.1" class="checkedsvg rightsvg"
								xmlns="http://www.w3.org/2000/svg"
								xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
								viewBox="0 0 59 59" style="enable-background: new 0 0 59 59;"
								xml:space="preserve">
                           <g>
                               <path
									d="M52,21c-0.553,0-1,0.447-1,1v32H2V5h49v1c0,0.553,0.447,1,1,1s1-0.447,1-1V3H0v53h53V22C53,21.447,52.553,21,52,21z" />
                               <path
									d="M58.707,7.293c-0.391-0.391-1.023-0.391-1.414,0L27,37.586l-13.07-13.07c-0.391-0.391-1.023-0.391-1.414,0
                          s-0.391,1.023,0,1.414l13.777,13.777C26.488,39.902,26.744,40,27,40s0.512-0.098,0.707-0.293l31-31
                          C59.098,8.316,59.098,7.684,58.707,7.293z" />
                           </g>
                       </svg>
						</div>
						<div>업무</div>
					</div>
				</a> <a href="#">
					<div class="rightbtn btnhover">
						<div>
							<svg version="1.1" class="schedulesvg rightsvg"
								xmlns="http://www.w3.org/2000/svg"
								xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
								viewBox="0 0 60 60" style="enable-background: new 0 0 60 60;"
								xml:space="preserve">
                           <g>
                               <path
									d="M57,4h-7V1c0-0.553-0.447-1-1-1h-7c-0.553,0-1,0.447-1,1v3H19V1c0-0.553-0.447-1-1-1h-7c-0.553,0-1,0.447-1,1v3H3
                           C2.447,4,2,4.447,2,5v11v43c0,0.553,0.447,1,1,1h54c0.553,0,1-0.447,1-1V16V5C58,4.447,57.553,4,57,4z M43,2h5v3v3h-5V5V2z M12,2h5
                           v3v3h-5V5V2z M4,6h6v3c0,0.553,0.447,1,1,1h7c0.553,0,1-0.447,1-1V6h22v3c0,0.553,0.447,1,1,1h7c0.553,0,1-0.447,1-1V6h6v9H4V6z
                           M4,58V17h52v41H4z" />
                               <path
									d="M38,23h-7h-2h-7h-2h-9v9v2v7v2v9h9h2h7h2h7h2h9v-9v-2v-7v-2v-9h-9H38z M31,25h7v7h-7V25z M38,41h-7v-7h7V41z M22,34h7v7h-7
                           V34z M22,25h7v7h-7V25z M13,25h7v7h-7V25z M13,34h7v7h-7V34z M20,50h-7v-7h7V50z M29,50h-7v-7h7V50z M38,50h-7v-7h7V50z M47,50h-7
                           v-7h7V50z M47,41h-7v-7h7V41z M47,25v7h-7v-7H47z" />
                           </g>
                       </svg>
						</div>
						<div>일정</div>
					</div>
				</a> <a href="#">
					<div class="rightbtn btnhover">
						<div>
							<svg version="1.1" class="todosvg rightsvg"
								xmlns="http://www.w3.org/2000/svg"
								xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
								viewBox="0 0 58 58" style="enable-background: new 0 0 58 58;"
								xml:space="preserve">
                           <g>
                               <rect x="9" y="12" width="40" height="2" />
                               <rect x="9" y="28" width="40" height="2" />
                               <rect x="9" y="44" width="40" height="2" />
                               <path
									d="M0,0v58h58V0H0z M56,56H2V2h54V56z" />
                           </g>
                       </svg>
						</div>
						<div>할일</div>
					</div>
				</a>
			</div>
		    <div id="addmembtn">
               	초대하기
               	<img src="${pageContext.request.contextPath}/resources/img/addperson-03-white.png" class="todoicon">
           	</div>
			<div id="pjchat">
				<div id="pjmembox">
                    <div class="allpj_title">
                        전체참여자
                        <span>5명</span>
                        <a href="#" class="allpjmem">전체보기</a>
                    </div>
                    <div class="part-title">관리자&nbsp;(1)</div>
                    <div id="pjmemlist">
                        <ul>
                            <li class="btnhover">
                                <img src="${pageContext.request.contextPath}/resources/img/user-3.png" class="userimg" width="32px">
                                <span class="pjusername">김혜원</span>
                                <a href="#"><img src="${pageContext.request.contextPath}/resources/img/chat-04.png" class="chatsvg"></a>
                            </li>
                        </ul>
                        <div class="part-title">내부참여자&nbsp;(4)</div>
                        <ul>
                            <li class="btnhover">
                                <img src="${pageContext.request.contextPath}/resources/img/user-3.png" class="userimg" width="32px">
                                <span class="pjusername">이윤진</span>
                                <a href="#"><img src="${pageContext.request.contextPath}/resources/img/chat-04.png" class="chatsvg"></a>
                            </li>
                        </ul>
                        <ul>
                            <li class="btnhover">
                                <img src="${pageContext.request.contextPath}/resources/img/user-3.png" class="userimg" width="32px">
                                <span class="pjusername">이혜림</span>
                                <a href="#"><img src="${pageContext.request.contextPath}/resources/img/chat-04.png" class="chatsvg"></a>
                            </li>
                            <li class="btnhover">
                                <img src="${pageContext.request.contextPath}/resources/img/user-3.png" class="userimg" width="32px">
                                <span class="pjusername">오은실</span>
                                <a href="#"><img src="${pageContext.request.contextPath}/resources/img/chat-04.png" class="chatsvg"></a>
                            </li>
                            <li class="btnhover">
                                <img src="${pageContext.request.contextPath}/resources/img/user-3.png" class="userimg" width="32px">
                                <span class="pjusername">김봉영</span>
                                <a href="#"><img src="${pageContext.request.contextPath}/resources/img/chat-04.png" class="chatsvg"></a>
                            </li>
                        </ul>
                    </div>
				</div>
                <a href="${pageContext.request.contextPath}/chat/projectchat?pno=${pno}" onClick="window.open(this.href,'', 'width=470, height=650'); return false;">
                    <div id="pjchatbox">
                       		 채팅 &nbsp;<img src="${pageContext.request.contextPath}/resources/img/chat-04-fill.png" id="chatbtn-fill">
                    </div>
                </a>
            </div>
        </div>
	</div>
    </div>
    <script>
     	  //게시글 작성 공개여부 설정
        $(".textfooter_side").on("click", function (e) {
            e.preventDefault();
            $(".public_setting").toggle();

            // if($('#pub_dropdown').data('clicked',true)){
            //     $("#pub").show();
            //     $("#admin").hide();
            // } else if($('#admin_dropdown').data('clicked',true)){
            //     $("#pub").show();
            //     $("#admin").hide();
            // }
            $('.set_li').on('click', function () {
                $(".public").show();
                $(".public_admin").hide();
                $("#taskopen").val("0");
            });
            $('.set_li_admin').on('click', function () {
                $(".public").hide();
                $(".public_admin").show();
                $("#taskopen").val("1");
            });
        })
        //게시글 작성 상자 늘어나기
        $('.wrap').on('keyup', 'textarea', function (e) {
            $(this).css('height', 'auto');
            $(this).height(this.scrollHeight);
        });
        $('.wrap').find('textarea').keyup();



        //작성된 글 더보기 메뉴 (혜림)
        $(".option #dropdown").on("click", function (e) {
            e.preventDefault();
           	var $t = $(this).parents(".option");
            $t.find(".editDropdown").toggle();
        });

        //스크롤 숨겼다가 hover하면 나타남
        $("#pjmemlist").mouseover(function () {
            $(this).css("overflow-y", "scroll");
        });
        $("#pjmemlist").mouseout(function () {
            $(this).css("overflow-y", "hidden");
        });

        //우측 버튼 hover시 background-color 변경
        $(".btnhover").hover(function () {
            $(this).css('background-color', '#e7e7e7');
        }, function () {
            $(this).css('background-color', '#ffffff');
        });
        //우측 이전화면 버튼 hover
        $("#prevbtn").hover(function () {
            $(this).css('border', '1px solid #23d9d9');
            $(this).css('color', '#23d9d9');
            $(".prevsvg").css('fill', '#23d9d9');
        }, function () {
            $(this).css('border', 'none');
            $(this).css('color', '#333333');
            $(".prevsvg").css('fill', '#111111');
        });
        
      	//윤진: 할일 내용-체크되면 li전체 완료선 추가-삭제
      	$(function(){
	        $("input[id='todocheck-${todo.tdno}']:checkbox").click(function () {
	            if ($(this).is(":checked")) {
	                $(this).nextAll(".todo-06").css("color", "gray");
	                $(this).nextAll(".todo-06").css("font-style", "italic");
	                $(this).nextAll(".todo-06").css("text-decoration", "line-through");
	            } else {
	                $(this).nextAll(".todo-06").css("color", "#111111");
	                $(this).nextAll(".todo-06").css("font-style", "normal");
	                $(this).nextAll(".todo-06").css("text-decoration", "none");
	            }
	        });
        });
    </script>
</body>
</html>