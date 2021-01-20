<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="kr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ontact, 서로 연결되는 온라인 공간 </title>
    <link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
        rel="stylesheet">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<style type="text/css">
    body{
        font-size: 14px;
        font-family: Noto Sans KR;
        line-height: 1.15;
    }
    header {
        height: 60px;
        margin: 0px 20px;
    }
    .register_res {
	text-align: center;
	font-size: 14px;
	font-weight: bold;
	margin: 20px;
}
.form_title {
	margin: -5px auto;
	line-height: 40px;
	font-size: 22px;
	font-weight: bold;
	text-align: center;
	height: 40px;
    width: 640px;
    letter-spacing:-0.9px;
}

#title_bottom {
	padding-bottom: 20px;
}

.form_input {
	width: 320px;
	height: 40px;
	column-span: 2;
	padding: 0px 5px;
	font-size: 14px;
	vertical-align: top;
	text-align: left;
	margin: 5px 0 5px 0;
	border: 1px solid #ccc;
	line-height: 20px;
	border-radius: 3px;
}
    .form_inputurl{
   		width: 208px;
        height: 40px;
        column-span: 2;
        padding: 0px 5px;
        font-size: 14px;
        vertical-align: top;
        text-align: left;
        margin: 5px 0 5px 0;
        border: 1px solid #ccc;
        line-height: 20px;
        border-radius: 3px;
    }
    #url{
    	font-size:18px;
    	vertical-align:bottom;
    }
.form_select{
    width:332px;
    height:40px;
    column-span: 2;
	padding: 0px 5px;
	font-size: 14px;
	vertical-align: top;
	text-align: left;
	margin: 5px 0 5px 0;
	border: 1px solid #ccc;
	line-height: 20px;
	border-radius: 3px;
}
.form_btn {
	border: 1px solid #425c5a;
	background-color: #fff;
	color: #425c5a;
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
.form_wrap table {
	margin: 0 auto;
	line-height: 45px;
	height: 40px;
}
.form_wrap th {
	width: 130px;
	padding: 20px 0 0 0px;
	font-weight: 700;
	font-size: 14px;
	color: #333;
	line-height: 20px;
	vertical-align: top;
    text-align: left;
}
.signup-errors{
	font-size:13px;
	line-height:90%;
	color:red;
	margin:-30px 0;
}

#register_ok {
	margin-top: 30px;
	width: 150px;
	height: 56px;
	font-size: 18px;
	line-height: 54px;
	border: 1px solid #5A3673;
	background-color: #5A3673;
	border-radius: 20px;
	font-weight: 700;
	color: white;
    }

tfoot {
	text-align: center;
}

    /*모달*/
    #modal {
        display:none;
        width: 380px;
        height: 330px;
        border-radius: 3px;
        border: 1px solid #c0c0c0;
        position: relative;
        text-align: center;
        background-color: white;
    }

    #modal_title {
        width: 380px;
        height: 45px;
        background-color: #F2F2F2;
        text-align: center;
        line-height: 45px;
        font-size: 17px;
    }
    #modal_msg{
        text-align: center;
        padding:50px 0;
        font-size: 15px;
    }
    .modal_numberbox{
        border-bottom: 1px solid #787878;
        padding:10px;
    }
    #modal_number{
        border:none;
    }
    #modal_time{
        color:red;
    }
    .errormsg{
        font-size:13px;
        width:226px;
        text-align:left;
        margin:20px auto 0 auto;
        position:relative;
    }
    .errorrmsg_content_false{
    	color:red;
    }
    .errorrmsg_content_true{
    	color:#5A3673;
    }
    .errormsg #resend{
        text-decoration: none;
        position:absolute;
        right:6px;
        color:black;
    }
    #modal_send{
        margin-top: 30px;
        width: 228px;
        height: 40px;
        font-size: 16px;
        line-height: 40px;
        border: 1px solid #5A3673;
        background-color: #5A3673;
        border-radius: 5px;
        font-weight: 700;
        color: white;
    }
    #modal .modal_close_btn {
        position: absolute;
        top: 15px;
        right: 10px;
    }

</style>

<body>
    <header>
        <h2>ONTACT</h2>
        <hr>
    </header>
    <section>
        <div class="form_wrap">
            <h3 class="form_title">온택트 초대장을 받으셨군요!</h3>
            <h3 class="form_title">게스트 계정을 생성해주세요.</h3>
            <p id="required_sub">
                
            </p>
            <p id="title_bottom"></p>
            <form:form role="form" id="form" commandName="guestRegisterRequest" action="${pageContext.request.contextPath}/main/guestjoincheck"> 
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <table id="login">
                    <tbody>
                        <tr>
                            <th>이메일</th>
                            <td>
                            	<form:input type="text" cssClass="form_input" path="uemail" commandName="uemail"/><br/>
                            	<form:errors path="uemail" cssClass="signup-errors"/>
                            </td>
                        </tr>
                        <tr>
                            <th>이름</th>
                            <td>
                            	<form:input type="text" cssClass="form_input" path="uname"/><br/>
                            	<form:errors path="uname" cssClass="signup-errors"/>
                            </td>
                        </tr>
                        <tr>
                            <th>비밀번호</th>
                            <td><form:input type="password" cssClass="form_input" path="upwd" commandName="upwd" 
                                    placeholder="8자 이상, 대문자/소문자/숫자/특수문자  모두 포함" /><br/>
                                <form:errors path="upwd" cssClass="signup-errors"/>
                            </td>
                        </tr>
                        <tr>
                            <th>비밀번호확인</th>
                            <td>
                            <form:input type="password" cssClass="form_input" path="upwdre" commandName="upwdre"
                                    placeholder="비밀번호를 한번 더 입력해주세요"/><br/>
                            <form:errors path="upwdre" cssClass="signup-errors"/>
                            </td>
                        </tr>
                        <tr>
                            <th>회사 URL</th>
                            <td>
                            <form:input type="text" cssClass="form_inputurl" path="curl"/>&nbsp;<span id="url">.ontact.team</span><br/>
                            <form:errors path="curl" cssClass="signup-errors"/>
                            </td>
                        </tr>
                        <tr>
                            <th colspan="2"><input type="checkbox" class="form_input_chk" id="f_chk1" required> <label
                                    for="f_chk1">서비스 이용약관, 개인정보취급방침을 확인하였고, 이에 동의합니다.</label>
                            </th>
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="3" id="footer">
                            <button type="button" id="register_ok">회원가입</button>
                        </tr>
                    </tfoot>
                </table>
             <!--모달-->
	        <div id="modal">
	            <div id="modal_title">인증번호 입력</div>
	            <div id="modal_msg">
	                <span id="validemail"></span> 으로<br>6자리 인증번호가 전송되었습니다.<br>
	            </div>
	            <span class="modal_numberbox" style="cursor:pointer">
	                <input type="text" id="modal_number" maxlength="6" onkeypress="">
	                <span id="modal_time">3:00</span>
	            </span>
	            <div class="errormsg">
	                <p id="msgwrapper">
	                    <span id="errorrmsg_content">인증번호</span>
	                    <a href="javascript:remail()" id="resend">재전송</a>
	                </p>
	            </div>
	            <button id="modal_send" class="modal_send_false" disabled="disabled">확인</button>
	            <a class="modal_close_btn">X</a>
	        </div>
            </form:form>
            <p id="required_sub"></p>
        </div>
       
           
        

        <script>
            function modal(id){
                var zIndex=9999;
                var modal=document.getElementById(id);

                // 모달 div 뒤에 희끄무레한 레이어
                var bg = document.createElement('div');
                bg.setStyle({
                    position: 'fixed',
                    zIndex: zIndex,
                    left: '0px',
                    top: '0px',
                    width: '100%',
                    height: '100%',
                    overflow: 'auto',
                    // 레이어 색갈은 여기서 바꾸면 됨
                    backgroundColor: 'rgba(0,0,0,0.4)'
                });
                document.body.append(bg);

                 // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
                 modal.querySelector('.modal_close_btn').addEventListener('click', function() {
                    bg.remove();
                    modal.style.display = 'none';
                });

                modal.setStyle({
                    position: 'fixed',
                    display: 'block',
                    boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

                    // 시꺼먼 레이어 보다 한칸 위에 보이기
                    zIndex: zIndex + 1,

                    // div center 정렬
                    top: '50%',
                    left: '50%',
                    transform: 'translate(-50%, -50%)',
                    msTransform: 'translate(-50%, -50%)',
                    webkitTransform: 'translate(-50%, -50%)'
                });
            }

            // Element 에 style 한번에 오브젝트로 설정하는 함수 추가
            Element.prototype.setStyle = function(styles) {
                for (var k in styles) this.style[k] = styles[k];
                return this;
            };

            var code=""; //이메일 인증번호 저장위한 코드
            $(document).ready(function(){
            	$("#register_ok").click(function(){
		            var email = $("#uemail").val();
            		var formData = $("#form").serialize();
                	console.log(formData+"아아");
                	var error1 = $('.signup-errors').text();//유효성 에러 상세메세지
                	var check = $('input:checkbox[id="f_chk1"]').is(":checked")
                	
                	/* if($(".form_select").val()==''){
            			alert('항목을 선택해주세요.')
            		} */
                	
            			$.ajax({
        					url:"${pageContext.request.contextPath}/main/guestjoinchecktest",
        					type:"POST",
        					async: false,
        					data:$("#form").serialize(),
        					success:function(data){
        						if(!check){
        							alert("이용약관에 동의해주세요.");
        							$("#form").submit();
        						} else if(data=="aaa"){
        							//alert(data);
        							$("#form").submit();
        						} else{
        							$('.signup-errors').text("");
        							modal('modal');
        							$("#validemail").text(email);
        							//이메일전송
        							$.ajax({
        								type:"GET",
        								url:"${pageContext.request.contextPath}/main/mailCheck?uemail="+email,
        								//async: false,
        								success:function(data){
        									code=data;
        									
        								}
        							})
        							
        						}
        					},
                    	})
            		});
            	
            	//비밀번호 확인
            	$("#upwdre").focusout(function() {
					var pw1 = $("#upwd").val();
					var pw2 = $("#upwdre").val();
					console.log(pw1+"원패스워드");
					console.log(pw2);
					if (pw1 != "" && pw2 != "") {
						{
							if (pw1 != pw2) {
								alert('비밀번호를 동일하게 입력해주세요');
								$("#upw").focus();
								$("#upw").val('');
								$("#upwdre").val('');
								return false;
							
							}
						}
					}
				});
            	
            	//메일 재전송
            	function remail(){
            		alert("들어옴?");
            		var email = $("#uemail").val();
            		$.ajax({
						type:"GET",
						url:"${pageContext.request.contextPath}/main/mailCheck?uemail="+email,
						//async: false,
						success:function(data){
							code=data;
						}
					})
            	};
            	
            	
            	//인증번호 비교
            	$("#modal_number").blur(function(){
            		var inputCode = $("#modal_number").val(); //입력코드
            		var checkResult = $("#errorrmsg_content"); //비교 결과
            		var joinButton=$("#modal_send"); //전송버튼
            		if(inputCode==code){
            			checkResult.html("인증번호가 일치합니다.");
            			checkResult.css("color", "#5A3673");
            			joinButton.attr("disabled",false);
						joinButton.css("background-color","#5A3673");
						joinButton.css("border","1px solid #5A3673");
            		} else {
            			checkResult.html("인증번호를 다시 확인해주세요.");
            			checkResult.css("color", "red")
            			joinButton.attr("disabled",true);
            			joinButton.css("background-color","#a2a2a2");
						joinButton.css("border","1px solid #a2a2a2");
            		}
            	})
            	
            	//회원가입 버튼
            	$("#modal_send").click(function(){
            		$("#form").attr("action","${pageContext.request.contextPath}/main/guestjoin").submit();
            		alert("회원가입이 완료되었습니다!");
            	})
            });
        </script>
    </section>
</body>

</html>