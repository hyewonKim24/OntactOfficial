<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ include file="../main/header.jsp"%>
<%@ include file="./pjsidebar.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <sec:csrfMetaTags />
    <title>Document</title>
    <link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/pjdetail.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <!-- 장소 검색 API -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e8f272dc1ba4f98e1be5c993c17cae5d&libraries=services"></script>
    <!-- date picker -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
     <!-- time picker -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
    <!-- Chart.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js" 
    	integrity="sha512-d9xgZrVZpmmQlfonhQUvTR7lMPtO7NkZMkA0ABN3PHCbKA5nqylQ/yWlFAyY6hYgdF1Qh6nYiuADWwKB4C2WSw==" 
    	crossorigin="anonymous"></script>
    <!-- 파일 -->
	<link href="${pageContext.request.contextPath}/resources/css/lightbox.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/resources/js/lightbox.min.js"></script>
    <script src="https://kit.fontawesome.com/22634e2e1a.js" crossorigin="anonymous"></script>
    <script>
	// 웹소켓 연결
	var sock = new WebSocket("ws://" + location.host + "/ontact/alert");
	var pno = ${ pno };
	let socketMsg = pno;
	console.log("msgmsg : " + socketMsg);
	
    </script>
	<script>
	//윤진: 할일 checked 변수선언
	let todochecked_cnt = 0;
	let todochecked_percent = 0;
	console.log("****** ~: "+todochecked_cnt);
	</script>
	</head>
	
	<body>
		<input type="hidden" value="${chatno}" id="chatno" name="chatno">
		<sec:authentication property="principal.username" var="username" />
		<sec:authentication property="principal.uno" var="uno" />
		<sec:authentication property="principal.uname" var="uname" />
		<input type="hidden" value="${uno}" id="uno" name="uno">
		<input type="hidden" value="${uname}" id="uname" name="uname">
		<div class="main">
			<div class="contents">
				
<!--  은실 ) 일반글 출력 (전체리스트로 수정해야함, 댓글 추가 안했음) -->
	<c:forEach items="${blist}" var="blist" varStatus="e">
		<c:if test="${blist.btype eq 1 }">
                <div class="one">
                    <div class="boardHeader">
                        <div class="writeInfo">
                            <span><img src="${pageContext.request.contextPath}/resources/img/user-3.png"
                                    class="profileImg"></span>
                            <div class="writer">${blist.uname} </div>
                            <div class="writeDate">${blist.bdate }</div>
                            <img src="">
                        </div>
                        <div class="option">
                            <div>
                                <a href=""><img src="${pageContext.request.contextPath}/resources/img/push-pin.png"
                                        class="fixNotice"></a>
                            </div>
                            <div>
                                <a href="" id="dropdown"><img
                                        src="${pageContext.request.contextPath}/resources/img/more-1.png"
                                        class="editoption"></a>
                            </div>
                            <div class="editDropdown">
                                <ul>
                                    <li>
                                  		<a href="${pageContext.request.contextPath}/project/commonboard/del?bno=${blist.bno}&pno=${pno}" class="list_delbtn">글 삭제</a>
                                    	<input type="hidden" class="bnoval" value="${blist.bno}">
                                    </li>
                                    <li><a href="">글 수정</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- 은실 / 보통글&파일리스트 글뿌리는건 고쳐야함-->
                    <div class="boardResult">
                    	<h2 class="title">${blist.bname }</h2>
                    	<c:forEach items="${blist.commonboardDto}" var="c">
                       		<div class="title_detail">${c.bdesc}</div>
                       	</c:forEach>
                       	<div class="uploadFiles">
                       		<ul class="uploadedFileList-real">
					<c:forEach items="${file}" var="file" varStatus="e">
					<c:if test="${blist.bno eq file.bno }">
                       			<li data-src="${file.fname }" class="uploadedFileList-real-li ${blist.bno}">
                       				<span class="boardimg-real"><img src="${file.imgsrc}" alt="Attachment"></span>
                       				<div class="boardimg-info-real">
	                       				<a href="${file.fpath }" class="boardimg-name-real">
	                       					<i class="fa fa-paperclip"></i>${file.foriginalname }
	                       				</a>
                       				</div>
                       				<input type="hidden" class="fnamevalue" value="${file.fname }"></input>
                       			</li>
                    </c:if>
                    </c:forEach> 
                       		</ul>
                       	</div>
                    </div>
                </div>
                <!-- 댓글 갯수 출력 -->
				<c:forEach items="${rclist}" var="clist" varStatus="i">
					<c:if test="${clist.bno eq blist.bno}">
						<div class="replyCount">댓글 <span class="rcount">${clist.rcount}</span>개</div>
					</c:if>
				</c:forEach>
                   <div class="threeBtn">
                        <ul>
                            <li>
                                <a href=""><img src="${pageContext.request.contextPath}/resources/img/like.png"
                                        class="like"
                                        style="width: 19px; padding-right: 10px;  padding-bottom : 5px; vertical-align: middle;">좋아요</a>
                            </li>
                            <li>
                                <a href=""><img src="${pageContext.request.contextPath}/resources/img/chat-03.png"
                                        class="replyReg"
                                        style="width: 17px; padding-right: 10px;vertical-align: middle;">댓글작성</a>
                            </li>
                            <li>
                                <a href=""><img src="${pageContext.request.contextPath}/resources/img/bookmark.png"
                                        class="save"
                                        style="width: 13px; padding-right: 10px; vertical-align: middle;">담아두기</a>
                            </li>
                        </ul>
                    </div>
              </c:if>
              

<!--  혜원 ) 업무 내용 출력  -->
				<c:if test="${blist.btype eq 2}">
					<div class="one">
						<div class="boardHeader">
							<div class="writeInfo">
								<span><img
										src="${pageContext.request.contextPath}/resources/img/user-3.png"
										class="profileImg"></span>
								<div class="writer">${blist.uname }</div>
								<div class="writeDate">${blist.bdate}</div>
								<img src="">
							</div>
							<div class="option">
								<div>
									<a href=""><img
											src="${pageContext.request.contextPath}/resources/img/push-pin.png"
											class="fixNotice"></a>
								</div>
								<div>
									<a href="" id="dropdown"><img
											src="${pageContext.request.contextPath}/resources/img/more-1.png"
											class="editoption"></a>
								</div>
								<div class="editDropdown">
									<ul>
										<li>
										<a href="${pageContext.request.contextPath}/project/taskdelete?bno=${blist.bno}&pno=${pno}" class="list_delbtn_task">글 삭제</a>
                                    	<input type="hidden" class="bnoval" value="${blist.bno}">
										</li>
										<li><a href="">글 수정</a></li>
									</ul>
								</div>
							</div>
						</div>

						<div class="boardResult">
							<div class="task_wrap">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
								<input type="hidden" name="pno" id="pno" value="${pno}">
								<div class="textbody">
									<h2 class="title">${blist.bname}</h2>
									<div id="task-01">
										<img src="${pageContext.request.contextPath}/resources/img/svg/clock-history.svg"
											width="20px" height="20px" id="task-icon01">
										<div class="task-radio-wrap">
											<input type="radio" class="task-radio task-radio-01"
												name="taskradio${e.count}" id="task-radio01-${e.count}"
												value="1">
											<label for="task-radio01-${e.count}"
												class="t-label">요청</label>
											<input type="radio" class="task-radio task-radio-02"
												name="taskradio${e.count}" id="task-radio02-${e.count}"
												value="2">
											<label for="task-radio02-${e.count}"
												class="t-label">진행</label>
											<input type="radio" class="task-radio task-radio-03"
												name="taskradio${e.count}" id="task-radio03-${e.count}"
												value="3">
											<label for="task-radio03-${e.count}"
												class="t-label">완료</label>
											<input type="radio" class="task-radio task-radio-04"
												name="taskradio${e.count}" id="task-radio04-${e.count}"
												value="4">
											<label for="task-radio04-${e.count}"
												class="t-label">보류</label>
										</div>
									</div>
							<c:forEach items="${blist.taskDto}" var="t" >
									<c:if test="${t.tstate eq 1}">
										<script>
											$(function () {
												var count = ${ e.count };
												$("#task-radio01-"+ count).prop("checked", true);
											});
										</script>
									</c:if>
									<c:if test="${t.tstate eq 2}">
										<script>
											$(function () {
												var count = ${ e.count };
												$("#task-radio02-"+ count).prop("checked", true);
											});
										</script>
									</c:if>
									<c:if test="${t.tstate eq 3}">
										<script>
											$(function () {
												var count = ${ e.count };
												$("#task-radio03-"+ count).prop("checked", true);
											});
										</script>
									</c:if>
									<c:if test="${t.tstate eq 4}">
										<script>
											$(function () {
												var count = ${ e.count };
												$("#task-radio04-"+ count).prop("checked", true);
											});
										</script>
									</c:if>
									<!-- 업무 상태 누르면 ajax로 값 update  -->
									<script>
										$(function () {
											// 업무리포트 그래프 뿌리기 
											var ctx = document.getElementById('taskChart').getContext('2d');
											var count = ${ e.count };
											var pno = ${ pno };
											var bno = ${ blist.bno };
											report();
											function report() {
												$.ajax({
													url: "${pageContext.request.contextPath}/project/tstatereport",
													data: {
														pno: pno
													},
													dataType: "json",
													success: function (data) {
														createChart(data[0], data[1], data[2], data[3]);
														return false;
													},
													error: function () {
														console.log("update 실패");
													}
												});
											};
											function createChart(s1, s2, s3, s4) {
												var myChart = new Chart(ctx, {
													type: 'doughnut',
													data: {
														labels: ['요청', '진행', '완료', '보류'],
														datasets: [{
															label: 'Score',
															data: [s1, s2, s3, s4],
															backgroundColor: [
																'#F27781',
																'#f17a19',
																'#50b766',
																'#4aaefb'
															],
														}]
													},
													options: {
														legend: {
															display: true,
															position: 'right',
														}
													}
												});
											};
											$("#task-radio01-" + count).click(function () {
												//업무 상태 변경
												$.ajax({
													url: "${pageContext.request.contextPath}/project/taskstate01",
													data: {
														bno: bno,
														pno: pno
													},
													dataType: "json",
													success: function (data) {
														console.log("ajax:" + data + "성공");
														report();
													},
													error: function () {
														console.log("update 실패");
													}
												});
											});
											$("#task-radio02-" + count).click(function () {
												//업무 상태 변경
												$.ajax({
													url: "${pageContext.request.contextPath}/project/taskstate02",
													data: {
														bno: bno,
														pno: pno
													},
													dataType: "json",
													success: function (data) {
														console.log(data + "성공");
														report();
													},
													error: function () {
														console.log("update 실패");
													}
												});
											});
											$("#task-radio03-" + count).click(function () {
												//업무 상태 변경
												$.ajax({
													url: "${pageContext.request.contextPath}/project/taskstate03",
													data: {
														bno: bno,
														pno: pno
													},
													dataType: "json",
													success: function (data) {
														console.log(data + "성공");
														report();
													},
													error: function () {
														console.log("update 실패");
													}
												});
											});
											$("#task-radio04-" + count).click(function () {
												//업무 상태 변경
												$.ajax({
													url: "${pageContext.request.contextPath}/project/taskstate04",
													data: {
														bno: bno,
														pno: pno
													},
													dataType: "json",
													success: function (data) {
														console.log(data + "성공");
														report();
													},
													error: function () {
														console.log("update 실패");
													}
												});
											});
										});
									</script>

                            <div class="task-02">
                        	    <img src="${pageContext.request.contextPath}/resources/img/svg/person-plus-fill.svg" width="20px" height="20px" class="task-icon02">
                          		<div class="task-res-wrap">
                          			<input type="text" class="task-res task-res${e.count }" name="taskname"  value="${t.taskmanager}">
                          			<input type="hidden" class="task-res-uno-c" name="taskuno">
                          			 <!-- 업무담당자 모달 /  해당 project 유저 list 뿌리기-->
                          			 <div class="task-res-add-wrap">
                          				<div class="task-add">
	                          				<ul>
	                          					 <c:forEach items="${userlist}" var="ulist">
	                          					<li class="task-res-list task-res-list${e.count}">${ulist.uname}</li>
												</c:forEach> 
													</ul>
												</div>
											</div>
										</div>
									</div>
									<!-- 업무 담당자 변경 ajax update  -->
									<script>
										$(function () {
											var count = ${e.count};
											console.log("카운트:"+count);
											var pno = ${pno};
											var bno = ${blist.bno};
											$(".task-res-list" + count).click(function () {
												console.log(bno + "값");
												var taskres = $(".task-res"+count).val();
												console.log(taskres + "담당자 변경값");
												$.ajax({
													url: "${pageContext.request.contextPath}/project/taskresupdate",
													data: {
														bno: bno,
														pno: pno,
														taskres: taskres
													},
													dataType: "json",
													success: function (data) {
														console.log("ajax:" + data + "성공");
													},
													error: function () {
														console.log("update 실패");
													}
												});
											});
										});
									</script>

									<div class="task-03">
										<img src="${pageContext.request.contextPath}/resources/img/svg/calendar-5.svg"
											width="20px" height="20px" class="task-icon02">
										<div class="task-start-wrap">
											<input type="text" name="taskstartdate"
												id="task-start-date${e.count}" class="task-schedule"
												placeholder="시작일시 추가" value="${t.tstart}">
										</div>
									</div>
									<div class="task-03">
										<img src="${pageContext.request.contextPath}/resources/img/svg/calendar-5.svg"
											width="20px" height="20px" class="task-icon02">
										<div class="task-start-wrap">
											<input type="text" name="taskenddate"
												id="task-end-date${e.count}" class="task-schedule"
												placeholder="마감일시 추가" value="${t.tend}">
										</div>
									</div>
									<script>
										//input을 datepicker로 선언
										var count = ${ e.count };
										$.datepicker.setDefaults({
											dateFormat: 'yy-mm-dd' //Input Display Format 변경
											, showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
											, showMonthAfterYear: true //년도 먼저 나오고, 뒤에 월 표시
											, changeYear: true //콤보박스에서 년 선택 가능
											, changeMonth: true //콤보박스에서 월 선택 가능                
											// ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
											// ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
											// ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
											// ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
											, yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
											, monthNamesShort: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'] //달력의 월 부분 텍스트
											, monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'] //달력의 월 부분 Tooltip 텍스트
											, dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'] //달력의 요일 부분 텍스트
											, dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'] //달력의 요일 부분 Tooltip 텍스트
											, minDate: "-48M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
											, maxDate: "+12M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
										});
										//값 변경되면 ajax update
										$('#task-start-date' + count).datepicker({
											onSelect: function (dateText) {
												console.log("Selected date: " + dateText + "; input's current value: " + this.value);
												var pno = ${ pno };
												var bno = ${ blist.bno};
										var tstart = dateText;
										console.log(tstart + "값");
										$.ajax({
											url: "${pageContext.request.contextPath}/project/tstartupdate",
											data: {
												bno: bno,
												pno: pno,
												tstart: tstart
											},
											dataType: "json",
											success: function (data) {
												console.log("ajax:" + data + "성공");
											},
											error: function () {
												console.log("update 실패");
											}
										});
										$(this).change();
											}
										})
										.on("change", function () {
											console.log("Got change event from field");
										});
										//값 변경되면 ajax update
										$('#task-end-date' + count).datepicker({
											onSelect: function (dateText) {
												var pno = ${ pno };
												var bno = ${ blist.bno};
										var tend = dateText;
										$.ajax({
											url: "${pageContext.request.contextPath}/project/tendupdate",
											data: {
												bno: bno,
												pno: pno,
												tend: tend
											},
											dataType: "json",
											success: function (data) {
												console.log("ajax:" + data + "성공");
											},
											error: function () {
												console.log("update 실패");
											}
										});
										$(this).change();
											}
										})
										.on("change", function () {
											console.log("Got change event from field");
										});
									</script>

									<div class="task-04">
										<img src="${pageContext.request.contextPath}/resources/img/svg/bar-chart-line-fill.svg"
											width="20px" height="20px" class="task-icon02">
										<div class="task-rate-wrap">
											<a class="workPrgs">
												<div class="workPrgrs_bg">
													<strong
														class="txt PROGRESS_PER">${t.trate}%</strong>

													<input type="hidden" name="trate" class="trate">
													<span id="PROGRESS"
														class="bar percent0 ${e.count}"></span>
													<div class="pcnt0 pcnt0${e.count}" data="0">
														<span class="pcnt">
															<button>0%</button>
														</span>
													</div>
													<div class="pcnt20 pcnt20${e.count}" data="20">
														<span class="pcnt">
															<button>20%</button>
														</span>
													</div>
													<div class="pcnt40 pcnt40${e.count}" data="40">
														<span class="pcnt">
															<button>40%</button>
														</span>
													</div>
													<div class="pcnt60 pcnt60${e.count}" data="60">
														<span class="pcnt">
															<button>60%</button>
														</span>
													</div>
													<div class="pcnt80 pcnt80${e.count}" data="80">
														<span class="pcnt">
															<button>80%</button>
														</span>
													</div>
													<div class="pcnt100 pcnt100${e.count}" data="100">
														<span class="pcnt">
															<button>100%</button>
														</span>
													</div>
												</div>
											</a>
										</div>
									</div>
									<c:if test="${t.trate eq 0}">
										<script>
											$(function () {
												var count = ${ e.count };
												$("." + count).css("width", "8px");
											});
										</script>
									</c:if>
									<c:if test="${t.trate eq 20}">
										<script>
											$(function () {
												var count = ${ e.count };
												$("." + count).css("width", "30px");
											});
										</script>
									</c:if>
									<c:if test="${t.trate eq 40}">
										<script>
											$(function () {
												var count = ${ e.count };
												$("." + count).css("width", "60px");
											});
										</script>
									</c:if>
									<c:if test="${t.trate eq 60}">
										<script>
											$(function () {
												console.log("60퍼")
												var count = ${ e.count };
												$("." + count).css("width", "90px");
											});
										</script>
									</c:if>
									<c:if test="${t.trate eq 80}">
										<script>
											$(function () {
												var count = ${ e.count };
												$("." + count).css("width", "120px");
											});
										</script>
									</c:if>
									<c:if test="${t.trate eq 100}">
										<script>
											$(function () {
												var count = ${ e.count };
												$("." + count).css("width", "150px");
												$("." + count).css("background-color", "#6db47c");
											});
										</script>
									</c:if>
									<!-- 업무 달성률 누르면 ajax로 값 update  -->
									<script>
										$(function () {
											var count = ${ e.count };
											var pno = ${ pno };
											var bno = ${ blist.bno };
											$(".pcnt0" + count).click(function () {
												$.ajax({
													url: "${pageContext.request.contextPath}/project/tasktrate00",
													data: {
														bno: bno,
														pno: pno
													},
													dataType: "json",
													success: function (data) {
														console.log("달성률 ajax:" + data + "성공");
													},
													error: function () {
														console.log("update 실패");
													}
												});
											});
											$(".pcnt20" + count).click(function () {
												$.ajax({
													url: "${pageContext.request.contextPath}/project/tasktrate20",
													data: {
														bno: bno,
														pno: pno
													},
													dataType: "json",
													success: function (data) {
														console.log("달성률 ajax:" + data + "성공");
													},
													error: function () {
														console.log("update 실패");
													}
												});
											});
											$(".pcnt40" + count).click(function () {
												$.ajax({
													url: "${pageContext.request.contextPath}/project/tasktrate40",
													data: {
														bno: bno,
														pno: pno
													},
													dataType: "json",
													success: function (data) {
														console.log("달성률 ajax:" + data + "성공");
													},
													error: function () {
														console.log("update 실패");
													}
												});
											});
											$(".pcnt60" + count).click(function () {
												$.ajax({
													url: "${pageContext.request.contextPath}/project/tasktrate60",
													data: {
														bno: bno,
														pno: pno
													},
													dataType: "json",
													success: function (data) {
														console.log("달성률 ajax:" + data + "성공");
													},
													error: function () {
														console.log("update 실패");
													}
												});
											});
											$(".pcnt80" + count).click(function () {
												$.ajax({
													url: "${pageContext.request.contextPath}/project/tasktrate80",
													data: {
														bno: bno,
														pno: pno
													},
													dataType: "json",
													success: function (data) {
														console.log("달성률 ajax:" + data + "성공");
													},
													error: function () {
														console.log("update 실패");
													}
												});
											});
											$(".pcnt100" + count).click(function () {
												$.ajax({
													url: "${pageContext.request.contextPath}/project/tasktrate100",
													data: {
														bno: bno,
														pno: pno
													},
													dataType: "json",
													success: function (data) {
														console.log("달성률 ajax:" + data + "성공");
													},
													error: function () {
														console.log("update 실패");
													}
												});
											});
										});
									</script>

									<div class="task-05">
										<img src="${pageContext.request.contextPath}/resources/img/svg/flag-2.svg"
											width="20px" height="20px" class="task-icon02">
										<div class="task-pri-wrap">
											<input type="text" class="task-pri pri-val${e.count}"
												name="taskpri" placeholder="우선순위 추가"
												value="${t.tpriority }">
											<div class="task-pri-add-wrap">
												<div class="task-pri-add">
													<button type="button"
														class="task-pri lv1-${e.count}" id="lv1"
														value="lv1">낮음</button> <br>
													<button type="button"
														class="task-pri lv2-${e.count}" id="lv2"
														value="lv2">보통</button> <br>
													<button type="button"
														class="task-pri lv3-${e.count}" id="lv3"
														value="lv3">높음</button>
												</div>
											</div>
										</div>
									</div>
									<!-- 업무 우선순위 누르면 ajax로 값 update  -->
									<script>
										$(function () {
											var count = ${ e.count };
											var pno = ${ pno };
											var bno = ${ t.bno };
											$(".lv1-" + count).click(function () {
												$(".pri-val" + count).val("낮음");
												$.ajax({
													url: "${pageContext.request.contextPath}/project/tprilv1",
													data: {
														bno: bno,
														pno: pno
													},
													dataType: "json",
													success: function (data) {
														console.log("ajax:" + data + "성공");
													},
													error: function () {
														console.log("update 실패");
													}
												});
											});
											$(".lv2-" + count).click(function () {
												$(".pri-val" + count).val("보통");
												$.ajax({
													url: "${pageContext.request.contextPath}/project/tprilv2",
													data: {
														bno: bno,
														pno: pno
													},
													dataType: "json",
													success: function (data) {
														console.log("ajax:" + data + "성공");
													},
													error: function () {
														console.log("update 실패");
													}
												});
											});
											$(".lv3-" + count).click(function () {
												$(".pri-val" + count).val("높음");
												$.ajax({
													url: "${pageContext.request.contextPath}/project/tprilv3",
													data: {
														bno: bno,
														pno: pno
													},
													dataType: "json",
													success: function (data) {
														console.log("ajax:" + data + "성공");
													},
													error: function () {
														console.log("update 실패");
													}
												});
											});
										});
									</script>

									<!-- 업무 글 content -->
									${t.tmemo}
								</div>
								<!-- 은실 ) 파일뿌리기 -->
								 <div class="uploadFiles">
			                       		<ul class="uploadedFileList-real">
								<c:forEach items="${file}" var="file" varStatus="e">
								<c:if test="${blist.bno eq file.bno }">
			                       			<li data-src="${file.fname }" class="uploadedFileList-real-li ${tlist.bno}">
			                       				<span class="boardimg-real"><img src="${file.imgsrc}" alt="Attachment"></span>
			                       				<div class="boardimg-info-real">
				                       				<a href="${file.fpath }" class="boardimg-name-real">
				                       					<i class="fa fa-paperclip"></i>${file.foriginalname }
				                       				</a>
			                       				</div>
			                       				<input type="hidden" class="fnamevalue" value="${file.fname }"></input>
			                       			</li>
			                    </c:if>
			                    </c:forEach>
			                       		</ul>
                      			</div> 
                    			</div>
                    			</div>
                    			</div>
                       			<!-- 여기까지 -->
                       	<%-- </c:forEach> --%>
                       	
                       	
								<!-- 댓글 갯수 출력 -->
							<c:forEach items="${rclist}" var="clist" varStatus="i">
								<c:if test="${clist.bno eq blist.bno}">
										<div class="replyCount">댓글 <span class="rcount">${clist.rcount}</span>개</div>
								</c:if>
							</c:forEach>
							<div class="threeBtn">
								<ul>
									<li>
										<a href=""><img
												src="${pageContext.request.contextPath}/resources/img/like.png"
												class="like"
												style="width: 19px; padding-right: 10px;  padding-bottom : 5px; vertical-align: middle;">좋아요</a>
									</li>
									<li>
										<a href=""><img
												src="${pageContext.request.contextPath}/resources/img/chat-03.png"
												class="replyReg"
												style="width: 17px; padding-right: 10px;vertical-align: middle;">댓글작성</a>
									</li>
									<li>
										<a href=""><img
												src="${pageContext.request.contextPath}/resources/img/bookmark.png"
												class="save"
												style="width: 13px; padding-right: 10px; vertical-align: middle;">담아두기</a>
									</li>
								</ul>
							</div>
						

					</c:forEach>
				</c:if>
<!-- 혜원 업무 글 결과화면 끝 -->

<!-- 혜림 일정 글 결과화면 -->
		<c:if test="${blist.btype eq 3}">
            <div class="one">
                <div class="boardHeader">
                    <div class="writeInfo">
                        <span><img src="${pageContext.request.contextPath}/resources/img/user-3.png" class="profileImg"></span>
                        <div class="writer">${blist.uname}</div>
                        <div class="writeschedate">${blist.bdate}</div>
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
                                <li><a href="${pageContext.request.contextPath}/project/schedule/del?bno=${blist.bno}&pno=${pno}">글 삭제</a></li>
                                <li><a href="">글 수정</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="boardResult">
                    <div class="result_wrap">
                        <!-- 일정, 제목-->
                        <div class="rtitle">
                        	<input type="hidden" value="${blist.bno}" readonly>
                            <input type="text" value="${blist.bname}" readonly>
                        </div>
                       	<c:forEach items="${blist.scheduleDto}" var="s" varStatus="e">
                        <div class="rschedate">
                            <img src="${pageContext.request.contextPath}/resources/img/time.png" class="sche_icon">
                            <fmt:formatDate pattern="yyyy년mm월dd일" value="${s.sstart}"/>
                            <input type="text" id="scheSdate" name="startdate" class="d" value="${s.sstart}"> 
                            &nbsp; &nbsp; ~ &nbsp; &nbsp;
                            <fmt:formatDate pattern="yyyy년mm월dd일" value="${s.send}"/>
                            <input type="text" id="scheEdate" name="enddate" class="d" value="${s.send}"> 
                        </div>
                        <!-- 참가자 -->
                        <div class="rschepeople">
                            <img src="${pageContext.request.contextPath}/resources/img/users.png" class="sche_icon">
                            <div class="attendeecount">참여자 <span>${s.count}</span>명</div>
                            <div class="attendee">${s.attendees}</div>
                            <button class="js-open  open-button">참석자 변경</button>
                            <!-- 참석자 모달 -->
                            <div class="js-layer  layer  hide">
		                             <div class="ModalPopup">
		                             
                                        <div class="attendee-title">참석자변경</div>
                                        <div class="attendee-list">
                                            <div class="attendee-search">
                                                <input type="text" placeholder="참석자 이름 검색">
                                                <button id="searchBtn"><img src="${pageContext.request.contextPath}/resources/img/search.png"></button>
                                            </div>
                                            
                                            <div class="attendee-people">
                                                <!-- 선택된 참가자가 표시됨  -->
                                            <form name="pickAttendee_frm" method="get" action="${pageContext.request.contextPath}/project/schedule/upd">
                                                <input type="hidden" name="pno" id="pno" value="${pno}">
                                                <input type="hidden" name="bno" id="bno" value="${blist.bno}">
                                                <div class="pick-attendee"></div>

                                                <c:forEach items="${userlist}" var="ulist" varStatus="e"> 
                                                <div class="userlist_wrap">
                                                    <img src="${pageContext.request.contextPath}/resources/img/user-3.png">
                                                    <span>${ulist.uname}</span>
                                                    <input type="hidden" class="taks-res-uno" name="attendee1" value="${ulist.uno}">
                                                    <input type="checkbox" class="pick pick${e.count}" value="+ 선택">
                                                    
                                                </div>
                                                <script type="text/javascript">
            				    	//참석자 변경 모달
            				        $('.js-open').click(function () {
            				        	/* var $layer = $('.js-layer'); */
            				        	/* var $layer = $(this).next();  */
            				        	var $layer = $(this).parent(".rschepeople");
            				            var aaa = $layer.find('.js-layer');
            				            aaa.removeClass('hide');
            				        	/* $layer.removeClass('hide'); */
            				        });
            				        $('.closebtn').click(function () {
            				            var $layer = $('.js-layer');
            				            $layer.addClass('hide');
            				        });
            				        console.log("값찍어보기 :" + '${e.count}');
            				        $('.pick${e.count}').click(function(e){
            				        	/* $(this).unbind("click"); */
            				        	e.stopPropagation();
            				        	alert("클릭햇다");
            				            if($(this).is(":checked") == true){
            				                $p=$(this).parent(".userlist_wrap");
            				                var user = $p.find("span").text();
            				                // var add = '<span>'+ user +'</span>'
            				                var add = '<input type="text" class="'+ user+ '" value="' + user+ '" name="attendeeChange">'
            				                $(".pick-attendee").append(add);
            				            } else if($(this).is(":checked") == false){
            				                $p=$(this).parent(".userlist_wrap");
            				                var user = $p.find("span").text();
            				                if($("." + user).val() == user){
            				                    var aaa = $(".test").val();
            				                    console.log(aaa);
            				                    $("." + user).remove();
            				                 }
            				            }
            				        })
            				        
                                    </script>
                                    
                                                </c:forEach>
                                                <div class="modal-btn">
                                                <button class="edit-btn closebtn" >취소</button>
                                                <button class="edit-btn" type="submit" onclick="changeAttendee()">확인</button>
                                                </div> 
											</form>
                                            </div>
                                            
                                            
                                        </div>
                                    </div>
                                    
                                
                            </div>
                            <div id="mask"></div>
                            <!-- <input type="text" id="schePname"> -->
	                        </div>
	                        <!-- 장소 -->
	                        <div class="rscheplace">
	                            <img src="${pageContext.request.contextPath}/resources/img/placeholder.png" class="sche_icon">
	                            <input type="text" value="${s.splace}">
	                        </div>
	                        <!-- 메모 -->
	                        <div class="rschememo">
	                            <img src="${pageContext.request.contextPath}/resources/img/calendar.png" id="calendaricon"class="sche_icon">
	                        	<textarea class="content_detail2" placeholder="${s.smemo}"></textarea>
	                        </div>
			                </c:forEach>
                    	</div>
                	</div>
                </div>
                <!-- 댓글 갯수 출력 -->
				<c:forEach items="${rclist}" var="clist" varStatus="i">
					<c:if test="${clist.bno eq blist.bno}">
							<div class="replyCount">댓글 <span class="rcount">${clist.rcount}</span>개</div>
					</c:if>
				</c:forEach>

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
         </c:if>
<!-- 혜림  일정 결과화면 끝 -->

<!-- 윤진 할일 결과화면 시작 -->
		<c:if test="${blist.btype eq 4 }">
		<div class="one">
                      <div class="boardHeader">
                          <div class="writeInfo">
                              <span><img src="${pageContext.request.contextPath}/resources/img/user-3.png" class="profileImg"></span>
                              <div class="writer">${blist.uname }</div>
                              <div class="writeDate">${blist.bdate }</div>
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
                                      <li><a href="">글 수정</a></li>
                                  </ul>
                              </div>
                          </div>
                      </div>

                      <div class="boardResult">
                          <div class="todo-cont">
                              <div class="todo-title">
                                  <div class="todo-list-title">${blist.bname }</div>
                                  <span class="todo-list-per-${blist.bno}">%</span>
                                  <span class="todo-list-ing">완료<span class="tdcompcnt-${blist.bno}"></span>/ 전체 <span class="todo-list-ed-${blist.bno}">${blist.todoViewDto.size()}</span></span>
                              </div>
                              <ul class="todo-cont-list todo-cont-list-${blist.bno}">
                              <c:forEach items="${blist.todoViewDto}" var="todo" varStatus="vs">
                              	<c:if test="${todo != null}">
                                  <li class="todo tdno-${todo.tdno}">
                                    <input type="checkbox" class="todo-05" id="todocheck-${todo.tdno}" name="tdcheck" value="${todo.tdcheck}">
                                    <label for="todocheck-${todo.tdno}"></label>
                              		<input type="hidden" class="tdno" name="tdno" value="${todo.tdno}">
                              		
                                      <c:if test="${todo.tdcheck eq 0}">
                                          <script>
                                      console.log("****** --: "+todochecked_cnt);
                                              $(function(){
                                                  $("#todocheck-${todo.tdno}").prop("checked", false);
                                              });
                                          </script>
                                      </c:if>
                                      <c:if test="${todo.tdcheck eq 1}">
                                          <script>
                                      todochecked_cnt++;
                                      console.log("****** c: "+todochecked_cnt);
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
                                                          var todocheckedevent = $(".tdcompcnt-${blist.bno}").text();
                                                          var todocheckedevent_cnt = Number(todocheckedevent);
                                                          console.log("****** todocheckedevent_cnt++ "+todocheckedevent_cnt);
                                                          $(".tdcompcnt-${blist.bno}").text(todocheckedevent_cnt+1);
                                                          
                                                          //퍼센트 구하기
                                                          var todocnt =  $(".tdcompcnt-${blist.bno}").text();
                                                          var allcnt = $(".todo-list-ed-${blist.bno}").text();
                                                          var d = (todocnt / allcnt)*100
                                                          var percent = Math.round(d);
                                                          $(".todo-list-per-${blist.bno}").text(percent+"%"); 
                                                          
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
                                                      var todocheckedevent = $(".tdcompcnt-${blist.bno}").text();
                                                      var todocheckedevent_cnt = Number(todocheckedevent);
                                                      console.log("****** todocheckedevent_cnt-- "+todocheckedevent_cnt);
                                                      $(".tdcompcnt-${blist.bno}").text(todocheckedevent_cnt-1);
                                                      //$(".tdcompcnt-${blist.bno}").text(a);
                                                      
                                                      //퍼센트 구하기
                                                      var todocnt =  $(".tdcompcnt-${blist.bno}").text();
                                                          var allcnt = $(".todo-list-ed-${blist.bno}").text();
                                                          var d = (todocnt / allcnt)*100
                                                          var percent = Math.round(d);
                                                      $(".todo-list-per-${blist.bno}").text(percent+"%"); 
                                                      
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
                                      	<input type="text" class="tddate" id="tddate-${todo.tdno}" onfocus="this.blur();" name="tddate" value="${todo.tddate}" >
                                      </div>
                                      <script>
                                      // 할일 체크 상태 변경
                                      $(function(){
                                      	$("#tddate-${todo.tdno}").click(function(){
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
                  				    	        	var tdno = ${todo.tdno};
                                              		var tddate = date;
                                                  		$.ajax({
                                      						url: "${pageContext.request.contextPath}/project/tddateupdate",
                                      						data: {
                                      							"tdno" : tdno,
                                      							"tddate" : tddate
                                      						},
                                      						dataType: "json",
                                      						success:function(data){
                                      							console.log("ajax:"+data+"성공");
                                      						},
                                      						error:function(){
                                      							console.log("update 실패");
                                      						}
                                                  	});
                  				    	        }
                  				    	    });
                                      	});
                                     	});
                                      </script>
                                      <c:if test="${todo.ufilepath == null}">
                                      	<img src="${pageContext.request.contextPath}/resources/img/user-3.png" width="20px" class="todo-08 todo-08-${todo.tdno}">
                                     	<input type="text" class="todo-09" value="">
                                      </c:if>
                                      <c:if test="${todo.ufilepath != null}">
                                      	<img src="${todo.ufilepath}" class="todo-08 todo-08-${todo.tdno} userimg">
                                      	<input type="text" class="todo-09" value="">
                                      </c:if>
                                     	<script>
                                     		$(".todo-08-${todo.tdno}").hover(function(){
                                     			$(this).next().css("display","inline-block");
                                     			$(this).next().val("${todo.uname}");
                                     		},function(){
                                     			$(this).next().css("display","none");
                                     		});
                                     		var tdlist = $(".tdno-${todo.tdno}").size();
                                            console.log("rrr"+tdlist);
                                     	</script>
                                  </li>
                              	</c:if>
                              </c:forEach>
                              </ul>
								<script>
                              	//$(".tdno-${todo.tdno}", function(){
                                  console.log("****** ${blist.bno} " + "${blist.bno}");
                                  console.log("****** todochecked_cnt "+todochecked_cnt);
                                  var a = todochecked_cnt;
                                  var b = $(".todo-list-ed-${blist.bno}").text();
								  //완료한 할일 수
                                  $(".tdcompcnt-${blist.bno}").text(a);
                                  //퍼센트 구하기
                                  var d = (a / b)*100;
                                  var percent = Math.round(d);
								  $(".todo-list-per-${blist.bno}").text(percent+"%");                               
                                  todochecked_cnt = 0;
	                  			//});
                              </script>
                          </div>
							
                      </div>
                      	
                      </div>
                      <!-- one 끝 -->
                      <!-- 댓글 갯수 출력 -->
                      <c:forEach items="${rclist}" var="clist" varStatus="i">
							<c:if test="${clist.bno eq blist.bno}">
								<div class="replyCount">댓글 <span class="rcount">${clist.rcount}</span>개</div>
							</c:if>
					  </c:forEach>
					  
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
		</c:if>
	
	
	
	
	
	
	
	
	
	
	
	</c:forEach>
	</div>
<!-- 윤진 할일 글 결과화면 끝 -->
           	

		
		<script>
			//게시글 작성 공개여부 설정
			$(".footerwrap").on("click", function (e) {
				e.preventDefault();
				let parent = $(this);
				parent.find(".public_setting").toggle();

				parent.find('.set_li').on('click', function () {
					parent.find(".public").show();
					parent.find(".public_admin").hide();
					parent.find(".taskopen").val("0");
				});
				parent.find('.set_li_admin').on('click', function () {
				 	parent.find(".public").hide();
				 	parent.find(".public_admin").show();
				 	parent.find(".taskopen").val("1");
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
			
			
			//초대하기 모달
			$("#addmembtn").on("click",function(){
				$(".invite-dim").css("display","block");
				$(".invite-search-wrap").css("display","block");
			});
			
			$(".invite-exit").on("click",function(){
				$(".invite-dim").css("display","none");
				$(".invite-search-wrap").css("display","none");
			});
			//초대하기 모달 검색기능
			$(".chat-search-input").keyup(function(){
				var c =$(this).val();
				$(".inviteList-table tr").hide();
				console.log("검색어:"+c);
				var temp= $(".inviteList-table td:contains('"+c+"')");
				console.log("temp"+temp);
				
				$(temp).parent().show();
			});
			
	// 파일 추가 (은실)
	imageChange();
	
	let header = $("meta[name='_csrf_header']").attr("content");
	let token = $("meta[name='_csrf']").attr("content");
	$("#uploadfile").on("change", fileChange);
	$("#uploadfile_task").on("change", fileChangeTask);		
	
	function fileChange(e) {
	    e.preventDefault();
	    let files = e.target.files;
	    for (let file of files) {
	        let size = file.size
	        let formData = new FormData();
	        formData.append("file", file);
	        console.log(formData.get('file'));
	        // 파일 업로드 AJAX 통신 메서드 호출
	        uploadFile(formData, size);
	    }
	}
	
	function fileChangeTask(e) {
	    e.preventDefault();
	    let files = e.target.files;
	    for (let file of files) {
	        let size = file.size
	        let formData = new FormData();
	        formData.append("file", file);
	        //console.log(formData.get('file'));
	        // 파일 업로드 AJAX 통신 메서드 호출
	        uploadFileTask(formData, size);
	    }
	}
	
	//파일 업로드 AJAX 통신
	function uploadFile(formData, size) {
	    $.ajax({
	        url: "${pageContext.request.contextPath}/files/upload",
	        data: formData,
	        dataType: "text",
	        processData: false,
	        contentType: false,
	        type: "POST",
	        beforeSend: function (xhr) {
	            xhr.setRequestHeader(header, token);	// 헤드의 csrf meta태그를 읽어 CSRF 토큰 함께 전송
	        },
	        success: function (data) {
	            printFiles(data, size);
	        }
	    })
	}
	
	//task용
	//파일 업로드 AJAX 통신
	function uploadFileTask(formData, size) {
	  $.ajax({
	      url: "${pageContext.request.contextPath}/files/upload",
	      data: formData,
	      dataType: "text",
	      processData: false,
	      contentType: false,
	      type: "POST",
	      beforeSend: function (xhr) {
	          xhr.setRequestHeader(header, token);	// 헤드의 csrf meta태그를 읽어 CSRF 토큰 함께 전송
	      },
	      success: function (data) {
	          printFilesTask(data, size);
	      }
	  })
	}
	
	//task용
	//첨부파일 출력
	function printFilesTask(data, size) {
	  // 파일 정보 처리
	  console.log("printfiles : "+size);
	  var fileInfo = getFileInfo(data);
	  var html = "<li><span class='boardimg'>";
	  html += "<img src='" + fileInfo.imgSrc + "' alt='Attachment' class='imgsrc'>";
	  html += "</span>"
	  html += "<div class='boardimg-info'>"
	  html += "<input type='hidden' value='" + size + "' id='fsize'>"
	  html += "<a href='" + fileInfo.originalFileUrl + "' class='boardimg-name'>"
	  html += "<i class='fa fa-paperclip'></i>" + fileInfo.originalFileName + "</a>"
	  html += "<a href='" + fileInfo.fullName + "' class='boardimg-delbtn'>"
	  html += "<i class='fa fa-fw fa-remove'></i></a></div></li>"
	      // Handlebars 파일 템플릿 컴파일을 통해 생성된 HTML을 DOM에 주입
	      $('.uploadedFileList_task').append(html);
	  // 이미지 파일인 경우 파일 템플릿에 lightbox 속성 추가
	  if (fileInfo.fullName.substr(12, 2) === "s_") {
	      // 마지막에 추가된 첨부파일 템플릿 선택자
	      var that = $('.uploadedFileList_task li').last();
	      // lightbox 속성 추가
	      that.find(".boardimg-name").attr("data-lightbox", "uploadImages");
	      // 파일 아이콘에서 이미지 아이콘으로 변경
	      that.find(".fa-paperclip").attr("class", "fa fa-camera");
	  }
	}
	
	//첨부파일 출력
	function printFiles(data, size) {
	    // 파일 정보 처리
	    console.log("printfiles : " + size);
	    var fileInfo = getFileInfo(data);
	    var html = "<li><span class='boardimg'>";
	    html += "<img src='" + fileInfo.imgSrc + "' alt='Attachment' class='imgsrc'>";
	    html += "</span>"
	    html += "<div class='boardimg-info'>"
	    html += "<input type='hidden' value='" + size + "' id='fsize'>"
	    html += "<a href='" + fileInfo.originalFileUrl + "' class='boardimg-name'>"
	    html += "<i class='fa fa-paperclip'></i>" + fileInfo.originalFileName + "</a>"
	    html += "<a href='" + fileInfo.fullName + "' class='boardimg-delbtn'>"
	    html += "<i class='fa fa-fw fa-remove'></i></a></div></li>"
	        // Handlebars 파일 템플릿 컴파일을 통해 생성된 HTML을 DOM에 주입
	        $('.uploadedFileList').append(html);
	    // 이미지 파일인 경우 파일 템플릿에 lightbox 속성 추가
	    if (fileInfo.fullName.substr(12, 2) === "s_") {
	        // 마지막에 추가된 첨부파일 템플릿 선택자
	        var that = $('.uploadedFileList li').last();
	        // lightbox 속성 추가
	        that.find(".boardimg-name").attr("data-lightbox", "uploadImages");
	        // 파일 아이콘에서 이미지 아이콘으로 변경
	        that.find(".fa-paperclip").attr("class", "fa fa-camera");
	    }
	}
	
	//파일 정보 처리
	  function getFileInfo(fullName) {

	      var originalFileName;   // 화면에 출력할 파일명
	      var imgSrc;             // 썸네일 or 파일아이콘 이미지 파일 출력 요청 URL
	      var originalFileUrl;    // 원본파일 요청 URL
	      var uuidFileName;       // 날짜경로를 제외한 나머지 파일명 (UUID_파일명.확장자)


	      // 이미지 파일이면
	      if (checkImageType(fullName)) {
	          imgSrc = "${pageContext.request.contextPath}/files/display?fileName=" + fullName; // 썸네일 이미지 링크
	          uuidFileName = fullName.substr(14);
	          var originalImg = fullName.substr(0, 12) + fullName.substr(14);
	          // 원본 이미지 요청 링크
	          originalFileUrl = "${pageContext.request.contextPath}/files/display?fileName=" + originalImg;
	      } else {
	          imgSrc = "${pageContext.request.contextPath}/resources/img/nonepic.png"; // 파일 아이콘 이미지 링크
	          uuidFileName = fullName.substr(12);
	          // 파일 다운로드 요청 링크
	          originalFileUrl = "${pageContext.request.contextPath}/files/display?fileName=" + fullName;
	      }
	      originalFileName = uuidFileName.substr(uuidFileName.indexOf("_") + 1);

	      return { originalFileName: originalFileName, imgSrc: imgSrc, originalFileUrl: originalFileUrl, fullName: fullName };
	  }
			
	// 이미지 파일 유무 확인
	  function checkImageType(fullName) {
	      let type = fullName.slice(fullName.lastIndexOf(".") + 1).toLowerCase();
	      let check = true;
	      if (!(type == "gif" || type == "jpg" || type == "jpeg" || type == "png")) {
	          check = false;
	      }
	      return check;
	  }	
	
	
	//파일 삭제 버튼 클릭 이벤트
	  $(document).on("click", ".boardimg-delbtn", function (event) {
	      event.preventDefault();
	      var that = $(this);
	      deleteFileWrtPage(that);
	  });
	  // 파일 삭제(입력페이지) : 첨부파일만 삭제처리
	  function deleteFileWrtPage(that) {
	      var url = "${pageContext.request.contextPath}/files/delete";
	      deleteFile(url, that);
	  }
	  // 파일 삭제 AJAX 통신
	  function deleteFile(url, that) {
	      $.ajax({
	          url: url,
	          type: "post",
	          data: { fileName: that.attr("href") },
	          dataType: "text",
	          beforeSend: function (xhr) {
	              xhr.setRequestHeader(header, token);	// 헤드의 csrf meta태그를 읽어 CSRF 토큰 함께 전송
	          },
	          success: function (result) {
	              if (result === "DELETED") {
	                  alert("삭제되었습니다.");
	                  that.parents("li").remove();
	              }
	          }
	      });
	  }
	 
	//게시글 저장 버튼 클릭 이벤트 처리 (일반글)
	  $("#writebtn").click(function (event) {
	      //event.preventDefault();
	      var that = $(this);
	      filesSubmit(that);
	  });
	  //게시글 입력/수정 submit 처리시에 첨부파일 정보도 함께 처리 (일반글)
		
			
	  function filesSubmit(that) {
				sendMessage();
				function sendMessage() {
					sock.send(pno);
					console.log("글 작성 소켓 보냄");
		
				}
				
	  	console.log("설마설마"+that)
	      var str = "";
	      $(".imgsrc").each(function(index){
	      	str += "<input type='hidden' name='filelist[" + index + "].imgsrc' value='" + $(this).attr('src') + "'>"
	      });
	      $(".boardimg-delbtn").each(function (index) {
	          str += "<input type='hidden' name='filelist[" + index + "].fname' value='" + $(this).attr('href') + "'>"
	      });
	      $(".boardimg-name").each(function (index) {
	          let par = $(this).parent();
	          let originalFileName = $(this).text();
	          let size = par.find('#fsize').val();
	          str += "<input type='hidden' name='filelist[" + index + "].fpath' value='" + $(this).attr('href') + "'>"
	          str += "<input type='hidden' name='filelist[" + index + "].fsize' value='" + size + "'>"
	          str += "<input type='hidden' name='filelist[" + index + "].foriginalname' value='" + originalFileName + "'>"
	      });
	      that.append(str);
	      console.log(str);
	      that.get(0).submit();
	  }

	  // 업로드 된 파일 이미지 설정 변경 (일반글)
	  function imageChange(){
	      $(".fnamevalue").each(function(index){
	          let fname = $(this).val();
	          let parent = $(this).parents('.uploadedFileList-real-li');
	          if(fname.substr(12,2)==="s_"){
	              parent.find('.boardimg-name-real').attr("data-lightbox", "uploadImages");
	              parent.find(".fa-paperclip").attr("class", "fa fa-camera");
	          }
	      })
	  }	
	  
	  
	//게시글 삭제 클릭 이벤트 (파일 삭제까지)
	  $(".list_delbtn").off().on("click", function (e) {
	      $(".list_delbtn").unbind("click"); 
	      e.preventDefault;
	      // 첨부파일명들을 배열에 저장
	      let bno = $(this).next().val();
	      var arr = [];
	      $("."+bno).each(function () {
	          arr.push($(this).attr("data-src"));
	      });
	      // 서버 파일 지우기
	      if(arr.length > 0) {
	      	$.ajax({
	              url: "${pageContext.request.contextPath}/files/deleteAll",
	              type: "post",
	              data: { files : arr },
	              beforeSend: function (xhr) {
	                  xhr.setRequestHeader(header, token);	// 헤드의 csrf meta태그를 읽어 CSRF 토큰 함께 전송
	              },
	              success: function (result) {
	              }
	          });
	      alert("삭제되었습니다.");
	      // db 삭제
	      $(this).get(0).click();
	      }
	  });
	
	// 업무 게시글 삭제 (파일삭제까지)
	$(".list_delbtn_task").off().on("click", function (e) {
	      $(".list_delbtn").unbind("click"); 
	      e.preventDefault;
	      // 첨부파일명들을 배열에 저장
	      let bno = $(this).next().val();
	      var arr = [];
	      $("."+bno).each(function () {
	          arr.push($(this).attr("data-src"));
	      });
	      // 서버 파일 지우기
	      if(arr.length > 0) {
	      	$.ajax({
	              url: "${pageContext.request.contextPath}/files/deleteAll",
	              type: "post",
	              data: { files : arr },
	              beforeSend: function (xhr) {
	                  xhr.setRequestHeader(header, token);	// 헤드의 csrf meta태그를 읽어 CSRF 토큰 함께 전송
	              },
	              success: function (result) {
	              }
	          });
	      alert("삭제되었습니다.");
	      // db 삭제
	      $(this).get(0).click();
	      }
	  });

		</script>
		
		<c:if test="${not empty inviteSuccess}">
			<script>
			$(document).ready(function(){  
				alert('${inviteSuccess}');	
			});
			 </script>		
		</c:if>
		
		
		<script>
										$(".replyUpdate").unbind("click");
										$(".replyUpdateBtn").unbind("click");
										$(".replyDelete").unbind("click");
										//댓글 수정
										$(".replyUpdate").click(function () {
											var parent = $(this).parent();
											var parentDiv = parent.parent();
											var rno = parentDiv.find(".rno").val();
											console.log(rno + "rno");
											console.log("댓글 수정");
											parentDiv.find(".replyResult").css("display", "none");
											parentDiv.find(".replyUpdate").css("display", "none");
											parentDiv.find(".replyDelete").css("display", "none");
											parentDiv.find(".replyUpdateText").css("display", "inline-block");
											parentDiv.find(".replyUpdateBtn").css("display", "inline-block");
										});
										$(".replyUpdateBtn").click(function () {
											var parent = $(this).parent();
											var parentDiv = parent.parent();
											var rdesc = parentDiv.find(".replyUpdateText").val();
											var rno = parentDiv.find(".rno").val();
											console.log(rno + "rno");
											console.log(rdesc + "rdesc");
											$.ajax({
												url: "${pageContext.request.contextPath}/project/replyupdate",
												data: {
													rno: rno,
													rdesc: rdesc
												},
												dataType: "json",
												success: function (data) {
													parentDiv.find(".replyResult").css("display", "block");
													parentDiv.find(".replyUpdateText").css("display", "none");
													parentDiv.find(".replyUpdateBtn").css("display", "none");
													parentDiv.find(".replyUpdate").css("display", "inline-block");
													parentDiv.find(".replyDelete").css("display", "inline-block");
													parentDiv.find(".replyResult").text(rdesc);
												},
												error: function () {
													console.log("댓글수정 실패");
												}
											});
										});
										//댓글 삭제
										$(".replyDelete").click(function () {
											var parent = $(this).parent();
											var parentDiv = parent.parent();
											var rno = parentDiv.find(".rno").val();
											$.ajax({
												url: "${pageContext.request.contextPath}/project/replydelete",
												data: {
													rno: rno
												},
												dataType: "json",
												success: function (data) {
													parentDiv.remove();
												},
												error: function () {
													console.log("삭제 실패");
												}
											});
										});
									</script>
	</body>
	</html>
