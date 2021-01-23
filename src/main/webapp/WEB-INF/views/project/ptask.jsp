<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath}/resources/css/reset.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
<meta charset="UTF-8">
<sec:csrfMetaTags />
<title>ontact, 서로 연결되는 온라인 공간</title>
<style>
body {
	background-color: #f6f6f6;
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

.main {
	position: relative;
	width: 1200px;
	height: 100%;
	margin: 0 auto;
}

.ptask_sidebar {
	position: relative;
	width: 210px;
	height: 100%;
	float: left;
}

.menu:hover {
	background-color: #ebebeb;
}

.ptask_sidebar ul, .ptask_sidebar ul li a {
	display: block;
	color: #111111;
}

.ptask_sidebar .menu {
	display: block;
	height: 40px;
	font-size: 14px;
	line-height: 40px;
	font-weight: 600;
	padding-left: 10px;
}

.menu_title {
	color: #939394;
	font-weight: 560;
	font-size: 15px;
	height: 25px;
}

input[type=checkbox], input[type=radio] {
	margin-top: -2px;
	margin-left: 12px;
	margin-right: 16px;
	vertical-align: middle;
	cursor: pointer
}

input[type=radio] {
	position: relative;
	margin: 0 1rem 0 0;
	cursor: pointer
}

input[type=radio]:before {
	-webkit-transition: -webkit-transform .4s
		cubic-bezier(.45, 1.8, .5, .75);
	-moz-transition: -moz-transform .4s cubic-bezier(.45, 1.8, .5, .75);
	transition: transform .4s cubic-bezier(.45, 1.8, .5, .75);
	-webkit-transform: scale(0, 0);
	-moz-transform: scale(0, 0);
	-ms-transform: scale(0, 0);
	-o-transform: scale(0, 0);
	transform: scale(0, 0);
	content: "";
	position: absolute;
	top: 1px;
	left: 1px;
	z-index: 1;
	width: .85714rem;
	height: .85714rem;
	background: #5A3673;
	border-radius: 50%;
}

input[type=radio]:disabled:before {
	background: #d3cedb
}

input[type=radio]:checked:before {
	-webkit-transform: scale(.7, .7);
	-moz-transform: scale(.7, .7);
	-ms-transform: scale(.7, .7);
	-o-transform: scale(.7, .7);
	transform: scale(.7, .7)
}

input[type=radio]:after {
	content: "";
	position: absolute;
	top: -2px;
	left: -2px;
	width: 1rem;
	height: 1rem;
	background: #fff;
	border: 2px solid rgba(95, 90, 185, .16);
	border-radius: 50%
}

input[type=checkbox] {
	position: relative;
	top: 0;
	margin: 0 1rem 0 0;
	cursor: pointer
}

input[type=checkbox]:before {
	-webkit-transition: -webkit-transform .4s
		cubic-bezier(.45, 1.8, .5, .75);
	-moz-transition: -moz-transform .4s cubic-bezier(.45, 1.8, .5, .75);
	transition: transform .4s cubic-bezier(.45, 1.8, .5, .75);
	-webkit-transform: rotate(-45deg) scale(0, 0);
	-moz-transform: rotate(-45deg) scale(0, 0);
	-ms-transform: rotate(-45deg) scale(0, 0);
	-o-transform: rotate(-45deg) scale(0, 0);
	transform: rotate(-45deg) scale(0, 0);
	content: "";
	position: absolute;
	top: 2px;
	left: -1px;
	z-index: 1;
	width: .85714rem;
	height: .42857rem;
	border: 2px solid #746fcc;
	border-top-style: none;
	border-right-style: none
}

input[type=checkbox]:disabled:before {
	border: 2px solid #d3cedb;
	border-top-style: none;
	border-right-style: none
}

input[type=checkbox]:checked:before {
	-webkit-transform: rotate(-45deg) scale(.8, .8);
	-moz-transform: rotate(-45deg) scale(.8, .8);
	-ms-transform: rotate(-45deg) scale(.8, .8);
	-o-transform: rotate(-45deg) scale(.8, .8);
	transform: rotate(-45deg) scale(.8, .8)
}

input[type=checkbox]:after {
	content: "";
	position: absolute;
	top: -2px;
	left: -3px;
	width: 1rem;
	height: 1rem;
	background: #fff;
	border: 2px solid rgba(95, 90, 185, .16);
	cursor: pointer
}

.contents {
	position: absolute;
	width: 970px;
	height: 860px;
	left: 210px;
	box-sizing: border-box;
	line-height: 15px;
}

.task_title {
	width: 830px;
	height: 45px;
	font-size: 18px;
	text-align: left;
	float: left;
	font-weight: 600;
	line-height: 33px;
}

.close {
	width: 100px;
	height: 32px;
	background-color: #5A3673;
	color: #F2F2F2;
	border: none;
	border-radius: 3px;
	margin-bottom: 10px;
}

.atask_list {
	position: absolute;
	width: 930px;
	/* padding-top: 30px; */
	margin: 0;
	height: 100%;
	background-color: #ffffff;
}

.board-listheader {
	font-size: 13px;
}

.board-listheader th {
	padding: 15px 0;
	vertical-align: middle;
	font-size: 14px;
}

.board-listheader thead {
	border-bottom: 1px solid #c0c0c0;
}

.board-listheader thead th {
	font-weight: 600;
	icon_task1
}
.menu_title.two {
	padding-top: 40px;
}

/* 업무 상태 */
.icon_task1 {
	background-color: #4aaefb;
}

.icon_task2 {
	background-color: #50b766;
}

.icon_task3 {
	background-color: #2e417e;
}

.icon_task4 {
	background-color: #d2d3d6;
}

.icon_task1, .icon_task2, .icon_task3, .icon_task4 {
	display: inline-block;
	width: 68px;
	height: 18px;
	line-height: 16px;
	font-size: 12px;
	color: #fff;
	font-weight: 700;
	text-align: center;
	border-radius: 2px;
}
</style>
</head>


<body>
	<div class="header">
		<div>헤더 들어갈 자리</div>
	</div>
	<div class="main">
		<div class="ptask_sidebar">
			<ul>
				<li class="menu">업무 구분</li>
				<li class="menu"><input type="radio" name="chk" value="1"
					id="id1"><label for="id1">내 업무</label></li>
				<li class="menu"><input type="radio" name="chk" value="2"
					id="id2"><label for="id2">요청한 업무</label></li>
				<li class="menu"><input type="radio" name="chk" value="3"
					id="id3"><label for="id3">전체 업무</label></li>


				<li class="menu_title two">상태</li>
				<li class="menu"><input type="radio" name="state" class="task"
					value="4" id="id4"><label for="id4"> 요청</label></li>
				<li class="menu"><input type="radio" name="state" class="task"
					value="5" id="id5"><label for="id5"> 진행</label></li>
				<li class="menu"><input type="radio" name="state" class="task"
					value="6" id="id6"><label for="id6"> 완료</label></li>
				<li class="menu"><input type="radio" name="state" class="task"
					value="7" id="id7"><label for="id7"> 보류</label></li>
			</ul>

		</div>


		<div class="contents">
			<input type="hidden" name="pno" id="pno" value="${pno}">
			<div class="ptask_section">
				<div class="task_title">전체 업무(${listCount})</div>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close" onclick="location.href='${pageContext.request.contextPath}/project/all/list'">닫기</button>
				<sec:authentication property="principal.uname" var="uname" />
				<input type="hidden" value="${uname}" id="uname">
				<div class="atask_list">
					<table id="tasktable" width="100%" class="board-listheader"
						cellpadding="0" cellspacing="0">

						<thead>
							<tr>
								<th>번호</th>
								<th>상태</th>
								<th>우선순위</th>
								<th width="40%;">제목</th>
								<th>담당자</th>
								<th>수정일</th>
							</tr>
						</thead>
						<c:forEach var="tasklist" items="${tasklist}" varStatus="status">
							<tr class="list">
								<th>${tasklist.rownum }</th>
								<th><c:choose>
										<c:when test="${tasklist.tstate  eq '1' }">
											<span class="icon_task1">요청</span>
										</c:when>
										<c:when test="${tasklist.tstate  eq '2' }">
											<span class="icon_task2">진행</span>
										</c:when>
										<c:when test="${tasklist.tstate  eq '3' }">
											<span class="icon_task3">완료</span>
										</c:when>
										<c:when test="${tasklist.tstate  eq '4' }">
											<span class="icon_task4">보류</span>
										</c:when>
									</c:choose></th>
								<th class="tpriority">${tasklist.tpriority }</th>
								<th style="text-align: left;"><a
									href="${pageContext.request.contextPath}/project/ptask?pno=${pno}&bno=${tasklist.bno}">
										${tasklist.boardalldto.bname}</a></th>
								<th class="taskmanager">${tasklist.taskmanager}</th>
								<th>${tasklist.boardalldto.bdate }</th>
							</tr>
						</c:forEach>
					</table>
				</div>

			</div>
		</div>

	</div>

	<script>
		$("input:radio[id='id1']").prop("checked", true);
		let header = $("meta[name='_csrf_header']").attr("content");
		let token = $("meta[name='_csrf']").attr("content");

		// 업무 구분
		$("#id1").click(function() {
			let pno = $('#pno').val();
			$("#id4").prop("checked", false);
			$("#id5").prop("checked", false);
			$("#id6").prop("checked", false);
			$("#id7").prop("checked", false);
			$.ajax({
				url : "${pageContext.request.contextPath}/project/taskmy",
				type : "POST",
				data : {
					pno : pno
				},
				beforeSend : function(xhr) {
					xhr.setRequestHeader(header, token); // 헤드의 csrf meta태그를 읽어 CSRF 토큰 함께 전송
				},
				success : function(list) {
					console.log(list);
					taskappend(list);
				}
			})
		})

		$("#id2").click(function() {
			let pno = $('#pno').val();
			$("#id4").prop("checked", false);
			$("#id5").prop("checked", false);
			$("#id6").prop("checked", false);
			$("#id7").prop("checked", false);
			$.ajax({
				url : "${pageContext.request.contextPath}/project/taskrequire",
				type : "POST",
				data : {
					pno : pno
				},
				beforeSend : function(xhr) {
					xhr.setRequestHeader(header, token); // 헤드의 csrf meta태그를 읽어 CSRF 토큰 함께 전송
				},
				success : function(list) {
					console.log(list);
					taskappend(list);
				}
			})
		})

		$("#id3").click(function() {
			let pno = $('#pno').val();
			$("#id4").prop("checked", false);
			$("#id5").prop("checked", false);
			$("#id6").prop("checked", false);
			$("#id7").prop("checked", false);
			$.ajax({
				url : "${pageContext.request.contextPath}/project/taskall",
				type : "POST",
				data : {
					pno : pno
				},
				beforeSend : function(xhr) {
					xhr.setRequestHeader(header, token); // 헤드의 csrf meta태그를 읽어 CSRF 토큰 함께 전송
				},
				success : function(list) {
					console.log(list);
					taskappend(list);
				}
			})
		})

		// 업무 리스트 append
		function taskappend(list) {
			$("#tasktable").text("");
			let html = "";
			html += '<thead><tr><th>번호</th><th>상태</th><th>우선순위</th><th width="40%;">제목</th><th>담당자</th><th>수정일</th></tr></thead>'
			for (let i = 0; i < list.length; i++) {
				html += "<tr class='list'>";
				html += "<th>" + list[i].rownum + "</th>";
				html += "<th>";
				if (list[i].tstate === "1") {
					html += '<span class="icon_task1">요청</span>';
				} else if (list[i].tstate === "2") {
					html += '<span class="icon_task2">진행</span>';
				} else if (list[i].tstate === "3") {
					html += '<span class="icon_task3">완료</span>';
				} else {
					html += '<span class="icon_task4">보류</span>';
				}
				html += '</th> <th class="tpriority">' + list[i].tpriority
						+ '</th>';
				html += '<th style="text-align: left;">'
						+ list[i].boardalldto.bname + '</th>';
				html += '<th class="taskmanager">' + list[i].taskmanager
						+ '</th>'
				html += '<th>' + list[i].boardalldto.bdate + '</th></tr>'
			}
			;
			$('#tasktable').append(html);
		};

		// 상태 분류
		$(document).on("click", "#id4", function() {
			$(".list").hide();
			$(".list").each(function(index) {
				let state1 = $(this).find('.icon_task1');
				if (state1.text() === "요청") {
					console.log("요청클릭")
					$(this).css("display", "table-row");
				}
			});
		});

		$(document).on("click", "#id5", function() {
			$(".list").hide();
			$(".list").each(function(index) {
				let state1 = $(this).find('.icon_task2');
				if (state1.text() === "진행") {
					console.log("진행클릭")
					$(this).css("display", "table-row");
				}
			});
		});

		$(document).on("click", "#id6", function() {
			$(".list").hide();
			$(".list").each(function(index) {
				let state1 = $(this).find('.icon_task3');
				if (state1.text() === "완료") {
					console.log("완료클릭")
					$(this).css("display", "table-row");
				}
			});
		});

		$(document).on("click", "#id7", function() {
			$(".list").hide();
			$(".list").each(function(index) {
				let state1 = $(this).find('.icon_task4');
				if (state1.text() === "보류") {
					console.log("보류클릭")
					$(this).css("display", "table-row");
				}
			});
		});
	</script>


</body>

</html>