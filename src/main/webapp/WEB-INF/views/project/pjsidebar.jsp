<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ontact, 서로 연결되는 온라인 공간</title>
<link href="${pageContext.request.contextPath}/resources/css/reset.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<style>
body {
	font-family: Noto Sans KR;
	font-size: 14px;
	line-height: 1.15;
	width: 1200px;
	margin: 0 auto;
    	height: 100%;
    	position: relative;
	
}

#leftsidebar{
	width:1200px !important;
	margin: 0 auto;
	border: none;
	outline: none;
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
	top: 60px;
}

#pj_sidebar>ul {
	padding: 10px 15px;
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

/*새프로젝트 버튼*/
#new_pj_btn {
	font-family: Noto Sans KR;
	width: 165px;
	height: 53px;
	border-radius: 56px;
	box-sizing: border-box;
	box-shadow: 0 2px 3px 0 rgba(0, 0, 0, .1);
	color: #5a3673;
	font-size: 16px;
	font-weight: 700;
	background-color: #fff;
	border-style: none;
	cursor: pointer;
	margin: 0 0 10px 10px;
}

/*모아보기_부서보관함*/
#pj_sidebar .sec_title {
	float: left;
	font-size: 13px;
	position: relative;
	color: #787878;
}

/*사이드바 알림숫자*/
.pj_sb_alarm {
	color: #da3334;
	font-size: 12px;
	margin-left: 5px;
	font-weight: 500;
}

/*scrollbar*/
/* width */
::-webkit-scrollbar {
	width: 5px;
}

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

/*svg icon*/
#pj_sidebar svg {
	width: 17px;
	margin-right: 5px;
	vertical-align: auto;
}

/*부서보관함 추가버튼*/
.sb_add_btn {
	fill: #c0c0c0;
	vertical-align: middle;
	height: 13px;
}

.sb_add_btn:hover {
	fill: #5a3673;
	vertical-align: middle;
	height: 13px;
}
#sidebar_pjteam {
	display: flex;
	flex-direction: column;
}
#sidebar_pjteam ul {
	min-height: 500px;
}

/*조직도*/
#org{
	margin: 20px 0 100px 0;
}

#orgchart{
	clear:both;
}

/*modal_새프로젝트 생성 모달*/
.sb-modal {
	display: none;
	position: fixed;
	z-index: 20;
	padding-top: 100px;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgb(0, 0, 0);
	background-color: rgba(0, 0, 0, 0.4);
}

/* Modal Content */
.sb-modal-content {
	position: relative;
	background-color: #fefefe;
	margin: auto;
	padding: 0;
	border: 1px solid #888;
	width: 40%;
	border-radius: 10px;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
	-webkit-animation-name: animatetop;
	-webkit-animation-duration: 0.4s;
	animation-name: animatetop;
	animation-duration: 0.4s;
}

/* Add Animation */
@
-webkit-keyframes animatetop {from { top:-300px;
	opacity: 0
}

to {
	top: 0;
	opacity: 1
}

}
@
keyframes animatetop {from { top:-300px;
	opacity: 0
}

to {
	top: 0;
	opacity: 1
}

}
.close {
	color: #333333;
	float: right;
	font-size: 20px;
	font-weight: bold;
	line-height: 50px;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

.sb-modal-header {
	padding: 2px 16px;
	background-color: #f4f4f4;
	color: #333333;
	border-radius: 10px 10px 0 0;
}

.sb-modal-body {
	padding: 2px 16px;
	display: flex;
	flex-direction: column;
	height: 400px;
}

.sb-modal-body>input:nth-child(1) {
	width: 90%;
	margin: 10px auto;
	min-height: 60px;
	height: auto;
	padding: 10px;
	max-height: 90px;
	overflow: hidden;
	border: 1px solid #d9d9d9;
	border-radius: 4px;
	box-sizing: border-box;
	font-size: 22px;
	color: #111111;
	font-weight: 700;
	letter-spacing: -1px;
}

.sb-modal-body textarea {
	width: 90%;
	overflow: auto;
	padding: 10px;
	min-height: 36px;
	height: 55px;
	max-height: 100px;
	font-size: 14px;
	border: 1px solid #d9d9d9;
	margin: 0px auto 10px auto;
	box-sizing: border-box;
	letter-spacing: -1px;
	overflow-x:hidden;
}

/*관리자 승인 참여*/
.sb-modal-body>.pj_secret {
	width: 90%;
	margin: 10px auto;
	box-sizing: border-box;
	transform: translateX(-3px);
}

.sb-modal-body>.pj_secret>svg {
	width: 16px;
	vertical-align: text-bottom;
}
/*toggle btn*/
.switch {
	position: relative;
	display: block;
	width: 36px;
	height: 19px;
	float: right;
}

.switch input {
	opacity: 0;
	width: 0;
	height: 0;
}

.slider {
	position: absolute;
	cursor: pointer;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: #ccc;
	-webkit-transition: .4s;
	transition: .4s;
}

.slider:before {
	position: absolute;
	content: "";
	height: 14px;
	width: 14px;
	left: 4px;
	bottom: 3px;
	background-color: white;
	-webkit-transition: .4s;
	transition: .4s;
}

input:checked+.slider {
	background-color: #23d9d9;
}

input:focus+.slider {
	box-shadow: 0 0 1px #23d9d9;
}

input:checked+.slider:before {
	-webkit-transform: translateX(14px);
	-ms-transform: translateX(14px);
	transform: translateX(14px);
}

/* Rounded sliders */
.slider.round {
	border-radius: 14px;
}

.slider.round:before {
	border-radius: 50%;
}

/*부서보관함 선택*/
.sb-modal-body>.pj_select_team {
	height: 100px;
	width: 90%;
	margin: 10px auto;
}

.sb-modal-body>.pj_select_team input[type=checkbox] {
	margin-right: 10px;
}

.sb-modal-body>.pj_select_team div:nth-child(1) {
	font-weight: 700;
	margin-bottom: 10px;
}

.sb-modal-body>.pj_select_team div:nth-child(2) {
	width: 90%;
	overflow-y: scroll;
}

.sb-modal-body>#pj_new_btn {
	width: 60%;
	height: 50px;
	margin: 0 auto;
	line-height: 48px;
	font-size: 15px;
	border-style: none;
	border-radius: 6px;
	cursor: pointer;
	display: inline-block;
	vertical-align: middle;
	color: #fff !important;
	font-weight: 700;
	text-align: center;
	background-color: #5a3673;
	box-sizing: border-box;
}
</style>
<script>
	$(document).ready(function() {
		$("#pj_sidebar").mouseover(function() {
			$(this).css("overflow-y", "scroll");
			// $(this).animate();
		});
		$("#pj_sidebar").mouseout(function() {
			$(this).css("overflow-y", "hidden");
		});		

		//프로젝트 생성  모달 부서목록 체크박스
		$("#new_pj_btn").click(function() {
			$.ajax({
				url : "${pageContext.request.contextPath}/project/pjteam",
				contentType : "application/json; charset=utf-8",
				dataType : "json",
				success : function(data) {
					$("#pjteam").html("");
					for (var i = 0; i < data.length; i++) {
						$("#pjteam").append('<input type="checkbox" name="dno" value="'+ data[i].dno + '">'+data[i].dname+'<br>');
					}
					
					//혜원 코드 추가
					$("#newpjModal").css("display","block");
					$(".close").click(function(){
						$("#newpjModal").css("display","none");
					});
				},
				error : function() {
					alert("newpj modal : pjteam load error");
				}
			});
		});
		
		//프로젝트 생성 모달 부서 체크박스
		$('input:checkbox[name="dno"]').is(":checked") ==  true
		
		//프로젝트 생성 모달 null 체크
		var pname = $('#pname').val();
		$('#pj_new_btn').click(function(){
			if(pname.val()=='' || pname.val() == null){
				alert("프로젝트 이름을 기입해주세요.");
				return false;
			} else {
				window.location.replace=("${pageContext.request.contextPath}/project/all/ins");
				return true;
			}
		});
		
		//관리자 승인 버튼 값 변화
		$("input[id='popen']:checkbox").click( function (){ 
			if ($("input[id='popen']:checkbox").is(":checked")){
				$(this).val('0');
			} else {
				$( "input[id='popen']:checkbox" ).removeAttr( ":checked"); 
				$(this).val('1');
			}
		});
		
		
		//sidebar 부서목록
		$.ajax({
			url: "${pageContext.request.contextPath}/project/pjteam",
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			success : function(data) {
				$("#pjteam").html("");
				for (var i = 0; i < data.length; i++) {
					$("#sidebar_pjteam").append('<li><a href="${pageContext.request.contextPath}/project/pjteam/list?dname='+ data[i].dname +'"><svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 60 60" style="enable-background: new 0 0 60 60;" xml:space="preserve"><path d="M57.49,21.5H54v-6.268c0-1.507-1.226-2.732-2.732-2.732H26.515l-5-7H2.732C1.226,5.5,0,6.726,0,8.232v43.687l0.006,0c-0.005,0.563,0.17,1.114,0.522,1.575C1.018,54.134,1.76,54.5,2.565,54.5h44.759c1.156,0,2.174-0.779,2.45-1.813L60,24.649v-0.177C60,22.75,58.944,21.5,57.49,21.5z M2,8.232C2,7.828,2.329,7.5,2.732,7.5h17.753l5,7h25.782c0.404,0,0.732,0.328,0.732,0.732V21.5H12.731c-0.144,0-0.287,0.012-0.426,0.036c-0.973,0.163-1.782,0.873-2.023,1.776L2,45.899V8.232z M47.869,52.083c-0.066,0.245-0.291,0.417-0.545,0.417H2.565c-0.243,0-0.385-0.139-0.448-0.222c-0.063-0.082-0.16-0.256-0.123-0.408l10.191-27.953c0.066-0.245,0.291-0.417,0.545-0.417H54h3.49c0.38,0,0.477,0.546,0.502,0.819L47.869,52.083z"/></svg>'+ data[i].dname +'</a></li>');
				}
				
			},
			error : function() {
				alert("sidebar : pjteam load error");
			}
		});		

	});
	// modal
	window.onload = function() {
		var modal = document.getElementById("newpjModal");
		var btn = document.getElementById("new_pj_btn");
		var span = document.getElementsByClassName("close")[0];
		// When the user clicks the button, open the modal 
		btn.onclick = function() {
			modal.style.display = "block";
		}
		// When the user clicks on <span> (x), close the modal
		span.onclick = function() {
			modal.style.display = "none";
		}

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
	};
</script>

	<script>
		 
		// 전역변수 설정
		$(document).ready(function(){
			// 글 작성 알림 카운트 ajax 추가
			$.ajax({
						url: "${pageContext.request.contextPath}/alertcount",
						async : false,
						success:function(data){
							console.log("알림추가")
							$(".pj_sb_alarm_all").html('');
							$(".pj_sb_alarm_all").append(data);
							
						},
						error:function(){
							console.log("실패");
						}
					});
			
		    
		});
		
</script>
<body>
	<div id="leftsidebar">
		<nav id="pj_sidebar">
			<button type="button" id="new_pj_btn">+&nbsp;새
				프로젝트</button>
			<ul>
				<li><a href="${pageContext.request.contextPath}/project/all/list"> <svg version="1.1" class="pj_btn"
							xmlns="http://www.w3.org/2000/svg"
							xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
							viewBox="0 0 50 35" style="enable-background: new 0 0 50 35;"
							xml:space="preserve">
	                        <g>
	                            <rect y="3" width="50" height="3" />
	                            <rect y="17" width="50" height="3" />
	                            <rect y="31" width="50" height="3" />
	                        </g>
	                    </svg>전체 <span class="pj_sb_alarm pj_sb_alarm_all"></span>
				</a></li>
				<li><a href="${pageContext.request.contextPath}/project/uns/list"> <svg version="1.1" class="pj_btn"
							xmlns="http://www.w3.org/2000/svg"
							xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
							viewBox="0 0 60 60" style="enable-background: new 0 0 60 60;"
							xml:space="preserve">
	                        <g>
	                            <path
								d="M54.168,0H5.832C4.271,0,3,1.271,3,2.832v54.336C3,58.729,4.271,60,5.832,60h48.336C55.729,60,57,58.729,57,57.168V2.832
			C57,1.271,55.729,0,54.168,0z M5.832,2h48.336C54.627,2,55,2.373,55,2.832V29H5V2.832C5,2.373,5.373,2,5.832,2z M54.168,58H5.832
			C5.373,58,5,57.627,5,57.168V31h50v26.168C55,57.627,54.627,58,54.168,58z" />
	                            <path
								d="M24.505,18h10.99C37.428,18,39,16.428,39,14.495V13c0-0.553-0.447-1-1-1s-1,0.447-1,1v1.495C37,15.325,36.325,16,35.495,16
			h-10.99C23.675,16,23,15.325,23,14.495V13c0-0.553-0.447-1-1-1s-1,0.447-1,1v1.495C21,16.428,22.572,18,24.505,18z" />
	                            <path
								d="M38,41c-0.553,0-1,0.447-1,1v1.495C37,44.325,36.325,45,35.495,45h-10.99C23.675,45,23,44.325,23,43.495V42
			c0-0.553-0.447-1-1-1s-1,0.447-1,1v1.495C21,45.428,22.572,47,24.505,47h10.99C37.428,47,39,45.428,39,43.495V42
			C39,41.447,38.553,41,38,41z" />
	                        </g>
	                    </svg> 미보관 <span class="pj_sb_alarm">00</span>
				</a></li>
				<li><a href="${pageContext.request.contextPath}/project/unread/list"><svg version="1.1" class="pj_btn"
							xmlns="http://www.w3.org/2000/svg"
							xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
							viewBox="0 0 50 50" style="enable-background: new 0 0 50 50;"
							xml:space="preserve">
	                        <path class="st47"
								d="M25,8.2c7.7,0,15.5,0,23.2,0c1.3,0,1.3,0,1.3,1.3c0,10.3,0,20.6,0,31c0,1.3,0,1.3-1.3,1.3
		c-15.5,0-30.9,0-46.4,0c-1.3,0-1.3,0-1.3-1.3c0-10.3,0-20.6,0-31c0-1.3,0-1.3,1.3-1.3C9.6,8.2,17.3,8.2,25,8.2z M2.9,9.5
		c0.3,0.3,0.5,0.5,0.7,0.7c6.3,6.2,12.7,12.4,19,18.5c1.7,1.6,3.1,1.6,4.8,0c6.4-6.2,12.7-12.4,19.1-18.6c0.2-0.2,0.3-0.4,0.6-0.7
		C32.3,9.5,17.7,9.5,2.9,9.5z M3,40.6c14.8,0,29.4,0,44.2,0c-5.4-4.7-10.6-9.3-16.1-14c-1,1.1-1.9,2.2-2.9,3.2c-2,1.9-4.2,1.9-6.2,0
		c-1.1-1.1-2.2-2.1-3.4-3.3C13.4,31.2,8.3,35.8,3,40.6z M48.2,39.9c0-9.9,0-19.7,0-29.6c-5.4,5.3-10.7,10.4-16.1,15.6
		C37.5,30.6,42.8,35.1,48.2,39.9z M1.8,40c5.4-4.9,10.6-9.6,15.9-14.3C12.4,20.5,7.2,15.5,1.8,10.2C1.8,20.2,1.8,30,1.8,40z" />
	                    </svg> 읽지않음 <span class="pj_sb_alarm pj_sb_alarm_all" >00</span>
				</a></li>
			</ul>
			<ul>
				<li><a href="${pageContext.request.contextPath}/commute/dailylist"> <svg version="1.1"
							xmlns="http://www.w3.org/2000/svg"
							xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
							viewBox="0 0 60 60" style="enable-background: new 0 0 60 60;"
							xml:space="preserve">
	                        <g>
	                            <path
								d="M52.29,44.29C52.109,44.479,52,44.74,52,45s0.1,0.52,0.29,0.71C52.479,45.89,52.74,46,53,46s0.52-0.11,0.71-0.29
			C53.89,45.52,54,45.26,54,45s-0.11-0.521-0.29-0.71C53.34,43.93,52.67,43.92,52.29,44.29z" />
	                            <path
								d="M23.638,42.263L20,40.405v-0.387c1.628-0.889,2.773-2.354,3.412-4.365C24.381,35.14,25,34.14,25,33.018v-1
			c0-0.927-0.431-1.786-1.151-2.35c-0.624-3.78-3.262-5.696-7.849-5.696c-0.217,0-0.429,0.009-0.636,0.025
			c-0.865,0.067-2.129-0.003-3.224-0.741c-0.41-0.276-0.719-0.544-0.917-0.796c-0.336-0.428-0.901-0.577-1.401-0.369
			c-0.501,0.206-0.796,0.708-0.733,1.248c0.042,0.372,0.105,0.808,0.2,1.285c0.193,0.975,0.193,0.975-0.078,1.558
			c-0.102,0.221-0.228,0.49-0.376,0.853c-0.331,0.81-0.566,1.697-0.701,2.646C7.424,30.245,7,31.1,7,32.018v1
			c0,1.122,0.619,2.122,1.588,2.636c0.639,2.012,1.784,3.477,3.412,4.365v0.376l-3.77,1.857C6.854,43.003,6,44.443,6,46.011v1.324
			c0,0.803,0,2.683,10,2.683s10-1.88,10-2.683v-1.244C26,44.461,25.095,42.994,23.638,42.263z M24,47.109
			c-0.623,0.379-3.161,0.908-8,0.908s-7.377-0.529-8-0.908v-1.099c0-0.835,0.456-1.603,1.151-1.983l3.858-1.9
			C13.611,41.833,14,41.21,14,40.539v-1.804l-0.604-0.261c-1.517-0.652-2.503-1.899-3.015-3.814l-0.143-0.532l-0.526-0.164
			C9.293,33.834,9,33.444,9,33.018v-1c0-0.363,0.207-0.699,0.541-0.877l0.469-0.25l0.055-0.528c0.099-0.939,0.308-1.804,0.622-2.57
			c0.133-0.325,0.246-0.568,0.338-0.767c0.339-0.729,0.462-1.105,0.377-1.876c1.175,0.672,2.587,0.959,4.122,0.842
			c0.155-0.013,0.314-0.02,0.477-0.02c3.744,0,5.572,1.356,5.929,4.399l0.062,0.523l0.466,0.245C22.792,31.316,23,31.652,23,32.018v1
			c0,0.427-0.293,0.816-0.712,0.946l-0.526,0.164l-0.143,0.532c-0.512,1.915-1.498,3.162-3.015,3.814L18,38.735v1.812
			c0,0.666,0.369,1.27,0.964,1.575l3.768,1.924l0.007,0.004C23.517,44.439,24,45.222,24,46.091V47.109z" />
	                            <path
								d="M31,29.018h10c0.553,0,1-0.447,1-1s-0.447-1-1-1H31c-0.553,0-1,0.447-1,1S30.447,29.018,31,29.018z" />
	                            <path
								d="M32,44.018h-1c-0.553,0-1,0.447-1,1s0.447,1,1,1h1c0.553,0,1-0.447,1-1S32.553,44.018,32,44.018z" />
	                            <path
								d="M38,44.018h-2c-0.553,0-1,0.447-1,1s0.447,1,1,1h2c0.553,0,1-0.447,1-1S38.553,44.018,38,44.018z" />
	                            <path
								d="M43,44.018h-1c-0.553,0-1,0.447-1,1s0.447,1,1,1h1c0.553,0,1-0.447,1-1S43.553,44.018,43,44.018z" />
	                            <path
								d="M49,44.018h-2c-0.553,0-1,0.447-1,1s0.447,1,1,1h2c0.553,0,1-0.447,1-1S49.553,44.018,49,44.018z" />
	                            <path
								d="M53,33.018H31c-0.553,0-1,0.447-1,1s0.447,1,1,1h22c0.553,0,1-0.447,1-1S53.553,33.018,53,33.018z" />
	                            <path
								d="M53,39.018H31c-0.553,0-1,0.447-1,1s0.447,1,1,1h22c0.553,0,1-0.447,1-1S53.553,39.018,53,39.018z" />
	                            <path
								d="M55.322,14H37V6.313C37,5.037,35.963,4,34.687,4h-9.375C24.037,4,23,5.037,23,6.313V14H4.678C2.099,14,0,16.099,0,18.678
			v32.645C0,53.901,2.099,56,4.678,56h50.645C57.901,56,60,53.901,60,51.322V18.678C60,16.099,57.901,14,55.322,14z M25,6.313
			C25,6.141,25.141,6,25.312,6h9.375C34.859,6,35,6.141,35,6.313V14v5.688C35,19.859,34.859,20,34.687,20h-9.375
			C25.141,20,25,19.859,25,19.688V14V6.313z M58,51.322C58,52.799,56.799,54,55.322,54H4.678C3.201,54,2,52.799,2,51.322V18.678
			C2,17.201,3.201,16,4.678,16H23v3.688C23,20.963,24.037,22,25.312,22h9.375C35.963,22,37,20.963,37,19.688V16h18.322
			C56.799,16,58,17.201,58,18.678V51.322z" />
	                            <path
								d="M30,15c2.206,0,4-1.794,4-4s-1.794-4-4-4s-4,1.794-4,4S27.794,15,30,15z M30,9c1.103,0,2,0.897,2,2s-0.897,2-2,2
			s-2-0.897-2-2S28.897,9,30,9z" />
	                        </g>
	                    </svg> 근태관리
				</a></li>
				<li><a href="${pageContext.request.contextPath}/project/driftlist"> <svg version="1.1"
							xmlns="http://www.w3.org/2000/svg"
							xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
							viewBox="0 0 60 60" style="enable-background: new 0 0 60 60;"
							xml:space="preserve">
	                        <g>
	                            <path
								d="M15.5,17h13c0.553,0,1-0.447,1-1s-0.447-1-1-1h-13c-0.553,0-1,0.447-1,1S14.947,17,15.5,17z" />
	                            <path
								d="M15.5,48h13c0.553,0,1-0.447,1-1s-0.447-1-1-1h-13c-0.553,0-1,0.447-1,1S14.947,48,15.5,48z" />
	                            <path
								d="M15.5,23h29c0.553,0,1-0.447,1-1s-0.447-1-1-1h-29c-0.553,0-1,0.447-1,1S14.947,23,15.5,23z" />
	                            <path
								d="M15.5,35h29c0.553,0,1-0.447,1-1s-0.447-1-1-1h-29c-0.553,0-1,0.447-1,1S14.947,35,15.5,35z" />
	                            <path
								d="M15.5,42h29c0.553,0,1-0.447,1-1s-0.447-1-1-1h-29c-0.553,0-1,0.447-1,1S14.947,42,15.5,42z" />
	                            <path
								d="M15.5,29h14c0.553,0,1-0.447,1-1s-0.447-1-1-1h-14c-0.553,0-1,0.447-1,1S14.947,29,15.5,29z" />
	                            <path
								d="M44.5,27h-7c-0.553,0-1,0.447-1,1s0.447,1,1,1h7c0.553,0,1-0.447,1-1S45.053,27,44.5,27z" />
	                            <path
								d="M32.79,27.29C32.6,27.479,32.5,27.729,32.5,28c0,0.26,0.109,0.52,0.29,0.71C32.979,28.899,33.229,29,33.5,29
			c0.27,0,0.52-0.11,0.71-0.29c0.18-0.19,0.29-0.44,0.29-0.71c0-0.271-0.101-0.521-0.29-0.71C33.83,26.92,33.17,26.91,32.79,27.29z" />
	                            <path
								d="M41.5,2h-6V1c0-0.553-0.447-1-1-1h-9c-0.553,0-1,0.447-1,1v1h-6h-13v58h49V2H41.5z M33.5,2v1v2h-7V3V2H33.5z M24.5,4v2v1h1
			h9h1V6V4h5v1v3h-21V5V4H24.5z M17.5,9v1h1h23h1V9V7h7v48h-39V7h7V9z M52.5,58h-45V4h10v1h-9v52h43V5h-9V4h10V58z" />
	                        </g>
	                    </svg> 전자결재
				</a></li>
			</ul>
			<ul>
				<li><span class="sec_title">모아보기</span></li>
				<li><a href="${pageContext.request.contextPath}/project/task?pno=${pno}"> <svg version="1.1"
							xmlns="http://www.w3.org/2000/svg"
							xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
							viewBox="0 0 59 59" style="enable-background: new 0 0 59 59;"
							xml:space="preserve">
	                        <g>
	                            <path
								d="M52,21c-0.553,0-1,0.447-1,1v32H2V5h49v1c0,0.553,0.447,1,1,1s1-0.447,1-1V3H0v53h53V22C53,21.447,52.553,21,52,21z" />
	                            <path
								d="M58.707,7.293c-0.391-0.391-1.023-0.391-1.414,0L27,37.586l-13.07-13.07c-0.391-0.391-1.023-0.391-1.414,0
			s-0.391,1.023,0,1.414l13.777,13.777C26.488,39.902,26.744,40,27,40s0.512-0.098,0.707-0.293l31-31
			C59.098,8.316,59.098,7.684,58.707,7.293z" />
	                        </g>
	                    </svg> 전체 업무
				</a></li>
				<li><a href="#"> <svg version="1.1"
							xmlns="http://www.w3.org/2000/svg"
							xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
							viewBox="0 0 60 60" style="enable-background: new 0 0 60 60;"
							xml:space="preserve">
	                        <g>
	                            <path
								d="M57,4h-7V1c0-0.553-0.447-1-1-1h-7c-0.553,0-1,0.447-1,1v3H19V1c0-0.553-0.447-1-1-1h-7c-0.553,0-1,0.447-1,1v3H3
			C2.447,4,2,4.447,2,5v11v43c0,0.553,0.447,1,1,1h54c0.553,0,1-0.447,1-1V16V5C58,4.447,57.553,4,57,4z M43,2h5v3v3h-5V5V2z M12,2h5
			v3v3h-5V5V2z M4,6h6v3c0,0.553,0.447,1,1,1h7c0.553,0,1-0.447,1-1V6h22v3c0,0.553,0.447,1,1,1h7c0.553,0,1-0.447,1-1V6h6v9H4V6z
			 M4,58V17h52v41H4z" />
	                            <path
								d="M38,23h-7h-2h-7h-2h-9v9v2v7v2v9h9h2h7h2h7h2h9v-9v-2v-7v-2v-9h-9H38z M31,25h7v7h-7V25z M38,41h-7v-7h7V41z M22,34h7v7h-7
			V34z M22,25h7v7h-7V25z M13,25h7v7h-7V25z M13,34h7v7h-7V34z M20,50h-7v-7h7V50z M29,50h-7v-7h7V50z M38,50h-7v-7h7V50z M47,50h-7
			v-7h7V50z M47,41h-7v-7h7V41z M47,25v7h-7v-7H47z" />
	                        </g>
	                    </svg> 전체 일정
				</a></li>
				<li><a href="${pageContext.request.contextPath}/files/list"> <svg version="1.1"
							xmlns="http://www.w3.org/2000/svg"
							xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
							viewBox="0 0 60 60" style="enable-background: new 0 0 60 60;"
							xml:space="preserve">
	                        <g>
	                            <path
								d="M32.515,7l-5-7H6v4H3v4H0v52h2h56h2V17v-2v-2v-2V7H32.515z M2,58V10h1h17.485l5,7h0.012l4.69,6.551
			c0.195,0.272,0.502,0.417,0.813,0.418V24h27v34H2z M58,22H31.537l-3.579-5H58V22z M58,15H26.525l-4.712-6.582l-0.001-0.001
			L21.515,8H5V6h1h17.485l5,7H58V15z M29.515,11l-5-7H8V2h18.485l5,7H58v2H29.515z" />
	                            <path
								d="M27,55h28V35H27V55z M29,37h24v16H29V37z" />
	                            <rect x="33" y="40" width="10" height="2" />
	                            <rect x="33" y="44" width="16" height="2" />
	                            <rect x="33" y="48" width="16" height="2" />
	                        </g>
	                    </svg> 전체 파일
				</a></li>
				<li><a href="${pageContext.request.contextPath}/project/mydetail"> <svg version="1.1"
							xmlns="http://www.w3.org/2000/svg"
							xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
							viewBox="0 0 60 60" style="enable-background: new 0 0 60 60;"
							xml:space="preserve">
	                        <path
								d="M48.014,42.889l-9.553-4.776C37.56,37.662,37,36.756,37,35.748v-3.381c0.229-0.28,0.47-0.599,0.719-0.951
		c1.239-1.75,2.232-3.698,2.954-5.799C42.084,24.97,43,23.575,43,22v-4c0-0.963-0.36-1.896-1-2.625v-5.319
		c0.056-0.55,0.276-3.824-2.092-6.525C37.854,1.188,34.521,0,30,0s-7.854,1.188-9.908,3.53C17.724,6.231,17.944,9.506,18,10.056
		v5.319c-0.64,0.729-1,1.662-1,2.625v4c0,1.217,0.553,2.352,1.497,3.109c0.916,3.627,2.833,6.36,3.503,7.237v3.309
		c0,0.968-0.528,1.856-1.377,2.32l-8.921,4.866C8.801,44.424,7,47.458,7,50.762V54c0,4.746,15.045,6,23,6s23-1.254,23-6v-3.043
		C53,47.519,51.089,44.427,48.014,42.889z M51,54c0,1.357-7.412,4-21,4S9,55.357,9,54v-3.238c0-2.571,1.402-4.934,3.659-6.164
		l8.921-4.866C23.073,38.917,24,37.354,24,35.655v-4.019l-0.233-0.278c-0.024-0.029-2.475-2.994-3.41-7.065l-0.091-0.396l-0.341-0.22
		C19.346,23.303,19,22.676,19,22v-4c0-0.561,0.238-1.084,0.67-1.475L20,16.228V10l-0.009-0.131c-0.003-0.027-0.343-2.799,1.605-5.021
		C23.253,2.958,26.081,2,30,2c3.905,0,6.727,0.951,8.386,2.828c1.947,2.201,1.625,5.017,1.623,5.041L40,16.228l0.33,0.298
		C40.762,16.916,41,17.439,41,18v4c0,0.873-0.572,1.637-1.422,1.899l-0.498,0.153l-0.16,0.495c-0.669,2.081-1.622,4.003-2.834,5.713
		c-0.297,0.421-0.586,0.794-0.837,1.079L35,31.623v4.125c0,1.77,0.983,3.361,2.566,4.153l9.553,4.776
		C49.513,45.874,51,48.28,51,50.957V54z" />
	                        <g>
	                    </svg> 내 게시물
				</a></li>
			</ul>
			<ul id="sidebar_pjteam">
				<li><span class="sec_title">부서 보관함&nbsp;</span></li>
			</ul>
			<ul id="org">
				<li class="orgchart">
					<a href="#"> 
						<img alt="조직도" src="${pageContext.request.contextPath}/resources/img/share-2.png" width="20px"> 조직도
					</a>
				</li>
			</ul>
		</nav>
		<!-- Modal -->
		<div id="newpjModal" class="sb-modal">
			<!-- Modal content -->
			<div class="sb-modal-content">
				<div class="sb-modal-header">
					<span class="close">&times;</span>
					<h3>프로젝트 만들기</h3>
				</div>
				<form action="${pageContext.request.contextPath}/project/all/ins" method="get">
					<div class="sb-modal-body">
						<input type="text" id="pname" placeholder="프로젝트 이름을 입력하세요." name="pname" />
						<textarea placeholder="프로젝트 설명을 입력할 수 있습니다." name="pdesc" cols="50" rows="3"></textarea>
						<div class="pj_secret">
							<svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg"
								xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
								viewBox="0 0 54 54" style="enable-background: new 0 0 54 54;"
								xml:space="preserve">
	                        <g>
	                            <path
									d="M43,20.113V14.5C43,6.505,35.822,0,27,0S11,6.505,11,14.5v5.613c-3.401,0.586-6,3.55-6,7.117v19.542
	                   C5,50.757,8.243,54,12.229,54h29.542C45.757,54,49,50.757,49,46.771V27.229C49,23.663,46.401,20.699,43,20.113z M13,14.5
	                   C13,7.607,19.28,2,27,2s14,5.607,14,12.5V20H13V14.5z M47,46.771C47,49.654,44.654,52,41.771,52H12.229C9.346,52,7,49.654,7,46.771
	                   V27.229C7,24.346,9.346,22,12.229,22h29.542C44.654,22,47,24.346,47,27.229V46.771z" />
	                            <path
									d="M27,28c-2.206,0-4,1.794-4,4v6c0,2.206,1.794,4,4,4s4-1.794,4-4v-6C31,29.794,29.206,28,27,28z M29,38c0,1.103-0.897,2-2,2
	                   s-2-0.897-2-2v-6c0-1.103,0.897-2,2-2s2,0.897,2,2V38z" />
	                        </g>
	                    </svg>
							관리자 승인 후 참여 가능 
							<label class="switch"> 
								<input id="popen" type="checkbox" value="1" name="popen">
								<span class="slider round">
							</label>
						</div>
						<div class="pj_select_team">
							<div>부서보관함 선택</div>
							<div>
								<div id="pjteam"></div>
							</div>
						</div>
						<input type="submit" id="pj_new_btn" value="프로젝트생성" />
					</div>
				</form>
			</div>
		</div>
	</div>
</body>

</html>