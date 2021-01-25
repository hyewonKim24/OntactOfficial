<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="kr">

<head>
<meta charset="UTF-8">
 <!-- 파비콘 -->
    <link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/resources/img/favicon/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/resources/img/favicon/favicon-16x16.png">
	<link rel="manifest" href="${pageContext.request.contextPath}/resources/img/favicon/site.webmanifest">
	<meta name="msapplication-TileColor" content="#da532c">
	<meta name="theme-color" content="#ffffff">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400&display=swap"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css">
<title>ontact, 서로 연결되는 온라인 공간</title>

<style>
body {
	width:100%;
	font-size: 14px;
	font-family: Noto Sans KR;
	line-height: 1.15;
}
input:focus{
outline:none;}

header {
	min-width: 350px;
	height: 60px;
	display: flex;
	justify-content: space-between;
	padding: 0px 20px;
}

.title {
	display: flex;
}

.title__logo {
	margin: 0 0 0 0;
	line-height: 60px;
}

.title__func {
	margin: 0 0;
	font-size: 17px;
	line-height: 60px;
}


#login {
	border-radius: 10px;
	background: #432D73;
	color: #fff;
	border: none;
	position: relative;
	height: 40px;
	padding: 0 2em;
	cursor: pointer;
	font-size: 14px;
	position: relative;
	top: 10px;
}

section{
min-width:620px;
}

#pwfinder {
	padding: 110px 0;
}

#pwfinder__desc {
	font-size: 26px;
	text-align: center;
	margin-bottom: 15px;
}

#pwfinder__desc2 {
	text-align: center;
	font-size: 14px;
	margin-bottom: 40px;
}

#pwfinder__wrapper {
	width: 380px;
	height: 171px;
	padding: 80px 60px;
	margin: 0 auto;
	background-color: #F2F2F2;
	position: relative;
}

#pwfinder__wrapper2 {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

#uemail {
	width: 320px;
	height: 40px;
	padding: 0px 5px;
	font-size: 14px;
	vertical-align: top;
	text-align: left;
	margin: 5px 0 10px 0;
	border: 1px solid #ccc;
	line-height: 20px;
	border-radius: 3px;
}

#pwfinder__wrappertext {
	font-size: 17px;
	padding-bottom: 5px;
}

#button__wrpper {
	text-align: center;
	margin-top: 20px;
}

#pwbtn {
	border-radius: 10px;
	background: #432D73;
	color: #fff;
	border: none;
	height: 50px;
	padding: 0 2em;
	cursor: pointer;
	font-size: 15px;
}

.signup-errors {
	font-size: 13px;
	line-height: 90%;
	color: red;
	padding-bottom:10px;
	/* margin: -30px 0; */
}
</style>
</head>

<body>
	<header>
		<div class="title">
			<h2 class="title__logo">ONTACT&nbsp;&nbsp;|</h2>
			<h2 class="title__func">&nbsp;&nbsp;비밀번호 찾기</h2>
		</div>
		<div class="title">
			<button id="login" onclick="location.href ='${pageContext.request.contextPath}/main/loginform'">로그인</button>
		</div>
	</header>
	<section>
		<hr>
		<div id="pwfinder">
			<div id="pwfinder__desc">비밀번호를 잊으셨나요?</div>
			<div id="pwfinder__desc2">기존에 가입하신 이메일을 입력하시면, 임시비밀번호가 발송됩니다.</div>
			<div id="pwfinder__wrapper">
				<form:form role="form" id="pwfinder__wrapper2"
					commandName="pwdRegisterRequest" method="post"
					action="${pageContext.request.contextPath}/main/pwdforgetmail">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<div id="pwfinder__wrappertext">이름</div>
					<form:input type="text" path="uname" id="uemail" placeholder="기존에 가입하신 이름을 입력해주세요." />
					<form:errors path="uname" cssClass="signup-errors" /><br/><br/>
					<div id="pwfinder__wrappertext">이메일</div>
					<form:input type="text" path="uemail" id="uemail" placeholder="기존에 가입하신 이메일을 입력해주세요." />
					<form:errors path="uemail" cssClass="signup-errors" />
					<div id="button__wrpper">
						<input type="submit" id="pwbtn" value="비밀번호 재설정하기">
					</div>
				</form:form>
			</div>
		</div>
	</section>
</body>

</html>