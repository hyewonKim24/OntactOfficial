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

		.board-listheader th {
			padding: 20px 0;
			vertical-align: middle;
			font-size: 12px;
			border: 1px solid #c0c0c0;
			background: #e8e8e8;
		}

		.board-listheader td {
			padding: 20px 0;
			vertical-align: middle;
			font-size: 12px;
			border: 1px solid #c0c0c0;
		}
		.board-listheader tbody tr {
			text-align: center;
		}	
		.board-listheader tbody tr td {
			padding-top: 20px;
			padding-bottom: 20px;
		}
		.section_title{
			padding-bottom: 10px;
			display: inline-block;
		}

		.apwritebtn{
			float: right;
			padding-top: 20px;
		}
		#apwritebtn{
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
				<li class="menu_list"><a href="#" class="link_menu">전자결재 기안함</a></li>
				<li class="menu_list"><a href="#" class="link_menu">전자결재 결재함</a></li>
			</ul>
		</div>



		<div class="page_section">
			<h2>전자결재 기안함</h2>
			<hr>
			<div class="main_section">
				<span class="section_title">결재요청건 ${listCount }건</span>
				<!-- <table width="100%" align="center" cellpadding="0" cellspacing="0"> -->
						<table width="100%" class="board-listheader" cellpadding="0" cellspacing="0">
							<thead>
								<tr>
									<th width="40%;">기안제목</th>
									<!-- <th width="50%;">제목</th> -->
									<th>기안자</th>
									<th>결재상태</th>
									<th>결재요청일</th>
								</tr>
							</thead>
						<c:forEach var="vo" items="${list}" varStatus="status">
							<tr>
								<td></td>
								<td>${vo.apattenda }</td>
								<td></td>
								<td>${vo.apdate }</td>
							</tr>
							
							</c:forEach>

						</table>
			</div>
				<div class="apwritebtn">
				<button type="button" id="apwritebtn" name="apwritebtn" onclick="window.location='driftform'">기안작성하기</button>
				</div>

		</div>
	</div>


</body>

</html>