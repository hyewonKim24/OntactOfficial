<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="reset.css" rel="stylesheet">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
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
		.n_title{
			padding: 20px 0;
			font-weight: 600;
		}
		.board_apL{
			font-size: 15px;
			text-align: left;
			display: inline-block;
		}
		.board_apL td{
			padding: 7px;
		}
		.board_apR{
			display: inline-block;
			font-size: 14px;
			padding-left: 500px;
		}
		.board_apR td{
			border: 1px solid #c0c0c0;

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
				<li class="menu_list"><a href="#" class="link_menu">전자결재 기안함</a></li>
				<li class="menu_list"><a href="#" class="link_menu">전자결재 결재함</a></li>
			</ul>
		</div>



		<div class="page_section">
			<h2>전자결재 결재함</h2>
			<hr>
			<div class="main_section">
				<h2>품의서</h2>
				<table class="board_apL">
					<tr>
						<td>문서번호</td>
						<td>1235124365</td>
					</tr>
					<tr>
						<td>기안부서</td>
						<td>개발팀</td>
					</tr>
					<tr>
						<td>기안자</td>
						<td>김또치</td>
					</tr>
					<tr>
						<td>기안 일시</td>
						<td>2020-10-10</td>
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
						<td style="padding: 30px 0; text-align: center;">text</td>
					</tr>
					<tr>
						<td style="padding: 3px 50px; text-align: center;">누구누구</td>
					</tr>
		
				</table>

				<hr style="border: solid #dedede; border-width: 1px 0 0; ">

				<div class="n_title">OT001-01 디바이스 외주 생산업체선정</div>

				<!-- <table width="100%" align="center" cellpadding="0" cellspacing="0"> -->
					<table width="100%" class="board-listheader" cellpadding="0" cellspacing="0">
						<tr>
							<td>프로젝트</td>
							<td colspan="3">내용</td>
						</tr>
						<tr>
							<td>장소</td>
							<td>소회의실</td>
							<td>일시</td>
							<td>2020-10-10</td>
						</tr>
						<tr>
							<td>참석자</td>
							<td colspan="3">김아무개,김둘리,이또치</td>
						</tr>
						<tr>
							<td>회의 내용</td>
							<td colspan="3"> 1.회의내용</td>
						</tr>
						<tr>
							<td>결정사항</td>
							<td colspan="3">결정사항</td>
						</tr>
						<tr>
							<td>기타</td>
							<td colspan="3">결정사항</td>
						</tr>

					</table>
			</div>
			<div class="apwrite">
				<button type="button" id="apwritebtn" name="apwritebtn">반려</button>
				<button type="button" id="apwritebtn" name="apwritebtn">결재완료</button>
			</div>

		</div>
	</div>


</body>

</html>