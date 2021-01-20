<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ include file="../main/header.jsp" %>
<%@ include file="../project/pjsidebar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ontact, 서로 연결되는 온라인 공간</title>
<style>
body{
	background: rgb(242, 242, 242);
}
#result-search-wrap{
    position: relative;
    width: 900px;
    height: 100%;
    margin: 80px auto 0 230px;
    float: left;
}

#result-search-word{
	font-size:18px;
    padding: 6px 0 20px 20px;
    border-bottom:1px solid #e7e7e7;
}
#result-search-contents{
	width: 900px;
	height: 150px;
	background-color: #fff;
    border-bottom:1px solid #e7e7e7;
}
#result-search-project{
	font-size:18px;
	padding:20px;
    border-bottom:1px solid #e7e7e7;
}
</style>
</head>
<body>
<div id="result-search-wrap">
	<div id="result-search-word">
		 <strong> '글'</strong>&nbsp;&nbsp;검색결과(전체)
	</div>
	<div id="result-search-contents">
		<div id="result-search-project">
			ontact 업무 공유방
		</div>
		<div id="result-search-project-content">
			
		</div>
	</div>

</div>

</body>
</html>