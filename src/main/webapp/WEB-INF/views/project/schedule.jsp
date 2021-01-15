<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
}

.header {
	position: relative;
	width: 100%;
	height: 60px;
}

.header div {
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
}
/* 사이드메뉴 */
.sidenav {
	position: relative;
	width: 210px;
	height: 100%;
	float: left;
}

.sidenav ul, .sidenav ul li a {
	display: block;
	color: black;
}

.sidenav ul li {
	display: block;
	font-size: 16px;
}

.sidenav ul ul {
	display: none;
}

.sidenav>ul>li>a {
	padding: 19px 20px;
	z-index: 2;
	cursor: pointer;
	font-weight: 700;
	text-decoration: none;
}

.sidenav ul ul li {
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
.contents {
	position: absolute;
	width: 970px;
	height: 860px;
	left: 210px;
	padding: 40px 0 40px 40px;
	border-left: 1px solid #e7e7e7;
	box-sizing: border-box;
}

.conTitle {
	width: 930px;
	height: 40px;
	line-height: 40px;
	padding-bottom: 20px;
	font-size: 32px;
	border-bottom: 1px solid #e7e7e7;
	text-align: left;
}

#calendar {
	position : absolute;
	width: 930px;
	padding-top: 30px;
	margin: 0;
	
}

/* 출근, 퇴근, qr 스캐너 모달 */
#gomodal {
	display: none;
	position: ;
	width: 100%;
	height: 0px;
	float: left;
	z-index: 9999;
	
}
.modal_content {
	position: absolute;
	width: 300px;
	height: 270px;
	padding: 20px 0;
	margin: 180px 315px;
	background: #fefefe;
	z-index: 9999; 
	border : 1px solid gray;
	
}
.close {
	width: 100px;
	height: 32px;
	background-color: #5A3673;
	color: #F2F2F2;
	border: none;
	border-radius: 3px;
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
											url : '${pageContext.request.contextPath}/dayoff/calendar',
											dataType : 'json',
											success : function(result) {
												var events = [];
												
												if (result != null) {
													$.each(result, function(index, element) {
														//모달생성
												        $(".fc-event-container").click(function(){
												        	$("#gomodal").attr("style", "display:block");
												        	var uname = element.uname; 
															var startdate = moment(eventObj.start).format('YYYY-MM-DD');
															var enddate = moment(eventObj.end).format('YYYY-MM-DD');
															console.log("시작일" + startdate);
															$(".modal_content #title").text(eventObj.title);
															$(".modal_content #pname").text(eventObj.title);
															$(".modal_content #startdate").text(startdate);
															$(".modal_content #enddate").text(enddate);
															$(".modal_content #people").text(uname);
															$(".modal_content #url").text(uname);
												        });
														/* $("#successModal").modal("show"); */
														
														
														$(".close").click(function(){
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
																var enddate = element.offend;
																var startdate = element.offstart;
																var realmname = element.uname;
																var description = element.uname + "/" + element.offreason;
																var reason = "${pageContext.request.contextPath}/commute/dailylist";
																	console.log("이"+ reason);
																var array1 = enddate.replace("월",",");
																var array2 = startdate.replace("월",",");
																	console.log("날짜"+ array1 + ", " + array2);
																/* if(enddate==null){
																	enddate=element.offstart;
																} */
																var startdate = moment(array2).format('YYYY-MM-DD');
																var enddate = moment(array1).format('YYYY-MM-DD');
																	console.log("날짜" + startdate + "," + enddate);
																	console.log("이름" + realmname);
																events.push({
																		title : description,
																		start : startdate,
																		end : enddate,
																		/* url : reason, */
																		/* url: "${pageContext.request.contextPath }/detail.do?seq="+element.seq,
																		color:"#ff3399"   */
																}); //.push()
																console.log(event);
															}); //.each()
															console.log(events);
														}//if end  
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
	<div class="header">
		<div>헤더 들어갈 자리</div>
	</div>
	<div class="main">
		<div class="sidenav">
			<ul>
				<li class="menu"><a href="">근태 관리</a>
					<ul class="hide">
						<li><a
							href="${pageContext.request.contextPath}/commute/dailylist">출퇴근
								관리</a></li>
						<li><a href="">월 근무내역</a></li>
						<li><a
							href="${pageContext.request.contextPath}/overwork/owlist">시간외
								근무신청</a></li>
					</ul></li>
				<li class="menu"><a href="">휴가 관리</a>
					<ul class="hide">
						<li><a
							href="${pageContext.request.contextPath}/dayoff/dflist">휴가 신청</a></li>
						<li><a
							href="${pageContext.request.contextPath}/dayoff/calendarlist">휴가
								현황</a></li>
					</ul></li>
				<li><a href="">조직도</a></li>
			</ul>
		</div>
		<div class="contents">
			<div class="article">
				<div class="conTitle">휴가현황</div>
				<div id='calendar'></div>
				
				<div id="gomodal">
				<div class="modal_layer"></div>
				<div class="modal_content">
					<div id="title"></div>
					<div id="pname"></div>
					<div id="startdate"></div>
					<div id="enddate"></div>
					<div id="enddate"></div>
					<div id="people"></div>
					<div id="url"><a href=""></a></div>
					<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
				</div>
			</div>	
			</div>
			
		</div>

		<!-- <div id="test"></div>
		<div class="modal fade" id="successModal" tabindex="-1" role="dialog"
			aria-labelledby="successModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-body">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<p></p>
					</div>
				</div>
			</div>
		</div> -->
			<script>
				/* 세로드롭다운 */
				$('.sidenav li.menu>a').on('click', function() {
					$(this).removeAttr('href');
					var element = $(this).parent('li');
					if (element.hasClass('open')) {
						element.removeClass('open');
						element.find('li').removeClass('open');
						element.find('ul').slideUp();
					} else {
						element.addClass('open');
						element.children('ul').slideDown();
						element.siblings('li').children('ul').slideUp();
						element.siblings('li').removeClass('open');
						element.siblings('li').find('li').removeClass('open');
						element.siblings('li').find('ul').slideUp();
					}
				});
			</script>
</body>
</html>