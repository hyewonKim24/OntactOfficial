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
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/reset.css"
	rel="stylesheet" type="text/css">
<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
	width:100% !important;
	position: fixed;
	color: #333333;
	font-size: 14px;
	line-height: 1.15;
	background-color:#ffffff;
}
/* 인풋 박스 클릭시 테두리 없애기 */
input:focus {
	outline: none;
}

.header-wrap a {
	text-decoration: none;
	color:#505050;
}

.header-wrap {
	position: fixed;
	z-index: 999;
	width:100% !important;
	height: 60px;
	background-color:#ffffff;
	box-shadow: 0 4px 2px -2px #D5D5D5;
	top: 0 !important;
}

.header {
	width: 1200px;
	margin: 0 auto;
	height: 52px;
	padding-top: 8px;
	background-color:#ffffff;
}

.header-left-wrap {
	float: left;
	width: 580px;
}

#header-logo {
	width: 30px;
	height: 30px;
	padding-top: 7px;
	margin-right: 30px;
}

#header-pj {
	display: inline;
	vertical-align: top;
	width: 500px;
	height: 45px;
	background-size: 8px 5px;
	box-sizing: border-box;
	border-radius: 5px;
	border: 1px solid #e7e7e7;
}

.header-pj-select {
	cursor: pointer;
	display: inline-block;
	width: 130px;
	height: 40px;
	line-height: 40px;
	box-sizing: border-box;
	font-size: 14px;
	color: #505050;
	border: none;
}

.header-search-form {
	width: 500px;
	float: right;
	box-sizing: border-box;
	border: 1px solid #e7e7e7;
	border-radius: 3px;
}

#header-pj-input {
	border: none;
	width: 350px;
	height: 40px;
	float: right;
}

.header-right-wrap {
	float: right;
	width: 400px;
	height: 52px;
	top: 0;
	right: 0;
	bottom: 0;
	text-align: right;
	box-sizing: border-box;
}

.header-btn {
	padding: 5px 15px 5px;
	height: 30px;
	line-height: 30px;
	font-size: 13px;
	color: #787878;
	font-weight: 700;
	letter-spacing: -1px;
	border: 1px solid #c0c0c0;
	border-radius: 30px;
	background-color: #fff;
}

.header-btn:hover {
	color: #505050;
	border: 1px solid #505050;
}

.header-right-icon {
	line-height: 40px;
	height: 30px;
	width: 15px;
	margin-left: 20px;
}

.header-icon-wrap {
	margin: 0px 10px 0 10px;
}

.header-icon {
	vertical-align: middle;
}

.alarm-count {
	position: absolute;
	display: none;
	top: 15px;
	width: 5px;
	height: 13px;
	line-height: 12px;
	padding: 0 5px;
	text-align: center;
	font-size: 10px;
	margin-left: 16px;
	color: #fff;
	background-color: #fc0d1b;
	border-radius: 6px;
	z-index: 100;
}
.alarm-counts {
	position: absolute;
	display: none;
	top: 15px;
	width: 10px;
	height: 13px;
	line-height: 12px;
	padding: 0 5px;
	text-align: center;
	font-size: 10px;
	margin-left: 16px;
	color: #fff;
	background-color: #fc0d1b;
	border-radius: 6px;
	z-index: 100;
}

/* 모달 */
.chat-wrap {
	width: 380px;
	height: 550px;
	display: none;
	position: absolute;
	top: 60px;
	text-align: left;
	border: 1px solid #e7e7e7;
	background: #fff;
	z-index: 1050;
	border: 1px solid #e7e7e7;
	box-shadow: 0 0 6px 2px #e7e7e7;
	border-radius: 7px;
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

#chat-scroll-box{
	width:380px;
	height:445px;
	overflow: scroll;
}

.tel-scroll-box{
	width:380px;
	height:445px;
	overflow: scroll;
}

#all-alarm-scroll-box{
	width:380px;
	height:445px;
	overflow: scroll;
}
#alarm-scroll-box{
	width:380px;
	height:445px;
	overflow: scroll;
}

.alarm-wrap {
	width: 380px;
	height: 550px;
	display: none;
	position: absolute;
	top: 60px;
	text-align: left;
	border: 1px solid #e7e7e7;
	background: #fff;
	z-index: 1050;
	border: 1px solid #e7e7e7;
	box-shadow: 0 0 6px 2px #e7e7e7;
	border-radius: 7px;
}

.my-wrap {
	width: 300px;
	height: 220px;
	display: none;
	position: absolute;
	top: 60px;
	right: 10%;
	padding: 30px;
	text-align: left;
	border: 1px solid #e7e7e7;
	background: #fff;
	z-index: 1050;
	border: 1px solid #e7e7e7;
	box-shadow: 0 0 6px 2px #e7e7e7;
	border-radius: 7px;
}

/* 채팅 및 알림 모달 */
.chat-alarm-tab {
	height: 50px;
	border-bottom: 1px solid #c0c0c0;
}

.chat-tab-box {
	margin-left: 10px;
}

.chat-tab-box a {
	display: inline-block;
	padding: 0 15px;
	min-width: 40px;
	height: 47px;
	line-height: 47px;
	color: #505050;
	text-align: center;
	font-weight: 700;
	font-size: 13px;
	border-bottom: 3px solid #fff;
}

.chat-tab-box .chat-tab1 {
	border-bottom: 3px solid #432D73;
}

#chat-add {
	margin-left: 150px;
}

.search-box {
	margin: 10px 12px;
	padding-left: 15px;
	height: 32px;
	line-height: 32px !important;
	border: 1px solid #e7e7e7;
	border-radius: 4px;
}

.icon-middle {
	vertical-align: middle;
}

#chat-search-input {
	border: none;
	width: 315px;
	line-height: 25px;
	display:inline-block;
}
#tel-search-input{
	border: none;
	width: 315px;
	line-height: 25px;
}
#alert-search-input{
	border: none;
	width: 315px;
	line-height: 25px;
}
#all-alert-search-input{
	border: none;
	width: 315px;
	line-height: 25px;
}
.alarm-all-view{
	background: none;
	border:none;
	font-size:13px;
	font-weight: bold;
}
.alarm-all-view2{
	background: none;
	border:none;
	font-size:13px;
	font-weight: bold;
	margin-left:100px;
}
.chat-search {
	padding-top: 12px;
	vertical-align: middle;
	margin-right: 5px;
}

.tel-tab-wrap {
	display: none;
}

.alarm-all-view {
	margin-left: 100px;
}

.chat-scroll-box {
	overflow: hidden;
}

.drag-bar {
	position: relative;
	width: 4px;
	height: 100%;
	margin: 0 auto;
	-webkit-border-radius: 16px;
	-moz-border-radius: 16px;
	border-radius: 16px;
	text-align: center;
}

.chatlist-td{
	clear:both;
	display: inline-block;
	float: right;
	height: 50px;
	width: 300px;
	padding-top:10px;
}
.alarmlist-td{
	clear:both;
	display: inline-block;
	float: right;
	height: 50px;
	width: 300px;
	padding-top:10px;
}
.alarm-name{
	border-bottom: 1px solid #e7e7e7;
	height: 75px;
}
.alarm-name-wrap{
	border-bottom: 1px solid #e7e7e7;
	height: 75px;
	background-color: #eeedf9;
}
.alert-date{
	font-size:9px;
	color:#787878;
	word-spacing:-1px;
	float: right;
	font-weight: normal !important;
	width: 95px;

}
.alarmlist-name{
	font-size:13px;
	font-weight: bold;
	padding-top:10px;
	color:#333333;
}
.alarmlist-content{
	font-size:11px;
	color:#505050;
}

.chat-name {
	border-bottom: 1px solid #e7e7e7;
	height: 75px;
}


.chat-users-icon {
	margin: 20px;
	display: inline-block;
	position: relative;
}

.chat-room-name {
	font-size: 12px;
	font-weight: bold;
	line-height: 25px;
}

.chat-recent-content {
	font-size: 10px;
	float: left;
	position: relative;
}

.chat-room-count {
	display: inline-block;
	margin-left: 4px;
	padding: 0 6px 0 5px;
	height: 16px;
	line-height: 16px;
	text-align: left;
	font-size: 12px;
	color: #fefefe;
	border-radius: 8px;
	background: #a9adb1;
}

.chat-alert-count{
	background-color: red;
	color:#fff;
	display:inline-block;
	float:right;
	width: 15px;
	height:15px;
	text-align: center;
	vertical-align: middle;
	border-radius: 30px;
	font-size:12px;
	line-height:15px;
	margin-right:20px;
	margin-bottom:10px;
	padding:3px;
	
}
/* 알림 모달 */
.alarmlist-td{
	line-height: 20px;
	width: 300px;
}

/* 프로필 */
#h-profile-top {
	margin: 0 auto;
	padding-top: 10px;
	padding-bottom: 20px;
	border-bottom: 1px solid #c0c0c0;
	line-height: 40px;
	text-align: center;
}

#h-profile-bottom {
	margin: 0 auto;
	padding-top: 10px;
	line-height: 40px;
	text-align: center;
}

.h-profile-icon {
	vertical-align: middle;
	margin-right: 10px;
}

.tel-title {
	width: 370px;
	padding-top: 10px;
	padding-left: 15px;
	font-size: 11px;
	font-weight: bold;
}

.tel-my {
	height: 76px;
	vertical-align: middle;
	border-bottom: 1px solid #e7e7e7;
}

.tel-other {
	height: 76px;
	vertical-align: middle;
	border-bottom: 1px solid #e7e7e7;
}

.tel-my-img {
	margin: 20px;
	display: inline;
	float: left;
	border-radius: 90px;
	box-shadow: inset 0 0 0 1px rgba(0, 0, 0, .05);
}

.tel-my-desc {
	display: inline;
	float: left;
	width: 290px;
	height: 70px;
	line-height: 70px;
	padding-left: 10px;
	font-size: 12px;
	font-weight: bold;
}

.tel-all-desc {
	display: inline;
	float: left;
	width: 290px;
	height: 70px;
	line-height: 70px;
	padding-left: 10px;
	font-size: 12px;
	font-weight: bold;
}

.tel-chat-icon {
	float: right;
	margin: 20px;
	height: 25px;
}

/* 프로필 정보 */
.prof-info-dim {
	position: fixed;
	top: 0px;
	left: 0px;
	width: 100%;
	height: 100%;
	overflow: hidden;
	background: rgb(0, 0, 0);
	opacity: 0.3;
	z-index: 500;
	display: none;
}

.prof-info {
	position: fixed;
	width: 300px;
	height: 300px;
	background-color: #fff;
	z-index: 9000;
	top: 30%;
	left: 40%;
	border: 1px solid #fff;
	border-radius: 4px;
	-webkit-border-radius: 4px;
	display: none;
}

.prof-exit {
	margin-right: 10px;
	margin-top: 10px;
}

.prof-name {
	float: left;
	font-size: 30px;
	font-weight: bold;
	line-height: 50px;
	padding: 10px;
	margin-top: 20px;
	margin-left: 10px;
}

.prof-cname {
	font-size: 13px;
	line-height: 20px;
	padding: 10px;
	margin-top: 50px;
	margin-left: 10px;
}
#Logout{
	background-color: #fff;
	border:none;
	display:inline-block;
}
.profile-img{
    content: "";
    display: block;
    border-radius: 90px;
    box-shadow: inset 0 0 0 1px rgba(0, 0, 0, .05);
    margin-left:130px;

}
.profile-name{
	font-size:13px;
	font-weight: bold;
}
</style>
<script>

	$(document).ready(function() {
		var timerID;
 		allAlertcount(); 
		//DB에 채팅알림 전체 수 
		function allChatAlert() {
		$.ajax({
			url: "${pageContext.request.contextPath}/chatalertall",
			async : false,
			success:function(object){
				console.log("채팅알림수:"+object);
				$("#chat-alarm-count").html('');
				$("#chat-alarm-counts").html(''); 
				
				$("#chat-alarm-count").css("display","inline");
				$("#chat-alarm-counts").css("display","inline"); 
				
				if(object==0 || object==null){
				$("#chat-alarm-count").remove();
				$("#chat-alarm-counts").remove(); 
				}else{
					if(object>9){
						$("#chat-alarm-count").remove();
						$("#chat-alarm-counts").append(object);
					}else{
						$("#chat-alarm-counts").remove(); 
						$("#chat-alarm-count").append(object);
					}					
				}
			},
			error:function(){
				console.log("실패");
			}
		});
				setTimeout(allChatAlert, 2000); 
		}
		//	timerID = setInterval("allChatAlert()", 1000); // 2초 단위로 갱신 처리
	
		
		// 글 작성 알림 카운트 ajax 추가
 		function allAlertcount(){ 
		$.ajax({
					url: "${pageContext.request.contextPath}/alertcount",
					async : false,
					success:function(data){
						console.log("알림추가")
						$("#alarm-count").html('');
						$("#alarm-counts").html('');

						$("#alarm-count").css("display","inline");
						$("#alarm-counts").css("display","inline");
						
						if(data==0 || data==null){
							$("#alarm-count").remove();
							$("#alarm-counts").remove();
						}else{
							if(data>9){
								$("#alarm-count").remove();
								$("#alarm-counts").append(data);
							}else{
								$("#alarm-count").append(data);
								$("#alarm-counts").remove(); 
							}			
						}
						allChatAlert();
					},
					error:function(){
						console.log("실패");
					}
				});
		}  
		
/*  		$.when(allAlertcount(),allChatAlert()).done(function(result1, result2){
 		    console.log("여러개 함수 순차 실행:"+result1, result2);
 		}); */
		
		
		$("#chat-icon").click(function() {
			$(".chat-wrap").toggle();
			$(".alarm-wrap").hide();
			$(".my-wrap").hide();
			//DB에 저장된 채팅 list가져오기 
			$.ajax({
				url: "${pageContext.request.contextPath}/chatlist",
				success:function(object){
					$("#chat-scroll-box").html('');
					var href= "this.href";
					
					var printHTML = "<table id='chat-list-table'>";
					for(var i=0 in object){
					printHTML += "<tr class='chat-name'>";
					printHTML += "<td><a href=\"${pageContext.request.contextPath}/chat/chatroomdetail?chatno="+object[i].chatno+"\""+
						" target='_blank' onClick=\"window.open(this.href,\'\', \'width=470, height=650\'); return false;\">";
					printHTML += "<span class='chat-users-icon'>";
					printHTML += "<img src='${pageContext.request.contextPath}/resources/img/svg/users.svg' width='35px' height='35px'></span>";
					printHTML += "</a></td><td class='chatlist-td'>";
					printHTML += "<a href=\"${pageContext.request.contextPath}/chat/chatroomdetail?chatno="+object[i].chatno+"\""+
					" target='_blank' onClick=\"window.open(this.href,\'\', \'width=470, height=650\'); return false;\">";
					printHTML += "<span class='chat-room-name' >";
					printHTML += " <p class='chatlist-name'> "+ object[i].chatno +")"+ object[i].chatname;
					printHTML += "<span class='chat-room-count'> "+object[i].mcount +"</span></span></p>";
					printHTML += "<span class='chat-recent-content'>"+object[i].content+"</span>"
					if(object[i].chatcount!=null && object[i].chatcount!=0){
						printHTML += "<span class='chat-alert-count'>"+ object[i].chatcount +"</span></a></td>";
					}
					printHTML += " </a> </tr>";
					
					}
					printHTML += "</table>";
					$("#chat-scroll-box").append(printHTML);
					
					//채팅방 클릭하면 모달창 닫힘
					$(".chat-name").click(function(){
						$(".chat-wrap").hide();
					});
					
				},
				error:function(){
					console.log("실패");
				}
			});
			
			
		});
		//알림 모달 켰을 때 
		$("#alarm-icon").click(function() {
			$(".alarm-all-view").show();
			$(".alarm-all-view2").hide();
			$(".alarm-wrap").toggle();
			$(".chat-wrap").hide();
			$(".my-wrap").hide();
			$(".alarm-tab1").css("border-bottom", "3px solid #432D73");
			$(".alarm-tab2").css("border", "none");
			$(".alarm-tab-wrap").show();
			$(".all-alarm-tab-wrap").hide();
			$.ajax({
				url: "${pageContext.request.contextPath}/alertlist",
				success:function(object){
					$("#alarm-scroll-box").html('');
					console.log("알림모달 켰을때 object"+object);
						var printHTML = "<table id='alarm-list-table'>";
						for(var i=0 in object){
							printHTML += "<tr class='alarm-name-wrap'>";
							printHTML += "<td><span class='chat-users-icon'>";
							printHTML += "<img src='${pageContext.request.contextPath}/resources/img/user-3.png' width='35px' height='35px'></span>";
							printHTML += "</td><td class='alarmlist-td'><a href='#'><p class='alarmlist-name'>"+object[i].pname;
							printHTML += "<span class='alert-date'>"+ object[i].fdate+ "</span></p>";
							printHTML +=  "<p class='alarmlist-content'>"+object[i].acontent+"</p></a></td>";
	/* 						printHTML += "<td class='alarmlist-right'>"+object[i].adate +"</td>";
 */					}
					printHTML += "</tr></table>";
					$("#alarm-scroll-box").append(printHTML);
					if(object==null){
						$("#alarm-scroll-box").html('미확인 알림이 없습니다');
					}

					
					},
				error:function(){
					console.log("실패");
				}
			});
		});
		$("#my-icon").click(function() {
			$(".my-wrap").toggle();
			$(".chat-wrap").hide();
			$(".alarm-wrap").hide();
		});
		$(".chat-tab1").click(function() {
			$(".chat-tab1").css("border-bottom", "3px solid #432D73");
			$(".chat-tab2").css("border", "none");
			$(".chat-tab-wrap").show();
			$(".tel-tab-wrap").hide();
		});
		
		//연락처 부분 모달
		$(".chat-tab2").click(function() {
			$(".chat-tab2").css("border-bottom", "3px solid #432D73");
			$(".chat-tab1").css("border", "none");
			$(".chat-tab-wrap").hide();
			$(".tel-tab-wrap").show();
			$.ajax({
			url: "${pageContext.request.contextPath}/userlist",
			success:function(object){
				$(".tel-all").html('');
					var html="<table id='tel-list-table'>";
				for(var i=0 in object){
					console.log(object+"성공");
					html+="<form action='${pageContext.request.contextPath}/chat/chatroomnew' method='post' id='chatfrm1'>";
					html += "<tr class='tel-other'>";
					html += "<input type='hidden' name='chatuno' value='"+object[i].uno+"'>";
					html += "<input type='hidden' name='chatuname' value='"+object[i].uname+"'>";
					if(object[i].ufilepath==null){
					html += "<td><img src='${pageContext.request.contextPath}/resources/img/user-3.png' width='35px' height='35px' class='tel-my-img'></td>";
					}else{
					html += "<td><img src='"+object[i].ufilepath+"' width='35px' height='35px' class='tel-my-img'></td>";
					}
					html += "<td class='tel-all-desc'>";
					html += "<a href='#' class='tel-prof-modal'>" +object[i].uname +" </a>";
					html += " <a href=\"${pageContext.request.contextPath}/chat/chatroom?chatuno="+ object[i].uno+"&chatuname="+ object[i].uname+"\" onClick= \"window.open(this.href, \'\', \'width=470, height=650\'); return false;\">";
					html += "<img src='${pageContext.request.contextPath}/resources/img/svg/chat-03.svg' width='30px' height='25px' class='tel-chat-icon'></a>";
					html += "</td></tr></form>";
					
				}
					html += "</table>";
					$(".tel-all").append(html);
			},
			error:function(){
				console.log("실패");
			}
		}); 
		});
		//알림 모달 
		$(".alarm-tab1").click(function() {
			$(".alarm-all-view2").hide();
			$(".alarm-all-view").show();
			$(".alarm-tab1").css("border-bottom", "3px solid #432D73");
			$(".alarm-tab2").css("border", "none");
			$(".alarm-tab-wrap").show();
			$(".all-alarm-tab-wrap").hide();
			$.ajax({
				url: "${pageContext.request.contextPath}/alertlist",
				success:function(object){
					$("#alarm-scroll-box").html('');
					
					var printHTML = "<table id='alarm-list-table'>";
					for(var i=0 in object){
						printHTML += "<tr class='alarm-name-wrap'>";
						printHTML += "<td><span class='chat-users-icon'>";
						printHTML += "<img src='${pageContext.request.contextPath}/resources/img/user-3.png' width='35px' height='35px'></span>";
						printHTML += "</td><td class='alarmlist-td'><a href='#'><p class='alarmlist-name'>"+object[i].pname;
						printHTML += "<span class='alert-date'>"+ object[i].fdate+ "</span></p>";
						printHTML +=  "<p class='alarmlist-content'>"+object[i].acontent+"</p></a></td>";
/* 						printHTML += "<td class='alarmlist-right'>"+object[i].adate +"</td>";
 */					}
					printHTML += "</tr></table>";
					$("#alarm-scroll-box").append(printHTML);
				},
				error:function(){
					console.log("실패");
				}
			});
		});
		
		//전체 알림 탭
		$(".alarm-tab2").click(function() {
			$(".alarm-all-view2").show();
			$(".alarm-all-view").hide();
			$(".alarm-tab2").css("border-bottom", "3px solid #432D73");
			$(".alarm-tab1").css("border", "none");
			$(".all-alarm-tab-wrap").show();
			$(".alarm-tab-wrap").hide();
			$.ajax({
				url: "${pageContext.request.contextPath}/alertalllist",
				success:function(object){
					$("#all-alarm-scroll-box").html('');
					
					var printHTML = "<table id='all-alarm-list-table'>";
					for(var i=0 in object){
						if(object[i].acount==1){
						printHTML += "<tr class='alarm-name-wrap'>";
						printHTML += "<td><span class='chat-users-icon'>";
						printHTML += "<img src='${pageContext.request.contextPath}/resources/img/user-3.png' width='35px' height='35px'></span>";
						printHTML += "</td><td class='alarmlist-td'><a href='#'><p class='alarmlist-name'>"+object[i].pname;
						printHTML += "<span class='alert-date'>"+ object[i].fdate+ "</span></p>";
						printHTML +=  "<p class='alarmlist-content'>"+object[i].acontent+"</p></a></td>";
 						printHTML += "<td class='alarmlist-right'>"+object[i].adate +"</td>";
						}else{
						printHTML += "<tr class='alarm-name'>";
						printHTML += "<td><span class='chat-users-icon'>";
						printHTML += "<img src='${pageContext.request.contextPath}/resources/img/user-3.png' width='35px' height='35px'></span>";
						printHTML += "</td><td class='alarmlist-td'><a href='#'><p class='alarmlist-name'>"+object[i].pname;
						printHTML += "<span class='alert-date'>"+ object[i].fdate+ "</span></p>";
						printHTML +=  "<p class='alarmlist-content'>"+object[i].acontent+"</p></a></td>";
						}
 					}
					printHTML += "</tr></table>";
					$("#all-alarm-scroll-box").append(printHTML);
				},
				error:function(){
					console.log("실패");
				}
			});
			
		});
		
		
		
		
		$(".tel-prof-modal").click(function() {
			$(".prof-info-dim").css("display", "block");
			$(".prof-info").css("display", "block");
		});

		$(".prof-exit").click(function() {
			$(".prof-info-dim").css("display", "none");
			$(".prof-info").css("display", "none");
		});
		
		//채팅 검색기능
		$("#chat-search-input").keyup(function(){
			var c =$(this).val();
			$("#chat-list-table tr").hide();
			console.log("검색어:"+c);
			var temp= $("#chat-list-table td:contains('"+c+"')");
			console.log("temp"+temp);
			
			$(temp).parent().show();
		});
		
		//연락처 검색기능
		$("#tel-search-input").keyup(function(){
			var c =$(this).val();
			$("#tel-list-table tr").hide();
			console.log("검색어:"+c);
			var temp= $("#tel-list-table td:contains('"+c+"')");
			console.log("temp"+temp);
			
			$(temp).parent().show();
		});
		//미확인 알람 검색기능
		$("#alert-search-input").keyup(function(){
			var c =$(this).val();
			$("#alarm-list-table tr").hide();
			var temp= $("#alarm-list-table td:contains('"+c+"')");
			console.log("temp"+temp);
			$(temp).parent().show();
		});
		//전체 알람 검색기능
		$("#all-alert-search-input").keyup(function(){
			var c =$(this).val();
			$("#all-alarm-list-table tr").hide();
			var temp= $("#all-alarm-list-table td:contains('"+c+"')");
			console.log("temp"+temp);
			$(temp).parent().show();
		});
		
		
		//채팅창 클릭했을 때 모달창 닫기 ㅠㅠ 안먹힘 
		$(".chat-name").click(function(){
			$(".chat-wrap").hide();
		});
		
		
	});
</script>
</head>

<body>

			<sec:authentication property="principal.username" var="username"/>
			<sec:authentication property="principal.uno" var="uno"/>
			<sec:authentication property="principal.uname" var="uname"/>
			<sec:authentication property="principal.ufilepath" var="ufilepath"/>
			<sec:csrfInput />
			<input type="hidden" value='${uname}' name="sessionuserid" id="sessionuserid">
			<input type="hidden" value="${uno}" id="uno" name="uno">
			<input type="hidden" value="${ufilepath}" id="ufilepath" name="ufilepath">
			
			
	<div class="header-wrap">
		<div class="header">
			<span class="header-left-wrap"> <!-- 로고 넣어야 함 ! --> <img
				src="img/png/internet.png" id="header-logo"> <span
				id="header-search">
					<form action="#" class="header-search-form">
						<select class="header-pj-select">
							<option value="P">&nbsp;&nbsp;&nbsp;프로젝트</option>
							<option value="A">&nbsp;&nbsp;&nbsp;전체</option>
							<option value="B">&nbsp;&nbsp;&nbsp;글</option>
							<option value="R">&nbsp;&nbsp;&nbsp;댓글</option>
						</select> <input type="text" placeholder="검색어를 입력해주세요" id="header-pj-input">
					</form>

			</span>

			</span> <span class="header-right-wrap"> 
			<a href="#" class="header-btn">관리자 설정</a> <a href="#" class="header-btn"> <svg
						version="1.1" id="Capa1" xmlns="http://www.w3.org/2000/svg"
						xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
						viewBox="0 0 42 42" style="enable-background: new 0 0 42 42;"
						xml:space="preserve" width="10px" height="10px" class="add">
                        <polygon
							points="42,20 22,20 22,0 20,0 20,20 0,20 0,22 20,22 20,42 22,42 22,22 42,22 " />
                    </svg> &nbsp; 직원 초대
			</a> <span class="header-icon-wrap"> <a href="#"
					class="header-right-icon" id="chat-icon"> 
					<span class="alarm-count" id="chat-alarm-count"></span> 
					<span class="alarm-counts" id="chat-alarm-counts"></span> 
					
					<!--채팅 아이콘--> <svg
							id="Layer1" data-name="Layer 1"
							xmlns="http://www.w3.org/2000/svg" viewBox="0 0 50 50"
							fill="#505050" width="25px" height="25px" class="header-icon">
                            <defs>
                                <style>
#Layer1 {
	fill: none;
	stroke: #505050;
	stroke-miterlimit: 10;
	stroke-width: 1.7px;
}
</style>
                            </defs>
                            <title>chat</title>
                            <path
								d="M48.76,23.66A23.57,23.57,0,1,0,4.25,35.76a2.79,2.79,0,0,1,.17,2.42C3.5,40.76,2.66,43.36,1.85,46a1.65,1.65,0,0,0,.1,1.3c.16.21.83.16,1.21,0,2.53-.81,5.05-1.64,7.55-2.53A2.18,2.18,0,0,1,12.8,45,22.94,22.94,0,0,0,28,48.45,23.62,23.62,0,0,0,48.76,23.66Z" />
                        </svg>
				</a> <a href="#" id="alarm-icon" class="header-right-icon"> 
						
						<span class="alarm-count" id="alarm-count">
						</span> 
						<span class="alarm-counts" id="alarm-counts">
						</span> 
						
						<!--알림 아이콘--> <svg version="1.1"
							id="Capa1" xmlns="http://www.w3.org/2000/svg"
							xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
							viewBox="0 0 55 55" style="enable-background: new 0 0 55 55;"
							xml:space="preserve" fill="#505050" width="25px" height="25px"
							class="header-icon">
                            <g>
                                <path
								d="M51.376,45.291C46.716,40.66,44.354,35.179,44.354,29v-8.994c0.043-6.857-4.568-11.405-8.53-13.216
		c-1.135-0.519-2.305-0.919-3.494-1.216V5c0-2.757-2.243-5-5-5s-5,2.243-5,5v0.661c-1.071,0.289-2.124,0.666-3.146,1.138
		C14.805,8.817,10.369,13.681,10.329,20v9c0,6.388-2.256,11.869-6.705,16.291c-0.265,0.264-0.361,0.653-0.249,1.01
		s0.415,0.621,0.784,0.685l9.491,1.639c1.768,0.305,3.396,0.555,4.945,0.761C20.341,52.806,23.768,55,27.512,55
		c3.745,0,7.173-2.196,8.917-5.618c1.543-0.205,3.163-0.454,4.921-0.758l9.49-1.639c0.369-0.063,0.671-0.328,0.784-0.685
		C51.737,45.944,51.641,45.555,51.376,45.291z M24.329,5c0-1.654,1.346-3,3-3s3,1.346,3,3v0.182c-1.993-0.286-4.015-0.274-6,0.047V5
		z M27.512,53c-2.532,0-4.898-1.258-6.417-3.315c2.235,0.23,4.321,0.346,6.406,0.346c2.093,0,4.186-0.116,6.43-0.349
		C32.411,51.741,30.044,53,27.512,53z M41.01,46.653c-1.919,0.331-3.678,0.6-5.34,0.812c-0.002,0-0.004,0-0.006,0
		c-0.732,0.093-1.444,0.174-2.141,0.244c-0.007,0.001-0.015,0.001-0.022,0.002c-0.637,0.064-1.26,0.115-1.876,0.16
		c-0.117,0.009-0.233,0.016-0.35,0.024c-0.534,0.035-1.062,0.063-1.587,0.083c-0.108,0.004-0.216,0.01-0.324,0.013
		c-1.244,0.042-2.471,0.042-3.714,0.001c-0.11-0.004-0.222-0.009-0.332-0.014c-0.518-0.02-1.04-0.047-1.567-0.082
		c-0.124-0.008-0.248-0.016-0.373-0.025c-0.6-0.043-1.207-0.094-1.828-0.155c-0.022-0.002-0.043-0.004-0.064-0.006
		c-0.692-0.069-1.399-0.15-2.126-0.242c-0.003,0-0.006,0-0.009,0c-1.668-0.211-3.433-0.482-5.361-0.814L6.329,45.33
		c3.983-4.554,6-10.038,6-16.33v-8.994c0.034-5.435,3.888-9.637,7.691-11.391c1.131-0.521,2.304-0.91,3.497-1.183
		c0.01-0.002,0.021-0.001,0.031-0.003c2.464-0.554,5.087-0.579,7.58-0.068c0.013,0.003,0.026-0.003,0.039-0.001
		c1.304,0.272,2.588,0.684,3.825,1.249c3.689,1.687,7.396,5.861,7.361,11.392v9c0,6.033,2.175,11.643,6.313,16.331L41.01,46.653z" />
                                <path
								d="M33.746,11.338c-3.875-1.771-8.62-1.773-12.469,0.002c-2.195,1.012-5.918,3.973-5.948,8.654
		c-0.003,0.552,0.441,1.002,0.994,1.006c0.002,0,0.004,0,0.006,0c0.549,0,0.997-0.443,1-0.994c0.023-3.677,3.019-6.035,4.785-6.85
		c3.331-1.537,7.446-1.533,10.799,0c0.502,0.23,1.096,0.009,1.326-0.493C34.469,12.16,34.248,11.567,33.746,11.338z" />
                            </g>
                        </svg>


				</a> <!-- 마이 프로필 --> <a href="#" class="header-right-icon" id="my-icon">
						<svg version="1.1" id="Capa1" xmlns="http://www.w3.org/2000/svg"
							xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
							viewBox="0 0 55 55" style="enable-background: new 0 0 55 55;"
							xml:space="preserve" fill="#505050" width="25px" height="25px"
							class="header-icon">
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

				</a> <!-- 채팅 모달 -->
					<div class="chat-wrap">
						<div class="chat-alarm-tab">
							<div class="chat-tab-box">
								<a href="#" class="chat-tab1">채팅</a> <a href="#"
									class="chat-tab2">연락처</a> <a
									href="${pageContext.request.contextPath}/chat/chatinvite"
									id="chat-add"
									onClick="window.open(this.href, '', 'width=470, height=680'); return false;">
									<!--새로운 대화창 열림--> <svg id="Layer1" data-name="Layer 1"
										xmlns="http://www.w3.org/2000/svg" viewBox="0 0 50 50"
										width="25px" height="25px" class="icon-middle">
                                        <defs>
                                            <style>
.cls-1 {
	fill: #5a3673;
}

.cls-2 {
	fill: #fff;
	stroke: #fff;
}
</style>
                                        </defs>
                                        <title>chatadd</title>
                                        <path class="cls-1"
											d="M25.15,49.48a23.82,23.82,0,0,1-12.78-3.72A1.35,1.35,0,0,0,11,45.57c-2.24.79-4.64,1.6-7.58,2.54-.06,0-1.53.48-2.15-.34a2.45,2.45,0,0,1-.24-2.07c.73-2.35,1.61-5.11,2.58-7.81a2,2,0,0,0-.12-1.75A24.18,24.18,0,0,1,14.09,3.29,24.45,24.45,0,0,1,25.18.61h0a24.43,24.43,0,0,1,3,48.69A25.48,25.48,0,0,1,25.15,49.48Z" />
                                        <path class="cls-2"
											d="M26.06,15.81v7.76h7.46v2H26.06v7.82H23.94V25.55H16.49v-2h7.46V15.81Z" />
                                    </svg>
								</a>
							</div>
							<div class="chat-tab-wrap">
									<form name="chat-search-form" action="${pageContext.request.contextPath}/chatnamesearch"> 
								<div class="search-box">
									<span id="chat-search"> <svg version="1.1" id="Capa1"
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

									</span>
									 <input type="text" id="chat-search-input" name="searchword" placeholder="채팅방 또는 이름 검색">
								</div>
								 	</form> 
								<div class="chat-scroll-box">
									<div class="dragbar"></div>

									<!-- 채팅방 -->
									<div id="chat-scroll-box">
									
									</div>
									
									
								</div>
							</div>
							<!--연락처 모달-->
							<div class="tel-tab-wrap">
								<div class="search-box">
									<span id="tel-search"> <svg version="1.1" id="Capa1"
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
									</span> <input type="text" id="tel-search-input"
										placeholder="이름, 소속 또는 연락처 검색">
								</div>
								<div class="tel-scroll-box">
									<div class="dragbar"></div>
									<div class="tel-name">
										<p class="tel-title">내 프로필</p>
										<div class="tel-my">
										 	<img src="${pageContext.request.contextPath}/resources/img/user-3.png" 
															  width="35px" height="35px" class="tel-my-img">
											<span class="tel-my-desc"> <a href="#">${uname }</a> <span>
													
											</span>
											</span>


										</div>
										<p class="tel-title">전체 연락처</p>
										<div class="tel-all">
											<!-- 전체 연락처 / 해당 회사 user list 가져와서 뿌리기 -->
											
											
											

											<!-- 연락처에서 이름 클릭했을 때 info 모달 -->
											<div class="prof-info-dim"></div>
											<div class="prof-info">
												<a href="#" class="prof-exit"> <svg version="1.1"
														id="Capa1" xmlns="http://www.w3.org/2000/svg"
														xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
														viewBox="0 0 31.112 31.112"
														style="enable-background: new 0 0 31.112 31.112;"
														xml:space="preserve" width="12px" height="12px"
														fill="#111111" storke="#111111" stroke-width="3px">
<polygon
															points="31.112,1.414 29.698,0 15.556,14.142 1.414,0 0,1.414 14.142,15.556 0,29.698 1.414,31.112 15.556,16.97 
	29.698,31.112 31.112,29.698 16.97,15.556 " /></svg></a>
												<p class="prof-name"></p>
												<p class="prof-cname"></p>
											</div>

										</div>
									</div>
								</div>
							</div>
						</div>
			
			
			
			<!--알림 모달-->
					</div> 
					<div class="alarm-wrap">
						<div class="chat-alarm-tab">
							<div class="chat-tab-box">
								<a href="#" class="alarm-tab1">미확인 알림</a> <a href="#"
									class="alarm-tab2">전체 알림</a>
									<button type="button" class="alarm-all-view">모두 읽음</button>
									<button type="button" class="alarm-all-view2">모두 읽음</button>
							</div>
							<div class="alarm-tab-wrap">
								<div class="search-box">
									<svg version="1.1" id="Capa1"
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
                                    </svg><input type="text" id="alert-search-input" placeholder="미확인 알림 검색">
								</div>
							<div id="alarm-scroll-box">
							<!-- 미확인 알림 리스트 -->
							</div>		
						</div>
				<!-- 전체 알림 -->
				<div class="all-alarm-tab-wrap">
					<div class="search-box">
						<svg version="1.1" id="Capa1" xmlns="http://www.w3.org/2000/svg"
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
						 <input type="text" id="all-alert-search-input" placeholder="전체 알림 검색">
						</div>
						<div id="all-alarm-scroll-box">
						<!-- 전체 알림 리스트 -->
						</div>
				</div>
				</div>
	</div>
	
	<script>
		 var socket = null;
		 
		// 전역변수 설정
		$(document).ready(function(){
		    // 웹소켓 연결
			var sock =new WebSocket("ws://" + location.host + "/ontact/alert");
		    console.log("소켓 연결됨 ")
		    
		    // 데이터를 전달 받았을때 
		    sock.onmessage = onMessage; 
		    
		});
		
		function onMessage(msg) {
			console.log("메시지 전달 받음"+msg);
			var data = msg.data;
			
			//메시지가 들어왔을때 ajax를 이용해서 내 알림 숫자 구하기
			 $.ajax({
					url: "${pageContext.request.contextPath}/alertcount",
					async:false,
					success:function(object){
						console.log("새글 등록 됐을때 : "+object+"알림추가")
						$("#alarm-count").html('');
						$("#alarm-counts").html('');
						$("#alarm-count").css("display","inline");
						$("#alarm-counts").css("display","inline");
						
						if(object==0 || object==null){
							$("#alarm-count").remove();
							$("#alarm-counts").remove(); 
						}else{
							if(object>8){
								var count=object+1;
								$("#alarm-count").remove();
								$("#alarm-counts").append(count);
							}else{
								var count=object+1;
								$("#alarm-count").append(count);
								$("#alarm-counts").remove(); 
							}			
						}
					},
					error:function(){
						console.log("실패");
					}
				});
		}
</script>
	
	
	<!-- 내 프로필  -->
	<div class="my-wrap">
		<div id="h-profile-top">
			<!--이미지가 있을 때 이미지 뿌리고 없으면 기본이미지-->
			
			 <c:if test="${not empty ufilepath }">
				<img src="${ufilepath}" width="40px" height="40px" class="profile-img">
			 </c:if>
			 <c:if test="${empty ufilepath}">
			 	<img src="${pageContext.request.contextPath}/resources/img/user-3.png" 
								  width="40px" height="40px" class="my-img-file">
			 </c:if>
			<p>
			</p>
			<p class="profile-name">${uname } </p>
		</div>
		<div id="h-profile-bottom">
			<p>
				<a href="#"> <svg version="1.1" id="Capa1"
						xmlns="http://www.w3.org/2000/svg"
						xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
						viewBox="0 0 54 54" style="enable-background: new 0 0 54 54;"
						xml:space="preserve" width="20px" height="20px"
						class="h-profile-icon">
                        <g>
                            <path
							d="M53.188,23.518l-3.128-0.602c-1.842-0.354-3.351-1.607-4.035-3.354c-0.686-1.745-0.433-3.69,0.677-5.203l1.964-2.679
		c0.292-0.397,0.249-0.949-0.1-1.298l-4.242-4.242c-0.339-0.339-0.871-0.39-1.268-0.121l-2.638,1.786
		c-1.552,1.052-3.505,1.231-5.224,0.482c-1.719-0.75-2.916-2.305-3.201-4.158l-0.505-3.282C31.413,0.36,30.994,0,30.5,0h-6
		c-0.479,0-0.892,0.34-0.982,0.812l-0.777,4.04c-0.347,1.801-1.565,3.296-3.26,3.997c-1.694,0.704-3.613,0.507-5.131-0.521
		L10.944,6.02c-0.397-0.268-0.929-0.218-1.268,0.121l-4.243,4.242c-0.349,0.349-0.391,0.9-0.1,1.299l1.964,2.679
		c1.109,1.512,1.362,3.457,0.677,5.203c-0.686,1.745-2.194,2.999-4.036,3.353l-3.128,0.602C0.34,23.608,0,24.021,0,24.5v6
		c0,0.493,0.36,0.913,0.848,0.988l3.283,0.505c1.853,0.285,3.408,1.481,4.157,3.2c0.75,1.72,0.57,3.673-0.482,5.226L6.02,43.057
		c-0.269,0.396-0.218,0.929,0.121,1.268l4.242,4.242c0.349,0.348,0.899,0.393,1.298,0.1l2.679-1.964
		c1.512-1.109,3.457-1.365,5.202-0.677c1.746,0.685,3,2.193,3.354,4.035l0.602,3.128C23.608,53.66,24.021,54,24.5,54h6
		c0.494,0,0.914-0.36,0.988-0.848l0.355-2.309c0.292-1.896,1.523-3.465,3.294-4.198c1.771-0.73,3.751-0.495,5.297,0.64l1.884,1.381
		c0.399,0.293,0.95,0.248,1.298-0.1l4.242-4.242c0.339-0.339,0.39-0.871,0.121-1.268l-1.786-2.638
		c-1.052-1.553-1.232-3.506-0.482-5.225c0.75-1.72,2.304-2.916,4.158-3.201l3.282-0.505C53.64,31.413,54,30.993,54,30.5v-6
		C54,24.021,53.66,23.608,53.188,23.518z M52,29.642l-2.435,0.375c-2.535,0.39-4.661,2.026-5.687,4.378
		c-1.025,2.351-0.779,5.022,0.66,7.146l1.323,1.954l-3.052,3.052l-1.192-0.874c-2.115-1.551-4.822-1.875-7.246-0.874
		c-2.422,1.004-4.107,3.149-4.505,5.741L29.642,52h-4.316l-0.446-2.316c-0.484-2.52-2.2-4.583-4.588-5.521
		c-2.385-0.937-5.047-0.589-7.115,0.926l-1.987,1.457l-3.052-3.052l1.324-1.954c1.438-2.123,1.685-4.795,0.659-7.146
		c-1.026-2.351-3.152-3.987-5.687-4.377L2,29.642v-4.315l2.317-0.445c2.519-0.484,4.582-2.199,5.52-4.587
		c0.937-2.388,0.591-5.048-0.926-7.117L7.454,11.19l3.052-3.052l2.723,1.845c2.077,1.407,4.701,1.675,7.018,0.713
		c2.317-0.96,3.984-3.004,4.458-5.468L25.326,2h4.316l0.375,2.435c0.39,2.535,2.027,4.661,4.378,5.687
		c2.351,1.026,5.022,0.778,7.146-0.659l1.954-1.323l3.052,3.052l-1.457,1.986c-1.517,2.068-1.863,4.729-0.925,7.117
		c0.937,2.388,3,4.103,5.52,4.587L52,25.326V29.642z" />
                            <path
							d="M27.5,17C21.71,17,17,21.71,17,27.5S21.71,38,27.5,38S38,33.29,38,27.5S33.29,17,27.5,17z M27.5,36
		c-4.687,0-8.5-3.813-8.5-8.5s3.813-8.5,8.5-8.5s8.5,3.813,8.5,8.5S32.187,36,27.5,36z" />
                            <path
							d="M27.5,22c-3.033,0-5.5,2.468-5.5,5.5s2.467,5.5,5.5,5.5s5.5-2.468,5.5-5.5S30.533,22,27.5,22z M27.5,31
        c-1.93,0-3.5-1.57-3.5-3.5s1.57-3.5,3.5-3.5s3.5,1.57,3.5,3.5S29.43,31,27.5,31z" />
                        </g>
                    </svg> 환경설정
				</a>
			</p>
               	<sec:authorize access="isAuthenticated()">
					<form action="${pageContext.request.contextPath}/logout" method="POST">
					<p>
				<svg version="1.1" id="Capa1"
						xmlns="http://www.w3.org/2000/svg"
						xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
						viewBox="0 0 56 56" style="enable-background: new 0 0 56 56;"
						xml:space="preserve" width="20px" height="20px"
						class="h-profile-icon">
                        <g>
                            <path
							d="M35.31,5.042c-0.532-0.155-1.085,0.15-1.24,0.68s0.149,1.085,0.68,1.24C44.906,9.932,52,19.405,52,30
                                           c0,13.233-10.767,24-24,24S4,43.233,4,30C4,19.392,11.105,9.915,21.279,6.953c0.53-0.154,0.835-0.709,0.681-1.239
                                           c-0.153-0.53-0.708-0.839-1.239-0.681C9.698,8.241,2,18.508,2,30c0,14.337,11.663,26,26,26s26-11.663,26-26
                                           C54,18.522,46.314,8.26,35.31,5.042z" />
                            <path
							d="M28,27c0.553,0,1-0.447,1-1V1c0-0.553-0.447-1-1-1s-1,0.447-1,1v25C27,26.553,27.447,27,28,27z" />
                        </g>
                        
                    </svg> 
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<!-- 수정필요 -->
	        		<button type="submit" id="Logout">로그아웃</button>
				</p>
					</form>    	
	    		</sec:authorize>
		</div>
	</div>
	</span>
	</span>

	</div>




	</div>
<script>
//알림 모두 읽음
$(document).ready(function() {
		$(".alarm-all-view").click(function() {
		$.ajax({
			url: "${pageContext.request.contextPath}/alertallread",
			success:function(object){
				$("#alarm-scroll-box").html('');
				
				var printHTML = "<table id='alarm-list-table'>";
				for(var i=0 in object){
					printHTML += "<tr class='alarm-name'>";
					printHTML += "<td><span class='chat-users-icon'>";
					printHTML += "<img src='${pageContext.request.contextPath}/resources/img/user-3.png' width='35px' height='35px'></span>";
					printHTML += "</td><td class='alarmlist-td'><p class='alarmlist-name'>"+object[i].pname+"</p>";
					printHTML +=  "<p class='alarmlist-content'>"+object[i].acontent+"</p></td>";
	/* 						printHTML += "<td class='alarmlist-right'>"+object[i].adate +"</td>";
	*/					}
				printHTML += "</tr></table>";
				$("#alarm-scroll-box").append(printHTML);
				$("#alarm-count").remove();
				$("#alarm-counts").remove(); 
			},
			error:function(){
				console.log("실패");
			}
		});
		});
		$(".alarm-all-view2").click(function() {
		$.ajax({
			url: "${pageContext.request.contextPath}/alertallreadtab2",
			success:function(object){
				$("#all-alarm-scroll-box").html('');
				
				var printHTML = "<table id='all-alarm-list-table'>";
				for(var i=0 in object){
					if(object[i].acount==1){
					printHTML += "<tr class='alarm-name-wrap'>";
					printHTML += "<td><span class='chat-users-icon'>";
					printHTML += "<img src='${pageContext.request.contextPath}/resources/img/user-3.png' width='35px' height='35px'></span>";
					printHTML += "</td><td class='alarmlist-td'><a href='#'><p class='alarmlist-name'>"+object[i].pname;
					printHTML += "<span class='alert-date'>"+ object[i].fdate+ "</span></p>";
					printHTML +=  "<p class='alarmlist-content'>"+object[i].acontent+"</p></a></td>";
						printHTML += "<td class='alarmlist-right'>"+object[i].adate +"</td>";
					}else{
					printHTML += "<tr class='alarm-name'>";
					printHTML += "<td><span class='chat-users-icon'>";
					printHTML += "<img src='${pageContext.request.contextPath}/resources/img/user-3.png' width='35px' height='35px'></span>";
					printHTML += "</td><td class='alarmlist-td'><a href='#'><p class='alarmlist-name'>"+object[i].pname;
					printHTML += "<span class='alert-date'>"+ object[i].fdate+ "</span></p>";
					printHTML +=  "<p class='alarmlist-content'>"+object[i].acontent+"</p></a></td>";
					}
					}
				printHTML += "</tr></table>";
				$("#all-alarm-scroll-box").append(printHTML);
				$("#alarm-count").remove();
				$("#alarm-counts").remove(); 
			},
			error:function(){
				console.log("실패");
			}
		});
		
});
});
</script>

</body>

</html>
