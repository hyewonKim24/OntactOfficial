<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ include file="../main/header.jsp" %>
<%@ include file="./pjsidebar.jsp" %>
	<!DOCTYPE html>
	<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<sec:csrfMetaTags />
		<title>ontact, 서로 연결되는 온라인 공간</title>
		<link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet"
			type="text/css">
		<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<!-- 파일 -->
		<link href="${pageContext.request.contextPath}/resources/css/lightbox.min.css" rel="stylesheet">
        <script src="${pageContext.request.contextPath}/resources/js/lightbox.min.js"></script>
        <script src="https://kit.fontawesome.com/22634e2e1a.js" crossorigin="anonymous"></script>
		<!-- 차트 그리기 -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"
			integrity="sha512-d9xgZrVZpmmQlfonhQUvTR7lMPtO7NkZMkA0ABN3PHCbKA5nqylQ/yWlFAyY6hYgdF1Qh6nYiuADWwKB4C2WSw=="
			crossorigin="anonymous"></script>
		<style>
			* {
				margin: 0;
			}

			body {
				width: 1200px;
				height: 100%;
				position: relative;
				font-size: 14px;
				font-family: Noto Sans KR;
				line-height: 1.15;
				background-color: rgb(242, 242, 242);
				margin: 0 auto;
			}

			a {
				text-decoration: none;
				color: #333333;
			}

			/* 본문 */
			.main {
				position: relative;
				width: 1200px;
				height: 100%;
				margin: 0 auto;
			}

			/* 프로젝트 글 */
			.contents {
				position: relative;
				width: 700px;
				height: 100%;
				margin: 80px auto 0 230px;
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
			#tab2:checked~#task,
			#tab3:checked~#schedule,
			#tab4:checked~#todo {
				display: block;
			}

			/* 글 작성 부분 */
			.boardHeader {
				height: 60px;
				padding: 25px 12px 0 25px;
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

			.writeDate {
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
			}

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

			/* 업무 리포트 */
			.task-report-wrap {
				position: relative;
				width: 700px;
				box-shadow: 1px 1px 3px 1px #e7e7e7;
				float: left;
			}

			#report-title {
				font-size: 20px;
				font-weight: bold;
				text-align: center;
				margin: 20px;
			}

			#taskChart {
				width: 500px !important;
				height: 250px !important;
				margin: 0 auto;
				padding-bottom: 15px;
			}

			/* 업무 css */
			.task-radio {
				display: none;
				margin: 10px;
			}

			.task-radio+label {
				display: inline-block;
				margin: -5px;
				padding: 8px;
				background-color: #f5f5f5;
				border: 1px solid #ccc;
				font-size: 13px;
				width: 70px;
				text-align: center;
				border-radius: 3px;
				cursor: pointer;
				color: #505050;
			}

			.task-radio-01:checked+label {
				background-color: #F27781;
				color: #fff;
			}

			.task-radio-02:checked+label {
				background-color: #f17a19;
				color: #fff;
			}

			.task-radio-03:checked+label {
				background-color: #50b766;
				color: #fff;
			}

			.task-radio-04:checked+label {
				background-color: #4aaefb;
				color: #fff;
			}

			#task-icon01 {
				margin: 10px;
			}

			#task-01 {
				display: inline-block;
				height: 50px;
				width: 600px;
				border: none;
				border-bottom: 1px solid #dadbdb;
			}

			.task-radio-wrap {
				position: absolute;
				display: inline-block;
				width: 350px;
				height: 30px;
				margin-left: 10px;
				margin-top: 10px;
			}

			.task-icon02 {
				margin: 12px;
			}

			.task-02 {
				display: inline-block;
				height: 45px;
				width: 600px;
				border: none;
				border-bottom: 1px solid #dadbdb;
			}

			.task-res-wrap {
				position: absolute;
				display: inline-block;
				width: 350px;
				height: 30px;
				margin-left: 10px;
				margin-top: 7px;
			}

			.task-res {
				padding: 5px;
				width: 150px;
				height: 20px;
				line-height: 25px;
				border: 1px solid #e7e7e7;
				border-radius: 5px;
			}

			.task-res-list {
				padding: 5px;
				width: 150px;
				height: 20px;
				line-height: 25px;
				border: 1px solid #e7e7e7;
				border-radius: 5px;
				cursor: pointer;
				text-align: center;
				white-space:nowrap;
			}

			.task-res-add-wrap {
				width: 162px;
				height: 100px;
				overflow: scroll;
				display: none;
				background-color: #fff;
				border: 1px solid #787878;
				border-radius: 5px;
				z-index: 99;
				position: absolute;
				top: 33px;
			}

			.task-03 {
				display: inline-block;
				height: 45px;
				width: 600px;
				border: none;
				border-bottom: 1px solid #dadbdb;
				z-index: -2;
			}

			.task-start-wrap {
				position: absolute;
				display: inline-block;
				width: 350px;
				height: 30px;
				margin-left: 10px;
				margin-top: 7px;
			}

			.task-schedule {
				padding: 5px;
				width: 150px;
				height: 20px;
				line-height: 25px;
				border: 1px solid #e7e7e7;
				border-radius: 5px;
			}

			/* 업무 달성률 */
			.task-04 {
				display: inline-block;
				height: 45px;
				width: 600px;
				border: none;
				border-bottom: 1px solid #dadbdb;
			}

			.task-rate-wrap {
				position: absolute;
				display: inline-block;
				width: 350px;
				height: 30px;
				margin-left: 10px;
				margin-top: 15px;
			}

			.workPrgrs {
				display: block;
				margin-top: 6px;
				margin-bottom: -3px;
				padding-bottom: 3px;
				height: 20px;
			}

			.workPrgrs_bg {
				position: absolute;
				width: 150px;
				height: 14px;
				border-radius: 3px;
				background-color: #eaeaea;
			}

			.workPrgrs_bg .txt {
				z-index: 1;
				position: absolute;
				left: 0;
				right: 0;
				text-align: center;
				font-size: 10px;
				line-height: 14px;
				color: #111;
			}

			.workPrgrs_bg .bar {
				display: block;
				position: absolute;
				top: 0;
				left: 0;
				bottom: 0;
				border-radius: 3px;
				background-color: #7099de;
			}

			.workPrgrs_bg .bar.percent0 {
				right: 95%;
			}

			.pcnt0,
			.pcnt100,
			.pcnt20,
			.pcnt40,
			.pcnt60,
			.pcnt80 {
				z-index: 100;
				display: inline-block;
				position: absolute;
				top: 0;
				bottom: -10px;
				width: 20%;
			}

			.workPrgrs_bg .pcnt button {
				position: relative;
				display: block;
				width: 36px;
				height: 23px;
				line-height: 21px;
				font-size: 11px;
				color: #fff;
				text-align: center;
				border: 0;
				background: 0 0;
			}

			.workPrgrs_bg .pcnt {
				z-index: 1;
				display: none;
				position: absolute;
				top: 20px;
				left: 100%;
				margin-left: -18px;
				width: 36px;
				height: 23px;
				line-height: 21px;
				border-radius: 3px;
				background-color: rgba(0, 0, 0, .6);
			}

			.pcnt0 {
				cursor: pointer;
				display: inline-block;
				z-index: 1000;
				width: 5%;
			}

			.pcnt20 {
				cursor: pointer;
				display: inline-block;
				z-index: 999;
				left: 5%;
			}

			.pcnt40 {
				cursor: pointer;
				display: inline-block;
				width: 40%;
				z-index: 998;
			}

			.pcnt60 {
				cursor: pointer;
				display: inline-block;
				width: 60%;
				z-index: 997;
			}

			.pcnt80 {
				cursor: pointer;
				display: inline-block;
				width: 80%;
				z-index: 996;
			}

			.pcnt100 {
				cursor: pointer;
				display: inline-block;
				width: 100%;
				z-index: 995;
			}

			/* 업무 우선순위 */
			.task-05 {
				display: inline-block;
				height: 45px;
				width: 600px;
				border: none;
				border-bottom: 1px solid #dadbdb;
				margin-bottom: 15px;
			}

			.task-pri {
				width: 150px;
				line-height: 25px;
				border: 1px solid #e7e7e7;
				border-radius: 5px;
				background-color: none;
			}

			.task-pri-wrap {
				position: absolute;
				display: inline-block;
				width: 350px;
				height: 30px;
				margin-left: 10px;
				margin-top: 7px;
			}

			.task-pri-add-wrap {
				width: 150px;
				height: 90px;
				display: none;
				background-color: #fff;
				border: 1px solid #787878;
				border-radius: 5px;
				z-index: 99;
				position: absolute;
				top: 33px;
			}

			/* 댓글 관련 */
			.replyUpdateText {
				display: none;
			}

			.replyUpdateBtn {
				display: none;
			}

			.replyUpdate {
				border: none;
				background: none;
				color: #432D73;
				font-size: 12px;
				font-family: Noto Sans KR;
			}

			.replyDelete {
				border: none;
				background: none;
				color: #432D73;
				font-size: 12px;
				font-family: Noto Sans KR;
			}

			.replyUpdateBtn {
				width: 80px;
				height: 25px;
				border-radius: 3px;
				color: #5A3673;
				font-size: 12px;
				border: 1px solid #5A3673;
				font-family: Noto Sans KR;
			}

			.replyUpdateText {
				width: 500px;
				height: 25px;
				box-sizing: border-box;
				vertical-align: middle;
				border: 1px solid #c0c0c0;
			}

			/* 댓글 작성 부분 */
			.reply {
				width: 700px;
				padding: 10px 0;
				border-top: 1px solid #e7e7e7;
			}

			.replyMore {
				background-color: white;
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

			.replyDate {
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

			/* 윤진 :할일 글 입력창*/
			.todoinput {
				width: 100%;
			}

			li {
				list-style: none;
				border-bottom: 1px solid #e7e7e7;
				padding: 5px 0;
			}

			/* 윤진 :할일 글 입력창 - 할일입력칸 / 아이콘설정 */
			.todo-01 {
				width: 20px !important;
				height: 20px !important;
				margin-left: 10px;
			}

			.todoicon {
				width: 23px;
				height: 23px;
				cursor: pointer;
				box-sizing: border-box;
			}

			.todo-01 {
				box-sizing: border-box;
			}

			.todo-02 {
				padding-left: 35px;
				width: 79%;
				height: 25px;
				min-height: 0px;
				line-height: 25px;
				font-size: 14px;
				border: none;
				margin: 0;
				box-sizing: border-box;
			}


			.todo-03 {
				display: none;
				width: 43px;
				border: none;
				text-align: center;
				font-weight: 600;
				color: #333333;
				transform: translateY(-9px);
			}

			.todo-04 {
				margin-left: 17px;
				transform: translateY(-6px);
			}

			.tdp-wrap {
				position: absolute;
				display: inline-block;
				width: 350px;
				height: 30px;
				margin-left: 10px;
				margin-top: 7px;
			}

			.tdp-list {
				padding: 5px;
				width: 150px;
				height: 20px;
				line-height: 25px;
				border: 1px solid #e7e7e7;
				border-radius: 5px;
				cursor: pointer;
				text-align: center;
			}

			.tdp-add-wrap {
				width: 162px;
				height: 100px;
				overflow: scroll;
				display: none;
				background-color: #fff;
				border: 1px solid #787878;
				border-radius: 5px;
				z-index: 999;
				position: absolute;
				top: 33px;
			}

			.todoaddbox {
				margin: 15px 0;
				cursor: pointer;
			}

			.todo-plus {
				width: 15px;
				height: 15px;
				margin-left: 13px;
				transform: translateY(2px);
			}

			.todoaddspan {
				padding-left: 40px;
				cursor: pointer;
			}

			/* 윤진 :할일 리스트*/
			.todo-cont {
				width: 95%;
				position: relative;
				padding: 15px 0 15px 0;
				border: 1px solid #e5e6e9;
				background-color: #fbfbfb;
				margin: 0 auto;
			}

			.todo-title {
				width: 90%;
				padding: 30px 35px 0 30px;
				margin-left: 15px;
			}

			.todo-list-per {
				margin-right: 45px;
				color: #505050;
			}

			.todo-list-ing {
				color: #505050;
			}

			.todo-list-title {
				display: inline-block;
				width: 65%;
				font-size: 16px;
				font-weight: 700;
				color: #333;
				line-height: 18px;
				text-overflow: ellipsis;
				white-space: nowrap;
				overflow: hidden;
			}

			.todo-cont-list {
				padding: 30px;
			}

			.todo-cont-list li {
				height: 40px;
				clear: both;
			}

			/* 윤진 :체크박스 설정*/
			/*unchecked */
			.todo-cont-list input[type="checkbox"] {
				display: none;
				width: 10%;
			}

			.todo-cont-list input[type="checkbox"]+label {
				display: inline-block;
				width: 20px;
				height: 20px;
				margin: 10px 10px 10px 25px;
				vertical-align: middle;
				background: url("${pageContext.request.contextPath}/resources/img/checked-2-01.png") left top no-repeat;
				cursor: pointer;
				background-size: cover;
				float: left;
			}

			/*checked */
			.todo-cont-list input[type="checkbox"]:checked+label {
				background: url("${pageContext.request.contextPath}/resources/img/checked-2-02.png") top no-repeat;
				background-size: cover;
			}

			/* 윤진 :할일 내용*/
			.todo-06 {
				padding-left: 20px;
				width: 71%;
				height: 25px;
				min-height: 0px;
				line-height: 25px;
				font-size: 14px;
				border: none;
				margin: 10px 0;
				box-sizing: border-box;
				float: left;
			}

			/*할일 마감일*/
			.todo-07 {
				float: left;
				margin: 0 20px;
				line-height: 44px;
			}

			/*할일 담당자 */
			.todo-08 {
				width: 25px;
				margin-top: 10px;
			}

			/* 윤진 : 우측 바 */
			.rightBar {
				position: fixed;
				width: 250px;
				height: 100%;
				margin: 80px 0 0 950px;
				z-index: 99;
			}

			/* 윤진 : 이전화면 버튼 div*/
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

			.rightBar #addmembtn {
				width: 250px;
				height: 60px;
				font-size: 14px;
				display: block;
				margin-bottom: 8px;
				line-height: 60px;
				color: #ffffff;
				font-weight: 700;
				padding-left: 90px;
				border-top: 1px solid #fff;
				border-left: 1px solid #ececec;
				border-right: 1px solid #ececec;
				border-bottom: 1px solid #e0e0e0;
				border-radius: 3px;
				background-color: #f27781;
				box-sizing: border-box;
			}

			.rightBar #addmembtn img {
				width: 23px;
				height: 23px;
				cursor: pointer;
				margin: 0 10px;
				transform: translateY(5px);
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

			/*윤진 :우측 파일함,업무,일정,할일 아이콘 색,크기 통일*/
			.rightsvg {
				width: 23px;
				fill: #444444;
			}

			/*윤진 : 채팅 div*/
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

			/* 윤진 : scrollbar*/
			/* 윤진 : width */
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

			/* 윤진 :전체참여자*/
			.allpj_title {
				position: relative;
				padding-top: 6px;
				margin: 0 15px 10px 15px;
				height: 20px;
				font-size: 12px;
				color: #343538;
				font-weight: 700;
			}

			/*윤진 :전체보기 버튼*/
			.allpjmem {
				display: block;
				position: absolute;
				top: 5px;
				right: 0;
				font-size: 12px;
				color: #676869;
				font-weight: 400;
			}

			/* 윤진 :타이틀 : 관리자,내부참여자 */
			.part-title {
				font-size: 12px;
				position: relative;
				padding-top: 8px;
				padding-bottom: 8px;
				min-height: 12px;
				margin: 0 15px;
				border-top: 1px solid #e9eaed;
			}

			/* 윤진 :타이틀 : 프로젝트 멤버 리스트 */
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

			/* 윤진 :프로필사진*/
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

			/* 윤진 :프로젝트 멤버 이름*/
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

			/* 윤진 :우측 사이드 채팅 아이콘*/
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

			/* 윤진 :우측 하단 채팅 버튼*/
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
			
			
			/* 초대하기 모달 */
			.invite-dim{
				display:none;
			    position: fixed;
			    top: 0;
			    left: 0;
			    width: 100%;
			    height: 100%;
			    background: rgba(0, 0, 0, 0.5);
			    z-index:90;
			    
			}
			
			.invite-search-wrap{
				display:none;
				position: relative;
			    width: 500px;
			    height: 580px;
			    margin: 100px auto;
			    background: #fefefe;
			    border:1px solid #fff;
			    z-index:95;
			    overflow: scroll;
			}
			
			.invite-title{
				width:550px;
			    height: 45px;
			    line-height: 45px;
			    text-align: center;
			    font-size: 16px;
			    background: #e7e7e7;
			
			}
			.invite-search-box {
            margin: 10px 12px;
            height: 32px;
            width: 480px;
            line-height: 32px !important;
            border: 1px solid #e7e7e7;
            border-radius: 4px;
            background-color: #fff;
        }

        .chat-search-input {
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
            width: 500px;
            height: 65px;
            background-color:#e7e7e7;
            margin:0 auto;
        }

        .chat-invite-wrap {
        	position:relative;
        	width:500px;
            line-height: 60px;
            color: #333333;
            font-weight: bold;
            text-align: center;
        }
        .inviteList-table tbody{
        	text-align: center;
        }


        .invite-exit{
            float: right;
            margin: 20px;
            width: 25px;
            height: 25px;
        }

        .invite-search{
            padding-left:10px;
        }

        .invite-rs{
            line-height: 40px;
            height: 400px;
            overflow: scroll;
        }
        .invite-my-img{
	        line-height: 68px;
	        width: 100px;
	        display:inline-block;
	        float:right;
        }
        .invite-names{
	        width: 400px;
	        height:50px;
	        line-height:20px;
	        padding-top:15px;
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
	        width: 30px;
	        display:inline-block;
	        float:right;
	        text-align: right;
	        padding-top:5px;
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
        	padding-left:20px;
        	vertical-align: middle;
        }
        .invite-imgs{
       	    border-radius: 90px;
    		box-shadow: inset 0 0 0 1px rgba(0, 0, 0, .05);
        }
      
        .tel-other{
           vertical-align: middle;
        }
        .submit-wrap{
            padding: 10px 0;
		    border-top-color: #e8e8e8;
		    border-top-width: 1px;
		    border-top-style: solid;
		    position: absolute ;
		    text-align: center;
		    bottom:0px;
		    background-color: #fff;
		    height :40px;
		    width: 500px;
		    vertical-align: middle;
        }
        .resetbtn{
        	width: 100px;
        	height: 40px;
        	border: 1px solid #432D73;
        	color:#432D73;
        	font-size:12px;
        	border-radius: 3px;
        	background: #fff;
        }
        .submitbtn{
            width: 150px;
        	height: 40px;
        	border: 1px solid #fff;
        	color:#fff;
        	font-size:12px;
        	border-radius: 3px;
        	background: #432D73;
        	margin-left:5px;
        }
        .inviteList-table tr:last-child td{
        	margin-bottom:100px;
        	background-color: black;
        	display:none;
        }
			
			
		</style>
	</head>
	
	<body>
		<input type="hidden" value="${chatno}" id="chatno" name="chatno">
		<sec:authentication property="principal.username" var="username" />
		<sec:authentication property="principal.uno" var="uno" />
		<sec:authentication property="principal.uname" var="uname" />
		<input type="hidden" value="${uno}" id="uno" name="uno">
		<input type="hidden" value="${uname}" id="uname" name="uname">
		<div class="main">
			<div class="contents">
				<!--  혜원/ 업무리포트  -->
				
				<div class="task-report-wrap">
					<p id="report-title"> 업무리포트 </p>
					<div class="task-report" width="300px" height="300px">
						<canvas id="taskChart"></canvas>
					</div>
				</div>

				<div class="wrap">
					<div class="write" id="write">
						<input id="tab1" type="radio" name="tabs" class="tabs" checked>
						<!--디폴트 메뉴-->
						<label for="tab1" class="tabslabel"><svg version="1.1" id="Capa_1"
								xmlns="http://www.w3.org/2000/svg"
								xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
								viewBox="0 0 60.017 60.017"
								style="enable-background:new 0 0 60.017 60.017;" xml:space="preserve">
								<path d="M59.144,3.731l-2.85-2.851c-1.164-1.161-3.057-1.162-4.221,0.001l-3.126,3.126H0v56h56V11.097l0.305-0.305l0,0l2.839-2.839
								C60.308,6.789,60.308,4.895,59.144,3.731z M20.047,36.759l3.22,3.22l-4.428,1.208L20.047,36.759z M52.062,12.206L47.82,7.964
								l1.414-1.414l4.243,4.242L52.062,12.206z M50.648,13.62L25.192,39.076l-4.242-4.242L46.406,9.378L50.648,13.62z M54,13.097v44.91H2
								v-52h44.947L18.829,34.127l-0.188,0.188l-2.121,7.779l-1.226,1.226c-0.391,0.391-0.391,1.023,0,1.414
								c0.195,0.195,0.451,0.293,0.707,0.293s0.512-0.098,0.707-0.293l1.226-1.226l7.779-2.123l26.351-26.35h0l0.447-0.447L54,13.097z
								M57.73,6.539l-2.839,2.839l-4.243-4.243l2.839-2.839c0.384-0.384,1.009-0.383,1.393,0l2.85,2.85
								C58.114,5.529,58.114,6.155,57.73,6.539z" />
							</svg>글작성
						</label>
						<input id="tab2" type="radio" name="tabs" class="tabs">
						<label for="tab2" class="tabslabel"><svg version="1.1"
								xmlns="http://www.w3.org/2000/svg"
								xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
								viewBox="0 0 59 59" style="enable-background:new 0 0 59 59;"
								xml:space="preserve">
								<g>
									<path
										d="M52,21c-0.553,0-1,0.447-1,1v32H2V5h49v1c0,0.553,0.447,1,1,1s1-0.447,1-1V3H0v53h53V22C53,21.447,52.553,21,52,21z" />
									<path d="M58.707,7.293c-0.391-0.391-1.023-0.391-1.414,0L27,37.586l-13.07-13.07c-0.391-0.391-1.023-0.391-1.414,0
									s-0.391,1.023,0,1.414l13.777,13.777C26.488,39.902,26.744,40,27,40s0.512-0.098,0.707-0.293l31-31
									C59.098,8.316,59.098,7.684,58.707,7.293z" />
								</g>
							</svg>업무
						</label>
						<input id="tab3" type="radio" name="tabs" class="tabs">
						<label for="tab3" class="tabslabel"><svg version="1.1"
								xmlns="http://www.w3.org/2000/svg"
								xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
								viewBox="0 0 60 60" style="enable-background:new 0 0 60 60;"
								xml:space="preserve">
								<g>
									<path d="M57,4h-7V1c0-0.553-0.447-1-1-1h-7c-0.553,0-1,0.447-1,1v3H19V1c0-0.553-0.447-1-1-1h-7c-0.553,0-1,0.447-1,1v3H3
									C2.447,4,2,4.447,2,5v11v43c0,0.553,0.447,1,1,1h54c0.553,0,1-0.447,1-1V16V5C58,4.447,57.553,4,57,4z M43,2h5v3v3h-5V5V2z M12,2h5
									v3v3h-5V5V2z M4,6h6v3c0,0.553,0.447,1,1,1h7c0.553,0,1-0.447,1-1V6h22v3c0,0.553,0.447,1,1,1h7c0.553,0,1-0.447,1-1V6h6v9H4V6z
									M4,58V17h52v41H4z" />
									<path d="M38,23h-7h-2h-7h-2h-9v9v2v7v2v9h9h2h7h2h7h2h9v-9v-2v-7v-2v-9h-9H38z M31,25h7v7h-7V25z M38,41h-7v-7h7V41z M22,34h7v7h-7
									V34z M22,25h7v7h-7V25z M13,25h7v7h-7V25z M13,34h7v7h-7V34z M20,50h-7v-7h7V50z M29,50h-7v-7h7V50z M38,50h-7v-7h7V50z M47,50h-7
									v-7h7V50z M47,41h-7v-7h7V41z M47,25v7h-7v-7H47z" />
								</g>
							</svg>일정
						</label>
						<input id="tab4" type="radio" name="tabs" class="tabs">
						<label for="tab4" class="tabslabel"><svg version="1.1" id="Capa_1"
								xmlns="http://www.w3.org/2000/svg"
								xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
								viewBox="0 0 58 58" style="enable-background:new 0 0 58 58;"
								xml:space="preserve">
								<g>
									<rect x="9" y="12" width="40" height="2" />
									<rect x="9" y="28" width="40" height="2" />
									<rect x="9" y="44" width="40" height="2" />
									<path d="M0,0v58h58V0H0z M56,56H2V2h54V56z" />
								</g>
							</svg>할일
						</label>
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
									<a href=""><img
											src="${pageContext.request.contextPath}/resources/img/attachment.png"
											class="textfooter_func"></a>
									<a href=""><img
											src="${pageContext.request.contextPath}/resources/img/picture-2.png"
											class="textfooter_func"></a>
								</div>
								<div class="textfooter_side">
									<div class="public">
										<img
											src="${pageContext.request.contextPath}/resources/img/worldwide.png"><span>전체공개
											&#9660;</span>
									</div>
									<div class="public_admin" style="display: none;">
										<img
											src="${pageContext.request.contextPath}/resources/img/unlocked-1.png"><span>관리자만
											&#9660;</span>
									</div>
									<div class="public_setting" style="display: none;">
										<h1 class="public_setting_title">게시물 공개 대상</h1>
										<ul>
											<li class="set_li">
												<img src="${pageContext.request.contextPath}/resources/img/worldwide.png"
													class="setimg">
												<div class="p_set_con">
													<strong>전체공개</strong>
													<span>전체 사람들에게 공개됩니다.</span>
												</div>
											</li>
											<li class="set_li_admin">
												<img src="${pageContext.request.contextPath}/resources/img/unlocked-1.png"
													class="setimg">
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

						<!-- 혜원 )  업무 글작성 부분 -->
						<%-- <c:if test="${not empty taskSuccess}">
							<script>
								alert("1개의 글이 등록되었습니다");
							</script>
							</c:if> --%>
							<div id="task" class="writemenu">
							<!-- 은실 폼 수정 -->
								<form name="task_frm" id="task_frm" method="post" action="${pageContext.request.contextPath}/project/taskinsert">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
									<input type="hidden" name="pno" id="pno" value="${pno}">
									<div class="textbody">
										<div class="title">
											<input type="text" class="title_detail" name="tasktitle"
												id="tasktitle" placeholder="업무명을 입력하세요.(50자 이내)">
										</div>
										<div id="task-01">
											<img src="${pageContext.request.contextPath}/resources/img/svg/clock-history.svg"
												width="20px" height="20px" id="task-icon01">
											<div class="task-radio-wrap">
												<input type="radio" class="task-radio task-radio-01"
													name="taskradio" id="task-radio01" value="1">
												<label for="task-radio01" class="t-label">요청</label>
												<input type="radio" class="task-radio task-radio-02"
													name="taskradio" id="task-radio02" value="2">
												<label for="task-radio02" class="t-label">진행</label>
												<input type="radio" class="task-radio task-radio-03"
													name="taskradio" id="task-radio03" value="3">
												<label for="task-radio03" class="t-label">완료</label>
												<input type="radio" class="task-radio task-radio-04"
													name="taskradio" id="task-radio04" value="4">
												<label for="task-radio04" class="t-label">보류</label>
											</div>
										</div>
										<div class="task-02">
											<img src="${pageContext.request.contextPath}/resources/img/svg/person-plus-fill.svg"
												width="20px" height="20px" class="task-icon02">
											<div class="task-res-wrap">
												<input type="text" class="task-res" name="taskname"
													placeholder="담당자 추가">
												<input type="hidden" class="task-res-uno-c"
													name="taskuno">
												<!-- 업무담당자 모달 /  해당 project 유저 list 뿌리기-->
												<div class="task-res-add-wrap">
													<div class="task-add">
														<ul>
															<c:forEach items="${userlist}" var="ulist">
																<li class="task-res-list task-res-list${e.count}">${ulist.uname}</li>
															</c:forEach>
														</ul>
													</div>
												</div>
											</div>
										</div>
										<div class="task-03">
											<img src="${pageContext.request.contextPath}/resources/img/svg/calendar-5.svg"
												width="20px" height="20px" class="task-icon02">
											<div class="task-start-wrap">
												<input type="text" name="taskstartdate"
													id="task-start-date" class="task-schedule"
													placeholder="시작일시 추가">
											</div>
										</div>
										<div class="task-03">
											<img src="${pageContext.request.contextPath}/resources/img/svg/calendar-5.svg"
												width="20px" height="20px" class="task-icon02">
											<div class="task-start-wrap">
												<input type="text" name="taskenddate" id="task-end-date"
													class="task-schedule" placeholder="마감일시 추가">
											</div>
										</div>
										<div class="task-04">
											<img src="${pageContext.request.contextPath}/resources/img/svg/bar-chart-line-fill.svg"
												width="20px" height="20px" class="task-icon02">
											<div class="task-rate-wrap">
												<a class="workPrgs">
													<div class="workPrgrs_bg">
														<strong class="txt PROGRESS_PER">0%</strong>
														<input type="hidden" name="trate" class="trate">
														<span id="PROGRESS" class="bar percent0"></span>
														<div class="pcnt0" data="0"
															style="width:5%;display:block">
															<span class="pcnt">
																<button>0%</button>
															</span>
														</div>
														<div class="pcnt20" data="20" style="left:5%;">
															<span class="pcnt">
																<button>20%</button>
															</span>
														</div>
														<div class="pcnt40" data="40">
															<span class="pcnt">
																<button>40%</button>
															</span>
														</div>
														<div class="pcnt60" data="60">
															<span class="pcnt">
																<button>60%</button>
															</span>
														</div>
														<div class="pcnt80" data="80">
															<span class="pcnt">
																<button>80%</button>
															</span>
														</div>
														<div class="pcnt100" data="100">
															<span class="pcnt">
																<button>100%</button>
															</span>
														</div>
													</div>
												</a>
											</div>
										</div>

										<div class="task-05">
											<img src="${pageContext.request.contextPath}/resources/img/svg/flag-2.svg"
												width="20px" height="20px" class="task-icon02">
											<div class="task-pri-wrap">
												<input type="text" class="task-pri" name="taskpri"
													placeholder="우선순위 추가">
												<div class="task-pri-add-wrap">
													<div class="task-pri-add">
														<button type="button" class="task-pri" id="lv1"
															value="lv1">낮음</button> <br>
														<button type="button" class="task-pri" id="lv2"
															value="lv2">보통</button> <br>
														<button type="button" class="task-pri" id="lv3"
															value="lv3">높음</button>

													</div>

												</div>
											</div>
										</div>


										<textarea class="content_detail2" placeholder="업무내용을 입력하세요"
											id="task-content" name="taskcontent"></textarea>
									<ul class="uploadedFileList_task"></ul> <!-- 이부분 추가 -->
									</div>
									<div class="textfooter">
										<div class="textfooter_func_wrap">
										<!-- 은실 수정 -->
											<a href="">
		                                    <label class="file" for="uploadfile_task" style="cursor:pointer;"><img
		                                            src="${pageContext.request.contextPath}/resources/img/attachment.png"
		                                            class="textfooter_func"></label>
			                           		<input type="file" id="uploadfile_task" name="file" multiple="multiple" style="display:none;">
		                                    </a>
		                                    <!-- 여기까지 -->
										</div>
										<div class="textfooter_side">
											<div class="public">
												<img
													src="${pageContext.request.contextPath}/resources/img/worldwide.png"><span>전체공개
													&#9660;</span>
											</div>
											<div class="public_admin" style="display: none;">
												<img
													src="${pageContext.request.contextPath}/resources/img/unlocked-1.png"><span>관리자만
													&#9660;</span>
											</div>
											<div class="public_setting" style="display: none;">
												<h1 class="public_setting_title">게시물 공개 대상</h1>
												<input type="hidden" id="taskopen" name="taskopen"
													value="0" />
												<ul>
													<li class="set_li">
														<img src="${pageContext.request.contextPath}/resources/img/worldwide.png"
															class="setimg">
														<div class="p_set_con">
															<strong>전체공개</strong>
															<span>전체 사람들에게 공개됩니다.</span>
														</div>
													</li>
													<li class="set_li_admin">
														<img src="${pageContext.request.contextPath}/resources/img/unlocked-1.png"
															class="setimg">
														<div class="p_set_con">
															<strong>관리자만</strong>
															<span>프로젝트 관리자에게만 공개됩니다.</span>
														</div>
													</li>
												</ul>
											</div>
											<!-- 은실 수정 -->
											<button type="button" class="writebtn" id="writetask"
												onclick="taskSubmit()">올리기</button>
										</div>
									</div>
								</form>
							</div>
							<script>
								$(function () {
									//input을 datepicker로 선언
									$.datepicker.setDefaults({
										dateFormat: 'yy-mm-dd' //Input Display Format 변경
										, showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
										, showMonthAfterYear: true //년도 먼저 나오고, 뒤에 월 표시
										, changeYear: true //콤보박스에서 년 선택 가능
										, changeMonth: true //콤보박스에서 월 선택 가능                
										// ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
										// ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
										// ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
										// ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
										, yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
										, monthNamesShort: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'] //달력의 월 부분 텍스트
										, monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'] //달력의 월 부분 Tooltip 텍스트
										, dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'] //달력의 요일 부분 텍스트
										, dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'] //달력의 요일 부분 Tooltip 텍스트
										, minDate: "-48M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
										, maxDate: "+12M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
									});
									$('#task-start-date').datepicker();
									$('#task-end-date').datepicker();

									$(".task-res").click(function () {
										$p = $(this).parents(".task-02");
										$p.find(".task-res-add-wrap").toggle();
									});
									$(".task-res-list").click(function () {
										$p = $(this).parents(".task-02");
										$(".task-res").val($(this).text());
										$p.find(".task-res-add-wrap").hide();
									});

									$(".task-pri").click(function () {
										$p = $(this).parents(".task-pri-wrap");
										$p.find(".task-pri-add-wrap").toggle();
									});

									$(".pcnt0").click(function () {
										var $p = $(this).parents(".workPrgrs_bg");
										$p.find(".bar").css("background-color", "#7099de");
										$p.find(".bar").css("width", "8px");
										$p.find(".PROGRESS_PER").html("0%");
										$p.find(".trate").val("0");
									});
									$(".pcnt20").click(function () {
										var $p = $(this).parents(".workPrgrs_bg");
										$p.find(".bar").css("background-color", "#7099de");
										$p.find(".bar").css("width", "30px");
										$p.find(".PROGRESS_PER").html("20%");
										$p.find(".trate").val("20");
									});
									$(".pcnt40").click(function () {
										var $p = $(this).parents(".workPrgrs_bg");
										$p.find(".bar").css("background-color", "#7099de");
										$p.find(".bar").css("width", "60px");
										$p.find(".PROGRESS_PER").html("40%");
										$p.find(".trate").val("40");
									});
									$(".pcnt60").click(function () {
										var $p = $(this).parents(".workPrgrs_bg");
										$p.find(".bar").css("background-color", "#7099de");
										$p.find(".bar").css("width", "90px");
										$p.find(".PROGRESS_PER").html("60%");
										$p.find(".trate").val("60");
									});
									$(".pcnt80").click(function () {
										var $p = $(this).parents(".workPrgrs_bg");
										$p.find(".bar").css("ba	ckground-color", "#7099de");
										$p.find(".bar").css("width", "120px");
										$p.find(".PROGRESS_PER").html("80%");
										$p.find(".trate").val("80");
									});
									$(".pcnt100").click(function () {
										var $p = $(this).parents(".workPrgrs_bg");
										$p.find(".bar").css("width", "150px");
										$p.find(".bar").css("background-color", "#6db47c");
										$p.find(".PROGRESS_PER").html("100%");
										$p.find(".trate").val("100");
									});
									$("#lv1").click(function () {
										$(".task-pri").val("낮음");
										$(".task-pri-add-wrap").hide();
									});
									$("#lv2").click(function () {
										$(".task-pri").val("보통");
										$(".task-pri-add-wrap").hide();
									});
									$("#lv3").click(function () {
										$(".task-pri").val("높음");
										$(".task-pri-add-wrap").hide();
									});



								});
								
								// 은실 파일 인서트 추가함
								//업무 글작성 버튼 눌렀을 때 + 소켓 알림
								// 웹소켓 연결
								var sock = new WebSocket("ws://" + location.host + "/ontact/alert");
								var pno = ${ pno };
								let socketMsg = pno;
								console.log("msgmsg : " + socketMsg);
								function taskSubmit() {
									sendMessage();
									function sendMessage() {
										sock.send(pno);
										console.log("글 작성 소켓 보냄");
									}
									
									 var str = "";
									    $(".imgsrc").each(function(index){
									    	str += "<input type='hidden' name='filelist[" + index + "].imgsrc' value='" + $(this).attr('src') + "'>"
									    });
									    $(".boardimg-delbtn").each(function (index) {
									        str += "<input type='hidden' name='filelist[" + index + "].fname' value='" + $(this).attr('href') + "'>"
									    });
									    $(".boardimg-name").each(function (index) {
									        let par = $(this).parent();
									        let originalFileName = $(this).text();
									        let size = par.find('#fsize').val();
									        str += "<input type='hidden' name='filelist[" + index + "].fpath' value='" + $(this).attr('href') + "'>"
									        str += "<input type='hidden' name='filelist[" + index + "].fsize' value='" + size + "'>"
									        str += "<input type='hidden' name='filelist[" + index + "].foriginalname' value='" + originalFileName + "'>"
									    });
									$("#writetask").append(str);
									var frm = document.task_frm;
									frm.action = "${pageContext.request.contextPath}/project/taskinsert";
									frm.method = "post";
									frm.submit();
								}
							</script>


							<div id="schedule" class="writemenu">
								<div class="textbody">
									<div class="title">
										<input type="text" class="title_detail" placeholder="제목 입력(선택)">
									</div>
									<textarea class="content_detail2"
										placeholder="내용을 입력하세요"></textarea>
								</div>
								<div class="textfooter">
									<div class="textfooter_func_wrap">
										<a href=""><img
												src="${pageContext.request.contextPath}/resources/img/attachment.png"
												class="textfooter_func"></a>
										<a href=""><img
												src="${pageContext.request.contextPath}/resources/img/picture-2.png"
												class="textfooter_func"></a>
									</div>
									<div class="textfooter_side">
										<div class="public">
											<img
												src="${pageContext.request.contextPath}/resources/img/worldwide.png"><span>전체공개
												&#9660;</span>
										</div>
										<div class="public_admin" style="display: none;">
											<img
												src="${pageContext.request.contextPath}/resources/img/unlocked-1.png"><span>관리자만
												&#9660;</span>
										</div>
										<div class="public_setting" style="display: none;">
											<h1 class="public_setting_title">게시물 공개 대상</h1>
											<ul>
												<li class="set_li">
													<img src="${pageContext.request.contextPath}/resources/img/worldwide.png"
														class="setimg">
													<div class="p_set_con">
														<strong>전체공개</strong>
														<span>전체 사람들에게 공개됩니다.</span>
													</div>
												</li>
												<li class="set_li_admin">
													<img src="${pageContext.request.contextPath}/resources/img/unlocked-1.png"
														class="setimg">
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
							<!-- 윤진 )  할일 글작성 부분 -->
							<div id="todo" class="writemenu">
								<form name="todo_frm" id="todo_frm" class="todoform">
									<%-- <input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" /> --%>
									<input type="hidden" name="pno" id="pno" value="${pno}">
									<div class="textbody">
										<div class="title">
											<input type="text" name="bname" class="title_detail"
												placeholder="할일 제목을 입력하세요">
										</div>
										<ul class="todoinput">
											<li class="todo">
												<!--할일 추가 버튼 +/- -->
												<img src="${pageContext.request.contextPath}/resources/img/minus-reverse-pink.png"
													class="todo-01 todoicon">
												<input type="text" class="content_detail todo-02"
													name="tdcontent" placeholder="할일 입력">
												<!--할일 마감일 지정 버튼-->
												<input type="text" class="todo-03 todoicon todo-date1"
													name="tdate" readonly>
												<!--할일 담당자 지정 모달 / 해당 project 유저 list 뿌리기-->
												<div class="tdp-wrap">
													<img src="${pageContext.request.contextPath}/resources/img/addperson.png"
														class="todo-04 todoicon">
													<div class="tdp-add-wrap">
														<input type="hidden" class="tdp">
														<div class="tdp-add">
															<ul>
																<c:forEach items="${userlist}"
																	var="ulist">
																	<li
																		class="tdp-list tdp-list${e.count}">
																		${ulist.uname}
																		<input type="hidden"
																			class="tdp-uno" name="tduno"
																			value="${ulist.uno}">
																	</li>
																	<%-- <img src="${ulist.ufilepath}">
																		--%>
																</c:forEach>
															</ul>
														</div>
													</div>
												</div>
											</li>
										</ul>
										<!--할일 항목 추가 버튼-->
										<div class="todoaddbox">
											<img src="${pageContext.request.contextPath}/resources/img/add.png"
												class="todo-plus todoicon" spellcheck="false"
												maxlength="60"><span class="todoaddspan">할일 추가</span>
										</div>

									</div>
									<div class="textfooter">
										<div class="textfooter_func_wrap">
											<a href=""><img
													src="${pageContext.request.contextPath}/resources/img/attachment.png"
													class="textfooter_func"></a> <a href=""><img
													src="${pageContext.request.contextPath}/resources/img/picture-2.png"
													class="textfooter_func"></a>
										</div>
										<div class="textfooter_side">
											<input type="hidden" id="bopen" name="bopen" value="0" />
											<div class="public">
												<img
													src="${pageContext.request.contextPath}/resources/img/worldwide.png"><span>전체공개
													&#9660;</span>
											</div>
											<div class="public_admin" style="display: none;">
												<img
													src="${pageContext.request.contextPath}/resources/img/unlocked-1.png"><span>관리자만
													&#9660;</span>
											</div>
											<div class="public_setting" style="display: none;">
												<h1 class="public_setting_title">게시물 공개 대상</h1>
												<ul>
													<li class="set_li"><img
															src="${pageContext.request.contextPath}/resources/img/worldwide.png"
															class="setimg">
														<div class="p_set_con">
															<strong>전체공개</strong> <span>전체 사람들에게
																공개됩니다.</span>
														</div>
													</li>
													<li class="set_li_admin"><img
															src="${pageContext.request.contextPath}/resources/img/unlocked-1.png"
															class="setimg">
														<div class="p_set_con">
															<strong>관리자만</strong> <span>프로젝트 관리자에게만
																공개됩니다.</span>
														</div>
													</li>
												</ul>
											</div>
											<button type="button" class="writebtn"
												onclick="todoSubmit()">올리기</button>
										</div>
									</div>
								</form>
							</div>

							<script>
								//윤진: todo 마감일 datepicker 선언
								var tdcnt = 2;
								$(function () {
									$('.todo-date1').datepicker({
										dateFormat: 'mm/dd' //Input Display Format 변경
										, showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
										, showMonthAfterYear: true //년도 먼저 나오고, 뒤에 월 표시
										, changeYear: true //콤보박스에서 년 선택 가능
										, changeMonth: true //콤보박스에서 월 선택 가능                
										, showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
										, buttonImage: '${pageContext.request.contextPath}/resources/img/calendar-8.png' //버튼 이미지 경로
										, buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
										, buttonText: "마감일" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
										, yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
										, monthNamesShort: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'] //달력의 월 부분 텍스트
										, monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'] //달력의 월 부분 Tooltip 텍스트
										, dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'] //달력의 요일 부분 텍스트
										, dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'] //달력의 요일 부분 Tooltip 텍스트
										, minDate: "-48M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
										, maxDate: "+12M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
										, onSelect: function (date) {
											console.log("date : " + date);
											$('.todo-date1').css("display", "inline-block");
											$('img.ui-datepicker-trigger').css('display', 'none');
											/* $('.todo-date1').val(date); */
											console.log($('.todo-date1').val());
										}
									});
									$('img.ui-datepicker-trigger').attr('width', '25px');
								});
								// 윤진: 할일 글쓰기- 할일 추가
								$(document).on('click', '.todoaddbox', function () {
									var todoinput = '<li class="todo">' + '\n' +
										'<img src="${pageContext.request.contextPath}/resources/img/minus-reverse-pink.png" class="todo-01 todoicon" >' + '\n' +
										'<input type="text" name="tdcontent" class="content_detail todo-02" placeholder="할일 입력">' + '\n' +
										'<input type="text" class="todo-03 todoicon todo-date' + tdcnt + '" name="tdate" readonly>' + '\n' +
										'<div class="tdp-wrap">' + '\n' +
										'<img src="${pageContext.request.contextPath}/resources/img/addperson.png" class="todo-04 todoicon">' + '\n' +
										'<div class="tdp-add-wrap">' + '\n' + '<div class="tdp-add">' + '\n' +
										'<ul>' + '\n' + '<c:forEach items="${userlist}" var="ulist">' + '\n' +
										'<li class="tdp-list tdp-list${e.count}">${ulist.uname}' + '\n' +
										'<input type="hidden" class="tdp-uno" name="tduno" value="${ulist.uno}"></li>' + '\n' +
										'</c:forEach>' + '\n' + '</ul>' + '\n' + '</div>' + '\n' + '</div>' + '\n' + '</div>' +
										'</li>'

									$(".todoinput").append(todoinput);
									$('.todoform').find('.todo-date' + tdcnt).datepicker({
										dateFormat: 'mm/dd' //Input Display Format 변경
										, showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
										, showMonthAfterYear: true //년도 먼저 나오고, 뒤에 월 표시
										, changeYear: true //콤보박스에서 년 선택 가능
										, changeMonth: true //콤보박스에서 월 선택 가능                
										, showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
										, buttonImage: '${pageContext.request.contextPath}/resources/img/calendar-8.png' //버튼 이미지 경로
										, buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
										, buttonText: "마감일" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
										, yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
										, monthNamesShort: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'] //달력의 월 부분 텍스트
										, monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'] //달력의 월 부분 Tooltip 텍스트
										, dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'] //달력의 요일 부분 텍스트
										, dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'] //달력의 요일 부분 Tooltip 텍스트
										, minDate: "-48M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
										, maxDate: "+12M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
										, onSelect: function (date) {
											console.log("date : " + date);
											console.log($(this));
											$(this).css("display", "inline-block");
											$(this).parent().find('img.ui-datepicker-trigger').css('display', 'none');
											$(this).val(date);
											console.log($(this).val());
											console.log("aaa" + $(this).val());
										}
									});
									$('img.ui-datepicker-trigger').attr('width', '25px');
									tdcnt++;
									console.log("tdcnt:" + tdcnt);
								});
								/*$(".ui-datepicker-trigger").remove();*/
								$(".todo-date" + tdcnt).removeClass('hasDatepicker').datepicker();
								$(".todo-date" + tdcnt).removeAttr('id');
								/* $('.datepicker').datepicker();  */

								//윤진: 할일 글쓰기- 내용 삭제
								$(document).on('click', '.todo-01', function () {
									if ($('.todo').length > 1) {
										$(this).parent().remove('.todo');
										console.log($('.todo').length + '하나이상 길이 ');
									} else {
										alert('할일을 하나 이상 입력해주세요');
										return false;
									}
								});
								//윤진: 할일 내용-체크되면 li전체 완료선 추가-삭제
								$("input[class='todo-05']:checkbox").click(function () {
									if ($(this).is(":checked")) {
										$(this).nextAll(".todo-06").css("color", "gray");
										$(this).nextAll(".todo-06").css("font-style", "italic");
										$(this).nextAll(".todo-06").css("text-decoration", "line-through");
									} else {
										$(this).nextAll(".todo-06").css("color", "#111111");
										$(this).nextAll(".todo-06").css("font-style", "normal");
										$(this).nextAll(".todo-06").css("text-decoration", "none");
									}
								});
								//
								$(document).on('click', '.todo-04', function () {
									$p = $(this).parent(".tdp-wrap");
									$p.find(".tdp-add-wrap").toggle();
								});
								$(document).on('click', ".tdp-list", function () {
									$p = $(this).parent().parent().parent().parent(".tdp-wrap");
									$p.find(".tdp-add-wrap").hide();
									$(".tdp").val($(this).text());
									/* if('${ulist.uname}' != null){
												$p.find(".todo-04").attr('src', '${ulist.ufilepath}');                    	    	
												console.log('filepath: ${ulist.ufilepath}');
									} */
								});

								//윤진 : 할일 insert
								//게시글 작성 공개여부 설정
								$(".textfooter_side").on("click", function (e) {
									e.preventDefault();
									$(".public_setting").toggle();

									$('.set_li').on('click', function () {
										$(".public").show();
										$(".public_admin").hide();
										$("#bopen").val("0");
									});
									$('.set_li_admin').on('click', function () {
										$(".public").hide();
										$(".public_admin").show();
										$("#bopen").val("1");
									});
								})
								//글작성 버튼 submit
								function todoSubmit() {
									var frm = document.todo_frm;
									frm.action = "${pageContext.request.contextPath}/project/todoinsert";
									frm.method = "get";
									frm.submit();
								}

							</script>
					</div>
				</div>

				<!--  혜원 ) 업무 내용 출력  -->
				<c:forEach items="${tasklist}" var="tlist" varStatus="e">
					<div class="one">
						<div class="boardHeader">
							<div class="writeInfo">
								<span><img
										src="${pageContext.request.contextPath}/resources/img/user-3.png"
										class="profileImg"></span>
								<div class="writer">${tlist.uname }</div>
								<div class="writeDate">${tlist.boardalldto.bdate}</div>
								<img src="">
							</div>
							<div class="option">
								<div>
									<a href=""><img
											src="${pageContext.request.contextPath}/resources/img/push-pin.png"
											class="fixNotice"></a>
								</div>
								<div>
									<a href="" id="dropdown"><img
											src="${pageContext.request.contextPath}/resources/img/more-1.png"
											class="editoption"></a>
								</div>
								<div class="editDropdown">
									<ul>
										<li><a
												href="${pageContext.request.contextPath}/project/taskdelete?bno=${tlist.bno}&pno=${pno}">글
												삭제</a></li>
										<li><a href="">다른 프로젝트에 올리기</a></li>
									</ul>
								</div>
							</div>
						</div>

						<div class="boardResult">
							<!-- 혜원 ) 업무 내용 뿌리기 -->
							<div class="task_wrap">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
								<input type="hidden" name="pno" id="pno" value="${pno}">
								<div class="textbody">
									<div class="title">
										${tlist.boardalldto.bname}
									</div>
									<div id="task-01">
										<img src="${pageContext.request.contextPath}/resources/img/svg/clock-history.svg"
											width="20px" height="20px" id="task-icon01">
										<div class="task-radio-wrap">
											<input type="radio" class="task-radio task-radio-01"
												name="taskradio${e.count}" id="task-radio01-${e.count}"
												value="1">
											<label for="task-radio01-${e.count}"
												class="t-label">요청</label>
											<input type="radio" class="task-radio task-radio-02"
												name="taskradio${e.count}" id="task-radio02-${e.count}"
												value="2">
											<label for="task-radio02-${e.count}"
												class="t-label">진행</label>
											<input type="radio" class="task-radio task-radio-03"
												name="taskradio${e.count}" id="task-radio03-${e.count}"
												value="3">
											<label for="task-radio03-${e.count}"
												class="t-label">완료</label>
											<input type="radio" class="task-radio task-radio-04"
												name="taskradio${e.count}" id="task-radio04-${e.count}"
												value="4">
											<label for="task-radio04-${e.count}"
												class="t-label">보류</label>
										</div>
									</div>
									<c:if test="${tlist.tstate eq 1}">
										<script>
											$(function () {
												var count = ${ e.count };
												$("#task-radio01-" + count).prop("checked", true);
											});
										</script>
									</c:if>
									<c:if test="${tlist.tstate eq 2}">
										<script>
											$(function () {
												var count = ${ e.count };
												$("#task-radio02-" + count).prop("checked", true);
											});
										</script>
									</c:if>
									<c:if test="${tlist.tstate eq 3}">
										<script>
											$(function () {
												var count = ${ e.count };
												$("#task-radio03-" + count).prop("checked", true);
											});
										</script>
									</c:if>
									<c:if test="${tlist.tstate eq 4}">
										<script>
											$(function () {
												var count = ${ e.count };
												$("#task-radio04-" + count).prop("checked", true);
											});
										</script>
									</c:if>
									<!-- 업무 상태 누르면 ajax로 값 update  -->
									<script>
									$(function () {
											$("#task-radio01-" + count).click(function () {
												//업무 상태 변경
												$.ajax({
													url: "${pageContext.request.contextPath}/project/taskstate01",
													data: {
														bno: bno,
														pno: pno
													},
													dataType: "json",
													success: function (data) {
														console.log("ajax:" + data + "성공");
														report();
													},
													error: function () {
														console.log("update 실패");
													}
												});
											});
											$("#task-radio02-" + count).click(function () {
												//업무 상태 변경
												$.ajax({
													url: "${pageContext.request.contextPath}/project/taskstate02",
													data: {
														bno: bno,
														pno: pno
													},
													dataType: "json",
													success: function (data) {
														console.log(data + "성공");
														report();
													},
													error: function () {
														console.log("update 실패");
													}
												});
											});
											$("#task-radio03-" + count).click(function () {
												//업무 상태 변경
												$.ajax({
													url: "${pageContext.request.contextPath}/project/taskstate03",
													data: {
														bno: bno,
														pno: pno
													},
													dataType: "json",
													success: function (data) {
														console.log(data + "성공");
														report();
													},
													error: function () {
														console.log("update 실패");
													}
												});
											});
											$("#task-radio04-" + count).click(function () {
												//업무 상태 변경
												$.ajax({
													url: "${pageContext.request.contextPath}/project/taskstate04",
													data: {
														bno: bno,
														pno: pno
													},
													dataType: "json",
													success: function (data) {
														console.log(data + "성공");
														report();
													},
													error: function () {
														console.log("update 실패");
													}
												});
											});
										});
									</script>

                            <div class="task-02">
                        	    <img src="${pageContext.request.contextPath}/resources/img/svg/person-plus-fill.svg" width="20px" height="20px" class="task-icon02">
                          		<div class="task-res-wrap">
                          			<input type="text" class="task-res task-res${e.count }" name="taskname"  value="${tlist.taskmanager}">
                          			<input type="hidden" class="task-res-uno-c" name="taskuno">
                          			 <!-- 업무담당자 모달 /  해당 project 유저 list 뿌리기-->
                          			 <div class="task-res-add-wrap">
                          				<div class="task-add">
	                          				<ul>
	                          					<c:forEach items="${userlist}" var="ulist">
	                          					<li class="task-res-list task-res-list${e.count}">${ulist.uname}</li>
												</c:forEach>
													</ul>
												</div>
											</div>
										</div>
									</div>
									<!-- 업무 담당자 변경 ajax update  -->
									<script>
										$(function () {
											var count = ${e.count};
											var pno = ${pno};
											var bno = ${tlist.bno};
											$(".task-res-list" + count).click(function () {
												console.log(bno + "값");
												var taskres = $(".task-res"+count).val();
												console.log(taskres + "담당자 변경값");
												$.ajax({
													url: "${pageContext.request.contextPath}/project/taskresupdate",
													data: {
														bno: bno,
														pno: pno,
														taskres: taskres
													},
													dataType: "json",
													success: function (data) {
														console.log("ajax:" + data + "성공");
													},
													error: function () {
														console.log("update 실패");
													}
												});
											});
										});
									</script>



									<div class="task-03">
										<img src="${pageContext.request.contextPath}/resources/img/svg/calendar-5.svg"
											width="20px" height="20px" class="task-icon02">
										<div class="task-start-wrap">
											<input type="text" name="taskstartdate"
												id="task-start-date${e.count}" class="task-schedule"
												placeholder="시작일시 추가" value="${tlist.tstart}">
										</div>
									</div>
									<div class="task-03">
										<img src="${pageContext.request.contextPath}/resources/img/svg/calendar-5.svg"
											width="20px" height="20px" class="task-icon02">
										<div class="task-start-wrap">
											<input type="text" name="taskenddate"
												id="task-end-date${e.count}" class="task-schedule"
												placeholder="마감일시 추가" value="${tlist.tend}">
										</div>
									</div>
									<script>
										//input을 datepicker로 선언
										var count = ${ e.count };
										$.datepicker.setDefaults({
											dateFormat: 'yy-mm-dd' //Input Display Format 변경
											, showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
											, showMonthAfterYear: true //년도 먼저 나오고, 뒤에 월 표시
											, changeYear: true //콤보박스에서 년 선택 가능
											, changeMonth: true //콤보박스에서 월 선택 가능                
											// ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
											// ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
											// ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
											// ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
											, yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
											, monthNamesShort: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'] //달력의 월 부분 텍스트
											, monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'] //달력의 월 부분 Tooltip 텍스트
											, dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'] //달력의 요일 부분 텍스트
											, dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'] //달력의 요일 부분 Tooltip 텍스트
											, minDate: "-48M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
											, maxDate: "+12M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
										});
										//값 변경되면 ajax update
										$('#task-start-date' + count).datepicker({
											onSelect: function (dateText) {
												console.log("Selected date: " + dateText + "; input's current value: " + this.value);
												var pno = ${ pno };
												var bno = ${ tlist.bno
										};
										var tstart = dateText;
										console.log(tstart + "값");
										$.ajax({
											url: "${pageContext.request.contextPath}/project/tstartupdate",
											data: {
												bno: bno,
												pno: pno,
												tstart: tstart
											},
											dataType: "json",
											success: function (data) {
												console.log("ajax:" + data + "성공");
											},
											error: function () {
												console.log("update 실패");
											}
										});
										$(this).change();
											}
										})
										.on("change", function () {
											console.log("Got change event from field");
										});

										//값 변경되면 ajax update
										$('#task-end-date' + count).datepicker({
											onSelect: function (dateText) {
												var pno = ${ pno };
												var bno = ${ tlist.bno
										};
										var tend = dateText;
										$.ajax({
											url: "${pageContext.request.contextPath}/project/tendupdate",
											data: {
												bno: bno,
												pno: pno,
												tend: tend
											},
											dataType: "json",
											success: function (data) {
												console.log("ajax:" + data + "성공");
											},
											error: function () {
												console.log("update 실패");
											}
										});
										$(this).change();
											}
										})
										.on("change", function () {
											console.log("Got change event from field");
										});

									</script>




									<div class="task-04">
										<img src="${pageContext.request.contextPath}/resources/img/svg/bar-chart-line-fill.svg"
											width="20px" height="20px" class="task-icon02">
										<div class="task-rate-wrap">
											<a class="workPrgs">
												<div class="workPrgrs_bg">
													<strong
														class="txt PROGRESS_PER">${tlist.trate}%</strong>

													<input type="hidden" name="trate" class="trate">
													<span id="PROGRESS"
														class="bar percent0 ${e.count}"></span>
													<div class="pcnt0 pcnt0${e.count}" data="0">
														<span class="pcnt">
															<button>0%</button>
														</span>
													</div>
													<div class="pcnt20 pcnt20${e.count}" data="20">
														<span class="pcnt">
															<button>20%</button>
														</span>
													</div>
													<div class="pcnt40 pcnt40${e.count}" data="40">
														<span class="pcnt">
															<button>40%</button>
														</span>
													</div>
													<div class="pcnt60 pcnt60${e.count}" data="60">
														<span class="pcnt">
															<button>60%</button>
														</span>
													</div>
													<div class="pcnt80 pcnt80${e.count}" data="80">
														<span class="pcnt">
															<button>80%</button>
														</span>
													</div>
													<div class="pcnt100 pcnt100${e.count}" data="100">
														<span class="pcnt">
															<button>100%</button>
														</span>
													</div>
												</div>
											</a>
										</div>
									</div>
									<c:if test="${tlist.trate eq 0}">
										<script>
											$(function () {
												var count = ${ e.count };
												$("." + count).css("width", "8px");
											});
										</script>
									</c:if>
									<c:if test="${tlist.trate eq 20}">
										<script>
											$(function () {
												var count = ${ e.count };
												$("." + count).css("width", "30px");
											});
										</script>
									</c:if>
									<c:if test="${tlist.trate eq 40}">
										<script>
											$(function () {
												var count = ${ e.count };
												$("." + count).css("width", "60px");
											});
										</script>
									</c:if>
									<c:if test="${tlist.trate eq 60}">
										<script>
											$(function () {
												console.log("60퍼")
												var count = ${ e.count };
												$("." + count).css("width", "90px");
											});
										</script>
									</c:if>
									<c:if test="${tlist.trate eq 80}">
										<script>
											$(function () {
												var count = ${ e.count };
												$("." + count).css("width", "120px");
											});
										</script>
									</c:if>
									<c:if test="${tlist.trate eq 100}">
										<script>
											$(function () {
												var count = ${ e.count };
												$("." + count).css("width", "150px");
												$("." + count).css("background-color", "#6db47c");
											});
										</script>
									</c:if>
									<!-- 업무 달성률 누르면 ajax로 값 update  -->
									<script>
										$(function () {
											var count = ${ e.count };
											var pno = ${ pno };
											var bno = ${ tlist.bno };
											$(".pcnt0" + count).click(function () {
												$.ajax({
													url: "${pageContext.request.contextPath}/project/tasktrate00",
													data: {
														bno: bno,
														pno: pno
													},
													dataType: "json",
													success: function (data) {
														console.log("달성률 ajax:" + data + "성공");
													},
													error: function () {
														console.log("update 실패");
													}
												});
											});
											$(".pcnt20" + count).click(function () {
												$.ajax({
													url: "${pageContext.request.contextPath}/project/tasktrate20",
													data: {
														bno: bno,
														pno: pno
													},
													dataType: "json",
													success: function (data) {
														console.log("달성률 ajax:" + data + "성공");
													},
													error: function () {
														console.log("update 실패");
													}
												});
											});
											$(".pcnt40" + count).click(function () {
												$.ajax({
													url: "${pageContext.request.contextPath}/project/tasktrate40",
													data: {
														bno: bno,
														pno: pno
													},
													dataType: "json",
													success: function (data) {
														console.log("달성률 ajax:" + data + "성공");
													},
													error: function () {
														console.log("update 실패");
													}
												});
											});
											$(".pcnt60" + count).click(function () {
												$.ajax({
													url: "${pageContext.request.contextPath}/project/tasktrate60",
													data: {
														bno: bno,
														pno: pno
													},
													dataType: "json",
													success: function (data) {
														console.log("달성률 ajax:" + data + "성공");
													},
													error: function () {
														console.log("update 실패");
													}
												});
											});
											$(".pcnt80" + count).click(function () {
												$.ajax({
													url: "${pageContext.request.contextPath}/project/tasktrate80",
													data: {
														bno: bno,
														pno: pno
													},
													dataType: "json",
													success: function (data) {
														console.log("달성률 ajax:" + data + "성공");
													},
													error: function () {
														console.log("update 실패");
													}
												});
											});
											$(".pcnt100" + count).click(function () {
												$.ajax({
													url: "${pageContext.request.contextPath}/project/tasktrate100",
													data: {
														bno: bno,
														pno: pno
													},
													dataType: "json",
													success: function (data) {
														console.log("달성률 ajax:" + data + "성공");
													},
													error: function () {
														console.log("update 실패");
													}
												});
											});
										});
									</script>

									<div class="task-05">
										<img src="${pageContext.request.contextPath}/resources/img/svg/flag-2.svg"
											width="20px" height="20px" class="task-icon02">
										<div class="task-pri-wrap">
											<input type="text" class="task-pri pri-val${e.count}"
												name="taskpri" placeholder="우선순위 추가"
												value="${tlist.tpriority }">
											<div class="task-pri-add-wrap">
												<div class="task-pri-add">
													<button type="button"
														class="task-pri lv1-${e.count}" id="lv1"
														value="lv1">낮음</button> <br>
													<button type="button"
														class="task-pri lv2-${e.count}" id="lv2"
														value="lv2">보통</button> <br>
													<button type="button"
														class="task-pri lv3-${e.count}" id="lv3"
														value="lv3">높음</button>
												</div>
											</div>
										</div>
									</div>
									<!-- 업무 우선순위 누르면 ajax로 값 update  -->
									<script>
										$(function () {
											var count = ${ e.count };
											var pno = ${ pno };
											var bno = ${ tlist.bno };
											$(".lv1-" + count).click(function () {
												$(".pri-val" + count).val("낮음");
												$.ajax({
													url: "${pageContext.request.contextPath}/project/tprilv1",
													data: {
														bno: bno,
														pno: pno
													},
													dataType: "json",
													success: function (data) {
														console.log("ajax:" + data + "성공");
													},
													error: function () {
														console.log("update 실패");
													}
												});
											});
											$(".lv2-" + count).click(function () {
												$(".pri-val" + count).val("보통");
												$.ajax({
													url: "${pageContext.request.contextPath}/project/tprilv2",
													data: {
														bno: bno,
														pno: pno
													},
													dataType: "json",
													success: function (data) {
														console.log("ajax:" + data + "성공");
													},
													error: function () {
														console.log("update 실패");
													}
												});
											});
											$(".lv3-" + count).click(function () {
												$(".pri-val" + count).val("높음");
												$.ajax({
													url: "${pageContext.request.contextPath}/project/tprilv3",
													data: {
														bno: bno,
														pno: pno
													},
													dataType: "json",
													success: function (data) {
														console.log("ajax:" + data + "성공");
													},
													error: function () {
														console.log("update 실패");
													}
												});
											});
										});
									</script>

									<!-- 업무 글 content -->
									${tlist.tmemo}
								</div>
							</div>
							<div class="replyCount">댓글 10개</div>


							<div class="threeBtn">
								<ul>
									<li>
										<a href=""><img
												src="${pageContext.request.contextPath}/resources/img/like.png"
												class="like"
												style="width: 19px; padding-right: 10px;  padding-bottom : 5px; vertical-align: middle;">좋아요</a>
									</li>
									<li>
										<a href=""><img
												src="${pageContext.request.contextPath}/resources/img/chat-03.png"
												class="replyReg"
												style="width: 17px; padding-right: 10px;vertical-align: middle;">댓글작성</a>
									</li>
									<li>
										<a href=""><img
												src="${pageContext.request.contextPath}/resources/img/bookmark.png"
												class="save"
												style="width: 13px; padding-right: 10px; vertical-align: middle;">담아두기</a>
									</li>
								</ul>
							</div>
						</div>

						<div class="reply">
							<!--  <button class="replyMore">이전 댓글 더보기</button> -->
							<br>
							<!-- 댓글 출력  -->
							<c:forEach items="${replylist}" var="rlist" varStatus="i">
								<c:if test="${rlist.bno eq tlist.bno}">
									<div class="defaultReply">
										<span>
											<img src="${pageContext.request.contextPath}/resources/img/user-3.png"
												class="replayPfImg">
										</span>

										<span class="replyTitle">${rlist.uname}</span>
										<span class="replyDate">${rlist.rdate}</span>
										<!-- 내 댓글일 때만 수정,삭제 버튼 보임 -->
										<c:if test="${rlist.uno eq uno}">
											<span class="replyEdit">
												<button type="button" class="replyUpdate"
													id="replyUpdate${i.count}">수정</button>
												<button type="button" class="replyDelete"
													id="replyDelete${i.count}">삭제</button>
											</span>
										</c:if>
										<div id="replyParent">
											<p id="replyResult${i.count}" class="replyResult">
												${rlist.rdesc}</p>
											<br>
											<input type="text" class="replyUpdateText"
												id="replyUpdateText${i.count}" value="${rlist.rdesc}">
											<button type="button" class="replyUpdateBtn"
												id="replayUpdateSubmit${i.count}">수정완료</button>
											<input type="hidden" value="${rlist.uno}"
												id="runo${i.count}">
											<input type="hidden" class="rno" value="${rlist.rno}"
												id="rno${i.count}">
										</div>
									</div>

									<script>
										$(".replyUpdate").unbind("click");
										$(".replyUpdateBtn").unbind("click");
										$(".replyDelete").unbind("click");
										//댓글 수정
										$(".replyUpdate").click(function () {
											var parent = $(this).parent();
											var parentDiv = parent.parent();
											var rno = parentDiv.find(".rno").val();
											console.log(rno + "rno");
											console.log("댓글 수정");
											parentDiv.find(".replyResult").css("display", "none");
											parentDiv.find(".replyUpdate").css("display", "none");
											parentDiv.find(".replyDelete").css("display", "none");
											parentDiv.find(".replyUpdateText").css("display", "inline-block");
											parentDiv.find(".replyUpdateBtn").css("display", "inline-block");
										});


										$(".replyUpdateBtn").click(function () {
											var parent = $(this).parent();
											var parentDiv = parent.parent();
											var rdesc = parentDiv.find(".replyUpdateText").val();
											var rno = parentDiv.find(".rno").val();
											console.log(rno + "rno");
											console.log(rdesc + "rdesc");

											$.ajax({
												url: "${pageContext.request.contextPath}/project/replyupdate",
												data: {
													rno: rno,
													rdesc: rdesc
												},
												dataType: "json",
												success: function (data) {
													parentDiv.find(".replyResult").css("display", "block");
													parentDiv.find(".replyUpdateText").css("display", "none");
													parentDiv.find(".replyUpdateBtn").css("display", "none");
													parentDiv.find(".replyUpdate").css("display", "inline-block");
													parentDiv.find(".replyDelete").css("display", "inline-block");
													parentDiv.find(".replyResult").text(rdesc);
												},
												error: function () {
													console.log("댓글수정 실패");
												}
											});
										});


										//댓글 삭제
										$(".replyDelete").click(function () {
											var parent = $(this).parent();
											var parentDiv = parent.parent();
											var rno = parentDiv.find(".rno").val();

											$.ajax({
												url: "${pageContext.request.contextPath}/project/replydelete",
												data: {
													rno: rno
												},
												dataType: "json",
												success: function (data) {
													parentDiv.remove();
												},
												error: function () {
													console.log("삭제 실패");
												}
											});
										});
									</script>

								</c:if>
							</c:forEach>

							<!-- 댓글 입력  -->
							<form action="${pageContext.request.contextPath}/project/replyinsert"
								id="replyForm" method="get">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
								<div class="replyFrom">
									<input type="hidden" name="pno" value="${pno}">
									<input type="hidden" name="bno" value="${tlist.bno}">
									<span>
										<img src="${pageContext.request.contextPath}/resources/img/user-2.png"
											class="replayPfImg2">
									</span>
									<input type="text" name="rdesc" class="replyarea"
										placeholder="댓글을 입력하세요.">
									<button type="submit" id="replyReg">등록</button>
								</div>
							</form>
						</div>

				</c:forEach>
			</div>
			
		</div>
		<!--우측 사이드바-->
			<div class="rightBar">
				<a href="#">
					<div id="prevbtn">
						<svg version="1.1" class="prevsvg rightsvg" xmlns="http://www.w3.org/2000/svg"
							xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
							viewBox="0 0 60 60" style="enable-background: new 0 0 60 60;"
							xml:space="preserve">
							<path
								d="M2.414,30l13.293-13.293c0.391-0.391,0.391-1.023,0-1.414s-1.023-0.391-1.414,0l-14,14c-0.391,0.391-0.391,1.023,0,1.414
								l14,14C14.488,44.902,14.744,45,15,45s0.512-0.098,0.707-0.293c0.391-0.391,0.391-1.023,0-1.414L2.414,30z" />
						</svg>
						이전화면

					</div>
				</a>
				<div id="rightbtns">
					<a href="#">
						<div class="rightbtn btnhover">
							<div>
								<svg version="1.1" class="fileboxsvg rightsvg"
									xmlns="http://www.w3.org/2000/svg"
									xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
									viewBox="0 0 60 60" style="enable-background: new 0 0 60 60;"
									xml:space="preserve">
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
					</a> <a href="#">
						<div class="rightbtn btnhover">
							<div>
								<svg version="1.1" class="checkedsvg rightsvg"
									xmlns="http://www.w3.org/2000/svg"
									xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
									viewBox="0 0 59 59" style="enable-background: new 0 0 59 59;"
									xml:space="preserve">
									<g>
										<path
											d="M52,21c-0.553,0-1,0.447-1,1v32H2V5h49v1c0,0.553,0.447,1,1,1s1-0.447,1-1V3H0v53h53V22C53,21.447,52.553,21,52,21z" />
										<path d="M58.707,7.293c-0.391-0.391-1.023-0.391-1.414,0L27,37.586l-13.07-13.07c-0.391-0.391-1.023-0.391-1.414,0
										s-0.391,1.023,0,1.414l13.777,13.777C26.488,39.902,26.744,40,27,40s0.512-0.098,0.707-0.293l31-31
										C59.098,8.316,59.098,7.684,58.707,7.293z" />
									</g>
								</svg>
							</div>
							<div>업무</div>
						</div>
					</a> <a href="#">
						<div class="rightbtn btnhover">
							<div>
								<svg version="1.1" class="schedulesvg rightsvg"
									xmlns="http://www.w3.org/2000/svg"
									xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
									viewBox="0 0 60 60" style="enable-background: new 0 0 60 60;"
									xml:space="preserve">
									<g>
										<path d="M57,4h-7V1c0-0.553-0.447-1-1-1h-7c-0.553,0-1,0.447-1,1v3H19V1c0-0.553-0.447-1-1-1h-7c-0.553,0-1,0.447-1,1v3H3
										C2.447,4,2,4.447,2,5v11v43c0,0.553,0.447,1,1,1h54c0.553,0,1-0.447,1-1V16V5C58,4.447,57.553,4,57,4z M43,2h5v3v3h-5V5V2z M12,2h5
										v3v3h-5V5V2z M4,6h6v3c0,0.553,0.447,1,1,1h7c0.553,0,1-0.447,1-1V6h22v3c0,0.553,0.447,1,1,1h7c0.553,0,1-0.447,1-1V6h6v9H4V6z
										M4,58V17h52v41H4z" />
										<path d="M38,23h-7h-2h-7h-2h-9v9v2v7v2v9h9h2h7h2h7h2h9v-9v-2v-7v-2v-9h-9H38z M31,25h7v7h-7V25z M38,41h-7v-7h7V41z M22,34h7v7h-7
										V34z M22,25h7v7h-7V25z M13,25h7v7h-7V25z M13,34h7v7h-7V34z M20,50h-7v-7h7V50z M29,50h-7v-7h7V50z M38,50h-7v-7h7V50z M47,50h-7
										v-7h7V50z M47,41h-7v-7h7V41z M47,25v7h-7v-7H47z" />
									</g>
								</svg>
							</div>
							<div>일정</div>
						</div>
					</a> <a href="#">
						<div class="rightbtn btnhover">
							<div>
								<svg version="1.1" class="todosvg rightsvg"
									xmlns="http://www.w3.org/2000/svg"
									xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
									viewBox="0 0 58 58" style="enable-background: new 0 0 58 58;"
									xml:space="preserve">
									<g>
										<rect x="9" y="12" width="40" height="2" />
										<rect x="9" y="28" width="40" height="2" />
										<rect x="9" y="44" width="40" height="2" />
										<path d="M0,0v58h58V0H0z M56,56H2V2h54V56z" />
									</g>
								</svg>
							</div>
							<div>할일</div>
						</div>
					</a>
				</div>
	<%-- 			<div id="addmembtn" onclick="window.open('${pageContext.request.contextPath}/project/projectinvite?pno=${pno}','프로젝트 멤버 초대','width=470px,height=600px,location=no,status=no,scrollbars=no')"> --%>
				<div id="addmembtn">
					초대하기
					<img src="${pageContext.request.contextPath}/resources/img/addperson-03-white.png"
						class="todoicon">
				</div>
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
									<img src="${pageContext.request.contextPath}/resources/img/user-3.png"
										class="userimg" width="32px">
									<span class="pjusername">김혜원</span>
									<a href="#"><img
											src="${pageContext.request.contextPath}/resources/img/chat-04.png"
											class="chatsvg"></a>
								</li>
							</ul>
							<div class="part-title">내부참여자&nbsp;(4)</div>
							<ul>
								<li class="btnhover">
									<img src="${pageContext.request.contextPath}/resources/img/user-3.png"
										class="userimg" width="32px">
									<span class="pjusername">이윤진</span>
									<a href="#"><img
											src="${pageContext.request.contextPath}/resources/img/chat-04.png"
											class="chatsvg"></a>
								</li>
							</ul>
							<ul>
								<li class="btnhover">
									<img src="${pageContext.request.contextPath}/resources/img/user-3.png"
										class="userimg" width="32px">
									<span class="pjusername">이혜림</span>
									<a href="#"><img
											src="${pageContext.request.contextPath}/resources/img/chat-04.png"
											class="chatsvg"></a>
								</li>
								<li class="btnhover">
									<img src="${pageContext.request.contextPath}/resources/img/user-3.png"
										class="userimg" width="32px">
									<span class="pjusername">오은실</span>
									<a href="#"><img
											src="${pageContext.request.contextPath}/resources/img/chat-04.png"
											class="chatsvg"></a>
								</li>
								<li class="btnhover">
									<img src="${pageContext.request.contextPath}/resources/img/user-3.png"
										class="userimg" width="32px">
									<span class="pjusername">김봉영</span>
									<a href="#"><img
											src="${pageContext.request.contextPath}/resources/img/chat-04.png"
											class="chatsvg"></a>
								</li>
							</ul>
						</div>
					</div>
					<a href="${pageContext.request.contextPath}/chat/projectchat?pno=${pno}"
						onClick="window.open(this.href,'', 'width=470, height=650'); return false;">
						<div id="pjchatbox">
							채팅 &nbsp;<img
								src="${pageContext.request.contextPath}/resources/img/chat-04-fill.png"
								id="chatbtn-fill">
						</div>
					</a>
				</div>
			</div>
		
		<!-- 초대하기 모달 -->
		<div class="invite-dim">
		</div>
    <div class="invite-search-wrap">
        <div class="chat-invite-top">
            <p class="chat-invite-wrap">
                <span class="invite-title">프로젝트 초대하기</span>
                <!--검색모달 닫기-->
                <a href="#"><svg version="1.1"  class="invite-exit" xmlns="http://www.w3.org/2000/svg"
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

            <div class="invite-search-box">
                <span class="invite-search">
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
                <input type="text" class="chat-search-input" placeholder="직원 이름으로 검색">
            </div>
			<form action="${pageContext.request.contextPath}/project/projectmemberinsert" method="post" class="pinvitefrm1">
            <div class="invite-rs">
              <c:if test="${empty pmlist }">
               	 검색 결과가 없습니다.
               	 </c:if>
						<sec:csrfInput /> 
						<table class="inviteList-table">
              			<c:if test="${not empty pmlist }">
              			  <c:forEach items="${pmlist}" var="list" varStatus="e">
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
									<td class="invite-names">
									<p class="invite-name">${list.uname}<br>
									<span class="invite-email">${list.cname}</span></p> </td>
										<td class="invite-check-wrap">
											<input type="checkbox" class="invite-check" class="check${e.count}" name="uno" value="${list.uno}"> 
											<label for="check${e.count}"></label>
										</td>
							</tr>
							</c:forEach>
             				  </c:if>
						</table>
						<div class="submit-wrap">
							 <input type="hidden" name="pno" value="${pno}"> 
							<button type="submit" class="submitbtn">프로젝트 초대</button>
						</div>
       			     </div>
					</form>
        </div>
    </div>
		
		
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
					$("#taskopen").val("0");
				});
				$('.set_li_admin').on('click', function () {
					$(".public").hide();
					$(".public_admin").show();
					$("#taskopen").val("1");
				});
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
				var $t = $(this).parents(".option");
				$t.find(".editDropdown").toggle();
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
			
			
			//초대하기 모달
			$("#addmembtn").on("click",function(){
				$(".invite-dim").css("display","block");
				$(".invite-search-wrap").css("display","block");
			});
			
			$(".invite-exit").on("click",function(){
				$(".invite-dim").css("display","none");
				$(".invite-search-wrap").css("display","none");
			});
			//초대하기 모달 검색기능
			$(".chat-search-input").keyup(function(){
				var c =$(this).val();
				$(".inviteList-table tr").hide();
				console.log("검색어:"+c);
				var temp= $(".inviteList-table td:contains('"+c+"')");
				console.log("temp"+temp);
				
				$(temp).parent().show();
			});
			$(function () {
				// 업무리포트 그래프 뿌리기 
				var ctx = document.getElementById('taskChart').getContext('2d');
				var pno = ${ pno };
				report();
				function report() {
					$.ajax({
						url: "${pageContext.request.contextPath}/project/tstatereport",
						data: {
							pno: pno
						},
						dataType: "json",
						success: function (data) {
							console.log("성공 들어옴");
							if(data!=null||data!=''){
								createChart(data[0], data[1], data[2], data[3]);
								console.log(data+"데이터 null이 아닐때 값 ")
								return false;
							}else{
								$(".task-report-wrap").css("display","none");
							}
							console.log(data+"데이터데이터");
						},
						error: function () {
							console.log("update 실패");
						}
					});
				};
				function createChart(s1, s2, s3, s4) {
					if(s1==null||s1==''){
						$(".task-report-wrap").css("display","none");
						console.log("데이터 s1"+s1);
					}
					var myChart = new Chart(ctx, {
						type: 'doughnut',
						data: {
							labels: ['요청', '진행', '완료', '보류'],
							datasets: [{
								label: 'Score',
								data: [s1, s2, s3, s4],
								backgroundColor: [
									'#F27781',
									'#f17a19',
									'#50b766',
									'#4aaefb'
								],
							}]
						},
						options: {

							legend: {
								display: true,
								position: 'right',
							}
						}
					});
				};
				});

			
		// 여기부터 파일
			let header = $("meta[name='_csrf_header']").attr("content");
			let token = $("meta[name='_csrf']").attr("content");
			$("#uploadfile_task").on("change", fileChangeTask);
			
		function fileChangeTask(e) {
	    e.preventDefault();
	    let files = e.target.files;
	    for (let file of files) {
	        let size = file.size
	        let formData = new FormData();
	        formData.append("file", file);
	        console.log(formData.get('file'));
	        // 파일 업로드 AJAX 통신 메서드 호출
	        uploadFileTask(formData, size);
	    }
	}
			
			
	//★바뀜 task용
	//파일 업로드 AJAX 통신
	function uploadFileTask(formData, size) {
	  $.ajax({
	      url: "${pageContext.request.contextPath}/files/upload",
	      data: formData,
	      dataType: "text",
	      processData: false,
	      contentType: false,
	      type: "POST",
	      beforeSend: function (xhr) {
	          xhr.setRequestHeader(header, token);	// 헤드의 csrf meta태그를 읽어 CSRF 토큰 함께 전송
	      },
	      success: function (data) {
	          printFilesTask(data, size);
	      }
	  })
	}

	//★바뀜 task용
	//첨부파일 출력
	function printFilesTask(data, size) {
	  // 파일 정보 처리
	  console.log("printfiles : "+size);
	  var fileInfo = getFileInfo(data);
	  var html = "<li><span class='boardimg'>";
	  html += "<img src='" + fileInfo.imgSrc + "' alt='Attachment' class='imgsrc'>";
	  html += "</span>"
	  html += "<div class='boardimg-info'>"
	  html += "<a href='" + fileInfo.originalFileUrl + "' class='boardimg-name'>"
	  html += "<i class='fa fa-paperclip'></i>" + fileInfo.originalFileName + "</a>"
	  html += "<a href='" + fileInfo.fullName + "' class='boardimg-delbtn'>"
	  html += "<i class='fa fa-fw fa-remove'></i></a></div>"
	  html += "<input type='hidden' value='" + size + "' name='fsize'></li>" >
	      // Handlebars 파일 템플릿 컴파일을 통해 생성된 HTML을 DOM에 주입
	      $('.uploadedFileList_task').append(html);
	  // 이미지 파일인 경우 파일 템플릿에 lightbox 속성 추가
	  if (fileInfo.fullName.substr(12, 2) === "s_") {
	      // 마지막에 추가된 첨부파일 템플릿 선택자
	      var that = $('.uploadedFileList_task li').last();
	      // lightbox 속성 추가
	      that.find(".boardimg-name").attr("data-lightbox", "uploadImages");
	      // 파일 아이콘에서 이미지 아이콘으로 변경
	      that.find(".fa-paperclip").attr("class", "fa fa-camera");
	  }
	}
	  
	//파일 정보 처리
	  function getFileInfo(fullName) {

	      var originalFileName;   // 화면에 출력할 파일명
	      var imgSrc;             // 썸네일 or 파일아이콘 이미지 파일 출력 요청 URL
	      var originalFileUrl;    // 원본파일 요청 URL
	      var uuidFileName;       // 날짜경로를 제외한 나머지 파일명 (UUID_파일명.확장자)


	      // 이미지 파일이면
	      if (checkImageType(fullName)) {
	          imgSrc = "${pageContext.request.contextPath}/files/display?fileName=" + fullName; // 썸네일 이미지 링크
	          uuidFileName = fullName.substr(14);
	          var originalImg = fullName.substr(0, 12) + fullName.substr(14);
	          // 원본 이미지 요청 링크
	          originalFileUrl = "${pageContext.request.contextPath}/files/display?fileName=" + originalImg;
	      } else {
	          imgSrc = "${pageContext.request.contextPath}/resources/img/nonepic.png"; // 파일 아이콘 이미지 링크
	          uuidFileName = fullName.substr(12);
	          // 파일 다운로드 요청 링크
	          originalFileUrl = "${pageContext.request.contextPath}/files/display?fileName=" + fullName;
	      }
	      originalFileName = uuidFileName.substr(uuidFileName.indexOf("_") + 1);

	      return { originalFileName: originalFileName, imgSrc: imgSrc, originalFileUrl: originalFileUrl, fullName: fullName };
	  }
	  
	//이미지 파일 유무 확인
	  function checkImageType(fullName) {
	      let type = fullName.slice(fullName.lastIndexOf(".") + 1).toLowerCase();
	      let check = true;
	      if (!(type == "gif" || type == "jpg" || type == "jpeg" || type == "png")) {
	          check = false;
	      }
	      return check;
	  }
	  
	//파일 삭제 버튼 클릭 이벤트
	  $(document).on("click", ".boardimg-delbtn", function (event) {
	      event.preventDefault();
	      var that = $(this);
	      deleteFileWrtPage(that);
	  });
	  // 파일 삭제(입력페이지) : 첨부파일만 삭제처리
	  function deleteFileWrtPage(that) {
	      var url = "${pageContext.request.contextPath}/files/delete";
	      deleteFile(url, that);
	  }
	  // 파일 삭제 AJAX 통신
	  function deleteFile(url, that) {
	      $.ajax({
	          url: url,
	          type: "post",
	          data: { fileName: that.attr("href") },
	          dataType: "text",
	          beforeSend: function (xhr) {
	              xhr.setRequestHeader(header, token);	// 헤드의 csrf meta태그를 읽어 CSRF 토큰 함께 전송
	          },
	          success: function (result) {
	              if (result === "DELETED") {
	                  alert("삭제되었습니다.");
	                  that.parents("li").remove();
	              }
	          }
	      });
	  }

	  //게시글 저장 버튼 클릭 이벤트 처리
	  $("#writebtn").click(function (event) {
	  	console.log("드러옴");
	      //event.preventDefault();
	      var that = $(this);
	      filesSubmit(that);
	  });
	  //게시글 입력/수정 submit 처리시에 첨부파일 정보도 함께 처리
	  function filesSubmit(that) {
	  	console.log("설마설마"+that)
	      var str = "";
	      $(".imgsrc").each(function(index){
	      	str += "<input type='hidden' name='filelist[" + index + "].imgsrc' value='" + $(this).attr('src') + "'>"
	      });
	      $(".boardimg-delbtn").each(function (index) {
	          str += "<input type='hidden' name='filelist[" + index + "].fname' value='" + $(this).attr('href') + "'>"
	      });
	      $(".boardimg-name").each(function (index) {
	          let par = $(this).parent();
	          let originalFileName = $(this).text();
	          let size = par.find('#fsize').val();
	          str += "<input type='hidden' name='filelist[" + index + "].fpath' value='" + $(this).attr('href') + "'>"
	          str += "<input type='hidden' name='filelist[" + index + "].fsize' value='" + size + "'>"
	          str += "<input type='hidden' name='filelist[" + index + "].foriginalname' value='" + originalFileName + "'>"
	      });
	      that.append(str);
	      console.log(str);
	      that.get(0).submit();
	  }

	  // 업로드 된 파일 이미지 설정 변경
	  function imageChange(){
	      $(".fnamevalue").each(function(index){
	          let fname = $(this).val();
	          let parent = $(this).parents('.uploadedFileList-real-li');
	          if(fname.substr(12,2)==="s_"){
	              parent.find('.boardimg-name-real').attr("data-lightbox", "uploadImages");
	              parent.find(".fa-paperclip").attr("class", "fa fa-camera");
	          }
	      })
	  }	
			
			
			
		</script>
		
		<%-- <c:if test="${not empty inviteSuccess}">
			<script>
			$(document).ready(function(){  
				alert('${inviteSuccess}');	
			});
			</script>
		</c:if> --%>

	</body>
	</html>