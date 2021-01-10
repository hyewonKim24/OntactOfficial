<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
            text-align: center;
            line-height: 40px;
        }
        .tel-my-img{
        	margin:10px;
        }
        .invite-names{
        line-height: 68px;
        width: 470px;
        display:inline-block;
        float:right;
        }
      
        .tel-other{
                	vertical-align: middle;
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
                <input type="text" id="chat-search-input" placeholder="대화상대 검색">
            </div>
            <div id="invite-rs">
              <c:if test="${empty ulist }">
               	 검색 결과가 없습니다.
               	 </c:if>
              <c:if test="${not empty ulist }">
                <c:forEach items="${ulist}" var="list">
												<form
													action="${pageContext.request.contextPath}/chat/chatroomnew"
													method="post" id="chatfrm1">
													<div class="tel-other">
														<input type="hidden" name="chatuname" value="${list.uname }">
														<span class="invite-names"> ${list.uname }  <span>
															
														</span>
														</span>
													</div>
												</form>
											</c:forEach>
               </c:if>
            </div>
        </div>
    </div>

</body>
</html>