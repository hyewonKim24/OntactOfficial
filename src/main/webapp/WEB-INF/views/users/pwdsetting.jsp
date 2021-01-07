<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="kr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ontact, 서로 연결되는 온라인 공간</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
        rel="stylesheet">
    <link href="/css/reset.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <style>
        * {
            margin: 0;
        }

        html,
        body {
            width: 100%;
            height: 100%;
            position: relative;
            font-size: 14px;
            font-family: Noto Sans KR;
            line-height: 1.15;
        }

        button,
        input {
            font-family: Noto Sans KR;
        }

        header {
            position: relative;
            width: 100%;
            height: 60px;
        }

        header div {
            width: 1200px;
            height: 60px;
            margin: 0 auto;
        }

        section {
            position: relative;
            width: 1200px;
            height: 100%;
            margin: 0 auto;
        }

        button,
        a {
            cursor: pointer;
        }

        /*사이드메뉴*/
        aside {
            width: 210px;
            height: 100%;
            float: left;
            background-color: #f2f2f2;
        }

        #aside_back {
            margin-top: 30px;
            width: 150px;
            height: 56px;
            font-size: 18px;
            line-height: 54px;
            border: 1px solid #5A3673;
            background-color: #5A3673;
            border-radius: 3px;
            font-weight: 700;
            color: white;
            margin-bottom: 20px;
        }

        aside ul {
            display: block;
        }

        aside ul li {
            padding: 20px;
            cursor: pointer;
        }

        aside ul li a {
            font-weight: 700;
            color: black;
            text-decoration: none;
            cursor: pointer;
            font-size: 17px;
        }

        /* 본문 */
        article {
            position: absolute;
            width: 970px;
            height: 860px;
            left: 210px;
            padding: 40px 0 40px 40px;
            border-left: 1px solid #e7e7e7;
            box-sizing: border-box;
        }
        #pwd_info{
            font-size:24px;
            font-weight: 500;
        }
        #line{
            margin:20px 0;
            height:1px;
            line-height:0;
            overflow:hidden;
            background-color: #e9eaed;
            width:100%;
        }
        #pwd_subtitle_1{
            font-size:16px;
            font-weight: 400;
            padding-bottom: 10px;
        }
        #pwd_subtitle_2{
            font-size:14px;
            padding-bottom:30px;
        }
        table tr td{
            padding:5px 25px 5px 0px;
            vertical-align: middle;
        }
        table tr td:nth-last-child(2){
            font-size:16px;
            font-weight: 400;
        }
        .pwdinput {
        width: 170px;
        height: 30px;
        column-span: 2;
        font-size: 16px;
        vertical-align: top;
        text-align: left;
        border: 1px solid #ccc;
        line-height: 30px;
        border-radius: 3px;
        text-indent:5px;
    }
    #pw_res {
        font-size: 12px;
        color: red;
    }
    #pw_res2 {
        font-size: 12px;
        color: red;
    }
        
        #pwdbtn {
        padding: 0 10px;
        margin-left: 15px;
        height: 32.5px;
        line-height: 32.5px;
        font-size: 15px;
        font-weight: 700;
        color: rgb(233, 233, 233);
        text-align: center;
        border: 1px solid #a2a2a2;
        border-radius: 2px;
        background-color: #a2a2a2;
        vertical-align: middle;
        }
    </style>
</head>

<body>
    <header>
        <div>헤더 들어갈 자리</div>
    </header>
    <section>
        <aside>
            <button id="aside_back"><&nbsp;&nbsp;&nbsp;&nbsp;돌아가기</button>
                    <ul>
                        <li><a href="#">계정 정보</a></li>
                        <li><a href="#">비밀번호 설정</a></li>
                    </ul>
        </aside>
        <article>
            <div id="pwd_info">비밀번호 설정</div>
            <div id="line"></div>
            <div id="pwd_subtitle_1">비밀번호 재설정을 할 수 있습니다.</div>
            <div id="pwd_subtitle_2">비밀번호는 <strong>영어 대문자, 소문자, 숫자, 특수문자 포함 8자리 이상</strong>이어야 합니다.</div>
            <form action="${pageContext.request.contextPath}/user/mypage/updpwd" method="POST">
                <table>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    <tr>
                        <td>현재 비밀번호</td>
                        <td><input type="password" name="nowpwd" class="pwdinput"></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><span id="pw_res2">${message}</td>
                    </tr>
                    <tr>
                        <td>새 비밀번호</td>
                        <td><input type="password" name="upwd" id="upwd" class="pwdinput"></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><span id="pw_res"></td>
                    </tr>
                    <tr>
                        <td>새 비밀번호 확인</td>
                        <td ><input type="password" name="upwdre" id="upwdre" class="pwdinput">
                            <button type="submit" id="pwdbtn" disabled="disabled">변경하기</button>
                        </td>
                    </tr>
                    <input type="hidden" value="${success}" id="message">
                </table>
            </form>
        </article>
    </section>



    <script>
    //비밀번호 유효성 검사
        var pwreg = false;
        $("#upwd").on("input",
            function () {
                var a = $("#upwd").val();
                var regex = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
                if (!regex.exec(a)) {
                    pwreg = false;
                    $("#pw_res").html('비밀번호 형식이 맞지않습니다.');
                    $("#pwdbtn").attr("disabled",true);
					$("#pwdbtn").css("background-color","#a2a2a2");
                    $("#pwdbtn").css("border","1px solid #a2a2a2");
                    return;
                } else {
                    pwreg = true;
                    $("#pw_res").html('');
                    $("#pwdbtn").attr("disabled",false);
                    $("#pwdbtn").css("background-color","#5A3673");
					$("#pwdbtn").css("border","1px solid #5A3673");
                }
            });

        $("#upwdre").focusout(function () {
            var pw1 = $("#upwd").val();
            var pw2 = $("#upwdre").val();
            if (pw1 != "" && pw2 != "") {
                {
                    if (pw1 != pw2) {
                        alert('비밀번호를 동일하게 입력해주세요');
                        $("#upwd").focus();
                        $("#upwdre").val('');
                        $("#upwdre").val('');
                        return false;
                    }
                }
            }
        });
        
        //비밀번호 변경 성공시 alert
         
        var responseMessage = $("#message").val();
        console.log(responseMessage)
        if(responseMessage != ""){
            alert(responseMessage)
        }
        
    </script>
</body>

</html>