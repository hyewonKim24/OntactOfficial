<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ontact, 서로 연결되는 온라인 공간</title>
<link href="/css/reset.css" rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js">
    </script>
<script>
    /* 	입력값 가져오기 */
    function printName() {
        const name = document.getElementById('name').value;
        document.getElementById("result").innerText = name;
    }
    </script>



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
	overflow: hidden;
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
	width: 240px;
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

.menu_list:nth-child(1) {
	border-bottom: none;
}

.menu_list {
	border: 1px solid black;
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
	padding-left: 280px;
	padding-right: 100px;
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

/* .board-listheader tbody tr td {
			padding-top: 20px;
			padding-bottom: 20px;
		} */
.apwrite {
	float: right;
	padding-top: 20px;
}

#apwritebtn {
	width: 100px;
	line-height: 30px;
	text-align: center;
	border: 1px solid #5A3673;
	background-color: #5A3673;
	color: #fff;
	font-size: 12px;
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
		<div id="apaside">
			<ul class="menu">
				<li class="menu_list"><a href="#" class="link_menu">전자결재
						기안함</a></li>
				<li class="menu_list"><a href="#" class="link_menu">전자결재
						결재함</a></li>
			</ul>
		</div>


	<form action="${pageContext.request.contextPath}/appinsert" method="post" enctype="tmultipart/form-data">
		<div class="page_section">
			<h2>기안 작성하기</h2>
			<hr>
			<div class="main_section">
					<div>
						문서형식 <select class="opt_bt" name="APFORMAT" >
							<option value="선택하세요">선택하세요</option>
							<option value="test">test</option>
							<option value="test">test</option>
						</select> 결제자 <select class="opt_bt" name="APPERSON">
							<option value="선택하세요">선택하세요</option>
							<option value="test">김혜원</option>
							<option value="test">수령동지</option>
						</select>
					</div>

					<div>
						기안부서 <select class="opt_bt" name="DNO">
							<option value="선택하세요">선택하세요</option>
							<option value="개발팀">개발팀</option>
							<option value="영업팀">영업팀</option>
						</select> 기안자 <input type="text" name="APDRAFTER">
						 기안 일시 <input type="date" id="name" onchange="printName()" name="apdate">
					</div>
					<hr>


					<input type="text" name="APTITLE" placeholder="기안 제목을 입력하세요">

					<!-- <table width="100%" align="center" cellpadding="0" cellspacing="0"> -->
					<table width="100%" class="board-listheader" cellpadding="0"
						cellspacing="0">
						<tr>
							<td>프로젝트</td>
							<td colspan="3"><input type="text" name="APPTITLE"
								style="width: 90%; border: 0;"></td>
						</tr>
						<tr>
							<td>장소</td>
							<td><input type="text" name="APPLACE"
								style="width: 90%; border: 0;"></td>
							<td>일시</td>
							<td id="result"></td>
						</tr>
						<tr>
							<td>참석자</td>
							<td colspan="3"><input type="text" name="APATTEND" style="width: 90%; border: 0;"></td>
						</tr>
						<tr>
							<td>회의 내용</td>
							<td colspan="3"><textarea name="APCONTENT"
									style="resize: none; width: 90%; height: 100%; border: 0;"></textarea>
							</td>
						</tr>
						<tr>
							<td>결정사항</td>
							<td colspan="3"><input type="text" name="APDEC"
								style="width: 90%; border: 0;"></td>
						</tr>
						<tr>
							<td>기타</td>
							<td colspan="3"><input type="text" name="APETC"
								style="width: 90%; border: 0;"></td>
						</tr>

					</table>
					
			</div>
			
			<div class="apwrite">
				<button type="submit" id="apwritebtn" name="apwritebtn">기안
					등록하기</button>
				<button type="button" id="apwritebtn" name="apwritebtn">취소</button>
			
			</div>

		</div>
		<sec:csrfInput />
		</form>
	</div>



</body>

</html>