<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en">

<head>
<sec:csrfMetaTags /> <!-- 토큰 -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ontact, 서로 연결되는 온라인 공간</title>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<!-- jQuery, bootstrap CDN -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<!-- msie 문제 해결 -->
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<!-- SocketJS CDN -->
<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>

<link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css">
<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
	width: 100%;
	position: relative;
	color: #333333;
	font-size: 14px;
	line-height: 1.15;
	z-index: -1;
}

.chat-room-wrap {
	z-index: -1;
}

.chat-room-top {
	width: 470px;
	height: 65px;
	background-color: #432D73;
	margin: 0 auto;
}

.chat-room-name-wrap {
	line-height: 60px;
	color: #fff;
	font-weight: bold;
	text-align: center;
}

#chat-name-title {
	text-align: center;
}

.chat-top-right {
	float: right;
	margin-right: 20px;
	vertical-align: middle;
}

#Capa_1_margin {
	margin-left: 15px;
}

.chat-room-content {
	width: 470px;
	height: 495px;
	margin:0 auto;
	overflow:scroll;
	border-bottom: 1px solid #e7e7e7;
}
/*스크롤바 변경*/
::-webkit-scrollbar { width: 5px; height: 0px; }
/* 스크롤바의 width */
::-webkit-scrollbar-track { background-color: #f0f0f0; }
/* 스크롤바의 전체 배경색 */
::-webkit-scrollbar-thumb { 
    background: linear-gradient(to bottom, #5A3673, #432D73); 
}
/* 스크롤바 색 */
::-webkit-scrollbar-button { display: none; }
.chat-room-bottom {
	text-align: center;
}

.chat-input {
	width: 325px;
	height: 60px;
	border: none;
	margin: 15px;
}

.chat-submit {
	border-radius: 3px;
	background-color: #a2a2a2;
	border: 0 currentColor;
	width: 70px;
	height: 70px;
	color: #fff;
	font-size: 14px;
	cursor: pointer;
	margin: 10px;
}

/* 채팅 서치 */
#chat-room-search {
	
}

#search-exit {
	float: right;
	margin: 20px;
	width: 25px;
	height: 25px;
}

.room-search-wrap {
	display: none;
}

#message-title {
	text-align: center;
	width: 400px;
}

.search-box {
	margin: 10px 12px;
	height: 32px;
	line-height: 32px !important;
	border: 1px solid #e7e7e7;
	border-radius: 4px;
}

#chat-search-input {
	border: none;
	width: 395px;
	line-height: 25px;
	padding-left: 10px;
}

.chat-search {
	padding-top: 12px;
	margin-top: 10px;
	vertical-align: middle;
	margin-right: 5px;
}

/* 인풋 박스 클릭시 테두리 없애기 */
input:focus {
	outline: none;
}

#chat-search-rs {
	width: 100%;
	height: 500px;
	vertical-align: middle;
	text-align: center;
	color: #505050;
	margin-top: 20px;
}

/* 채팅방 모아보기 모달 */
.chat-moa {
	display: none;
	width: 290px;
	height: 665px;
	background-color: #fff;
	position: fixed;
	top: 0;
	left: 185px;
	z-index: 100;
}

.chat-dim {
	display: none;
	width: 100%;
	height: 100%;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	background-color: rgba(0, 0, 0, 0.5);
}

#chat-moa-exit {
	float: right;
	margin: 20px;
}

.chat-moa-sub {
	
}

.chat-moa-title {
	padding: 15px;
	font-weight: bold;
	margin-top: 55px;
	background-color: #e7e7e7;
}

/* 채팅 내용 */
.mycontent{
	width: 450px;
	height: 40px;
	line-height: 30px;
	padding:10px 0px 10px 10px;
	display:block;

}
.other-content{
	width: 430px;
	height: 100%;
	line-height: 40px;
	float:left;
}

.other-content-date{
	font-size:10px;
	color:#505050;
}
.mycontent-info{
	margin-left:335px;
}
.other-content-info{
	display:block;
	margin:10px;
	height: 20px;
	
}

.other-content-wrap{
	background: #e7e7e7;
    border: 1px solid #e7e7e7;
    border-top-left-radius: 5px;
	display: inline-block;
    max-width: 100%;
    padding: 7px 12px;
    border-radius: 5px;
    color: #111;
    line-height: 1.5;
    font-size: 14px;
    position: relative;
    margin-left:10px;
}

.mycontent-wrap{
	clear:both;
	background: #5A3673;
    border: 1px solid #5A3673;
    border-top-left-radius: 5px;
	display: block;
    max-width: 100%;
    float:right;
    padding: 7px 12px;
    border-radius: 5px;
    color: #fff;
    line-height: 1.5;
    font-size: 14px;
    position: relative;
    margin-top:3px;
}
</style>
<script>
	$(document).ready(function() {
		$("#chat-room-search").click(function() {
			$(".room-search-wrap").show();
			$("#chat-room-wrap").hide();
		});
		$("#search-exit").click(function() {
			$(".room-search-wrap").hide();
			$("#chat-room-wrap").show();
		});
		$("#search-exit").click(function() {
			$(".room-search-wrap").hide();
			$("#chat-room-wrap").show();
		});

		$("#chat-room-menu").click(function() {
			$(".chat-dim").show();
			$(".chat-moa").show();
		});

		$("#chat-moa-exit").click(function() {
			$(".chat-dim").hide();
			$(".chat-moa").hide();
		});
		//메시지 입력시에만 활성ㅎ
		$("#message").on('input',function(){
				$("#sendBtn").css("background-color","#111111");
		});
		
		//최하단으로 포커스 이동
		 var isScrollUp = false;
		 var divChat = document.getElementById('chat-content-wrap');
		 if (!isScrollUp) {
		      $('.chat-room-content').animate({
		        scrollTop: divChat.scrollHeight - divChat.clientHeight
		      }, 100);
		    }
	});
</script>
</head>

<body>
 	<!-- 정보 가져오기 -->
	<input type="hidden" value="${chatno}" id="chatno" name="chatno">
	<sec:authentication property="principal.username" var="username"/>
	<sec:authentication property="principal.uno" var="uno"/>
	<sec:authentication property="principal.uname" var="uname"/>
	<sec:csrfInput />
	<input type="hidden" value='${uname}' name="sessionuserid" id="sessionuserid">
	<input type="hidden" value="${uno}" id="uno" name="uno">
	<input type="hidden" value="${chatname }" id="chatname" name="chatname">
	<div id="chat-room-wrap">

		<div class="chat-room-top">
			<p class="chat-room-name-wrap">
				<span id="chat-name-title">${chatname }</span> <span
					class="chat-top-right"> <a href="#" id="chat-room-search">
						<svg version="1.1" id="Capa_1_margin"
							xmlns="http://www.w3.org/2000/svg"
							xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
							viewBox="0 0 53.627 53.627"
							style="enable-background: new 0 0 53.627 53.627;"
							xml:space="preserve" fill="#fff" width="25px" height="25px"
							stroke="#fff" class="vertical-align">
                            <path
								d="M53.627,49.385L37.795,33.553C40.423,30.046,42,25.709,42,21C42,9.42,32.58,0,21,0S0,9.42,0,21s9.42,21,21,21
                        c4.709,0,9.046-1.577,12.553-4.205l15.832,15.832L53.627,49.385z M2,21C2,10.523,10.523,2,21,2s19,8.523,19,19s-8.523,19-19,19
                        S2,31.477,2,21z M35.567,36.093c0.178-0.172,0.353-0.347,0.525-0.525c0.146-0.151,0.304-0.29,0.445-0.445l14.262,14.262
                        l-1.415,1.415L35.123,36.537C35.278,36.396,35.416,36.238,35.567,36.093z" />
                        </svg>
				</a> <!--메뉴버튼--> <a href="#" id="chat-room-menu"> <svg version="1.1"
							id="Capa_1_margin" xmlns="http://www.w3.org/2000/svg"
							xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
							viewBox="0 0 50 50" style="enable-background: new 0 0 50 50;"
							xml:space="preserve" fill="#fff" width="25px" height="25px"
							stroke="#fff" class="vertical-align">
                            <g>
                                <rect y="3" width="50" height="2" />
                                <rect y="17" width="50" height="2" />
                                <rect y="31" width="50" height="2" />
                                <rect y="45" width="50" height="2" />
                            </g>
                        </svg>
				</a>
				</span>

			</p>
		</div>
		<script type="text/javascript">
			//websocket을 지정한 URL로 연결
			var chatno=$("#chatno").val();
			console.log("chatno:"+chatno)
//			var sock =new WebSocket("ws://" + location.host + "/ontact/echo/"+chatno);
			var sock =new WebSocket("ws://localhost:8090/ontact/echo/"+chatno);
			//websocket 서버에서 메시지를 보내면 자동으로 실행된다.
			sock.onmessage = onMessage;
			//websocket 과 연결을 끊고 싶을때 실행하는 메소드
			sock.onclose = onClose;
			$(function() {
				
				//엔터쳤을때 메시지 보내짐
				$('#message').keypress(function(event){
				     if ( event.which == 13 ) {
				         $('#sendBtn').click();
				         return false;
				     }
				});
				     
				$("#sendBtn").click(function() {
					console.log('send message...');
					//DB에 채팅 content 저장
					$.ajax({
						url: "${pageContext.request.contextPath}/chat/contentadd",
						data: {
							message : $("#message").val(),
							chatno : $("#chatno").val(),
							uno : $("#uno").val()
						},
						dataType: "json",
						success:function(){
							console.log("성공");
						},
						error:function(){
							console.log("실패");
						}
					});
					sendMessage();
				});
			});

			function sendMessage() {
				//websocket으로 메시지를 보내겠다.
				var msg = $("#message").val();
				var chatno = $("#chatno").val();
				sock.send(chatno+","+msg);
				//메시지 지우기 
				$("#message").val('');
				
			}

			//evt 파라미터는 websocket이 보내준 데이터다.
			function onMessage(evt) { //변수 안에 function자체를 넣음.
				console.log("websocket이 보내준 데이터" + evt);

				var data = evt.data;
				var sessionid = null;
				var message = null;

				//문자열을 splite//
				var strArray = data.split('|');

				for (var i = 0; i < strArray.length; i++) {
					console.log('str[' + i + ']: ' + strArray[i]);
				}

				//current session id//
				var currentuser_session = $('#sessionuserid').val()+" ";
				console.log('current session id: ' + currentuser_session);
				
				sessionid = strArray[0]; //현재 메세지를 보낸 사람의 세션 등록//
				message = strArray[1]; //현재 메세지를 저장//
				
				//공백 제거
				sessionid.trim();
				console.log("current:"+currentuser_session +"그리고 sessionid:"+sessionid);
				
 				//나와 상대방이 보낸 메세지를 구분하여 영역을 나눈다.//
				if (sessionid == currentuser_session) {
					var printHTML = "<div class='well'>";
					printHTML += "<div class='mycontent'>";
					printHTML += "<div class='mycontent-info'>";
				//	printHTML += "<strong>[" + sessionid + "]</strong> <br>";
					printHTML += "</div>";
					printHTML += "<p class='mycontent-wrap'>"+message+"</p><br>";
					printHTML += "</div>";
					printHTML += "</div>";

					$("#chatdata").append(printHTML);
				} else {
					//상대방
					var printHTML = "<div class='well'>	";
					printHTML += "<div class='other-content'>";
					printHTML += "<div class='other-content-info'>";
					printHTML += "<strong>" + sessionid + "</strong><br>";
					printHTML += "</div>";
					printHTML += "<p class='other-content-wrap'>"+message+"</p><br>";
					printHTML += "</div>";
					printHTML += "</div>";
					
					$("#chatdata").append(printHTML);
				}
				//최하단으로 포커스 이동
				 var isScrollUp = false;
				 var divChat = document.getElementById('chat-content-wrap');
				 if (!isScrollUp) {
				      $('.chat-room-content').animate({
				        scrollTop: divChat.scrollHeight - divChat.clientHeight
				      }, 100);
				    }
			} 

			function onClose(evt) {
				$("#data").append("연결 끊김");
			}
		</script>
		
		
		<div class="chat-room-content" id="chat-content-wrap">
			<div class="well" id="chatdata">
				<!-- 대화내용 출력 -->
				<c:forEach items="${conlist }" var="list">
				<div class="well">
				<c:if test="${list.usersdto.uname ne uname}">
					<div class="otehr-content">
						<div class="other-content-info">
								<strong> ${list.usersdto.uname}</strong><br>
						</div>
						<p class="other-content-wrap"> ${list.content}</p> 
						<span class="other-content-date">${list.chatdate }</span>
					</div>
				</c:if>
				<c:if test="${list.usersdto.uname eq uname}">
					<div class="mycontent">
						<div class="mycontent-info">
						</div>
						<p class="mycontent-wrap"> ${list.content}</p> 
					</div>
				</c:if>
				</div>
				</c:forEach>

			
			</div>
			


			
		</div>
		<div class="chat-room-bottom">
			<input type="text" class="chat-input" id="message"
				placeholder="메세지를 입력하세요" name="message"> <input type="submit"
				class="chat-submit" id="sendBtn" value="전송">
		</div>
	</div>

	<!--검색 모달-->
	<div class="room-search-wrap">
		<div class="chat-room-top">
			<p class="chat-room-name-wrap">
				<span id="message-title">메시지 검색 </span>
				<!--검색모달 닫기-->
				<a href="#"><svg version="1.1" id="search-exit"
						xmlns="http://www.w3.org/2000/svg"
						xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
						viewBox="0 0 60 60" style="enable-background: new 0 0 60 60;"
						xml:space="preserve" fill="#fff" width="25px" height="25px"
						stroke="#fff">
                        <g>
                            <path d="M0,0v60h60V0H0z M58,58H2V2h56V58z" />
                            <polygon
							points="16.009,45.405 30.151,31.263 44.293,45.405 45.707,43.991 31.565,29.849 45.707,15.707 44.293,14.293 
		30.151,28.435 16.009,14.293 14.595,15.707 28.737,29.849 14.595,43.991 	" />
                        </g>
                    </svg></a>
			</p>

			<div class="search-box">
				<span id="chat-search"> <svg version="1.1" id="Capa_1_margin"
						xmlns="http://www.w3.org/2000/svg"
						xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
						viewBox="0 0 53.627 53.627"
						style="enable-background: new 0 0 53.627 53.627;"
						xml:space="preserve" width="15px" height="15px">
                        <path
							d="M53.627,49.385L37.795,33.553C40.423,30.046,42,25.709,42,21C42,9.42,32.58,0,21,0S0,9.42,0,21s9.42,21,21,21
c4.709,0,9.046-1.577,12.553-4.205l15.832,15.832L53.627,49.385z M2,21C2,10.523,10.523,2,21,2s19,8.523,19,19s-8.523,19-19,19
S2,31.477,2,21z M35.567,36.093c0.178-0.172,0.353-0.347,0.525-0.525c0.146-0.151,0.304-0.29,0.445-0.445l14.262,14.262
l-1.415,1.415L35.123,36.537C35.278,36.396,35.416,36.238,35.567,36.093z" />
                    </svg>

				</span> <input type="text" id="chat-search-input" placeholder="대화내용 검색">
			</div>
			<div id="chat-search-rs">검색 결과가 없습니다.</div>
		</div>
	</div>

	<!--모아보기 모달-->
	<div class="chat-dim"></div>
	<div class="chat-moa">
		<a href="#" id="chat-moa-exit"> <svg version="1.1"
				xmlns="http://www.w3.org/2000/svg"
				xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
				viewBox="0 0 31.112 31.112"
				style="enable-background: new 0 0 31.112 31.112;"
				xml:space="preserve" fill="#505050" width="20px" height="20px"
				stroke="#505050">
<polygon points="31.112,1.414 29.698,0 15.556,14.142 1.414,0 0,1.414 14.142,15.556 0,29.698 1.414,31.112 15.556,16.97 
	29.698,31.112 31.112,29.698 16.97,15.556 " /></svg>
		</a>
		<div class="chat-moa-sub">

			<p class="chat-moa-title">모아보기</p>
			<p>
				<span>이미지</span> <span>링크</span>
			</p>
		</div>
		<p class="chat-moa-title">채팅 참여자</p>


	</div>
</body>

</html>