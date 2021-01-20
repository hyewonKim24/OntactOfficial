<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ontact, 서로 연결되는 온라인 공간 </title>
    <link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css">
    <link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
</head>
<style type="text/css">
    body{
        width:100%;
        height:100vh;
        background-image:url('${pageContext.request.contextPath}/resources/img/main.jpg');
        background-repeat: no-repeat;
        background-size:cover;
        position:relative;
        font-size: 14px;
        font-family: Noto Sans KR;
        line-height: 1.15;
    }
    header{
        height:60px;
        display:flex;
        justify-content: space-between;
        margin:0px 20px;
    }
    h2{
        color:white;
    }
    #login{
        border-radius:10px;
        background:#432D73;
        color:#fff;
        border:none;
        position:relative;
        height:40px;
        padding:0 2em;
        cursor:pointer;
        font-size:14px;
        position:relative;
        top:10px;
    }
    h3{
        color:white;
        font-size:35px;
        text-align: center;
        position:relative;
        line-height: 160%;
        letter-spacing:-0.9px;
        top:220px;
    }
    .btn{
        top:250px;
        position: relative;
        display:flex;
        justify-content: space-around;
    }
    .btn__join{
        border-radius:10px;
        background:#432D73;
        color:#fff;
        border:none;
        position:relative;
        width:155px;
        height:60px;
        padding:0 10px;
        cursor:pointer;
        font-size:18px;
        font-weight: bold;
    }
    .txt{
        top:280px;
        position: relative;
        display:flex;
        justify-content: space-around;
    }
    .txt__join{
        color:white;
        /* font-weight:bold; */
        font-size:19px; 
        margin-right:18px;
    }
    
</style>

<body>

    <header>
	    <h2>ONTACT</h2>
	    <sec:authorize access="isAnonymous()">
	        <button id="login"  onclick="location.href ='${pageContext.request.contextPath}/main/loginform'">로그인</button>
	    </sec:authorize>
    	<sec:authorize access="isAuthenticated()">
			<form action="${pageContext.request.contextPath}/main/logout" method="POST">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        		<button type="submit" id="login">로그아웃</button>
			</form>    	
    	</sec:authorize>
    </header>
    <section>
	<h3>컨택트에서 언택트로<br>
        이젠 서로 연결되는 온라인 공간 ontact로</h3>
        <sec:authorize access="isAnonymous()">
        <div class="btn">
            <button class="btn__join" onclick="location.href='${pageContext.request.contextPath}/main/busjoin'">비즈니스 계정</button>
            <button class="btn__join" onclick="location.href='${pageContext.request.contextPath}/main/guestjoin'">게스트 계정</button>
        </div>
        <div class="txt">
            <div class="txt__join">온택트 공간 개설하기</div>
            <div class="txt__join">온택트 입장하기</div>
        </div>
        </sec:authorize>
        <%-- <sec:authorize access="isAuthenticated()">
        	<div id="info"><sec:authentication property="principal.uname" var="name"/>님, 반갑습니다.</div>
        	<sec:authentication property="principal.cno" var="cno"/>
        	<input type="text" value="${name}">
        	<input type="text" value="${cno }">
        	<sec:authentication property="principal" var="principal"/>
			<input type="text" value="${principal }">
			<sec:authentication property="principal.username"/>
        	
        </sec:authorize> --%>
    </section>
</body>
</html>