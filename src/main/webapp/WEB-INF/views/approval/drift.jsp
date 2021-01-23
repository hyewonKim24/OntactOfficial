<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="${pageContext.request.contextPath}/resources/css/reset.css"
	rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<style>
a {
	text-decoration: none;
}

/*헤더부분*/
header {
	background-color: #F2F2F2;
	display: flex;
	position: relative;
	height: 60px;
	padding: 0 32px;
	top: 0;
	left: 0;
	right: 0;
}

.container {
			position: relative;
    width: 1200px;
    height: 100%;
    margin: 0 auto;
}

.wrap_title {
	display: flex;
	flex: 1;
}

.doc_title {
	display: flex;
	align-items: center;
	font-size: 20px;
}

.util_user {
	padding-top: 11px;
	line-height: 0;
}

.userinfo {
	display: inline-block;
	font-size: 14px;
	color: #505050;
}

.userprofile {
	vertical-align: middle;
	display: inline-block;
	margin-left: 16px;
}

.userprofile .icon {
	width: 29px;
	height: 29px;
}

/*헤더부분 END*/

/*aside부분*/
		#apaside {
			width: 210px;
			height: 100%;
			background-color: #F2F2F2;
			display: inline-block;
			position: absolute;
			/* padding-top: 24px; */
		}

		/* .menu {
			padding: 17px 44px 14px 32px;
		} */

		.menu li a {
			padding: 16px 0 16px 19px;
		}

/* 		.menu_list:nth-child(1) {
			border-bottom: none;
		}

		.menu_list {
			border: 1px solid black;
		}
 */
 
 		.menu_list:hover{
 			background-color: #e7e7e7;
 		}
		.link_menu {
			text-decoration: none;
			display: block;
			position: relative;
			min-height: 55px;
			padding: 17px 44px 14px 32px;
			box-sizing: border-box;
			color: #333333;
			font-size: 14px;
			font-weight: 600;
		}
/*aside부분 END*/

/*section부분  */
.page_section {
    position: absolute;
    width: 970px; 
    height: 860px;
    left: 210px;
    padding: 40px 0 40px 40px;
    border-left: 1px solid #e7e7e7;
    box-sizing: border-box;
}

/*section부분 END */
.main_section {
	padding-top: 30px;
}

.board-listheader {
	font-size: 13px;
	line-height: 140%;
}

.board-listheader td {
	padding: 5px 0;
	vertical-align: middle;
	font-size: 12px;
	border: 1px solid #c0c0c0;
}

.board-listheader tbody tr {
	text-align: center;
}

.apwrite {
	float: right;
	padding-top: 20px;
}



.n_title {
	padding: 20px 0;
	font-weight: 600;
}

.board_apL {
	font-size: 15px;
	text-align: left;
	display: inline-block;
}

.board_apL td {
	padding: 7px;
}

.board_apR {
	display: inline-block;
	font-size: 14px;
	padding-left: 500px;
}

.board_apR td {
	border: 1px solid #c0c0c0;
}

/*모달*/
#new_pj_btn {
	width: 100px;
	line-height: 30px;
	text-align: center;
	border: 1px solid #5A3673;
	background-color: #5A3673;
	color: #fff;
	font-size: 12px;
}
#new_pj_btn_a {
	width: 100px;
	line-height: 30px;
	text-align: center;
	border: 1px solid #5A3673;
	background-color: #5A3673;
	color: #fff;
	font-size: 12px;
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

.sb-modal {
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

.sb-modal-content {
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

.sb-modal-header {
	padding: 2px 16px;
	background-color: #f4f4f4;
	color: #333333;
	border-radius: 10px 10px 0 0;
}

.sb-modal-body {
	width: 100%;
    /* padding: 2px 16px; */
    display: flex;
    flex-direction: column;
    height: 200px;
    display: inline-block;
    margin: 0 auto;
    text-align: center;
}

.sb-modal-body>#stateupdate {
	width: 22%;
	height: 45px;
	margin-right: 20px;
	line-height: 25px;
	font-size: 13px;
	border: 1px solid black;
	border-radius: 6px;
	cursor: pointer;
	display: inline-block;
	vertical-align: middle;
	color: black;
	font-weight: 600;
	text-align: center;
	background-color: white;
}
.close_a{
	width: 22%;
	height: 45px;
	margin: 0 auto;
	line-height: 25px;
	font-size: 13px;
	border: 1px solid black;
	border-radius: 6px;
	cursor: pointer;
	display: inline-block;
	vertical-align: middle;
	color: black;
	font-weight: 600;
	text-align: center;
	background-color: white;
}
.cclose {
	color: #333333;
	float: right;
	font-size: 20px;
	font-weight: bold;
	line-height: 50px;
}
.cclose:hover, .cclose:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

.ssb-modal {
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

.ssb-modal-content {
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

.ssb-modal-header {
	padding: 2px 16px;
	background-color: #f4f4f4;
	color: #333333;
	border-radius: 10px 10px 0 0;
	text-align: center;
}

.ssb-modal-body {
	width: 100%;
    /* padding: 2px 16px; */
    display: flex;
    flex-direction: column;
    height: 125px;
    display: inline-block;
    margin: 0 auto;
    text-align: center;
}

.ssb-modal-body>#stateupdatea {
	width: 22%;
	height: 45px;
	margin-right: 20px;
	line-height: 25px;
	font-size: 13px;
	border: 1px solid black;
	border-radius: 6px;
	cursor: pointer;
	display: inline-block;
	vertical-align: middle;
	color: black;
	font-weight: 600;
	text-align: center;
	background-color: white;
}
.cclose_a{
	width: 22%;
	height: 45px;
	margin: 0 auto;
	line-height: 25px;
	font-size: 13px;
	border: 1px solid black;
	border-radius: 6px;
	cursor: pointer;
	display: inline-block;
	vertical-align: middle;
	color: black;
	font-weight: 600;
	text-align: center;
	background-color: white;
}
#pname{
	text-align: center;
	padding: 15px 0 15px 0;
}
</style>
<title>ontact, 서로 연결되는 온라인 공간</title>
</head>

<body>

	<header>
		<div class="wrap_title">
			<h1 class="doc_title">
				<a href="#" style="color: black;">전자결재</a>
			</h1>
		</div>
		<div class="util_user">
			<div class="userinfo">
				<strong>사용자명</strong>
			</div>
			<div class="userprofile">
				<a href="#"><img src="./img/user3.png" class="icon"></a>
			</div>

		</div>
	</header>

	<div class="container">
		<input type="hidden" name="apno" value="${apno.apno}">
		<div id="apaside">
			<ul class="menu">
				<li class="menu_list"><a href="${pageContext.request.contextPath}/project/driftlist" class="link_menu">전자결재
						기안함</a></li>
				<li class="menu_list"><a href="#" class="link_menu">전자결재
						결재함</a></li>
			</ul>
		</div>



		<div class="page_section">
			<h2>전자결재 결재함</h2>
			<hr>
			<div class="main_section">
				<h2>${apno.apformat }</h2>
				<table class="board_apL">
					<tr>
						<td>문서번호</td>
						<td>${apno.apno }</td>
					</tr>
					<tr>
						<td>기안부서</td>
						<td>
						<c:choose>
								<c:when test="${apno.dno eq '1' }">개발팀</c:when>
								<c:when test="${apno.dno eq '2' }">기획팀</c:when>
								<c:when test="${apno.dno eq '3' }">영업팀</c:when>
								<c:when test="${apno.dno eq '4' }">마케팅팀</c:when>
						</c:choose>
						</td>
					</tr>
					<tr>
						<td>기안자</td>
						<td>${apno.apdrafter }</td>
					</tr>
					<tr>
						<td>기안 일시</td>
						<td>${apno.apdate }</td>
					</tr>
				</table>

				<table class="board_apR">
					<tr>
						<td style="border: 0; padding-bottom: 10px;">결재</td>
					</tr>
					<tr>
						<td style="padding: 3px 50px; text-align: center;">팀장</td>
					</tr>
					<tr>
						<td style="padding: 30px 0; text-align: center;">A</td>
					</tr>
					<tr>
						<td style="padding: 3px 50px; text-align: center;">${apno.apperson }</td>
					</tr>

				</table>

				<hr style="border: solid #dedede; border-width: 1px 0 0;">

				<div class="n_title">${apno.aptitle }</div>

				<!-- <table width="100%" align="center" cellpadding="0" cellspacing="0"> -->
				<table width="100%" class="board-listheader" cellpadding="0"
					cellspacing="0">
					<tr>
						<td>프로젝트</td>
						<td colspan="3">${apno.apptitle }</td>
					</tr>
					<tr>
						<td>장소</td>
						<td>${apno.applace }</td>
						<td>일시</td>
						<td>${apno.apstate }</td>
					</tr>
					<tr>
						<td>참석자</td>
						<td colspan="3">${apno.apattend }</td>
					</tr>
					<tr>
						<td>회의 내용</td>
						<td colspan="3">${apno.apcontent }</td>
					</tr>
					<tr>
						<td>결정사항</td>
						<td colspan="3">${apno.apdec }</td>
					</tr>
					<tr>
						<td>기타</td>
						<td colspan="3">${apno.apetc }</td>
					</tr>

				</table>
			</div>

	
			
			<script>
	
			window.onload = function() {
				var mmodal = document.getElementById("newpjModal_a");
				var bbtn = document.getElementById("new_pj_btn_a");
				var sspan = document.getElementsByClassName("cclose")[0];
				var sspan2 = document.getElementsByClassName("cclose_a")[0];
				/* var btn2 = document.getElementById("stateupdate"); */
				// When the user clicks the button, open the modal 
				bbtn.onclick = function() {
					mmodal.style.display = "block";
				}
				// When the user clicks on <span> (x), close the modal
				sspan.onclick = function() {
					mmodal.style.display = "none";
				}
				sspan2.onclick = function() {
					mmodal.style.display = "none";
				}
				// When the user clicks anywhere outside of the modal, close it
				window.onclick = function(event) {
					if (event.target == mmodal) {
						mmodal.style.display = "none";
					}
				}
				/* btn2.onclick = function(event) {
					location.href = 'stateupdate?apno=${apno.apno }'
				} */
				/* 결재완료 모달 */
				var modal = document.getElementById("newpjModal");
					var btn = document.getElementById("new_pj_btn");
					var span = document.getElementsByClassName("close")[0];
					var span2 = document.getElementsByClassName("close_a")[0];
					var btn2 = document.getElementById("stateupdate");
					// When the user clicks the button, open the modal 
					btn.onclick = function() {
						modal.style.display = "block";
					}
					// When the user clicks on <span> (x), close the modal
					span.onclick = function() {
						modal.style.display = "none";
					}
					span2.onclick = function() {
						modal.style.display = "none";
					}
					// When the user clicks anywhere outside of the modal, close it
					window.onclick = function(event) {
						if (event.target == modal) {
							modal.style.display = "none";
						}
					}
					btn2.onclick = function(event) {
						location.href = 'stateupdate?apno=${apno.apno }'
					}
			};
			
			</script>
			<div class="apwrite">
				<button type="button" id="new_pj_btn_a" name="apwritebtn" onclick="newpjModal_a">반려</button>
				
				<div id="newpjModal_a" class="ssb-modal">
					<!-- Modal content -->
					<div class="ssb-modal-content">
						<div class="ssb-modal-header">
							<span class="cclose">&times;</span>
							<h4>반려사유입력</h4>
						</div>
						<form action="${pageContext.request.contextPath}/updateaprejection" method="get">
						<input type="hidden" name="apno" value="${apno.apno}">
						<div id="pname">
							<textarea cols="40" rows="8" placeholder="반려 사유를 입력해주세요(50자 내외)" name="aprejection" style="resize: none;"></textarea>
							</div>
							<div class="ssb-modal-body">
							
								<input type="submit" id="stateupdatea" value="확 인" /> 
								<input type="button" class="cclose_a" value="취 소" />
								</div>
								</form>
					</div>
				</div> 
					 
				<%-- <button type="button" id="apwritebtn" onclick="window.location='stateupdate?apno=${apno.apno }'">결재완료</button> --%>
				<button type="button" id="new_pj_btn" onclick="newpjModal">결재완료</button>

				<div id="newpjModal" class="sb-modal">
					<!-- Modal content -->
					<div class="sb-modal-content">
						<div class="sb-modal-header">
							<span class="close">&times;</span>
						</div>
							<div class="sb-modal-body">
							<h5>결재 하시겠습니까</h5>
								<input type="submit" id="stateupdate" value="확 인" /> 
								<input type="button" class="close_a" value="취 소" />
							</div>
					</div>
				</div> 
			</div>

		</div>
	</div>


</body>

</html>