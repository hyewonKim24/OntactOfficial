<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ontact, 서로 연결되는 온라인 공간</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
        rel="stylesheet">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css">
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
            width: 100%;
            position: relative;
            color: #333333;
            font-size: 14px;
            line-height: 1.15;
        }
        /* 인풋 박스 클릭시 테두리 없애기 */
        input:focus {outline:none;}
        .invite-search-wrap{
            width: 100%;
        }
        
        /*스크롤바 변경*/
		::-webkit-scrollbar { width: 5px; height: 0px; }
		/* 스크롤바의 width */
		::-webkit-scrollbar-track { background-color: #f0f0f0; }
		/* 스크롤바의 전체 배경색 */
		::-webkit-scrollbar-thumb { 
		    background: linear-gradient(to bottom, #505050, #505050); 
		}
		/* 스크롤바 색 */
		::-webkit-scrollbar-button { display: none; }
        .search-box {
            margin: 10px 12px;
            height: 32px;
            width: 445px;
            line-height: 32px !important;
            border: 1px solid #e7e7e7;
            border-radius: 4px;
        }

        #chat-search-input {
            border: none;
            width: 400px;
            line-height: 25px;
            padding-left: 10px;
        }

        .chat-search {
            padding-top: 12px;
            margin-top: 10px;
            vertical-align: middle;
            margin-right: 5px;
        }
 
        .chat-invite-top {
            width: 470px;
            height: 65px;
            background-color:#e7e7e7;
            margin:0 auto;
        }

        .chat-invite-wrap {
            line-height: 60px;
            color: #333333;
            font-weight: bold;
            text-align: center;
        }

        #invite-title{

        }

        #invite-exit{
            float: right;
            margin: 20px;
            width: 25px;
            height: 25px;
        }

        #invite-search{
            padding-left:10px;
        }

        #invite-rs{
            line-height: 40px;
        }
        .tel-my-img{
	        line-height: 68px;
	        width: 100px;
	        display:inline-block;
	        float:right;
        }
        .invite-names{
	        width: 300px;
	        height:50px;
	        line-height:20px;
	        padding-top:5px;
	        display:inline-block;
        }
        .invite-name{
        	font-size:13px;
        	color:#333333;
        	font-weight: bold;
        	padding-left:20px;
        
        }
        .invite-email{
        	font-size:10px;
        	color:#787878;
        }
        .invite-check-wrap{
	        line-height: 50px;
	        width: 100px;
	        display:inline-block;
	        float:right;
	        text-align: right;
	    }
	    
	    .invite-check{
	        border-radius: 70%;
		    border: 1px solid #bebebe;
		    width: 15px;
		    height: 15px;
		    cursor: pointer;
        
        }
			
        .invite-img-file{
      		width: 30px;
      		height: 30px;
      		border-radius:15px !important;
        }
        .invite-img{
        	line-height: 50px;
        	padding:10px;
        	vertical-align: middle;
        	margin-left:10px;
        }
      
        .tel-other{
           vertical-align: middle;
        }
        #submit-wrap{
            padding: 6px 0;
		    border-top-color: #e8e8e8;
		    border-top-width: 1px;
		    border-top-style: solid;
		    position: fixed;
		    text-align: center;
		    bottom:0px;
		    background-color: #fff;
		    height :50px;
		    width: 100%;
		    vertical-align: middle;
        }
        #resetbtn{
        	width: 100px;
        	height: 40px;
        	border: 1px solid #432D73;
        	color:#432D73;
        	font-size:12px;
        	border-radius: 3px;
        	background: #fff;
        }
        #submitbtn{
            width: 100px;
        	height: 40px;
        	border: 1px solid #fff;
        	color:#fff;
        	font-size:12px;
        	border-radius: 3px;
        	background: #432D73;
        	margin-left:5px;
        }
        #inviteList-table tr:last-child td{
        	margin-bottom:100px;
        	background-color: black;
        	display:none;
        }
    </style>
</head>
<body>
    <div class="invite-search-wrap">
        <div class="chat-invite-top">
            <p class="chat-invite-wrap">
                <span id="invite-title">대화상대 초대</span>
                <!--검색모달 닫기-->
                <a href="#" onclick="javascript:window.close()"><svg version="1.1"  id="invite-exit" xmlns="http://www.w3.org/2000/svg"
                        xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 60 60"
                        style="enable-background:new 0 0 60 60;" xml:space="preserve" fill="#505050" width="25px"
                        height="25px" stroke="#505050">
                        <g>
                            <path d="M0,0v60h60V0H0z M58,58H2V2h56V58z" />
                            <polygon points="16.009,45.405 30.151,31.263 44.293,45.405 45.707,43.991 31.565,29.849 45.707,15.707 44.293,14.293 
		30.151,28.435 16.009,14.293 14.595,15.707 28.737,29.849 14.595,43.991 	" />
                        </g>
                    </svg></a>
            </p>

            <div class="search-box">
                <span id="invite-search">
                    <svg version="1.1" id="Capa_1_margin" xmlns="http://www.w3.org/2000/svg"
                        xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 53.627 53.627"
                        style="enable-background:new 0 0 53.627 53.627;" xml:space="preserve" width="15px"
                        height="15px">
                        <path d="M53.627,49.385L37.795,33.553C40.423,30.046,42,25.709,42,21C42,9.42,32.58,0,21,0S0,9.42,0,21s9.42,21,21,21
c4.709,0,9.046-1.577,12.553-4.205l15.832,15.832L53.627,49.385z M2,21C2,10.523,10.523,2,21,2s19,8.523,19,19s-8.523,19-19,19
S2,31.477,2,21z M35.567,36.093c0.178-0.172,0.353-0.347,0.525-0.525c0.146-0.151,0.304-0.29,0.445-0.445l14.262,14.262
l-1.415,1.415L35.123,36.537C35.278,36.396,35.416,36.238,35.567,36.093z" />
                    </svg>

                </span>
                <input type="text" id="chat-search-input" placeholder="이름, 이메일으로 대화상대 검색">
            </div>
			<form action="${pageContext.request.contextPath}/chat/chatinvite" method="post" id="chatfrm1">
            <div id="invite-rs">
              <c:if test="${empty ulist }">
               	 검색 결과가 없습니다.
               	 </c:if>
						<sec:csrfInput /> 
						<table id="inviteList-table">
              			<c:if test="${not empty ulist }">
              			  <c:forEach items="${ulist}" var="list" varStatus="e">
							<tr class="tel-other">
							<td class="invite-img">
								<c:if test="${not empty list.ufilepath }">
								<img src="${list.ufilepath }" class="invite-imgs"  width="30px" height="30px" >
								</c:if>
								<c:if test="${empty list.ufilepath}">
								<img src="${pageContext.request.contextPath}/resources/img/user-3.png" 
								  width="30px" height="30px" class="invite-img-file">
								</c:if>
								
								</td>
									<td class="invite-names"><input type="hidden" name="chatuname" value="${list.uname }">
									<p class="invite-name">${list.uname}<br>
									<span class="invite-email">${list.uemail}</span></p> </td>
										<td class="invite-check-wrap">
											<input type="checkbox" class="invite-check" id="check${e.count}" name="chatuno" value="${list.uno}"> 
											<label for="check${e.count}"></label>
										</td>
							</tr>
				</c:forEach>
               </c:if>
						</table>
            </div>
						<div id="submit-wrap">
							<button type="reset" id="resetbtn">취소</button><button type="submit" id="submitbtn">대화방 초대</button>
						</div>
					</form>
        </div>
    </div>
<script>
	//상대방 검색기능
	$("#chat-search-input").keyup(function(){
		var c =$(this).val();
		$("#inviteList-table tr").hide();
		console.log("검색어:"+c);
		var temp= $("#inviteList-table td:contains('"+c+"')");
		console.log("temp"+temp);
		
		$(temp).parent().show();
	});
</script>
</body>
</html>