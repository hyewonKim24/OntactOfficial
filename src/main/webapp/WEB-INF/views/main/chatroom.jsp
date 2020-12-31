<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ontact, 서로 연결되는 온라인 공간</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
        rel="stylesheet">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/reset.css" />
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
        .chat-room-wrap{
            z-index: -1;
        }

        .chat-room-top {
            width: 470px;
            height: 65px;
            background-color: #432D73;
            margin:0 auto;
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
            padding-top: 8px;
        }

        #Capa_1_margin {
            margin-left: 15px;
        }

        .chat-room-content {
            width: 100%;
            height: 495px;
            border-bottom: 1px solid #e7e7e7;
        }

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
        #chat-room-search {}

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
            height: 655px;
            background-color: #fff;
            position: fixed;
            top:0;
            left:185px;
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

        #chat-moa-exit{
            float: right;
            margin:20px;
        }
        .chat-moa-sub{
        }
        .chat-moa-title{
            padding:15px;
            font-weight: bold;
            margin-top:55px;
            background-color:#e7e7e7;

        }
    </style>
    <script>
        $(document).ready(function () {
            $("#chat-room-search").click(function () {
                $(".room-search-wrap").show();
                $("#chat-room-wrap").hide();
            });
            $("#search-exit").click(function () {
                $(".room-search-wrap").hide();
                $("#chat-room-wrap").show();
            });
            $("#search-exit").click(function () {
                $(".room-search-wrap").hide();
                $("#chat-room-wrap").show();
            });

            $("#chat-room-menu").click(function(){
                $(".chat-dim").show();
                $(".chat-moa").show();
            });

            $("#chat-moa-exit").click(function(){
                $(".chat-dim").hide();
                $(".chat-moa").hide();
            });

        });
    </script>
</head>

<body>
    <div id="chat-room-wrap">

        <div class="chat-room-top">
            <p class="chat-room-name-wrap"> <span id="chat-name-title">채팅방제목 (3명)</span>
                <span class="chat-top-right">
                    <a href="#" id="chat-room-search"> <svg version="1.1" id="#Capa_1_margin" xmlns="http://www.w3.org/2000/svg"
                            xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 53.627 53.627"
                            style="enable-background:new 0 0 53.627 53.627;" xml:space="preserve" fill="#fff"
                            width="25px" height="25px" stroke="#fff" class="vertical-align">
                            <path d="M53.627,49.385L37.795,33.553C40.423,30.046,42,25.709,42,21C42,9.42,32.58,0,21,0S0,9.42,0,21s9.42,21,21,21
                        c4.709,0,9.046-1.577,12.553-4.205l15.832,15.832L53.627,49.385z M2,21C2,10.523,10.523,2,21,2s19,8.523,19,19s-8.523,19-19,19
                        S2,31.477,2,21z M35.567,36.093c0.178-0.172,0.353-0.347,0.525-0.525c0.146-0.151,0.304-0.29,0.445-0.445l14.262,14.262
                        l-1.415,1.415L35.123,36.537C35.278,36.396,35.416,36.238,35.567,36.093z" />
                        </svg></a>
                        <!--메뉴버튼-->
                        <a href="#" id="chat-room-menu">
                        <svg version="1.1" id="#Capa_1_margin" xmlns="http://www.w3.org/2000/svg"
                            xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 50 50"
                            style="enable-background:new 0 0 50 50;" xml:space="preserve" fill="#fff" width="25px"
                            height="25px" stroke="#fff" class="vertical-align">
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
        <div class="chat-room-content">

        </div>
        <div class="chat-room-bottom">
            <input type="text" class="chat-input" placeholder="메세지를 입력하세요">
            <input type="submit" class="chat-submit" value="전송">
        </div>
    </div>

    <!--검색 모달-->
    <div class="room-search-wrap">
        <div class="chat-room-top">
            <p class="chat-room-name-wrap">
                <span id="message-title">메시지 검색</span>
                <!--검색모달 닫기-->
                <a href="#"><svg version="1.1" id="search-exit" xmlns="http://www.w3.org/2000/svg"
                        xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 60 60"
                        style="enable-background:new 0 0 60 60;" xml:space="preserve" fill="#fff" width="25px"
                        height="25px" stroke="#fff">
                        <g>
                            <path d="M0,0v60h60V0H0z M58,58H2V2h56V58z" />
                            <polygon points="16.009,45.405 30.151,31.263 44.293,45.405 45.707,43.991 31.565,29.849 45.707,15.707 44.293,14.293 
		30.151,28.435 16.009,14.293 14.595,15.707 28.737,29.849 14.595,43.991 	" />
                        </g>
                    </svg></a>
            </p>

            <div class="search-box">
                <span id="chat-search">
                    <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg"
                        xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 53.627 53.627"
                        style="enable-background:new 0 0 53.627 53.627;" xml:space="preserve" width="15px"
                        height="15px">
                        <path d="M53.627,49.385L37.795,33.553C40.423,30.046,42,25.709,42,21C42,9.42,32.58,0,21,0S0,9.42,0,21s9.42,21,21,21
c4.709,0,9.046-1.577,12.553-4.205l15.832,15.832L53.627,49.385z M2,21C2,10.523,10.523,2,21,2s19,8.523,19,19s-8.523,19-19,19
S2,31.477,2,21z M35.567,36.093c0.178-0.172,0.353-0.347,0.525-0.525c0.146-0.151,0.304-0.29,0.445-0.445l14.262,14.262
l-1.415,1.415L35.123,36.537C35.278,36.396,35.416,36.238,35.567,36.093z" />
                    </svg>

                </span>
                <input type="text" id="chat-search-input" placeholder="대화내용 검색">
            </div>
            <div id="chat-search-rs">
                검색 결과가 없습니다.
            </div>
        </div>
    </div>

    <!--모아보기 모달-->
    <div class="chat-dim">
        
    </div>
        <div class="chat-moa">
            <a href="#" id="chat-moa-exit">
                <svg version="1.1"  xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 31.112 31.112" style="enable-background:new 0 0 31.112 31.112;" xml:space="preserve" fill="#505050" width="20px"
     height="20px" stroke="#505050">
<polygon points="31.112,1.414 29.698,0 15.556,14.142 1.414,0 0,1.414 14.142,15.556 0,29.698 1.414,31.112 15.556,16.97 
	29.698,31.112 31.112,29.698 16.97,15.556 "/></svg>
            </a>
            <div class="chat-moa-sub">

                <p class="chat-moa-title">
                    모아보기
                </p>
                <p>
                    <span>이미지</span>
                    <span>링크</span>
                </p>
            </div>
        <p class="chat-moa-title">
            채팅 참여자
        </p>
        
        
        
</div>
</body>

</html>