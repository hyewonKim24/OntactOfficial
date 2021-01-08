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
        width: 400px;
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
														<svg version="1.1" id="Capa1"
															xmlns="http://www.w3.org/2000/svg"
															xmlns:xlink="http://www.w3.org/1999/xlink" x="0px"
															y="0px" viewBox="0 0 55 55"
															style="enable-background: new 0 0 55 55;"
															xml:space="preserve" fill="#505050" width="35px"
															height="35px" class="tel-my-img">
                                                    <path
																d="M27.5,0C12.336,0,0,12.337,0,27.5c0,7.976,3.417,15.167,8.86,20.195l-0.072,0.098l0.705,0.604
                                                c3.904,3.342,8.655,5.483,13.681,6.26c0.356,0.056,0.715,0.102,1.075,0.144c0.391,0.045,0.782,0.085,1.176,0.112
                                                c0.579,0.043,1.162,0.071,1.75,0.078c0.062,0,0.123,0.008,0.185,0.008c0.017,0,0.035-0.002,0.052-0.002
                                                c0.03,0,0.059,0.002,0.089,0.002C42.664,55,55,42.663,55,27.5S42.664,0,27.5,0z M27.414,52.998c-0.09,0-0.178-0.006-0.267-0.007
                                                c-0.478-0.004-0.954-0.029-1.429-0.06c-5.298-0.368-10.154-2.359-14.074-5.482c0.381-0.36,0.802-0.665,1.266-0.9l9.137-3.921
                                                c0.739-0.368,1.191-1.186,1.628-2.063c0.274-0.552,0.243-1.195-0.083-1.721C23.265,38.315,22.699,38,22.079,38l-6.347,0.005
                                                c-0.022-0.002-2.195-0.222-3.83-0.924c-0.308-0.132-0.437-0.235-0.474-0.241c0.015-0.042,0.051-0.124,0.141-0.251
                                                c2.264-3.224,6.083-9.643,6.214-16.409c0.008-0.379,0.303-9.287,9.332-9.361c5.365,0.044,7.902,3.189,9.086,5.82
                                                c0.591,1.313,0.939,2.879,1.065,4.785c0.39,5.9,3.1,11.466,5.305,15.095c0.114,0.188,0.148,0.418,0.096,0.631
                                                c-0.049,0.197-0.168,0.361-0.335,0.461c-1.038,0.62-2.389,0.407-2.397,0.404L33.273,38c-0.713,0-1.33,0.45-1.571,1.146
                                                c-0.243,0.702-0.028,1.472,0.536,1.917c0.71,0.561,0.992,0.734,1.104,0.794l7.619,4.609c0.654,0.357,1.229,0.845,1.692,1.434
                                                C38.231,51.229,32.983,52.986,27.414,52.998z M44.25,46.702c-0.633-0.815-1.415-1.491-2.293-1.969l-7.619-4.609
                                                c-0.016-0.009-0.07-0.04-0.19-0.124h5.54c0.436,0.061,2.175,0.222,3.669-0.673c0.627-0.374,1.072-0.977,1.25-1.695
                                                c0.181-0.727,0.062-1.511-0.327-2.151c-2.088-3.438-4.655-8.691-5.018-14.189c-0.143-2.147-0.547-3.938-1.237-5.473
                                                c-1.424-3.164-4.469-6.947-10.91-7c-10.964,0.09-11.33,11.206-11.332,11.32c-0.125,6.47-4.134,12.855-5.851,15.3
                                                c-0.467,0.665-0.616,1.312-0.444,1.921c0.188,0.66,0.719,1.171,1.625,1.56c1.917,0.823,4.322,1.066,4.521,1.081h6.084
                                                c-0.167,0.324-0.395,0.735-0.512,0.813l-9.113,3.908l-0.053,0.024c-0.713,0.356-1.349,0.83-1.914,1.395
                                                C5.132,41.483,2,34.852,2,27.5C2,13.439,13.439,2,27.5,2S53,13.439,53,27.5C53,35.153,49.606,42.024,44.25,46.702z" />
                                                </svg>


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