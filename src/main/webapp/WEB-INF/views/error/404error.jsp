<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="True"%>
<%@ include file="../main/header.jsp"%>
<%
response.setStatus(HttpServletResponse.SC_OK);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ontact, 서로 연결되는 온라인 공간</title>
<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
	width:100% !important;
	position: fixed;
	color: #333333;
	font-size: 14px;
	line-height: 1.15;
	background-color:#ffffff;
}
.error_wrap{
	width: 1080px;
	margin: 0 auto;
	text-align: center;
	padding-top:200px;
}
.error_title{
	font-size: 1.17em;
	font-weight: bold;
}
.error_contents{
	font-size: 12px;
	color: gray;
}
.error_btn{
	border: 1px solid #425c5a;
	background-color: #fff;
	color: #432D73;
	display: inline-block;
	width: 120px;
	margin-left: 5px;
	vertical-align: top;
	margin-top: 5px;
	height: 44px;
	border-radius: 3px;
	font-weight: 700;
	font-size: 14px;
	line-height: 40px;
	text-align: center;
	height: 44px;
}
</style>
</head>
<body>
<div class="error_wrap">
<svg width="200px" height="200px" viewBox="0 0 17 16" class="bi bi-exclamation-triangle-fill" fill="#432D73" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5a.905.905 0 0 0-.9.995l.35 3.507a.552.552 0 0 0 1.1 0l.35-3.507A.905.905 0 0 0 8 5zm.002 6a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
</svg><br>
<p class="error_title">404 페이지를 찾을 수 없습니다.</p><br>
<p class="error_contents">죄송합니다. 기술적인 문제로 일시적으로 접속되지 않았습니다.<br>
잠시 후 다시 이용 부탁드리며 이용에 불편을 드려 사과드립니다.</p><br>
<!-- 로그인 된 사람 -->
<sec:authorize access="isAuthenticated()">
	<button type="button" onclick="location.href='<%=request.getContextPath()%>/project/all/list';" class="error_btn">ONTACT 메인</button>
</sec:authorize>
<!-- 로그인 안된 사람 -->
<sec:authorize access="isAnonymous()">
	<button type="button" onclick="location.href='<%=request.getContextPath()%>/main';" class="error_btn">ONTACT 메인</button>
</sec:authorize>

</div>
<br><br><br><br><br>
</body>
</html>