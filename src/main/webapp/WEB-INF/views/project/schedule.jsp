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
<script src='${pageContext.request.contextPath}/resources/packages/core/main.js'></script>
<script src='${pageContext.request.contextPath}/resources/packages/interaction/main.js'></script>
<script src='${pageContext.request.contextPath}/resources/packages/timegrid/main.min.js'></script>
<script src='${pageContext.request.contextPath}/resources/packages/daygrid/main.js'></script>
<link href='${pageContext.request.contextPath}/resources/packages/core/main.css' rel='stylesheet' />
<link href='${pageContext.request.contextPath}/resources/packages/daygrid/main.css' rel='stylesheet' />
<script src='${pageContext.request.contextPath}/resources/js/moment.js'></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
<link href='${pageContext.request.contextPath}/resources/packages/timegrid/main.min.css' rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css">

<style>
* {
   margin: 0;
}

body {
   width: 100%;
   height: 100%;
   position: relative;
   font-size: 14px;
   font-family: Noto Sans KR;
   line-height: 1.15;
   color: #111111;
    background-color: rgb(242, 242, 242);
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
.main {
   position: relative;
   width: 1200px;
   height: 100%;
   margin: 0 auto;
   margin-top : 15px;
}
/* 사이드 체크박스 */
.sidenav {
   position: relative;
   width: 210px;
   height: 100%;
   float: left;
}
.sidenav ul, .sidenav ul li a {
   display: block;
   color: #111111;
}
.sidenav .ttl {
   display: block;
    height: 45px;
   font-size: 14px;
    line-height: 45px;
    color: #787878;
}
.sidenav .menu {
   display: block;
    height: 40px;
   	font-size: 14px;
    line-height:40px;
}
.sidenav ul li input{
    margin-right: 8px;
    vertical-align: middle;
}
.sidenav input[type="checkbox"]{
    width : 18px; 
    height: 18px; 
    overflow:hidden; 
    border:0;
    background-color:black;
}
/* 콘텐츠 */
.contents {
	position: absolute;
	width: 970px;
	height: 860px;
	left: 210px;
	box-sizing: border-box;
}
.conTitle {
	width: 850px;
	height: 45px;
	line-height: 45px;
	font-size: 18px;
	text-align: left;
    float: left;
    verticle-align : middle;
}
#calendar {
	position : absolute;
	width: 908px;
	padding: 30px;
	margin-top:50px;
	background-color : white;
}

/* 출근, 퇴근, qr 스캐너 모달 */
#gomodal {
   display: none;
   position: absolute;
   width: 100%;
   height: 0px;
   float: left;
   z-index: 9999;
  	
   
}
.modal_content {
   position: absolute;
   width: 330px;
   min-height: 170px;
   max-height: 250px;
   padding: 20px 30px;
   margin: 180px 315px;
   background: #fefefe;
   z-index: 9999; 
   border-radius : 5px;
  border : 1px solid #dbdbdb;
  box-shadow: inset 0 0 0 1px rgba(0, 0, 0, .05);
   
   
}
.close {
   width: 60px;
   height: 30px;
   
   color: #F2F2F2;
   border: none;
   border-radius: 3px;
   float:right;
   margin-top : 7px;
   

}
/* .modal_layer {
   position: fixed;
   top: 0;
   left: 0;
   width: 100%;
   height: 100%;
   background: rgba(0, 0, 0, 0.5);
} */


.fc-license-message {
   display: none;
}
.fc-event {
   cursor: pointer;
}
.fc-button-group{
	
	
}
.fc-button-primary{
	background-color: #432d73;
	border-color : #787878;
	
}

.fc-button-primary:hover{
	background-color: #432d73;
	border-color : #787878;
	
}

.fc-button-primary:not(:disabled):active, 
.fc-button-primary:not(:disabled).fc-button-active{
	background-color: #432d73;
	border-color : #787878;
}
.fc-button:disabled{
	opacity : 1;
}
.fc-button-primary:disabled{
	background-color: #432d73;
	border-color : #787878;
}
.modal-close {
   width: 17px;
   height: 15px;
   background-color: #5A3673;
   color: #F2F2F2;
   border: none;
   border-radius: 3px;
   texgt-align: center;
   float : right;
}

#title{
	 font-size : 22px;
	 padding : 5px 0 ;
}
#pname{
	font-size : 12px;
	padding-bottom : 5px;
}
#people{
	font-size : 12px;
	padding-bottom : 5px;
}
.top{
	border-bottom : 1px solid gray;
	padding-bottom : 10px;
	margin-bottom : 10px;
}
#startdate{
	font-size : 14px;
	padding-bottom : 5px;
}
#enddate{
	font-size : 14px;
	padding-bottom : 5px;
}
#attendees{
	font-size : 14px;
	padding-bottom : 5px;
}
#taskmanager{
	font-size : 14px;
	padding-bottom : 5px;
}
.menu input[type="checkbox"] {
	display: none;
	width: 10%;
}
.menu input[type="checkbox"]+label {
	display: inline-block;
	width: 20px;
	height: 20px;
	margin: 10px 10px 10px 25px;
	vertical-align: middle;
	background: url("${pageContext.request.contextPath}/resources/img/checked-2-01.png") left top no-repeat;
	cursor: pointer;
	background-size: cover;
}
.menu input[type="checkbox"]:checked+label {
	background: url("${pageContext.request.contextPath}/resources/img/checked-2-02.png") top no-repeat;
	background-size: cover;

}

.sidenav ul li:nth-child(4){
	
}
               
</style>
<script>
	document.addEventListener('DOMContentLoaded',function() {
						/* var elems = document.querySelectorAll('.modal');
						var instances = M.Modal.init(elems); */
						var calendarEl = document.getElementById('calendar');
						var calendar = new FullCalendar.Calendar(
								calendarEl,
								{
									height : 600,
									plugins : [ 'interaction', 'dayGrid' ],
									defaultView : 'dayGridMonth',
									defaultDate : new Date(),
									header : {
										left : 'prevYear,prev,next,nextYear today',
										center : 'title',
										right : 'dayGridMonth,dayGridWeek,dayGridDay'
									},
									locale : 'ko',
									eventLimit : true,
									eventLimitText : "more",
									eventLimitClick : "popover",
									editable : false,
									droppable : true,
									
									//해당 일정 클릭하면 모달 생성
									eventClick : function(info) {
										console.log(info);
										var eventObj = info.event;
										$.ajax({
											contentType : 'application/json',
											url : '${pageContext.request.contextPath}/schedule/list',
											dataType : 'json',
											success : function(result) {
												
												var events = [];
												if (result != null) {
													$.each(result, function(index, element) {
														//모달생성
												        $(".fc-event-container").click(function(){
												        	$("#gomodal").attr("style", "display:block");
												        	var btype = eventObj.id;
												        	console.log("모달 글타입" + btype);
												        	var pname = element.pname; 
												        	var uname = element.uname; 
												        	var attendees = element.attendees;
												        	var taskmanager = element.taskmanager;
												        	
															var startdate = moment(eventObj.start).format('YYYY-MM-DD');
															var enddate = moment(eventObj.end).format('YYYY-MM-DD');
															console.log("시작일" + startdate);
															
															var ttl = null;
															if(btype == 2){
																var ttl = "업무";
															} else if(btype ==3){
																var ttl = "일정";
															}
															
															$(".modal_content #title").text(ttl + " : " + eventObj.title);
															$(".modal_content #people").text("작성자 : " + uname);
															$(".modal_content #pname").text(pname);
															$(".modal_content #startdate").text("시작일 : " + startdate);
															$(".modal_content #enddate").text("종료일 : " + enddate);
															$(".modal_content #attendees").text("참석자 : " + attendees);
															$(".modal_content #taskmanager").text("담당자 : " + taskmanager);
												        });
														/* $("#successModal").modal("show"); */
														
														
														$(".modal-close").click(function(){
													        $("#gomodal").attr("style", "display:none");
													        });
														/* $(".modal_content .modalTitle").text(eventObj.start); */
														
														
														/* if (eventObj.url) { 
														 	alert('Clicked '+ eventObj.title + '.\n'
																	+ 'Will open ' + eventObj.url + ' in a new tab');
																	window.open(eventObj.url);
																	info.jsEvent.preventDefault(); // prevents browser from following link in current tab.
														} else {
															alert('Clicked ' + eventObj.title);
														} */
														}); //.each()
												}//if end   */
										}//success: function end                          
								}); //ajax end
							},
							//달력에 일정 출력
							events : function(info, successCallback,failureCallback) {
										console.log(info);
										
										$.ajax({
												contentType : 'application/json',
												url : '${pageContext.request.contextPath}/schedule/list',
												dataType : 'json',
												success : function(result) {
													
														var events = [];
														if (result != null) {
															$.each(result, function(index, element) {
																var sstart = element.sstart;
				                                                var send = element.send;
				                                                var bname = element.bname;
				                                                var btype = element.btype;
				                                                console.log("글타입 : " + btype);
				                                                var startdate = moment(sstart).format('YYYY-MM-DD');
				                                                var enddate = moment(send).format('YYYY-MM-DD'); 
																/* var reason = "${pageContext.request.contextPath}/commute/dailylist";
																	console.log("이"+ reason); */
																/* if(enddate==null){
																	enddate=element.offstart;
																} */
																var startdate = moment(startdate).format('YYYY-MM-DD');
																var enddate = moment(enddate).format('YYYY-MM-DD');
																	console.log("날짜" + startdate + "," + enddate);
																
																var ttl = null;
																var colors = null;
																if(btype == 2){
																	var ttl = "업무";
																	var colors = "#653bbf";
																} else if(btype ==3){
																	var ttl = "일정";
																	var colors = "#23d9d9";
																}
																console.log("글형태 이름" + ttl);
																
																var add = ttl + "/ " + bname;
																events.push({
																	  id : btype,
				                                                      title : add,
				                                                      start : startdate,
				                                                      end : enddate,
				                                                      color : colors	
																		/* url: "${pageContext.request.contextPath }/detail.do?seq="+element.seq,
																		   */
																}); //.push()
																console.log(event);
															}); //.each()
															console.log("each 끝");
														}//if end  
														console.log("if 끝");
														successCallback(events);
													}//success: function end                          
												}); //ajax end
									}, //events:function end
								});//new FullCalendar end
						calendar.render();
					});
</script>

</head>
<body>
	<div class="headersection">
		<div>헤더 들어갈 자리</div>
	</div>
   <div class="main">
      <div class="sidenav">
      <input type="hidden" id="pno" value="${pno}">
         <ul>
            <li class="menu" style="color : #a2a2a2; font-size : 16px">일정</li>
            <li class="menu">
            <input type="checkbox" name="chk" class="sche" value="1" onclick="checkOneS(this)" id="a" checked="checked"><label for="a"></label>
            전체 일정</li>
            <li class="menu">
            <input type="checkbox" name="chk" class="sche" value="2" onclick="checkOneS(this)" id="b"><label for="b"></label>
            내가 등록한 일정</li>
            <li class="menu" style="border-bottom : 1px solid #dbdbdb;">
            <input type="checkbox" name="chk" class="sche" value="3" onclick="checkOneS(this)" id="c"><label for="c"></label>
            초대받은 일정</li>
            
            <li class="menu" style="color : #a2a2a2; font-size : 16px">업무</li>
            <li class="menu">
            <input type="checkbox" name="chk" class="task" value="4" onclick="checkOneT(this)" id="d" checked="checked"><label for="d"></label>
            전체 업무</li>
            <li class="menu">
            <input type="checkbox" name="chk" class="task" value="5" onclick="checkOneT(this)" id="f"><label for="f"></label>
            내가 등록한 업무</li>
            <li class="menu">
            <input type="checkbox" name="chk" class="task" value="6" onclick="checkOneT(this)" id="g"><label for="g"></label>
            요청 업무</li>
         </ul>
      </div>
      <div class="contents">
         <div class="article">
            <div class="conTitle">일정 : 프로젝트 이름</div>
            <button type="button" class="close" data-dismiss="modal"
                  aria-label="Close" onclick="location.href=''">닫기</button>
            <!-- 달력 -->
            <div id='calendar'></div>
            <!-- 달력 모달 -->
            <div id="gomodal">
            <div class="modal_layer"></div>
            <div class="modal_content">
            
               <button type="button" class="modal-close" data-dismiss="modal" aria-label="Close">
                     <span aria-hidden="true">&times;</span>
                </button> 
               <div id="title"></div>
               <div class="top">
	               <div id="pname"></div>
	               <div id="people"></div>
               </div>
               
               <div id="startdate"></div>
               <div id="enddate"></div>
               <div id="attendees"></div>
               <div id="taskmanager"></div>
            </div>
         </div>   
         </div>
         
      </div>
   </div>
   <script>
   function checkOneS(a){
      console.log("###checkOneS");
      console.log("###this: " +  a);
      var obj1 = document.getElementsByClassName('sche');
      console.log("###obj1.length: " +  obj1.length);
      for (var i = 0; i < obj1.length; i++) {
         console.log("###obj1[i]: " +  obj1[i]);
         if (obj1[i] != a) {
            obj1[i].checked = false;
         }
      }
   }
   function checkOneT(a){
      console.log("checkOneT");
      console.log("this: " +  a);
      var obj2 = document.getElementsByClassName('task');
      console.log("###obj2.length: " +  obj2.length);
      for (var i = 0; i < obj2.length; i++) {
         console.log("###obj2[i]: " +  obj2[i]);
         if (obj2[i] != a) {
            obj2[i].checked = false;
         }
      }
   }
   $('.modal-close').click(function () {
       var $layer = $('.modal_conte');
       $layer.addClass('hide');
   });
      /* $('input[type='checkbox']') */
      /* $("input[name='chk']").change(function(){
         
      }) */
      
      
   
   </script>
</body>
</html>