<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ontact, 서로 연결되는 온라인 공간</title>
    <link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <!-- 장소 검색 API -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e8f272dc1ba4f98e1be5c993c17cae5d&libraries=services"></script>
    <!-- date picker -->
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">    
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <!-- time picker -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
    

    <style>
        * {
            margin: 0; 
        }

        body {
            width: 100%;
            height: 100%;
            position: relative;
            font-size: 14px;
            font-family: Noto Sans KR;
            line-height: 1.15;
            background-color: rgb(242, 242, 242);
        }

        a {
            text-decoration: none;
            color: #333333;
        }

        .header {
            position: relative;
            width: 100%;
            height: 60px;
        }

        .header div {
            width: 1200px;
            height: 60px;
            margin: 0 auto;
        }


        /* 본문 */
        .main {
            position: relative;
            width: 1200px;
            height: 100%;
            margin: 0 auto;
        }

        /*sidebar*/
        #pj_sidebar {
            width: 210px;
            height: 100%;
            padding-top: 20px;
            background-color: #f2f2f2;
            color: #333333;
            z-index: 10;
            position: fixed;
            overflow-x: hidden;
            margin: 0 auto;
        }

        #pj_sidebar>ul {
            padding: 10px 0;
        }

        #pj_sidebar>ul>li {
            height: 33px;
            line-height: 33px;
            padding-left: 10px;
            font-weight: 400;
            list-style: none;
        }

        #pj_sidebar>ul>li:hover {
            background-color: #e7e7e7;
        }

        #pj_sidebar>ul>li>a {
            display: block;
            text-decoration: none;
            color: #333333;
        }

        #pj_sidebar>ul>li>a>img {
            margin-right: 5px;
            vertical-align: auto;
        }

        /* 프로젝트 글 */
        .contents {
            position: relative;
            width: 700px;
            height: 100%;
            margin: 0 20px;
            left: 210px;
            box-shadow: 1px 1px 3px 1px #e7e7e7;
            float: left;
        }

        /* 글 쓰기 부분 */
        .write {
            border: 1px solid #dadbdb;
            min-height: 270px;
            box-sizing: border-box;
            background: #fff;
        }

        .writemenu {
            display: none;
        }

        .write .tabs {
            display: none;
        }

        .tabslabel {
            display: inline-block;
            padding: 15px 26.1px;
            font-weight: 600;
            text-align: center;
            color: #969696;
            width: 118px;
            font-size: 15px;
        }

        .write svg {
            width: 20px;
            height: 20px;
            margin: -5px 10px -5px -5px;
            stroke: #c0c0c0;
            stroke-width: 3%;
        }

        #line {
            border-top: 1px solid #dadbdb;
        }

        .tabslabel:hover {
            cursor: pointer;
        }

        .textbody {
            height: auto;
            margin-top: 10px;
            margin: 17px 25px;
        }

        .title {
            width: 100%;
            border-bottom: 1px solid #dadbdb;
            padding-bottom: 8px;
            margin-bottom: 12px;
        }

        .title_detail {
            border: none;
            width: 100%;
            height: 100%;
            font-size: 16px;
            font-weight: 700;
            font-family: Noto Sans KR;
        }

        .content_detail {
            border: none;
            width: 100%;
            min-height: 65px;
            font-size: 14px;
            overflow-y: hidden;
            font-family: Noto Sans KR;
        }

        .content_detail2 {
            border: none;
            width: 100%;
            min-height: 69px;
            font-size: 14px;
            overflow-y: hidden;
            font-family: Noto Sans KR;
        }

        .content_detail:focus,
        .title_detail:focus {
            outline: none;
        }

        .textfooter {
            height: 46px;
            border-top: 1px solid #dadbdb;
            /* border:1px solid red; */
            padding: 10px 20px;
            bottom: 0px;
            width: 658px;
            display: flex;
            justify-content: space-between;
            position: relative;
        }

        .textfooter_func {
            width: 24px;
            margin-right: 8px;
            margin-left: 5px;
            margin-top: 8px;
        }

        .textfooter_side {
            display: flex;
        }

        .public {
            min-width: 100px;
            border: 1px solid #dfe0e4;
            height: 36px;
            line-height: 32px;
            font-size: 12px;
            color: #545557;
            /* text-align: center; */
            font-weight: 700;
            background-color: #fff;
            border-radius: 3px;
            box-sizing: border-box;
            font-family: Noto Sans KR;
            position: relative;
            cursor: pointer;
        }

        .public span {
            margin-top: 0px;
            margin-left: 3px;
            position: absolute;
        }

        .public img {
            width: 20px;
            /* position:absolute; */
            margin-right: 2px;
            margin-top: 5px;
            margin-left: 5px;
        }

        .public_admin {
            min-width: 100px;
            border: 1px solid #dfe0e4;
            height: 36px;
            line-height: 32px;
            font-size: 12px;
            color: #545557;
            /* text-align: center; */
            font-weight: 700;
            background-color: #fff;
            border-radius: 3px;
            box-sizing: border-box;
            font-family: Noto Sans KR;
            position: relative;
            cursor: pointer;
        }

        .public_admin span {
            margin-top: 0px;
            margin-left: 3px;
            position: absolute;
        }

        .public_admin img {
            width: 20px;
            /* position:absolute; */
            margin-right: 2px;
            margin-top: 5px;
            margin-left: 5px;
        }

        .public_setting {
            position: absolute;
            top: 50px;
            right: -1px;
            z-index: 1000;
            width: 230px;
            text-align: left;
            border: 1px solid rgba(34, 35, 37, .2);
            border-radius: 2px;
            background: #fff;
            box-shadow: 1px -1px 4px 0 rgba(0, 0, 0, .15);
        }

        .public_setting_title {
            height: 29px;
            line-height: 27px;
            text-indent: 12px;
            font-size: 12px;
            color: #828385;
            font-weight: 400;
            border-bottom: 1px solid #dfe0e4;
        }

        .set_li {
            position: relative;
        }

        .set_li:hover {
            background-color: #f6f7f8;
        }

        .set_li_admin {
            position: relative;
        }

        .set_li_admin:hover {
            background-color: #f6f7f8;
        }

        .setimg {
            width: 23px;
            top: 14px;
            left: 7px;
            position: absolute;
        }

        .p_set_con strong {
            display: block;
            font-size: 12px;
            color: #545557;
        }

        .p_set_con {
            display: block;
            padding: 10px 0 0 40px;
            height: 55px;
            font-size: 11px;
            color: #828385;
            box-sizing: border-box;
            background-repeat: no-repeat;
            background-position: 11px 14px;
            cursor: pointer;
        }

        .writebtn {
            width: 80px;
            height: 36px;
            background-color: #5A3673;
            border-radius: 3px;
            color: #e7e7e7;
            border: none;
            font-family: Noto Sans KR;
            font-weight: 700;
            vertical-align: middle;
            margin-left: 5px;
            font-size: 14px;
        }

        .tabs:checked+.tabslabel svg {
            width: 20px;
            height: 20px;
            margin: -5px 10px -5px -5px;
            stroke-width: 6%;
            stroke: #F27781;
        }

        /*input 클릭시, label 스타일*/
        .tabs:checked+.tabslabel {
            color: #F27781;
        }

        #tab1:checked~#commonboard,
        #tab2:checked~#sche,
        #tab3:checked~#schedule,
        #tab4:checked~#todo {
            display: block;
        }

/* 여기서부터 혜림 파트 : 일정 작성 부분 */
        /* 일정 작성 부분 */
        .schepeople,
        .schedate {
            width: 648px;
            height: 38px;
            border-bottom: 1px solid #dadbdb;
            box-sizing: border-box;
            padding-bottom: 10px;
            margin-bottom: 12px;
        }

        .schedate .d {
            width: 120px;
            height: 28px;
            box-sizing: border-box;
            border: 1px solid #dadbdb;
            margin-right: 10px;
        }

        .schedate .t {
            width: 80px;
            height: 28px;
            box-sizing: border-box;
            border: 1px solid #dadbdb;
        }
        .schepeople img{
          float: left;
          padding-right : 10px;
        }
        /* 참석자 모달 리스트 *우/
        .sche-res-wrap{
			position:absolute;
			display:inline-block;
			width: 600px;
			height: 30px;
            box-sizing: border-box;
		}
		.sche-res{
			padding:5px;
			width: 100px;
			height: 15px;
			line-height: 25px;
			border: 1px solid #e7e7e7;
			border-radius: 3px;
		}
		.sche-res-close{
            border: 1px solid #e7e7e7;
            background: white;
            width: 27px;
            height: 27px;
            box-sizing: border-box;
        }
		.sche-res-append{
            padding:5px;
			width: 100px;
			height: 15px;
			line-height: 25px;
			border: 1px solid #e7e7e7;
			border-radius: 3px;
        }
		.sche-res-list{
			width: 100px;
			height: 20px;
			line-height: 25px;
			cursor: pointer;
			padding-top : 5px;
			text-align : center;
		}
		
		.sche-res-add-wrap{
			width: 110px;
			height: 100px;
        	display:none;
			overflow: scroll;
			background-color: #fff;
			border: 1px solid #787878;
			border-radius: 3px;
			z-index: 999;
		    position: absolute;
   			top: 33px;
		}
		#schePname {
            width: 135px;
            height: 28px;
            box-sizing: border-box;
            border: 1px solid #dadbdb;
        }
        /* 참석자 모달 리스트 끝 */	
        .scheplace{
            width: 648px;
            border-bottom: 1px solid #dadbdb;
            box-sizing: border-box;
            padding-bottom: 10px;
            margin-bottom: 17px;
        }
        #locationSearch{
        	background-color: white;
        	border: none;
        	border-bottom: 1px solid #dadbdb;
        	vertical-align : middle;
        	height : 28px;
        	box-sizing: border-box;
        	letter-spacing : -4px;
        	
        }
        #location{
            width: 567px;
            height: 28px;
            box-sizing: border-box;
            border: none;
            border-bottom: 1px solid #dadbdb;
        }
        .sche_icon{
            width: 15px;
            padding: 5px;
            vertical-align: middle;
        }
        #map{
            width: 93%;
            height: 200px;
            margin-left: 25px;
        }
        #aabbcc{
        	width: 600px;
            height: 28px;
            box-sizing: border-box;
            border: none;
            border-bottom: 1px solid #dadbdb;
            margin-left : 25px;
            margin-bottom : 10px;
        }
        #calendaricon{
            vertical-align: top;
            padding-top: 0;
        }
        .schememo textarea{
            width: 600px;
        }
/* 여기까지 혜림 : 일정 작성 부분 끝  */

        /* 글 작성 부분 */
        .boardHeader {
            height: 60px;
            padding: 25px 12px 0 25px;
            background-color: white;
        }

        .writeInfo {
            width: 200px;
            height: 40px;
            float: left;
        }

        .profileImg {
            width: 40px;
            float: left;
            margin-right: 25px;
        }

        .writer {
            height: 18px;
            font-size: 14px;
            font-weight: 700;
            padding-top: 5px;
        }

        .writeschedate {
            font-size: 12px;
            font-weight: 400;
            padding-top: 5px;
            color: #c0c0c0;
        }

        .option {
            width: 60px;
            height: 40px;
            padding-top: 7px;
            margin: 0;
            float: right;
        }

        .fixNotice {
            width: 18px;
            margin-top: 3px;
            margin-right: 20px;
            float: left;
        }

        .editoption {
            width: 5px;
            height: 20px;
            margin-top: 3px;
        }

        .editDropdown {
            display: none;
            width: 145px;
            height: 65px;
            border: 1px solid #e7e7e7;
            box-sizing: border-box;
            font-size: 12px;
            float: right;
            margin-top: 6px;
            z-index:9999;
        }

        .editDropdown ul {
            padding: 8px 0;
        }

        .editDropdown ul li {
            padding: 6px 15px;
        }

        .boardResult {
            width: 650px;
            padding: 7px 25px;
            background-color: white;
        }

 /* 여기서부터 혜림 부분 시작: 일정 결과화면 */
        .result_wrap{
            width: 650px;
            min-height: 151px;
            background-color: #fafafa;
            border: 1px solid #e7e7e7;
        }
        .rstart{
            width: 80px;
            height: 60px;
            padding: 10px;
            float: left;
            text-align: center;
            border-right: 1px solid #e7e7e7;
            border-bottom: 1px solid #e7e7e7;
        }
        #month{
            height: 30px;
            line-height: 30px;
            font-size: 16px;
            text-align: center;
            letter-spacing: 2px;
        }
        #day{
            height: 30px;
            line-height: 30px;
            font-size: 30px;
            letter-spacing: 5px;
        }
        .rtitle{
            width:648px;
            height: 40px;
            
            border-bottom: 1px solid #e7e7e7;
        }
        .rtitle input{
            width: 648px;
            height: 38px;
            box-sizing: border-box;
            border: none;
            padding-left: 10px;
            background-color: #fafafa;
        }
        .rschedate{
            width: 648px;
            height: 40px;
            line-height: 40px;
            
            padding-left: 10px;
            border-bottom: 1px solid #e7e7e7;
            box-sizing: border-box;
        }
        .rschedate input{
            width: 120px;
            height: 30px;
            box-sizing: border-box;
            border: none;
            background-color: #fafafa;
            
        }
        .rschepeople {
            padding-top: 10px;
            padding-left: 10px;
        }
        .rschepeople img{
            float: left;
        }
        .attendeecount{
            width: 200px;
            height: 25px;
            line-height: 25px;
            font-size: 14px;
            font-weight: 700;
            margin-left: 34px;
        }
        .attendee{
            height: 35px;
            line-height: 35px;
            font-size: 14px;
            margin-left: 34px;
            float: left;
        }
        #attendee-edit{
            width: 100px;
            height: 30px;
            font-weight: 700;
            border-radius: 10px;
            border: 1px solid #e7e7e7;
            background: none;
            margin-right: 10px;
            float: right;
        }

        /* 참석자 변경 모달 */
        #attendee-modal{
            display: none;
            /* position: relative; */
            height: 0;
            width:100%;
            /* float: left; */
            z-index: 9999;
        }
        .attendee-modal-content{
            position: relative;
            width:550px;
            height: 580px;
            margin:100px auto;
            background:#fefefe;
        }
        .attendee-title{
            height: 45px;
            line-height: 45px;
            text-align: center;
            font-size: 16px;  
            background:#e7e7e7;
        }
        .attendee-search{
            height: 35px;
            padding: 10px 0;
            background:#e7e7e7;
            letter-spacing: -20px;
        }
        .attendee-search input{
            width: 410px;
            height: 35px;
            margin-left: 20px;
            margin-right: 0;
            border: none;
            box-sizing: border-box;  
            vertical-align:bottom; 
        }
        .attendee-search button{
            height: 35px;
            margin: 0;
            border: none;
            box-sizing: border-box;
            background-color: white;
        }
        .attendee-search img{
            width: 23px;
        }
        /* 참석자 선택하면 추가되는 곳 */
        .pick-attendee input{
            width: 100px;
            height: 35px;
            margin-top: 8px;
            margin-right: 8px;
            background-color: #e7e7e7;
            border: none;  
            box-sizing: border-box;
            text-align: center;
            font-weight: 700;
        }
        .attendee-people{
            padding : 0 20px;
        }
        .pick-attendee{
            padding-left: 10px;
            height: 40px;
            line-height: 45px;
            margin-bottom: 18px;
        }
        .userlist_wrap{
            height: 70px;
            border-bottom: 1px solid #e7e7e7;   
        }
        .userlist_wrap img{
            width: 40px;
            height: 40px;
            padding : 15px 20px 0 10px;
        }
        .userlist_wrap span{
            height: 70px;
            line-height: 70px;
            font-weight: 700;
            
        }
        .userlist_wrap .pick{
            margin-top : 23px;
            width: 60px;
            height: 25px;
            float: right;
            border: 1px solid #e7e7e7;   
            color : #a2a2a2; 
        }
        .edit-btn{
            width: 100px;
            height: 32px;
            background-color: #5A3673;
            color:#F2F2F2;
            border : none;
            border-radius: 3px;
        }
        .modal-btn{
            padding-top: 17px;
            text-align: center;
        }
        .attendee_modal-layer {
          position:fixed;
          top:0;
          left:0;
          width:100%;
          height:100%;
          background:rgba(0, 0, 0, 0.5);
        }
        /* 모달 끝 */
        .rscheplace{
            clear: both;
            padding-left: 10px;
        }
        .rscheplace input{
            width: 600px;
            height: 30px;
            font-size: 14px;
            box-sizing: border-box;
            border: none;
            margin-left: 3px;
            background-color: #fafafa;
        }
        .rschememo{
            padding-top: 10px;
            padding-left: 10px;
        }
        .rschememo textarea{
            width: 605px;
            background-color: #fafafa;
        }
/* 여기까지 혜림 부분 끝 : 일정 결과화면 */

        .replyCount {
            width: 650px;
            height: 25px;
            margin-top: 30px;
            font-size: 12px;
            color: #c0c0c0;
            text-align: right;
        }

        .threeBtn {
            width: 650px;
            height: 40px;
            line-height: 40px;
            padding: 0 25px;
            border-top: 1px solid #e7e7e7;
        }

        .threeBtn ul li {
            float: left;
        }

        .threeBtn ul li a {
            vertical-align: middle;
            padding-right: 30px;
            font-size: 12px;
            font-weight: 700;
            color: #787878;
        }

        /* 댓글 작성 부분 */
        .reply {
            width: 700px;
            padding: 10px 0;
            border-top: 1px solid #e7e7e7;
        }

        .replyMore {
            background-color: #f2f2f2;
            border: none;
            font-size: 14px;
            color: #5A3673;
            padding: 10px 15px 20px 15px;
        }

        .defaultReply {
            width: 670px;
            margin: 0 15px;
            padding-bottom: 10px;
        }

        .replayPfImg {
            width: 34px;
            margin-right: 20px;
            float: left;
        }

        .replayPfImg2 {
            width: 34px;
            margin-right: 20px;
            float: left;
        }

        .replyTitle {
            height: 13px;
            font-size: 13px;
            font-weight: 700;
            padding-right: 10px;
        }

        .replyschedate {
            font-size: 13px;
            color: #c0c0c0;
        }

        .replyEdit {
            float: right;
        }

        .replyEdit a {
            color: #c0c0c0;
            font-size: 12px;
        }

        #replyResult {
            width: 643px;
            margin-top: 5px;
        }

        .replyFrom {
            margin: 10px 0 10px 15px;
        }

        .replyFrom input {
            width: 550px;
            height: 30px;
            margin: 5px 5px 5px 0;
            box-sizing: border-box;
            vertical-align: middle;
            border: 1px solid #c0c0c0;
        }

        #replyReg {
            width: 60px;
            height: 30px;
            background-color: #5A3673;
            border-radius: 3px;
            color: #e7e7e7;
            border: none;
            font-family: Noto Sans KR;
        }

        /* 우측 바 */
        .rightBar {
            position: absolute;
            width: 250px;
            height: 100%;
            background-color: #5A3673;
            left: 950px;
        }

        /*이전화면 버튼 div*/
        .rightBar #prevbtn {
            width: 250px;
            height: 60px;
            font-size: 14px;
            display: block;
            margin-bottom: 8px;
            line-height: 60px;
            color: #333333;
            font-weight: 700;
            border-top: 1px solid #fff;
            border-left: 1px solid #ececec;
            border-right: 1px solid #ececec;
            border-bottom: 1px solid #e0e0e0;
            border-radius: 3px;
            background-color: #fff;
            box-sizing: border-box;
        }

        .rightBar #prevbtn>.prevsvg {
            padding: 18px 0 0 30px;
            float: left;
            fill: #111111;
        }

        .rightBar>#rightbtns {
            clear: both;
            width: 250px;
            height: 70px;
            margin-bottom: 8px;
            border-left: 1px solid #ececec;
            border-right: 1px solid #ececec;
            border-bottom: 1px solid #e0e0e0;
            border-radius: 3px;
            background-color: #fff;
            text-align: center;
            color: #505050;
            font-weight: 500;
        }

        .rightBar>#rightbtns .rightbtn {
            float: left;
            width: 25%;
            padding: 15px 0;
        }

        /*우측 파일함,업무,일정,할일 아이콘 색,크기 통일*/
        .rightsvg {
            width: 23px;
            fill: #444444;
        }

        /*채팅 div*/
        #pjchat {
            width: 250px;
            height: 300px;
            background-color: #fff;
        }

        #pjchat>#pjmembox {
            height: 90%;
            overflow: hidden;
            padding: 10px 0;
        }

        /*scrollbar*/
        /* width */
        /* ::-webkit-scrollbar {
            width: 5px;
        } */

        /* Track */
        ::-webkit-scrollbar-track {
            background: #e7e7e7;
        }

        /* Handle */
        ::-webkit-scrollbar-thumb {
            background: #a2a2a2;
            border-radius: 10px;
        }

        /* Handle on hover */
        ::-webkit-scrollbar-thumb:hover {
            background: #505050;
        }

        /*전체참여자*/
        .allpj_title {
            position: relative;
            padding-top: 6px;
            margin: 0 15px 10px 15px;
            height: 20px;
            font-size: 12px;
            color: #343538;
            font-weight: 700;
        }

        /*전체보기 버튼*/
        .allpjmem {
            display: block;
            position: absolute;
            top: 5px;
            right: 0;
            font-size: 12px;
            color: #676869;
            font-weight: 400;
        }

        /*타이틀 : 관리자,내부참여자 */
        .part-title {
            font-size: 12px;
            position: relative;
            padding-top: 8px;
            padding-bottom: 8px;
            min-height: 12px;
            margin: 0 15px;
            border-top: 1px solid #e9eaed;
        }

        /*타이틀 : 프로젝트 멤버 리스트 */
        #pjmemlist {
            height: 80%;
            overflow-x: hidden;
        }

        #pjchat>#pjmembox>#pjmemlist>ul>li {
            position: relative;
            width: 250px;
            height: 50px;
            padding: 8px 20px 8px 20px;
            box-sizing: border-box;
        }

        /*프로필사진*/
        .userimg {
            z-index: 20;
            position: relative;
            top: 0;
            left: 0;
            width: 32px;
            height: 32px;
            content: "";
            display: block;
            border-radius: 32px;
            float: left;
            box-shadow: inset 0 0 0 1px rgba(0, 0, 0, .05);
        }

        /*프로젝트 멤버 이름*/
        .pjusername {
            display: inline-block;
            width: 160px;
            text-overflow: ellipsis;
            white-space: nowrap;
            overflow: hidden;
            margin: 0px 0 0 10px;
            color: #969696;
            vertical-align: middle;
            margin-top: 7px;
        }

        /*우측 사이드 채팅 아이콘*/
        .chatsvg {
            position: absolute;
            top: 11px;
            right: 20px;
            width: 25px;
        }

        #chatbtn-fill {
            width: 18px;
            margin-top: 10px;
            transform: translateY(3px);
        }

        /*우측 하단 채팅 버튼*/
        #pjchatbox {
            width: 250px;
            height: 45px;
            position: relative;
            line-height: 40px;
            font-weight: 700;
            font-size: 14px;
            color: #333;
            text-align: center;
            border-top: 1px solid #d7d7d7;
            border-bottom: 1px solid #d7d7d7;
            border-radius: 0 0 0px 0px;
            background-color: #fff;
        }

        #pjchatbox>.pjchatboxsvg {
            position: absolute;
            top: 11px;
            right: 20px;
            width: 25px;
        }
        
         /* 참석자 모달 변경 */
		.layer {
		    position: fixed;
		    width: 40%;
		    left: 50%;
		    margin-left: -21%; /* half of width */
		    height: 580px;
		    top: 40%;
		    margin-top: -150px; /* half of height */
		    overflow: auto;
		
		    /* decoration */
		    border: 1px solid #dadbdb;
		    background-color: rgb(255, 255, 255);
		    box-sizing: border-box;
		}
		@media (max-width: 600px) {
		    .layer {
		        width: 80%;
		        margin-left: -40%;
		    }
		}
		.hide {
		    display: none;
		}


    </style>
    <script>
    var result='${message}';
	console.log(result);
	if(result == "success") {
        alert("일정이 등록되었습니다.");
    } 
	var test ='${userlist}';
	for(i=0; i<test.length; i++){
		console.log(test.uname);	
	}
	
        // date picker
        $(function() {
            //input을 datepicker로 선언
            $.datepicker.setDefaults({
                dateFormat: 'yy-mm-dd' //Input Display Format 변경
                ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
                ,changeYear: true //콤보박스에서 년 선택 가능
                ,changeMonth: true //콤보박스에서 월 선택 가능                
                // ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
                // ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
                // ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
                // ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
                ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
                ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
                ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
                ,minDate: "-48M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                ,maxDate: "+12M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
            });                    
            $('#scheSdate').datepicker();
            $('#scheEdate').datepicker(); 
            
            //초기값을 오늘 날짜로 설정
            $('#scheSdate').datepicker('setDate', 'today');
            $('#scheEdate').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)  
                    
        });

        $(function() {
    		$("#scheStime, #scheEtime").timepicker({
		        timeFormat: 'HH:mm',
		        interval: 30,
		        minTime: '08',
		        maxTime: '22:00',
		        defaultTime: '08',
		        startTime: '08:00',
		        dynamic: false,
		        dropdown: true,
		        scrollbar: true        
    	    });
        });
    $(document).ready(function(){  
    	 var count = 1;
         var attendeename = $(".sche-res-list").text();
         console.log("ㄴㅇ" + attendeename);
         
         //일정 글 작성 시 : 참석자 리스트 드롭다운 
         $(".sche-res").click(function (){
     	    $p=$(this).parents(".schepeople");
     	    $p.find(".sche-res-add-wrap").toggle();
     	});
        //참석자 리스트 클릭시 해당 참석자 추가 
     	$(".sche-res-list").click(function(){
     	     $p=$(this).parents(".schepeople");
     	     var test = $(this).text();

     	     console.log("이름이뭐" + test);
             $p.find(".sche-res-add-wrap").hide();
             var add = '<input type="text" class="' + test +' sche-res-append" name="attendee" autocomplete="off" value="'+test+'">'+'<input type="button" class="sche-res-close '+test +'" id="'+ test +'" value="x">';
             $(".sche-res-wrap").append(add);
             
             $(document).on('click','#'+test,function(){
                 $p=$(this).parent(".sche-res-wrap");
                 $p.find("."+test).remove();
             });
         });
     
     	console.log(".sche-res-close"+attendeename);
     	
     	//참석자 하나씩 삭제

        $('.js-open').click(function () {
            var $layer = $('.js-layer');
            $layer.removeClass('hide');
        });
        $('.close').click(function () {
            var $layer = $('.js-layer');
            $layer.addClass('hide');
        });
        
        $(".pick").click(function(){
            if($(this).is(":checked") == true){
                $p=$(this).parent(".userlist_wrap");
                var user = $p.find("span").text();
                // var add = '<span>'+ user +'</span>'
                var add = '<input type="text" class="'+ user+ '" value="' + user+ '" name="attendee-child">'
                $(".pick-attendee").append(add);
            } else if($(this).is(":checked") == false){
                $p=$(this).parent(".userlist_wrap");
                var user = $p.find("span").text();
                if($("." + user).val() == user){
                    var aaa = $(".test").val();
                    console.log(aaa);
                    $("." + user).remove();
                 }
            }
        })
        function changeAttendee(){
            var change = $("input[name='attendee-child']").val();
            console.log("왜이래" +change)            
            $("input[name='attendee']").val(change);

        }
        
            var infowindow = new kakao.maps.InfoWindow({ zIndex: 1 });
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                mapOption = {
                    center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
                    level: 5 // 지도의 확대 레벨
                };
            // 지도를 생성합니다    
            var map = new kakao.maps.Map(mapContainer, mapOption);
        $("#locationSearch").click(function(){
    		// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
           
            // 장소 검색 객체를 생성합니다
            var ps = new kakao.maps.services.Places();
            // 키워드로 장소를 검색합니다
    		var keyword = $("#location").val();
    		console.log("위치정보 : " + keyword);
            ps.keywordSearch(keyword, placesSearchCB);
            // 키워드 검색 완료 시 호출되는 콜백함수 입니다

    	});
          function placesSearchCB(data, status, pagination) {
                if (status === kakao.maps.services.Status.OK) {
                    // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
                    // LatLngBounds 객체에 좌표를 추가합니다
                    var bounds = new kakao.maps.LatLngBounds();
                    for (var i = 0; i < data.length; i++) {
                        displayMarker(data[i]);
                        bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
                    }
                    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
                    map.setBounds(bounds);
                }
            }

            // 지도에 마커를 표시하는 함수입니다
            function displayMarker(place) {
                // 마커를 생성하고 지도에 표시합니다
                var marker = new kakao.maps.Marker({
                    map: map,
                    position: new kakao.maps.LatLng(place.y, place.x)
                });
                // 마커에 클릭이벤트를 등록합니다
                kakao.maps.event.addListener(marker, 'click', function () {
                    // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
                    infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
                    infowindow.open(map, marker);
                    console.log("마커위의" + place.place_name);
                    $("#aabbcc").val(place.place_name);
                });
            }
            
            
    });

    </script>
</head>


<body>
    <div class="header">
        <div>헤더 들어갈 자리</div>
    </div>
    <div class="main">
        <nav id="pj_sidebar">
            <button type="button" id="new_pj_btn" onclick="">+&nbsp;새
                프로젝트</button>
            <ul>
                <li><a href="#">
                        <svg version="1.1" class="pj_btn" xmlns="http://www.w3.org/2000/svg"
                            xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 50 35"
                            style="enable-background: new 0 0 50 35;" xml:space="preserve">
                            <g>
                                <rect y="3" width="50" height="3" />
                                <rect y="17" width="50" height="3" />
                                <rect y="31" width="50" height="3" />
                            </g>
                        </svg> 전체 <span class="pj_sb_alarm">00</span>
                    </a>
                </li>
           </ul>
        </nav>


        <div class="contents">
            <div class="wrap">
                <div class="write" id="write">
                    <input id="tab1" type="radio" name="tabs" class="tabs" checked>
                    <!--디폴트 메뉴-->
                    <label for="tab1" class="tabslabel"><svg version="1.1" id="Capa_1"
                            xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px"
                            y="0px" viewBox="0 0 60.017 60.017" style="enable-background:new 0 0 60.017 60.017;"
                            xml:space="preserve">
                            <path d="M59.144,3.731l-2.85-2.851c-1.164-1.161-3.057-1.162-4.221,0.001l-3.126,3.126H0v56h56V11.097l0.305-0.305l0,0l2.839-2.839
                       C60.308,6.789,60.308,4.895,59.144,3.731z M20.047,36.759l3.22,3.22l-4.428,1.208L20.047,36.759z M52.062,12.206L47.82,7.964
                       l1.414-1.414l4.243,4.242L52.062,12.206z M50.648,13.62L25.192,39.076l-4.242-4.242L46.406,9.378L50.648,13.62z M54,13.097v44.91H2
                       v-52h44.947L18.829,34.127l-0.188,0.188l-2.121,7.779l-1.226,1.226c-0.391,0.391-0.391,1.023,0,1.414
                       c0.195,0.195,0.451,0.293,0.707,0.293s0.512-0.098,0.707-0.293l1.226-1.226l7.779-2.123l26.351-26.35h0l0.447-0.447L54,13.097z
                        M57.73,6.539l-2.839,2.839l-4.243-4.243l2.839-2.839c0.384-0.384,1.009-0.383,1.393,0l2.85,2.85
                       C58.114,5.529,58.114,6.155,57.73,6.539z" />
                        </svg>글작성</label>
                    <input id="tab2" type="radio" name="tabs" class="tabs">
                    <label for="tab2" class="tabslabel"><svg version="1.1" xmlns="http://www.w3.org/2000/svg"
                            xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 59 59"
                            style="enable-background:new 0 0 59 59;" xml:space="preserve">
                            <g>
                                <path
                                    d="M52,21c-0.553,0-1,0.447-1,1v32H2V5h49v1c0,0.553,0.447,1,1,1s1-0.447,1-1V3H0v53h53V22C53,21.447,52.553,21,52,21z" />
                                <path d="M58.707,7.293c-0.391-0.391-1.023-0.391-1.414,0L27,37.586l-13.07-13.07c-0.391-0.391-1.023-0.391-1.414,0
        s-0.391,1.023,0,1.414l13.777,13.777C26.488,39.902,26.744,40,27,40s0.512-0.098,0.707-0.293l31-31
        C59.098,8.316,59.098,7.684,58.707,7.293z" />
                            </g>
                        </svg>업무</label>
                    <input id="tab3" type="radio" name="tabs" class="tabs">
                    <label for="tab3" class="tabslabel"><svg version="1.1" xmlns="http://www.w3.org/2000/svg"
                            xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 60 60"
                            style="enable-background:new 0 0 60 60;" xml:space="preserve">
                            <g>
                                <path d="M57,4h-7V1c0-0.553-0.447-1-1-1h-7c-0.553,0-1,0.447-1,1v3H19V1c0-0.553-0.447-1-1-1h-7c-0.553,0-1,0.447-1,1v3H3
		C2.447,4,2,4.447,2,5v11v43c0,0.553,0.447,1,1,1h54c0.553,0,1-0.447,1-1V16V5C58,4.447,57.553,4,57,4z M43,2h5v3v3h-5V5V2z M12,2h5
		v3v3h-5V5V2z M4,6h6v3c0,0.553,0.447,1,1,1h7c0.553,0,1-0.447,1-1V6h22v3c0,0.553,0.447,1,1,1h7c0.553,0,1-0.447,1-1V6h6v9H4V6z
		 M4,58V17h52v41H4z" />
                                <path d="M38,23h-7h-2h-7h-2h-9v9v2v7v2v9h9h2h7h2h7h2h9v-9v-2v-7v-2v-9h-9H38z M31,25h7v7h-7V25z M38,41h-7v-7h7V41z M22,34h7v7h-7
		V34z M22,25h7v7h-7V25z M13,25h7v7h-7V25z M13,34h7v7h-7V34z M20,50h-7v-7h7V50z M29,50h-7v-7h7V50z M38,50h-7v-7h7V50z M47,50h-7
		v-7h7V50z M47,41h-7v-7h7V41z M47,25v7h-7v-7H47z" />
                            </g>
                        </svg>일정</label>
                    <input id="tab4" type="radio" name="tabs" class="tabs">
                    <label for="tab4" class="tabslabel"><svg version="1.1" id="Capa_1"
                            xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px"
                            y="0px" viewBox="0 0 58 58" style="enable-background:new 0 0 58 58;" xml:space="preserve">
                            <g>
                                <rect x="9" y="12" width="40" height="2" />
                                <rect x="9" y="28" width="40" height="2" />
                                <rect x="9" y="44" width="40" height="2" />
                                <path d="M0,0v58h58V0H0z M56,56H2V2h54V56z" />
                            </g>
                        </svg>할일</label>
                    <div id="line"></div>
                    <div id="commonboard" class="writemenu">
                        <div class="textbody">
                            <div class="title">
                                <input type="text" class="title_detail" placeholder="제목 입력(선택)">
                            </div>
                            <textarea class="content_detail" placeholder="내용을 입력하세요"></textarea>
                        </div>
                        <div class="textfooter">
                            <div class="textfooter_func_wrap">
                                <a href=""><img src="../img/attachment.png" class="textfooter_func"></a>
                                <a href=""><img src="../img/picture-2.png" class="textfooter_func"></a>
                            </div>
                            <div class="textfooter_side">
                                <div class="public">
                                    <img src="../img/worldwide.png"><span>전체공개
                                        &#9660;</span>
                                </div>
                                <div class="public_admin" style="display: none;">
                                    <img src="../img/unlocked-1.png"><span>관리자만
                                        &#9660;</span>
                                </div>
                                <div class="public_setting" style="display: none;">
                                    <h1 class="public_setting_title">게시물 공개 대상</h1>
                                    <ul>
                                        <li class="set_li">
                                            <img src="../img/worldwide.png" class="setimg">
                                            <div class="p_set_con">
                                                <strong>전체공개</strong>
                                                <span>전체 사람들에게 공개됩니다.</span>
                                            </div>
                                        </li>
                                        <li class="set_li_admin">
                                            <img src="../img/unlocked-1.png" class="setimg">
                                            <div class="p_set_con">
                                                <strong>관리자만</strong>
                                                <span>프로젝트 관리자에게만 공개됩니다.</span>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <button class="writebtn">올리기</button>
                            </div>
                        </div>
                    </div>
                    <div id="sche" class="writemenu">
                        <div class="textbody">
                            <div class="title">
                                <input type="text" class="title_detail" placeholder="제목 입력(선택)">
                            </div>
                            <textarea class="content_detail2" placeholder="내용을 입력하세요"></textarea>
                        </div>
                        <div class="textfooter">
                            <div class="textfooter_func_wrap">
                                <a href=""><img src="../img/attachment.png" class="textfooter_func"></a>
                                <a href=""><img src="../img/picture-2.png" class="textfooter_func"></a>
                            </div>
                            <div class="textfooter_side">
                                <div class="public">
                                    <img src="../img/worldwide.png"><span>전체공개
                                        &#9660;</span>
                                </div>
                                <div class="public_admin" style="display: none;">
                                    <img src="../img/unlocked-1.png"><span>관리자만
                                        &#9660;</span>
                                </div>
                                <div class="public_setting" style="display: none;">
                                    <h1 class="public_setting_title">게시물 공개 대상</h1>
                                    <ul>
                                        <li class="set_li">
                                            <img src="../img/worldwide.png" class="setimg">
                                            <div class="p_set_con">
                                                <strong>전체공개</strong>
                                                <span>전체 사람들에게 공개됩니다.</span>
                                            </div>
                                        </li>
                                        <li class="set_li_admin">
                                            <img src="../img/unlocked-1.png" class="setimg">
                                            <div class="p_set_con">
                                                <strong>관리자만</strong>
                                                <span>프로젝트 관리자에게만 공개됩니다.</span>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <button class="writebtn">올리기</button>
                            </div>
                        </div>
                    </div>

                    <!-- 혜림 : 일정 입력화면-->
                    <div id="schedule" class="writemenu">
                    <form id="scheduelBoardForm" method="get" action="${pageContext.request.contextPath}/project/schedule/ins?pno=${pno}">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    	 <input type="hidden" name="pno" id="pno" value="${pno}">
                        <div class="textbody">
                            <div class="title">
                                <input type="text" class="title_detail" placeholder="일정 제목을 입력하세요" name="bname" autocomplete="off">
                            </div>
                            <div class="schedate">
                                <img src="${pageContext.request.contextPath}/resources/img/time.png" class="sche_icon">
                                <input type="text" id="scheSdate" name="sstart" class="d" autocomplete="off">
                                <input type="text" id="scheStime" name="sstarttime" class="t"> &nbsp; &nbsp; ~ &nbsp;
                                &nbsp;
                                <input type="text" id="scheEdate" name="send" class="d" autocomplete="off">
                                <input type="text" id="scheEtime" name="sendtime" class="t">&nbsp; &nbsp; &nbsp; 
                                <!-- <input type="checkbox" id="allday" name="allday"> &nbsp; 종일 -->
                            </div>
                            <div class="schepeople">
                                <img src="${pageContext.request.contextPath}/resources/img/users.png" class="sche_icon">
                                <!-- <input type="text" id="schePname" name="attendee" autocomplete="off"> -->
                                <div class="sche-res-wrap">
                                	<input type="text" class="sche-res" placeholder="참석자 추가" autocomplete="off">
                          			<input type="hidden" class="sche-res-uno-c" name="scheuno">
                          			 <!-- 업무담당자 모달 /  해당 project 유저 list 뿌리기 -->
                          			 <div class="sche-res-add-wrap">
                          				<div class="sche-add">
	                          				<ul>
	                          					<c:forEach items="${userlist}" var="ulist" varStatus="e">
	                          					<li class="sche-res-list sche-res-list${e.count}">${ulist.uname}</li>
	                          					<input type="hidden" class="taks-res-uno" name="attendee1" value="${ulist.uno }">
	                          					
	                         					</c:forEach>
	                          				</ul>
                          				</div>
                          			</div>
                          		</div>
                            </div>
                            <div class="scheplace">
                                <img src="${pageContext.request.contextPath}/resources/img/placeholder.png" class="sche_icon">
                                <button id="locationSearch"><img src="${pageContext.request.contextPath}/resources/img/search.png" style="width:16px; height:16px; margin:0; padding:0;"></button>
                                <input type="text" id="location" placeholder="장소를 입력해주세요">
                                <input type="text" name="splace" id="aabbcc">
                                <div id="map"></div>
                            </div>
                            <div class="schememo">
                                <img src="${pageContext.request.contextPath}/resources/img/calendar.png" id="calendaricon"class="sche_icon">
                            <textarea class="content_detail2" placeholder="내용을 입력하세요" name="smemo"></textarea>
                            </div>
                        </div>
                        <div class="textfooter">
                            <div class="textfooter_func_wrap">
                                <a href=""><img src="${pageContext.request.contextPath}/resources/img/attachment.png" class="textfooter_func"></a>
                                <a href=""><img src="${pageContext.request.contextPath}/resources/img/picture-2.png" class="textfooter_func"></a>
                            </div>
                            <div class="textfooter_side">
                                <div class="public">
                                    <img src="${pageContext.request.contextPath}/resources/img/worldwide.png"><span>전체공개
                                        &#9660;</span>
                                </div>
                                <div class="public_admin" style="display: none;">
                                    <img src="${pageContext.request.contextPath}/resources/img/unlocked-1.png"><span>관리자만
                                        &#9660;</span>
                                </div>
                                <div class="public_setting" style="display: none;">
                                    <h1 class="public_setting_title">게시물 공개 대상</h1>
                                    <ul>
                                        <li class="set_li">
                                            <img src="${pageContext.request.contextPath}/resources/img/worldwide.png" class="setimg">
                                            <div class="p_set_con">
                                                <strong>전체공개</strong>
                                                <span>전체 사람들에게 공개됩니다.</span>
                                            </div>
                                        </li>
                                        <li class="set_li_admin">
                                            <img src="${pageContext.request.contextPath}/resources/img/unlocked-1.png" class="setimg">
                                            <div class="p_set_con">
                                                <strong>관리자만</strong>
                                                <span>프로젝트 관리자에게만 공개됩니다.</span>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                           <button type="submit" class="writebtn">올리기</button>
                           
                        </div>
                        </form>
                    </div>
                    
                    
                    
                    
                    <div id="todo" class="writemenu">
                        <div class="textbody">
                            <div class="title">
                                <input type="text" class="title_detail" placeholder="제목 입력(선택)">
                            </div>
                            <textarea class="content_detail2" placeholder="내용을 입력하세요"></textarea>
                        </div>
                        <div class="textfooter">
                            <div class="textfooter_func_wrap">
                                <a href=""><img src="${pageContext.request.contextPath}/resources/img/attachment.png" class="textfooter_func"></a>
                                <a href=""><img src="${pageContext.request.contextPath}/resources/img/picture-2.png" class="textfooter_func"></a>
                            </div>
                            <div class="textfooter_side">
                                <div class="public">
                                    <img src="${pageContext.request.contextPath}/resources/img/worldwide.png"><span>전체공개
                                        &#9660;</span>
                                </div>
                                <div class="public_admin" style="display: none;">
                                    <img src="${pageContext.request.contextPath}/resources/img/unlocked-1.png"><span>관리자만
                                        &#9660;</span>
                                </div>
                                <div class="public_setting" style="display: none;">
                                    <h1 class="public_setting_title">게시물 공개 대상</h1>
                                    <ul>
                                        <li class="set_li">
                                            <img src="${pageContext.request.contextPath}/resources/img/worldwide.png" class="setimg">
                                            <div class="p_set_con">
                                                <strong>전체공개</strong>
                                                <span>전체 사람들에게 공개됩니다.</span>
                                            </div>
                                        </li>
                                        <li class="set_li_admin">
                                            <img src="${pageContext.request.contextPath}/resources/img/unlocked-1.png" class="setimg">
                                            <div class="p_set_con">
                                                <strong>관리자만</strong>
                                                <span>프로젝트 관리자에게만 공개됩니다.</span>
                                            </div>
                                        </li>
                                    </ul>
                                    <button class="writebtn">올리기</button>
                                  </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            
            
            
            <div class="one">
                <div class="boardHeader">
                    <div class="writeInfo">
                        <span><img src="${pageContext.request.contextPath}/resources/img/user-3.png" class="profileImg"></span>
                        <div class="writer">이혜림</div>
                        <div class="writeschedate">202012-18-17:34</div>
                        <img src="">
                    </div>
                    <div class="option">
                        <div>
                            <a href=""><img src="${pageContext.request.contextPath}/resources/img/push-pin.png" class="fixNotice"></a>
                        </div>
                        <div>
                            <a href="" id="dropdown"><img src="${pageContext.request.contextPath}/resources/img/more-1.png" class="editoption"></a>
                        </div>
                        <div class="editDropdown">
                            <ul>
                                <li><a href="">글 삭제</a></li>
                                <li><a href="">다른 프로젝트에 올리기</a></li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="boardResult">
                    일반 글 작성 내용입니다<br>
                    일반 글 작성 내용입니다<br>
                    일반 글 작성 내용입니다<br>
                    일반 글 작성 내용입니다<br>
                    일반 글 작성 내용입니다<br>
                    일반 글 작성 내용입니다<br>
                    <div class="replyCount">댓글 10개</div>
                </div>

                <div class="threeBtn">
                    <ul>
                        <li>
                            <a href=""><img src="${pageContext.request.contextPath}/resources/img/like.png" class="like"
                                    style="width: 19px; padding-right: 10px;  padding-bottom : 5px; vertical-align: middle;">좋아요</a>
                        </li>
                        <li>
                            <a href=""><img src="${pageContext.request.contextPath}/resources/img/chat-03.png" class="replyReg"
                                    style="width: 17px; padding-right: 10px;vertical-align: middle;">댓글작성</a>
                        </li>
                        <li>
                            <a href=""><img src="${pageContext.request.contextPath}/resources/img/bookmark.png" class="save"
                                    style="width: 13px; padding-right: 10px; vertical-align: middle;">담아두기</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="reply">
                <button class="replyMore">이전 댓글 더보기</button>
                <div class="defaultReply">
                    <span>
                        <img src="${pageContext.request.contextPath}/resources/img/user-3.png" class="replayPfImg">
                    </span>
                    <span class="replyTitle">이혜림</span>
                    <span class="replyschedate">202012-18-17:34</span>
                    <span class="replyEdit">
                        <a href="">수정 &nbsp;&nbsp;&nbsp;| </a>
                        <a href=""> &nbsp;&nbsp;&nbsp; 삭제</a>
                    </span>
                    <div id="replyResult">댓글 작성 내용입니다 댓글 작성 내용입니다 댓글 작성 내용입니다</div>
                </div>

                <div class="defaultReply">
                    <span>
                        <img src="${pageContext.request.contextPath}/resources/img/user-3.png" class="replayPfImg">
                    </span>
                    <span class="replyTitle">이혜림</span>
                    <span class="replyschedate">202012-18-17:34</span>
                    <span class="replyEdit">
                        <a href="">수정 &nbsp;&nbsp;&nbsp;| </a>
                        <a href=""> &nbsp;&nbsp;&nbsp; 삭제</a>
                    </span>
                    <div id="replyResult">댓글 작성 내용입니다 댓글 작성 내용입니다 댓글 작성 내용입니다</div>
                </div>
                <div class="replyFrom">
                    <span>
                        <img src="${pageContext.request.contextPath}/resources/img/user-2.png" class="replayPfImg2">
                    </span>
                    <input type="text" name="reply" id="replyarea" placeholder="댓글을 입력하세요.">
                    <button id="replyReg">등록</button>
                </div>
            </div>
            
            <!-- 혜림 : 일정 결과 화면 -->
			<c:forEach items="${schelist}" var="slist" varStatus="e">
            <div class="one">
                <div class="boardHeader">
                    <div class="writeInfo">
                        <span><img src="${pageContext.request.contextPath}/resources/img/user-3.png" class="profileImg"></span>
                        <div class="writer">${slist.uname}</div>
                        <div class="writeschedate">${slist.bdate}</div>
                        <img src="">
                    </div>
                    <div class="option">
                        <div>
                            <a href=""><img src="${pageContext.request.contextPath}/resources/img/push-pin.png" class="fixNotice"></a>
                        </div>
                        <div>
                            <a href="" id="dropdown"><img src="${pageContext.request.contextPath}/resources/img/more-1.png" class="editoption"></a>
                        </div>
                        <div class="editDropdown">
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/project/schedule/del?bno=${slist.bno}&pno=${pno}">글 삭제</a></li>
                                <li><a href="">다른 프로젝트에 올리기</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="boardResult">
                    <div class="result_wrap">
                        <!-- 일정, 제목-->
                        <div class="rtitle">
                            <input type="text" value="${slist.bname}" readonly>
                        </div>
                        <div class="rschedate">
                        
                            <img src="${pageContext.request.contextPath}/resources/img/time.png" class="sche_icon">
                            <%-- <fmt:formatDate pattern="yyyy년mm월dd일" value="${slist.sstart}"/> --%>
                            <input type="text" id="scheSdate" name="startdate" class="d" value="${slist.sstart}"> 
                            &nbsp; &nbsp; ~ &nbsp; &nbsp;
                            <%-- <fmt:formatDate pattern="yyyy년mm월dd일" value="${slist.send}"/> --%>
                            <input type="text" id="scheEdate" name="enddate" class="d" value="${slist.send}">
                        </div>
                        <!-- 참가자 -->
                        <div class="rschepeople">
                            <img src="${pageContext.request.contextPath}/resources/img/users.png" class="sche_icon">
                            <div class="attendeecount">참여자 <span>${slist.count}</span>명</div>
                            <div class="attendee">${slist.attendees}</div>
                            <button class="js-open  open-button">참석자 변경</button>
                            <!-- 참석자 모달 -->
                            <div class="js-layer  layer  hide">
                            <!-- <div id="attendee-modal"> -->
                                <!-- <div class="attendee_modal-layer"></div> -->
		                             <div class="ModalPopup">
		                             
                                    <!-- <div class="attendee-modal-content"> -->
                                        <div class="attendee-title">참석자변경</div>
                                        <div class="attendee-list">
                              			  
                                            <div class="attendee-search">
                                                <input type="text" placeholder="참석자 이름 검색">
                                                <button id="searchBtn"><img src="${pageContext.request.contextPath}/resources/img/search.png"></button>
                                            </div>
                                            <div class="attendee-people">
                                                <!-- 선택된 참가자가 표시됨  -->
                                                <form action="" method="">
                                                <div class="pick-attendee"></div>
                                                </form>
                                                <div class="userlist_wrap">
                                                    <img src="${pageContext.request.contextPath}/resources/img/user-3.png">
                                                    <span>HYELIM</span>
                                                    <input type="checkbox" class="pick" value="+ 선택">
                                                </div>
                                                <div class="userlist_wrap">
                                                    <img src="${pageContext.request.contextPath}/resources/img/user-3.png">
                                                    <span>TEST1</span>
                                                    <input type="checkbox" class="pick" value="+ 선택">
                                                </div>
                                                <div class="userlist_wrap">
                                                    <img src="${pageContext.request.contextPath}/resources/img/user-3.png">
                                                    <span>TEST2</span>
                                                    <input type="checkbox" class="pick" value="+ 선택">
                                                </div >
                                                <div class="userlist_wrap">
                                                    <img src="${pageContext.request.contextPath}/resources/img/user-3.png">
                                                    <span>test3</span>
                                                    <input type="checkbox" class="pick" value="+ 선택">
                                                </div>
                                                <div class="userlist_wrap">
                                                    <img src="${pageContext.request.contextPath}/resources/img/user-3.png">
                                                    <span>오은실천재</span>
                                                    <input type="checkbox" class="pick" value="+ 선택">
                                                </div>
                                                <div class="modal-btn">
                                                <button class="edit-btn close" >취소</button> &nbsp; 
                                                <button type="submit" class="edit-btn" onclick=" changeAttendee();">확인</button>
                                                </div> 
                                            </div>
                                            
                                        </div>
                                    </div>
                                
                            </div>
                            <div id="mask"></div>
                            <!-- <input type="text" id="schePname"> -->
	                        </div>
	                        <!-- 장소 -->
	                        <div class="rscheplace">
	                            <img src="${pageContext.request.contextPath}/resources/img/placeholder.png" class="sche_icon">
	                            <input type="text" value="${slist.splace}">
	                        </div>
	                        <!-- 메모 -->
	                        <div class="rschememo">
	                            <img src="${pageContext.request.contextPath}/resources/img/calendar.png" id="calendaricon"class="sche_icon">
	                        	<textarea class="content_detail2" placeholder="${slist.smemo}"></textarea>
	                        </div>
                    	</div>
                	</div>
                </div>
				</c:forEach>
                <div class="replyCount">댓글 10개</div>

                <div class="threeBtn">
                    <ul>
                        <li>
                            <a href=""><img src="${pageContext.request.contextPath}/resources/img/like.png" class="like"
                                    style="width: 19px; padding-right: 10px;  padding-bottom : 5px; vertical-align: middle;">좋아요</a>
                        </li>
                        <li>
                            <a href=""><img src="${pageContext.request.contextPath}/resources/img/chat-03.png" class="replyReg"
                                    style="width: 17px; padding-right: 10px;vertical-align: middle;">댓글작성</a>
                        </li>
                        <li>
                            <a href=""><img src="${pageContext.request.contextPath}/resources/img/bookmark.png" class="save"
                                    style="width: 13px; padding-right: 10px; vertical-align: middle;">담아두기</a>
                        </li>
                    </ul>
                </div>
            </div>

             <!-- 댓글 출력 -->
             <div class="reply">
                <button class="replyMore">이전 댓글 더보기</button>
                <div class="defaultReply">
                    <span>
                        <img src="${pageContext.request.contextPath}/resources/img/user-3.png" class="replayPfImg">
                    </span>
                    <span class="replyTitle">이혜림</span>
                    <span class="replyschedate">202012-18-17:34</span>
                    <span class="replyEdit">
                        <a href="">수정 &nbsp;&nbsp;&nbsp;| </a>
                        <a href=""> &nbsp;&nbsp;&nbsp; 삭제</a>
                    </span>
                    <div id="replyResult">댓글 작성 내용입니다 댓글 작성 내용입니다 댓글 작성 내용입니다</div>
                </div>

                <div class="defaultReply">
                    <span>
                        <img src="${pageContext.request.contextPath}/resources/img/user-3.png" class="replayPfImg">
                    </span>
                    <span class="replyTitle">이혜림</span>
                    <span class="replyschedate">202012-18-17:34</span>
                    <span class="replyEdit">
                        <a href="">수정 &nbsp;&nbsp;&nbsp;| </a>
                        <a href=""> &nbsp;&nbsp;&nbsp; 삭제</a>
                    </span>
                    <div id="replyResult">댓글 작성 내용입니다 댓글 작성 내용입니다 댓글 작성 내용입니다</div>
                </div>
                
                <!-- 댓글 입력 -->
                <div class="replyFrom">
                    <span>
                        <img src="${pageContext.request.contextPath}/resources/img/user-2.png" class="replayPfImg2">
                    </span>
                    <input type="text" name="reply" id="replyarea" placeholder="댓글을 입력하세요.">
                    <button id="replyReg">등록</button>
                </div>
            </div>
            
            
            
            <div class="one">
                <div class="boardHeader">
                    <div class="writeInfo">
                        <span><img src="${pageContext.request.contextPath}/resources/img/user-3.png" class="profileImg"></span>
                        <div class="writer">이혜림</div>
                        <div class="writeschedate">202012-18-17:34</div>
                        <img src="">
                    </div>
                    <div class="option">
                        <div>
                            <a href=""><img src="${pageContext.request.contextPath}/resources/img/push-pin.png" class="fixNotice"></a>
                        </div>
                        <div>
                            <a href="" id="dropdown"><img src="${pageContext.request.contextPath}/resources/img/more-1.png" class="editoption"></a>
                        </div>
                        <div class="editDropdown">
                            <ul>
                                <li><a href="">글 삭제</a></li>
                                <li><a href="">다른 프로젝트에 올리기</a></li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="boardResult">
                    일반 글 작성 내용입니다<br>
                    일반 글 작성 내용입니다<br>
                    일반 글 작성 내용입니다<br>
                    일반 글 작성 내용입니다<br>
                    일반 글 작성 내용입니다<br>
                    일반 글 작성 내용입니다<br>
                    <div class="replyCount">댓글 10개</div>
                </div>

                <div class="threeBtn">
                    <ul>
                        <li>
                            <a href=""><img src="${pageContext.request.contextPath}/resources/img/like.png" class="like"
                                    style="width: 19px; padding-right: 10px;  padding-bottom : 5px; vertical-align: middle;">좋아요</a>
                        </li>
                        <li>
                            <a href=""><img src="${pageContext.request.contextPath}/resources/img/chat-03.png" class="replyReg"
                                    style="width: 17px; padding-right: 10px;vertical-align: middle;">댓글작성</a>
                        </li>
                        <li>
                            <a href=""><img src="${pageContext.request.contextPath}/resources/img/bookmark.png" class="save"
                                    style="width: 13px; padding-right: 10px; vertical-align: middle;">담아두기</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="reply">
                <button class="replyMore">이전 댓글 더보기</button>
                <div class="defaultReply">
                    <span>
                        <img src="${pageContext.request.contextPath}/resources/img/user-3.png" class="replayPfImg">
                    </span>
                    <span class="replyTitle">이혜림</span>
                    <span class="replyschedate">202012-18-17:34</span>
                    <span class="replyEdit">
                        <a href="">수정 &nbsp;&nbsp;&nbsp;| </a>
                        <a href=""> &nbsp;&nbsp;&nbsp; 삭제</a>
                    </span>
                    <div id="replyResult">댓글 작성 내용입니다 댓글 작성 내용입니다 댓글 작성 내용입니다</div>
                </div>

                <div class="defaultReply">
                    <span>
                        <img src="${pageContext.request.contextPath}/resources/img/user-3.png" class="replayPfImg">
                    </span>
                    <span class="replyTitle">이혜림</span>
                    <span class="replyschedate">202012-18-17:34</span>
                    <span class="replyEdit">
                        <a href="">수정 &nbsp;&nbsp;&nbsp;| </a>
                        <a href=""> &nbsp;&nbsp;&nbsp; 삭제</a>
                    </span>
                    <div id="replyResult">댓글 작성 내용입니다 댓글 작성 내용입니다 댓글 작성 내용입니다</div>
                </div>
                <div class="replyFrom">
                    <span>
                        <img src="${pageContext.request.contextPath}/resources/img/user-2.png" class="replayPfImg2">
                    </span>
                    <input type="text" name="reply" id="replyarea" placeholder="댓글을 입력하세요.">
                    <button id="replyReg">등록</button>
                </div>
            </div>
            <div class="one">
                <div class="boardHeader">
                    <div class="writeInfo">
                        <span><img src="${pageContext.request.contextPath}/resources/img/user-3.png" class="profileImg"></span>
                        <div class="writer">이혜림</div>
                        <div class="writeschedate">202012-18-17:34</div>
                        <img src="">
                    </div>
                    <div class="option">
                        <div>
                            <a href=""><img src="${pageContext.request.contextPath}/resources/img/push-pin.png" class="fixNotice"></a>
                        </div>
                        <div>
                            <a href="" id="dropdown"><img src="${pageContext.request.contextPath}/resources/img/more-1.png" class="editoption"></a>
                        </div>
                        <div class="editDropdown">
                            <ul>
                                <li><a href="">글 삭제</a></li>
                                <li><a href="">다른 프로젝트에 올리기</a></li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="boardResult">
                    일반 글 작성 내용입니다<br>
                    일반 글 작성 내용입니다<br>
                    일반 글 작성 내용입니다<br>
                    일반 글 작성 내용입니다<br>
                    일반 글 작성 내용입니다<br>
                    일반 글 작성 내용입니다<br>
                    <div class="replyCount">댓글 10개</div>
                </div>

                <div class="threeBtn">
                    <ul>
                        <li>
                            <a href=""><img src="${pageContext.request.contextPath}/resources/img/like.png" class="like"
                                    style="width: 19px; padding-right: 10px;  padding-bottom : 5px; vertical-align: middle;">좋아요</a>
                        </li>
                        <li>
                            <a href=""><img src="${pageContext.request.contextPath}/resources/img/chat-03.png" class="replyReg"
                                    style="width: 17px; padding-right: 10px;vertical-align: middle;">댓글작성</a>
                        </li>
                        <li>
                            <a href=""><img src="${pageContext.request.contextPath}/resources/img/bookmark.png" class="save"
                                    style="width: 13px; padding-right: 10px; vertical-align: middle;">담아두기</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="reply">
                <button class="replyMore">이전 댓글 더보기</button>
                <div class="defaultReply">
                    <span>
                        <img src="${pageContext.request.contextPath}/resources/img/user-3.png" class="replayPfImg">
                    </span>
                    <span class="replyTitle">이혜림</span>
                    <span class="replyschedate">202012-18-17:34</span>
                    <span class="replyEdit">
                        <a href="">수정 &nbsp;&nbsp;&nbsp;| </a>
                        <a href=""> &nbsp;&nbsp;&nbsp; 삭제</a>
                    </span>
                    <div id="replyResult">댓글 작성 내용입니다 댓글 작성 내용입니다 댓글 작성 내용입니다</div>
                </div>

                <div class="defaultReply">
                    <span>
                        <img src="${pageContext.request.contextPath}/resources/img/user-3.png" class="replayPfImg">
                    </span>
                    <span class="replyTitle">이혜림</span>
                    <span class="replyschedate">202012-18-17:34</span>
                    <span class="replyEdit">
                        <a href="">수정 &nbsp;&nbsp;&nbsp;| </a>
                        <a href=""> &nbsp;&nbsp;&nbsp; 삭제</a>
                    </span>
                    <div id="replyResult">댓글 작성 내용입니다 댓글 작성 내용입니다 댓글 작성 내용입니다</div>
                </div>
                <div class="replyFrom">
                    <span>
                        <img src="${pageContext.request.contextPath}/resources/img/user-2.png" class="replayPfImg2">
                    </span>
                    <input type="text" name="reply" id="replyarea" placeholder="댓글을 입력하세요.">
                    <button id="replyReg">등록</button>
                </div>
            </div>

        </div>
        <div class="rightBar">
            <a href="#">
                <div id="prevbtn">
                    <svg version="1.1" class="prevsvg rightsvg" xmlns="http://www.w3.org/2000/svg"
                        xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 60 60"
                        style="enable-background:new 0 0 60 60;" xml:space="preserve">
                        <path
                            d="M2.414,30l13.293-13.293c0.391-0.391,0.391-1.023,0-1.414s-1.023-0.391-1.414,0l-14,14c-0.391,0.391-0.391,1.023,0,1.414
                   l14,14C14.488,44.902,14.744,45,15,45s0.512-0.098,0.707-0.293c0.391-0.391,0.391-1.023,0-1.414L2.414,30z" />
                    </svg> 이전화면

                </div>
            </a>
            <div id="rightbtns">
                <a href="#">
                    <div class="rightbtn btnhover">
                        <div>
                            <svg version="1.1" class="fileboxsvg rightsvg" xmlns="http://www.w3.org/2000/svg"
                                xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 60 60"
                                style="enable-background:new 0 0 60 60;" xml:space="preserve">
                                <g>
                                    <path d="M60,8.311c0-0.199-0.052-0.382-0.131-0.551c-0.027-0.209-0.112-0.412-0.254-0.579L53.46,0H6.54L0.384,7.182
                           C0.242,7.348,0.157,7.55,0.131,7.76C0.052,7.929,0,8.112,0,8.311V19h3v41h54V19h3V8.311z M7.46,2h45.08l4.286,5H3.174L7.46,2z
                            M55,58H5V19h50V58z M58,17h-1H3H2V9h56V17z" />
                                    <path d="M42,23H18v10h24V23z M40,31H20v-6h20V31z" />
                                    <path d="M45,38H15v14h30V38z M43,50H17V40h26V50z" />
                                    <path
                                        d="M22,48h5c0.552,0,1-0.447,1-1s-0.448-1-1-1h-5c-0.552,0-1,0.447-1,1S21.448,48,22,48z" />
                                    <path
                                        d="M27,44h11c0.552,0,1-0.447,1-1s-0.448-1-1-1H27c-0.552,0-1,0.447-1,1S26.448,44,27,44z" />
                                    <path d="M22,44c0.26,0,0.52-0.11,0.71-0.29C22.89,43.52,23,43.26,23,43c0-0.261-0.11-0.521-0.29-0.71c-0.38-0.37-1.04-0.37-1.42,0
                           C21.11,42.479,21,42.739,21,43c0,0.27,0.11,0.52,0.29,0.71C21.48,43.89,21.73,44,22,44z" />
                                    <path
                                        d="M31.29,46.29C31.11,46.479,31,46.739,31,47c0,0.26,0.11,0.52,0.29,0.71C31.48,47.89,31.74,48,32,48
                           c0.26,0,0.52-0.11,0.71-0.29C32.89,47.52,33,47.26,33,47c0-0.261-0.11-0.521-0.29-0.71C32.34,45.92,31.66,45.92,31.29,46.29z" />
                                    <path
                                        d="M38,46h-1c-0.552,0-1,0.447-1,1s0.448,1,1,1h1c0.552,0,1-0.447,1-1S38.552,46,38,46z" />
                                </g>
                            </svg>
                        </div>
                        <div>파일함</div>
                    </div>
                </a>
                <a href="#">
                    <div class="rightbtn btnhover">
                        <div><svg version="1.1" class="checkedsvg rightsvg" xmlns="http://www.w3.org/2000/svg"
                                xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 59 59"
                                style="enable-background:new 0 0 59 59;" xml:space="preserve">
                                <g>
                                    <path
                                        d="M52,21c-0.553,0-1,0.447-1,1v32H2V5h49v1c0,0.553,0.447,1,1,1s1-0.447,1-1V3H0v53h53V22C53,21.447,52.553,21,52,21z" />
                                    <path d="M58.707,7.293c-0.391-0.391-1.023-0.391-1.414,0L27,37.586l-13.07-13.07c-0.391-0.391-1.023-0.391-1.414,0
                           s-0.391,1.023,0,1.414l13.777,13.777C26.488,39.902,26.744,40,27,40s0.512-0.098,0.707-0.293l31-31
                           C59.098,8.316,59.098,7.684,58.707,7.293z" />
                                </g>
                            </svg></div>
                        <div>업무</div>
                    </div>
                </a>
                <a href="#">
                    <div class="rightbtn btnhover">
                        <div><svg version="1.1" class="schedulesvg rightsvg" xmlns="http://www.w3.org/2000/svg"
                                xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 60 60"
                                style="enable-background:new 0 0 60 60;" xml:space="preserve">
                                <g>
                                    <path d="M57,4h-7V1c0-0.553-0.447-1-1-1h-7c-0.553,0-1,0.447-1,1v3H19V1c0-0.553-0.447-1-1-1h-7c-0.553,0-1,0.447-1,1v3H3
                            C2.447,4,2,4.447,2,5v11v43c0,0.553,0.447,1,1,1h54c0.553,0,1-0.447,1-1V16V5C58,4.447,57.553,4,57,4z M43,2h5v3v3h-5V5V2z M12,2h5
                            v3v3h-5V5V2z M4,6h6v3c0,0.553,0.447,1,1,1h7c0.553,0,1-0.447,1-1V6h22v3c0,0.553,0.447,1,1,1h7c0.553,0,1-0.447,1-1V6h6v9H4V6z
                            M4,58V17h52v41H4z" />
                                    <path d="M38,23h-7h-2h-7h-2h-9v9v2v7v2v9h9h2h7h2h7h2h9v-9v-2v-7v-2v-9h-9H38z M31,25h7v7h-7V25z M38,41h-7v-7h7V41z M22,34h7v7h-7
                            V34z M22,25h7v7h-7V25z M13,25h7v7h-7V25z M13,34h7v7h-7V34z M20,50h-7v-7h7V50z M29,50h-7v-7h7V50z M38,50h-7v-7h7V50z M47,50h-7
                            v-7h7V50z M47,41h-7v-7h7V41z M47,25v7h-7v-7H47z" />
                                </g>
                            </svg></div>
                        <div>일정</div>
                    </div>
                </a>
                <a href="#">
                    <div class="rightbtn btnhover">
                        <div><svg version="1.1" class="todosvg rightsvg" xmlns="http://www.w3.org/2000/svg"
                                xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 58 58"
                                style="enable-background:new 0 0 58 58;" xml:space="preserve">
                                <g>
                                    <rect x="9" y="12" width="40" height="2" />
                                    <rect x="9" y="28" width="40" height="2" />
                                    <rect x="9" y="44" width="40" height="2" />
                                    <path d="M0,0v58h58V0H0z M56,56H2V2h54V56z" />
                                </g>
                            </svg></div>
                        <div>할일</div>
                    </div>
            </div></a>
            <div id="pjchat">
                <div id="pjmembox">
                    <div class="allpj_title">
                        전체참여자
                        <span>5명</span>
                        <a href="#" class="allpjmem">전체보기</a>
                    </div>
                    <div class="part-title">관리자&nbsp;(1)</div>
                    <div id="pjmemlist">
                        <ul>
                            <li class="btnhover">
                                <img src="${pageContext.request.contextPath}/resources/img/user-3.png" class="userimg" width="32px">
                                <span class="pjusername">김혜원</span>
                                <a href="#"><img src="${pageContext.request.contextPath}/resources/img/chat-04.png" class="chatsvg"></a>
                            </li>
                        </ul>
                        <div class="part-title">내부참여자&nbsp;(4)</div>
                        <ul>
                            <li class="btnhover">
                                <img src="${pageContext.request.contextPath}/resources/img/user-3.png" class="userimg" width="32px">
                                <span class="pjusername">이윤진</span>
                                <a href="#"><img src="${pageContext.request.contextPath}/resources/img/chat-04.png" class="chatsvg"></a>
                            </li>
                        </ul>
                        <ul>
                            <li class="btnhover">
                                <img src="${pageContext.request.contextPath}/resources/img/user-3.png" class="userimg" width="32px">
                                <span class="pjusername">이혜림</span>
                                <a href="#"><img src="${pageContext.request.contextPath}/resources/img/chat-04.png" class="chatsvg"></a>
                            </li>
                            <li class="btnhover">
                                <img src="${pageContext.request.contextPath}/resources/img/user-3.png" class="userimg" width="32px">
                                <span class="pjusername">오은실</span>
                                <a href="#"><img src="${pageContext.request.contextPath}/resources/img/chat-04.png" class="chatsvg"></a>
                            </li>
                            <li class="btnhover">
                                <img src="${pageContext.request.contextPath}/resources/img/user-3.png" class="userimg" width="32px">
                                <span class="pjusername">김봉영</span>
                                <a href="#"><img src="${pageContext.request.contextPath}/resources/img/chat-04.png" class="chatsvg"></a>
                            </li>
                        </ul>
                    </div>
                </div>
                <a href="">
                    <div id="pjchatbox">
                        채팅 &nbsp;<img src="${pageContext.request.contextPath}/resources/img/chat-04-fill.png" id="chatbtn-fill">
                    </div>
                </a>
            </div>
        </div>
    </div>
    <!-- </div>
    </div> -->
    
    <script>

        //게시글 작성 공개여부 설정
        $(".textfooter_side").on("click", function (e) {
            e.preventDefault();
            $(".public_setting").toggle();

            // if($('#pub_dropdown').data('clicked',true)){
            //     $("#pub").show();
            //     $("#admin").hide();
            // } else if($('#admin_dropdown').data('clicked',true)){
            //     $("#pub").show();
            //     $("#admin").hide();
            // }
            $('.set_li').on('click', function () {
                $(".public").show();
                $(".public_admin").hide();
            })
            $('.set_li_admin').on('click', function () {
                $(".public").hide();
                $(".public_admin").show();
            })
        })
        //게시글 작성 상자 늘어나기
        $('.wrap').on('keyup', 'textarea', function (e) {
            $(this).css('height', 'auto');
            $(this).height(this.scrollHeight);
        });
        $('.wrap').find('textarea').keyup();

        //작성된 글 더보기 메뉴 (혜림)
        $(".option #dropdown").on("click", function (e) {
            e.preventDefault();
            $(".editDropdown").toggle();
        });

        //스크롤 숨겼다가 hover하면 나타남
        $("#pjmemlist").mouseover(function () {
            $(this).css("overflow-y", "scroll");
        });
        $("#pjmemlist").mouseout(function () {
            $(this).css("overflow-y", "hidden");
        });

        //우측 버튼 hover시 background-color 변경
        $(".btnhover").hover(function () {
            $(this).css('background-color', '#e7e7e7');
        }, function () {
            $(this).css('background-color', '#ffffff');
        });
        //우측 이전화면 버튼 hover
        $("#prevbtn").hover(function () {
            $(this).css('border', '1px solid #23d9d9');
            $(this).css('color', '#23d9d9');
            $(".prevsvg").css('fill', '#23d9d9');
        }, function () {
            $(this).css('border', 'none');
            $(this).css('color', '#333333');
            $(".prevsvg").css('fill', '#111111');
        });
    </script>
</body>

</html>