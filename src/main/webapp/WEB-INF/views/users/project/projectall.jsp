<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="pjsidebar.jsp" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ontact, 서로 연결되는 온라인 공간</title>
<link href="${pageContext.request.contextPath}/resources/css/reset.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<style>
body {
	font-family: Noto Sans KR;
	font-size: 14px;
	line-height: 1.15;
	width: 1200px;
	margin: 0 auto;
}

#pj_board {
	margin: 20px auto 0 230px;
	width: 970px;
}

#pj_board a {
	text-decoration: none;
}

#pj_board>#pj_board_top {
	display: flex;
}

#pj_board>#pj_board_top>#section_company {
	width: 50%;
}

#pj_board>#pj_board_top>#section_team {
	width: 50%;
}

#pj_board>#pj_board_top>#section_project {
	display: flex;
	flex-direction: column;
}

#pj_board_bottom>#section_project>.pj_board_list {
	display: flex;
	flex-wrap: wrap;
}

.pj_title {
	font-size: 20px;
	padding-left: 30px;
}

/*개별 project */
.pj_box {
	position: relative;
	width: 222px;
	height: 190px;
	margin: 10px;
	color: #ffffff;
	background-color: #432d73;
	border-radius: 10px;
	box-sizing: border-box;
}

/*project명*/
.pj_box>div:first-child {
	font-size: 18px;
	font-weight: bold;
	max-height: 75px;
	padding: 20px;
	text-overflow: ellipsis;
	overflow: hidden;
}

/*부서명*/
.pj_box>.pj_team_list {
	width: 150px;
	height: 70px;
}

.pj_box>.pj_team_list>div {
	font-size: 12px;
	font-weight: 300;
	padding-left: 20px;
}

/*참여수*/
.pj_box>div:nth-child(3) {
	font-size: 13px;
	font-weight: bold;
	padding: 15px 0 0 20px;
}

/*scrollbar*/
/* width */
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

/*편집 버튼*/
#pj_edit {
	font-size: 12px;
	float: right;
	margin-right: 12px;
	line-height: 20px;
}

/*부서보관함 이동 화면*/
#pj_body {
	display: none;
	position: fixed;
	z-index: 20;
	padding-top: 100px;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgb(0, 0, 0);
	background-color: rgba(0, 0, 0, 0.4);
}

.pjCheck {
	display: block;
	z-index: 50;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 45px;
	height: 45px;
	cursor: pointer;
	border: none;
	background-image: url("icon/circle_white.svg");
	background-color: transparent;
}

/*modal_프로젝트 부서함 이동 모달*/
.pj-modal-move {
	display: none;
	position: fixed;
	z-index: 20;
	padding-top: 100px;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgb(0, 0, 0);
	background-color: rgba(0, 0, 0, 0.4);
}

/* Modal Content */
.pj-modal-move-content {
	position: relative;
	background-color: #fefefe;
	margin: auto;
	padding: 0;
	border: 1px solid #888;
	width: 23%;
	border-radius: 10px;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
	-webkit-animation-name: animatetop;
	-webkit-animation-duration: 0.4s;
	animation-name: animatetop;
	animation-duration: 0.4s;
}

.close {
	color: #333333;
	float: right;
	font-size: 20px;
	font-weight: bold;
	line-height: 50px;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

.pj-modal-move-header {
	padding: 2px 16px;
	background-color: #f4f4f4;
	color: #333333;
	border-radius: 10px 10px 0 0;
}

.pj-modal-move-body {
	padding: 0 16px;
	display: flex;
	flex-direction: column;
	height: 250px;
}

.pj-modal-move-body>div:first-child {
	margin: 12px;
	font-size: 12px;
}

/*부서보관함 선택*/
.pj-modal-move-body>.pj_team_move {
	height: 200px;
	width: 90%;
	margin: 5px auto;
}

.pj-modal-move-body>.pj_team_move>.pj_move_title {
	font-weight: 700;
	margin-bottom: 10px;
}

.pj-modal-move-body>.pj_team_move>.pj_move_title input[type=checkbox] {
	margin-right: 10px;
}

.pj-modal-move-body>.pj_team_move div:nth-child(2) {
	width: 90%;
}

.pj-modal-move-body>#pj_team_move_btn {
	width: 60%;
	height: 40px;
	margin: 15px auto;
	line-height: 40px;
	font-size: 14px;
	border-style: none;
	border-radius: 6px;
	cursor: pointer;
	display: inline-block;
	vertical-align: middle;
	color: #fff !important;
	font-weight: 700;
	text-align: center;
	background-color: #5a3673;
	box-sizing: border-box;
}
.lock_1{
	width: 20px;
	float: right;
}
</style>
<script>
	$(document).ready(function() {
		$(".pj_team_list").mouseover(function() {
			$(this).css("overflow-y", "scroll");
			// $(this).animate();
		});
		$(".pj_team_list").mouseout(function() {
			$(this).css("overflow-y", "hidden");
		});

		$("#pj_edit").click(function() {
			$("#pj_body").css("display", "block");
		});
		$(".pjCheck").click(function() {
			$(this).css("background-image", 'url("icon/check.svg")');
		});
	});
	// modal
	// window.onload = function () {
	//     var modal = document.getElementById("pjmoveModal");
	//     var btn = document.getElementById("pj_edit");
	//     var span = document.getElementsByClassName("close")[0];
	//     // When the user clicks the button, open the modal 
	//     btn.onclick = function () {
	//         modal.style.display = "block";
	//     }
	//     // When the user clicks on <span> (x), close the modal
	//     span.onclick = function () {
	//         modal.style.display = "none";
	//     }

	//     // When the user clicks anywhere outside of the modal, close it
	//     window.onclick = function (event) {
	//         if (event.target == modal) {
	//             modal.style.display = "none";
	//         }
	//     }
	// };

	/* 	$.ajax({
	 url: "${pageContext.request.contextPath}/project/all/list",
	 type: "GET",
	 contentType: "application/json; charset=utf-8;",
	 dataType: "json",
	 success: function(data){
	 console.log("aaa");
	 for(var i =0; i<data.length; i++){
	 $('.result').append('<span>' + data[i].pname + '</span>');
	 }
	 },
	 error: function(){
	 alert("projectlist err");
	 }
	 }); */
</script>

<body>
	<div id="pj_body"></div>
	<!-- The Modal -->
	<div id="pjmoveModal" class="pj-modal-move">
		<!-- Modal content -->
		<div class="pj-modal-move-content">
			<div class="pj-modal-move-header">
				<span class="close">&times;</span>
				<h3>보관함 설정</h3>
			</div>
			<div class="pj-modal-move-body">
				<div>이동할 보관함을 설정해주세요.</div>
				<div class="pj_team_move">
					<div class="pj_move_title">부서보관함 선택</div>
					<div>
						<div>
							<input type="checkbox">부서명
						</div>
						<div>
							<input type="checkbox">부서명
						</div>
						<div>
							<input type="checkbox">부서명
						</div>
					</div>
				</div>
				<button type="button" id="pj_team_move_btn">이동하기</button>
			</div>
		</div>
	</div>
	<!-- Section -->
	<section id="pj_board">
		<div id="pj_board_top">
			<div id="section_company">
				<div class="pj_title">All</div>
				<c:if test="${!empty pjc}">
					<a href="#">
						<div id="pj_company" class="pj_box">
							<div>${pjc.cname}</div>
							<div class="pj_team_list"></div>
							<div>
								<span>${pjc.ucnt}</span> <span>명 참여중</span>
							</div>
							<button type="button" title="선택" class="pjCheck"></button>
						</div>
					</a>
				</c:if>
			</div>
			<div id="section_team">
				<div class="pj_title">Team</div>
				<c:if test="${!empty pjd}">
					<a href="#">
						<div id="pj_team" class="pj_box">
							<div>${pjd.dname}</div>
							<div class="pj_team_list"></div>
							<div>
								<span>${pjd.ucnt}</span> <span>명 참여중</span>
							</div>
						</div>
					</a>
				</c:if>
			</div>
		</div>
		<hr>
		<div id="pj_board_bottom">
			<div id="section_project">
				<div class="pj_title">
					<span>Project</span> <span><a href="#" id="pj_edit">편집</a></span>
				</div>
				<div class="pj_board_list">
					<!-- 프로젝트가 하나도 없을 경우
					<c:if test="${empty listpj}">
					</c:if> -->
					<!-- 프로젝트가 있는 경우 -->
					<c:if test="${!empty listpj}">
						<c:forEach var="listpj" items="${listpj}" varStatus="status">
							<a href="#">
								<div id="pj_project" class="pj_box">
									<div>${listpj.pname}</div>
									<div class="pj_team_list">
										<div>${listpj.pjteam}</div>
									</div>
									<div>
										<span>${listpj.pjmembercnt}</span> <span>명 참여중</span>
									</div>
									 <c:if test="${listpj.popen == 0 }">
										<span> <svg version="1.1" class="lock_1"
												xmlns="http://www.w3.org/2000/svg"
												xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
												viewBox="0 0 60 60"
												style="enable-background: new 0 0 60 60; fill: #ffffff;"
												xml:space="preserve">
												<g>
													<path
													d="M43,20.113V14.5C43,6.505,35.822,0,27,0S11,6.505,11,14.5v5.613c-3.401,0.586-6,3.55-6,7.117v19.542
														C5,50.757,8.243,54,12.229,54h29.542C45.757,54,49,50.757,49,46.771V27.229C49,23.663,46.401,20.699,43,20.113z M13,14.5
														C13,7.607,19.28,2,27,2s14,5.607,14,12.5V20H13V14.5z M47,46.771C47,49.654,44.654,52,41.771,52H12.229C9.346,52,7,49.654,7,46.771
														V27.229C7,24.346,9.346,22,12.229,22h29.542C44.654,22,47,24.346,47,27.229V46.771z" />
													<path
													d="M27,28c-2.206,0-4,1.794-4,4v6c0,2.206,1.794,4,4,4s4-1.794,4-4v-6C31,29.794,29.206,28,27,28z M29,38c0,1.103-0.897,2-2,2
														s-2-0.897-2-2v-6c0-1.103,0.897-2,2-2s2,0.897,2,2V38z" />
												</g>
											</svg>
										</span>
									</c:if>
								</div>
							</a>
						</c:forEach>
					</c:if>
				</div>
			</div>
		</div>
	</section>
</body>

</html>