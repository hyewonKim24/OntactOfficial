<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ontact, 서로 연결되는 온라인 공간 </title>
    <link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css">
    <link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
    rel="stylesheet">
    <style type="text/css">
    body{
        width:100%;
        height:100vh;
        background-image:url("${pageContext.request.contextPath}/resources/img/login2.jpg");
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
    #joinbtn{
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
    #login{
    padding-top: 150px;
    margin: 0 auto;
    width:460px;
    }
    #table_wrapper{
        background-color:#F2F2F2;
        padding:30px 0px;
        border-radius: 5px;
        width:460px;
        box-shadow:2px 2px 10px #333333;
        margin:0 auto;
        /* float:right;
        margin-right:160px; */
    }
    #login_tbl{
        line-height:30px;
        vertical-align:middle;
        background-color:#F2F2F2;
    }
    .input_login_wrap {
	width: 340px;
	height: 60px;
    }
    .login_name{
        padding-right:15px;
        font-size:14px;
    }
    .input_login {
	width: 330px;
	height: 54px;
	border: 1px solid #ccc;
	border-radius: 3px;
	background-color: #fff;
	font-size: 14px;
	line-height: 20px;
	outline: none;
    margin-top: 10px;
    margin-right:10px;
}
.form_login_btn {
    text-align: center;
}
.form_btn1 {
	width: 340px;
	line-height: 54px;
	border-radius: 5px;
	margin: 10px 0;
	background-color: #5A3673;
	color: white;
    border: none;
    font-size:18px;
    font-weight: 700;
}
#login_pwdforgot{
    padding:10px 0 0 0;
}

#login_search{
    text-align:center;
    font-style:italic;
    font-size:15px;
}
#login_tbl {
	margin: 0 auto;
	line-height: 30px;
	height: 40px;
	vertical-align: middle;
}

#login_tbl a {
	color: #787878;
	text-decoration: underline;
}
#login_keep{
}
#login_text{
    text-align: right;
    font-size:26px;
    font-weight: bold;
    color:white;
    margin:20px 0px;
    line-height: 150%;
}


    </style>
</head>
<body>
    <header>
        <h2>ONTACT</h2>
        <button id="joinbtn" onclick="${pageContext.request.contextPath}/busjoin">회원가입</button>
    </header>
    <section>
        <form id="login" method="post" action="${pageContext.request.contextPath}/login">
            <div id="table_wrapper">
            <table id="login_tbl">
            <tr>
                <td colspan="2" class="login_name">이메일</td>
                <td colspan="3" class="input_login_wrap">
                    <input type="text" name="uemail" id="uemail" class="input_login" tabindex="1" placeholder="이메일을 입력해주세요">
                </td>
            </tr>
            <tr>
                <td colspan="2" class="login_name">비밀번호</td>
                <td colspan="3">
                	<input type="password" name="upwd" id="upwd" class="input_login" tabindex="1" placeholder="비밀번호를 입력해주세요">
            	</td>
            </tr>
            <tr>
                <td colspan="3" id="login_pwdforgot">
                    <input type="checkbox" id="login_keep" name="login_keep" width="20px">
                    <label for="login_keep"
					class="login_font_size">자동 로그인</label>
                </td>
            </tr>
            <tr>
                <td colspan="5" class="form_login_btn">
                    <button class="form_btn1" type="submit">로그인</button>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
                </td>
            </tr>
            <tr>
            	<td colspan="5">
            		<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
    					<font color="red">
       					 <p>Your login attempt was not successful due to <br/>
           			 	${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</p>
       				 <c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session"/>
   					 </font>
					</c:if>
            	</td>
            </tr>
            <tr>
                <td colspan="5">
                    <p id="login_search">
                        <a href="" class="login_font_size">비밀번호를 잊어버리셨나요?</a>
                    </p>
                </td>
            </tr>
        </table>
    </div>
    <div id="login_text">편안한 곳에서<br>서로 편하게 소통할 수 있는<br>온택트</div>
        </form>
    </section>
</body>
</html>