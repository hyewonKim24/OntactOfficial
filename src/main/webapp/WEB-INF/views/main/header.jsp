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
button{
	font-family: 'Noto Sans KR', sans-serif;
}
input{
	font-family: 'Noto Sans KR', sans-serif;
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
	width: 35px;
	height: 35px;
	padding-top: 5px;
	margin-left: 10px;
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
.header-icon-my{
	vertical-align: middle;
	border-radius: 90px;
    box-shadow: inset 0 0 0 1px rgba(0, 0, 0, .05);
}

.alarm-count {
	position: absolute;
	display: inline;
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
	display: inline;
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
	display:none;
}
.prof-bg-img{
    position: relative;
    overflow: hidden;
    width: 300px;
    height: 300px;
}
.prof-info {
	background-color: #fff;
	z-index: 512;
	border: 1px solid #fff;
	border-radius: 4px;
	-webkit-border-radius: 4px;
	padding: 10px 20px 0;
	}
.prof-info-wrap{
	position: fixed;
	width: 300px;
	height: 600px;
	background-color: #fff;
	z-index: 510;
	top: 10%;
	left: 40%;
	border: 1px solid #fff;
	border-radius: 4px;
	-webkit-border-radius: 4px;
	dispaly:none;
}

.prof-exit {
    position: absolute;
    top: 5px;
    right: 5px;
    width: 20px;
    height: 20px;
	z-index: 900;
}

.prof-top{
	position: relative;
    padding-bottom: 28px;
    border-bottom: 1px solid #e9eaed;
}

.prof-name {
	font-size: 30px;
	font-weight: bold;
	line-height: 50px;
	pading-left:10px;
	color:#505050;
}

.prof-cname {
	font-size: 18px;
	line-height: 20px;
	pading-left:10px;
	color:#787878;
}
#Logout{
	background-color: #fff;
	border:none;
	display:inline-block;
}
.h-profle-content{
	font-size:12px;
	color:#505050;
}
.prof-bottom{
	padding-top:10px;
}

.prof-icon{
	padding-right:10px;
	vertical-align: middle;
}
.prof-content{
	padding:10px 0 10px 0;

}
.prof-chat{
	display:inline-block;
	width: 260px;
	height: 35px;
	background-color: #432D73;
	color:#fff;
	border:1px solid #432D73;
	border-radius: 10px;
}
.prof-bottom a{
	color:#fff;
	text-decoration: none;
	font-size:15px;
	line-height: 35px;
	text-align: center;
}
.profile-img{
    content: "";
    display: block;
    border-radius: 90px;
    box-shadow: inset 0 0 0 1px rgba(0, 0, 0, .05);
    margin-left:130px;

}
.profile-name{
	font-size:14px;
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
				$("#chat-alarm-count").html('');
				$("#chat-alarm-counts").html(''); 
				
				console.log("채팅 알림수"+object);
				if(object==0 || object==null){
						$("#chat-alarm-counts").css("display","none");
						$("#chat-alarm-count").css("display","none");
				}else{ 
					if(object>9){
						$("#chat-alarm-count").css("display","none");
						$("#chat-alarm-counts").css("display","inline-block");
						$("#chat-alarm-counts").append(object);
					}else{
						$("#chat-alarm-counts").css("display","none");
						$("#chat-alarm-count").css("display","inline-block");
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

						$("#alarm-count").css("display","none");
						$("#alarm-counts").css("display","none");
						
						if(data==0 || data==null){
							$("#alarm-count").css("display","none");
							$("#alarm-counts").css("display","none");
						}else{
							if(data>9){
								$("#alarm-count").css("display","none");
								$("#alarm-counts").css("display","inline-block");
								$("#alarm-counts").append(data);
							}else{
								$("#alarm-counts").css("display","none");
								$("#alarm-count").css("display","inline-block");
								$("#alarm-count").append(data);
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
					printHTML += " <p class='chatlist-name'> "+ object[i].chatname;
					printHTML += "<span class='chat-room-count'> ";
					printHTML += "<img src='${pageContext.request.contextPath}/resources/img/svg/people-fill.svg' width='10px' height='10px'>&nbsp;"+object[i].mcount;
					printHTML += "</span></span></p>";
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
			$(".prof-info-wrap").css("display", "none");
			$.ajax({
			url: "${pageContext.request.contextPath}/userlist",
			success:function(object){
				$(".tel-all").html('');
					var html="<table id='tel-list-table'>";
				for(var i=0 in object){
					html+="<form action='${pageContext.request.contextPath}/chat/chatroomnew' method='post' id='chatfrm1'>";
					html += "<tr class='tel-other'>";
					if(object[i].ufilepath==null){
						html += "<td><img src='${pageContext.request.contextPath}/resources/img/user-3.png' width='35px' height='35px' class='tel-my-img'></td>";
					}else{
						html += "<td><img src='"+object[i].ufilepath+"' width='35px' height='35px' class='tel-my-img'></td>";
					}
					html += "<td class='tel-all-desc'>";
					html += "<a href='#' class='tel-prof-modal'>" +object[i].uname;
					html += "<input type='hidden' name='chatuno' class='chatuno' value='"+object[i].uno+"'>";
					html += "<input type='hidden' name='chatuname' class='chatuname' value='"+object[i].uname+"'>";
					html += "<input type='hidden' name='ufilepath' class='ufilepath' value='"+object[i].ufilepath+"'>";
					html += "<input type='hidden' name='dname' class='dname' value='"+object[i].dname+"'>";
					html += "<input type='hidden' name='urank' class='urank' value='"+object[i].urank+"'>";
					html += "<input type='hidden' name='uemail' class='uemail' value='"+object[i].uemail+"'>";
					html += "<input type='hidden' name='cname' class='cname' value='"+object[i].cname+"'></a>";
					html += " <a href=\"${pageContext.request.contextPath}/chat/chatroom?chatuno="+ object[i].uno+"&chatuname="+ object[i].uname+"\" onClick= \"window.open(this.href, \'\', \'width=470, height=650\'); return false;\">";
					html += "<img src='${pageContext.request.contextPath}/resources/img/svg/chat-03.svg' width='30px' height='25px' class='tel-chat-icon'></a>";
					html += "</td></tr></form>";
				}
					html += "</table>";
					$(".tel-all").append(html);
					
					$(".tel-prof-modal").click(function() {
						$(".prof-chat-wrap").html('');
						$(".prof-bg-img").html('');
						
						var uno = $(this).find('.chatuno').val();
						var uname = $(this).find('.chatuname').val();
						var cname = $(this).find('.cname').val();
						var dname = $(this).find('.dname').val();
						var uemail = $(this).find('.uemail').val();
						var urank = $(this).find('.urank').val();
						var ufilepath = $(this).find('.ufilepath').val();
						
						console.log("ufilepath"+ufilepath);
						
						if(ufilepath==null || ufilepath=="null"){  
							var printhtml = "<img src='${pageContext.request.contextPath}/resources/img/user-3.png' class='prof-bg-img'><a href='#' class='prof-exit'> &times;</a>";
							$(".prof-bg-img").append(printhtml);
						}else if(ufilepath!=null || ufilepath!="null" ||ufilepath!=""){
							var printhtml = "<img src='"+ufilepath+"' class='prof-bg-img'><a href='#' class='prof-exit'> &times;</a>";
							$(".prof-bg-img").append(printhtml);
						}
							
						var chathtml = "<a href=\"${pageContext.request.contextPath}/chat/chatroom?chatuno="+uno+"&chatuname="+uname+"\" onClick= \"window.open(this.href, \'\', \'width=470, height=650\'); return false;\" class='prof-chat'>채팅하기</a>";
						$(".prof-chat-wrap").append(chathtml);
						
						$(".prof-name").text(uname);
						$(".prof-cname").text(cname);
						$(".prof-email").text(uemail);
						if(dname==null){
							$(".prof-dname").text(dname);
						}else{
							$(".prof-dname").text('-');
						}
						$(".prof-urank").text(urank);
						$(".prof-info-dim").css("display", "block");
						$(".prof-info-wrap").css("display", "block");
						$(".prof-exit").click(function() {
							$(".prof-info-dim").css("display", "none");
							$(".prof-info-wrap").css("display", "none");
						}); 
					}); 

						
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
		
		
		
		
	});
</script>
</head>

<body>

			<sec:authentication property="principal.username" var="username"/>
			<sec:authentication property="principal.uno" var="uno"/>
			<sec:authentication property="principal.uname" var="uname"/>
			<sec:authentication property="principal.ufilepath" var="ufilepath"/>
			<sec:authentication property="principal.urank" var="urank"/>
			<sec:csrfInput />
			<input type="hidden" value='${uname}' name="sessionuserid" id="sessionuserid">
			<input type="hidden" value="${uno}" id="uno" name="uno">
			<input type="hidden" value="${ufilepath}" id="ufilepath" name="ufilepath">
			<input type="hidden" value="${urank}" id="urank" name="urank">
			
			
	<div class="header-wrap">
		<div class="header">
			<span class="header-left-wrap"> <!-- 로고 넣어야 함 ! -->
			 <a href="${pageContext.request.contextPath}/project/all/list">
			 <img src="${pageContext.request.contextPath}/resources/img/ontact_logo-03.png" id="header-logo"> 
			 </a>
				
				<span id="header-search">


					<form class="header-search-form" name="header_frm">
						<select class="header-pj-select" name="headerselect">
							<option value="P">&nbsp;&nbsp;&nbsp;프로젝트</option>
							<option value="B">&nbsp;&nbsp;&nbsp;글</option>
							<option value="R">&nbsp;&nbsp;&nbsp;댓글</option>
						</select> 
						<input type="text" placeholder="검색어를 입력해주세요" name="headersearchtext" id="header-pj-input">
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
					<span id="chat-alarm-ajax"></span>
					<span class="alarm-count" id="chat-alarm-count"></span> 
					<span class="alarm-counts" id="chat-alarm-counts"></span> 
					
					<!--채팅 아이콘-->
					<%-- <img src="${pageContext.request.contextPath}/resources/img/svg/chat.svg" width="25px" height="25px" class="header-icon">
					 --%>
					
					 <svg id="Layer1" data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 50 50" fill="#505050" width="25px" height="25px" class="header-icon">
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
                            <path d="M48.76,23.66A23.57,23.57,0,1,0,4.25,35.76a2.79,2.79,0,0,1,.17,2.42C3.5,40.76,2.66,43.36,1.85,46a1.65,1.65,0,0,0,.1,1.3c.16.21.83.16,1.21,0,2.53-.81,5.05-1.64,7.55-2.53A2.18,2.18,0,0,1,12.8,45,22.94,22.94,0,0,0,28,48.45,23.62,23.62,0,0,0,48.76,23.66Z" />
                        </svg>
				</a> <a href="#" id="alarm-icon" class="header-right-icon"> 
						
						<span id="alarm-ajax"></span>
						<span class="alarm-count" id="alarm-count"></span> 
						<span class="alarm-counts" id="alarm-counts"></span> 
						
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


				</a> <!-- 마이 프로필 -->
				 <a href="#" class="header-right-icon" id="my-icon">
				 
			 	 <c:if test="${empty ufilepath}">
						<img src="${pageContext.request.contextPath}/resources/img/user-3.png" width="25px" height="25px" class="header-icon-my">
				 </c:if>
				 <c:if test="${not empty ufilepath}">
			 			<img src="${ufilepath}" width="25px" height="25px" class="header-icon-my">
				 </c:if>

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
										<c:if test="${empty ufilepath}">
										 	<img src="${pageContext.request.contextPath}/resources/img/user-3.png" width="35px" height="35px" class="tel-my-img">
										</c:if>
										<c:if test="${not empty ufilepath}">
										 	<img src="${ufilepath}" width="35px" height="35px" class="tel-my-img">
										</c:if>
											<span class="tel-my-desc"> <a href="#">${uname }</a> <span>
													
											</span>
											</span>


										</div>
										<p class="tel-title">전체 연락처</p>
										<div class="tel-all">
											<!-- 전체 연락처 / 해당 회사 user list 가져와서 뿌리기 -->
											
											
											

										</div>
											<!-- 연락처에서 이름 클릭했을 때 info 모달 -->
											<div class="prof-info-dim"></div>
											<div class="prof-info-wrap">
											<div class="prof-bg-img">
												</div>
											<div class="prof-info">
												<div class="prof-top">
													<p class="prof-name"></p>
													<p class="prof-cname"></p>
												</div>
												<div class="prof-bottom">
													<p class="prof-content">
													<img src="${pageContext.request.contextPath}/resources/img/svg/envelope-fill.svg" width="15px" height="15px" class="prof-icon">
													<span class="prof-email"></span>
													</p>
													<p class="prof-content">
													<img src="${pageContext.request.contextPath}/resources/img/svg/building.svg" width="15px" height="15px" class="prof-icon">
													<span class="prof-dname"></span>
													</p>
													<p class="prof-content">
													<img src="${pageContext.request.contextPath}/resources/img/svg/id-card-4.svg" width="15px" height="15px" class="prof-icon">
													<span class="prof-urank"></span>
													</p><br>
													<span class="prof-chat-wrap">
													</span>
													
												</div>
												
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

						var count=object+1;
						
						if(object==0){
								$("#alarm-count").css("display","inline");
								$("#alarm-counts").css("display","none");
								$("#alarm-count").append(count);
						}
						else if(object>8){
								$("#alarm-count").css("display","none");
								$("#alarm-counts").css("display","inline");
								$("#alarm-counts").append(count);
						}else{
								$("#alarm-count").css("display","inline");
								$("#alarm-counts").css("display","none");
								$("#alarm-count").append(count);
							}		
						//사이드바 
						$(".pj_sb_alarm_all").html('');
						$(".pj_sb_alarm_all").append(count);
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
				<img src="${pageContext.request.contextPath}/resources/img/svg/settings-4.svg"  width="20px" height="20px" class="h-profile-icon">
				<a href="${pageContext.request.contextPath}/user/mypage/detail" class="h-profle-content"> 
				내 정보 수정
				</a>
			</p>
               	<sec:authorize access="isAuthenticated()">
					<form action="${pageContext.request.contextPath}/main/logout" method="POST">
					<p>
					<img src="${pageContext.request.contextPath}/resources/img/svg/exit-2.svg"  width="20px" height="20px" class="h-profile-icon">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<!-- 수정필요 -->
	        		<button type="submit" id="Logout" class="h-profle-content">로그아웃</button>
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
				$(".pj_sb_alarm_all").html('');
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
		
		$("#header-pj-input").keypress(function(e){
			if(e.keyCode == 13){
				var frm = document.header_frm;
				frm.action = "${pageContext.request.contextPath}/headersearch";
				frm.method = "get";
				frm.submit();
				}
			});
		
		//내 프로필에서 눌렀을때 모달 뜨기
		$(".tel-my-desc").click(function(){
			var uname= $("#uname").val();
			var uemail= $("#uemail").val();
			var dname= $("#dname").val();
			var urank= $("#urank").val();
			
			$(".prof-name").text(uname);
			$(".prof-cname").text(cname);
			$(".prof-email").text(uemail);
			$(".prof-dname").text(dname);
			$(".prof-urank").text(urank);
			$(".prof-info-dim").css("display", "block");
			$(".prof-info-wrap").css("display", "block");
			$(".prof-exit").click(function() {
				$(".prof-info-dim").css("display", "none");
				$(".prof-info-wrap").css("display", "none");
			}); 
		});
		

});
</script>

</body>

</html>