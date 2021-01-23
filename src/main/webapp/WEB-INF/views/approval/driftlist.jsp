<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet">
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
    /* width: 970px; */
    height: 860px;
    left: 210px;
    padding: 40px 0 40px 40px;
    border-left: 1px solid #e7e7e7;
    box-sizing: border-box;

		}

		/*section부분 END */
		.main_section {
			padding-top: 30px;
			    width: 970px;

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
			cursor: pointer;

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
				<li class="menu_list"><a href="${pageContext.request.contextPath}/project/driftlist" class="link_menu">전자결재 기안함</a></li>
				<li class="menu_list"><a href="#" class="link_menu">전자결재 결재함</a></li>
			</ul>
		</div>



		<div class="page_section">
			<div>
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
									<th>반려사유</th>
								</tr>
							</thead>
							<c:if test="${not empty list}">
						<c:forEach var="vo" items="${list}" varStatus="status">
							<tr>
								<td><a href="drift?apno=${vo.apno}&page=${currentPage}">
								${vo.aptitle }</a></td>
								<td>${vo.apdrafter }</td>
								<td>
								<c:choose>
								<c:when test="${vo.apstate eq '2' }">반려</c:when>
								<c:when test="${vo.apstate eq '1' }">결재완료</c:when>
								<c:when test="${vo.apstate eq '0' }">결재대기</c:when>
								</c:choose>
								</td>
								<td>${vo.apdate }</td>
								<td>${vo.aprejection }</td>
							</tr>
							</c:forEach>
							</c:if>

						<tr>
							<td colspan="6"><c:if test="${currentPage <= 1}">
						&lt; &nbsp;
						</c:if> <c:if test="${currentPage > 1}">ssss
									<c:url var="dailyprev" value="/driftlist">
										<c:param name="page" value="${currentPage-1}" />
									</c:url>
									<a href="${dailyprev}">&lt; &nbsp; &nbsp; &nbsp; </a>
								</c:if> <!-- 끝 페이지 번호 처리 --> <c:set var="endPage" value="${maxPage}" />
								<c:forEach var="p" begin="${startPage+1}" end="${endPage}">
									<!-- eq : == / ne : != -->
									<c:if test="${p eq currentPage}">
										<font color="red" size="4"><b>${p} &nbsp; &nbsp;
												&nbsp;</b></font>
									</c:if>
									<c:if test="${p ne currentPage}">
										<c:url var="dailychk" value="/driftlist">
											<c:param name="page" value="${p}" />
										</c:url>
										<a href="${dailychk}">${p} &nbsp; &nbsp; &nbsp;</a>
									</c:if>
								</c:forEach> <c:if test="${currentPage >= maxPage}"> &nbsp; &gt;
							</c:if> <c:if test="${currentPage < maxPage}">
									<c:url var="dailynext" value="/driftlist">
										<c:param name="page" value="${currentPage+1}" />
									</c:url>
									<a href="${dailynext}">&nbsp; &gt;</a>
								</c:if></td>
						</tr>
						</table>
						</div>
			</div>
				<div class="apwritebtn">
				<button type="button" id="apwritebtn" name="apwritebtn" onclick="window.location='driftform'">기안작성하기</button>
				</div>

		</div>
	</div>


</body>

</html>