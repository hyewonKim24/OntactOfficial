<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>ontact, 서로 연결되는 온라인 공간</title>
    <link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/vendor/fullcalendar.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/vendor/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/vendor/select2.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/vendor/bootstrap-datetimepicker.min.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/vendor/main.css">
    <style>
        *{
            margin : 0;
        }
        body{
            width : 100%;
            height: 100%;
            position: relative;
            font-size: 14px;
            font-family: Noto Sans KR;
            line-height: 1.15;
        }
        .header{
            position: relative;
            width: 100%;
            height: 60px;
        }
        .header div{
            width: 1200px;
            height: 60px;
            margin: 0 auto;
        }
        /* 본문 */
        .main{
            position: relative;
            width: 1200px;
            height: 100%;
            margin: 0 auto;
        }
        /* 사이드메뉴 */
        .sidenav{
            position: relative;
            width: 210px;
            height: 100%;
            float: left;
        }
        .sidenav ul,
        .sidenav ul li a {
            display: block;
            color: black;
        }
        .sidenav ul li{
            display: block;
            font-size: 16px;
        }
        .sidenav ul ul {
        display: none;
        }
        .sidenav > ul > li > a {
        padding: 19px 20px;
        z-index: 2;  
        cursor: pointer;
        font-weight: 700;
        text-decoration: none;
        }
        .sidenav ul ul li{
            background-color: #e7e7e7;
        }
        .sidenav ul ul li a {
        cursor: pointer;
        padding: 10px 0;
        padding-left: 30px;
        z-index: 1;
        text-decoration: none;
        font-size: 13px;
        }
        /* 콘텐츠 */
        .container{
            position: absolute;
            width: 970px;
            left: 210px;
            margin: 0;
            padding : 40px 0 40px 40px;
            border-left: 1px solid #e7e7e7;
        }
        .conTitle{
            width: 930px;
            line-height: 40px;
            padding-bottom: 20px;
            font-size: 32px;
            border-bottom: 2px solid #e7e7e7;
        }
        .col-lg-6{
            width: 930px;
            height: 30px;
            margin-top: 60px;
            padding: 0;
        }
        #optionTit{
            width: 70px;
            height: 30px;
            margin : 0;
            float: left;
        }
    </style>
    <script>
        // html dom 이 다 로딩된 후 실행된다.
        $(document).ready(function() {
        $('.sidenav li.menu>a').on('click', function(){
		$(this).removeAttr('href');
		var element = $(this).parent('li');
		if (element.hasClass('open')) {
			element.removeClass('open');
			element.find('li').removeClass('open');
            element.find('ul').slideUp();
		}
		else {
			element.addClass('open');
			element.children('ul').slideDown();
			element.siblings('li').children('ul').slideUp();
			element.siblings('li').removeClass('open');
			element.siblings('li').find('li').removeClass('open');
            element.siblings('li').find('ul').slideUp();
		}
	    });
    });
    </script>    
</head>

<body>
    <div class="header">
        <div>헤더 들어갈 자리</div>
    </div>
    <div class="main">
        <div class="sidenav">
                <ul>
                    <li class="menu"><a href="">근태 관리</a>
                        <ul class="hide">
                            <li><a href="">출퇴근 관리</a></li>
                            <li><a href="">월 근무내역</a></li>
                            <li><a href="">시간외 근무신청</a></li>
                        </ul>
                    </li>
                    <li class="menu"><a href="">휴가 관리</a>
                        <ul class="hide">
                            <li><a href="">휴가 신청</a></li>
                            <li><a href="">휴가 현황</a></li>
                        </ul>
                    </li>
                    <li ><a href="">조직도</a></li>
                </ul>
        </div>
        <div class="container">
        <div class="panel panel-default">
            <div class="conTitle">휴가 현황</div>    
            <div class="panel-body">
                <!-- <div class="col-lg-6">
                    <label for="calendar_view">구분별</label>
                    <div class="input-group">
                        <select class="filter" id="type_filter" multiple="multiple">
                            <option value="카테고리1">카테고리1</option>
                            <option value="카테고리2">카테고리2</option>
                            <option value="카테고리3">카테고리3</option>
                            <option value="카테고리4">카테고리4</option>
                        </select>
                    </div>
                </div> -->

                <div class="col-lg-6">
                    <div id="optionTit" style="font-weight : 700;">부서구분</div>
                    <div class="input-group">
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="정연"
                            checked>전체선택</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="정연"
                                checked>경영팀</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="다현"
                                checked>인사팀</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="사나"
                                checked>개발팀</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="나연"
                                checked>영업팀</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="지효"
                                checked>디자인팀</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="정연"
                                checked>마케팅</label>
                    </div>
                </div>

            </div>
        </div>

        <div id="wrapper">
            <div id="loading"></div>
            <div id="calendar"></div>
        </div>


        <!-- 일정 추가 MODAL -->
        <div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title"></h4>
                    </div>
                    <div class="modal-body">

                        <!-- <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-allDay">하루종일</label>
                                <input class='allDayNewEvent' id="edit-allDay" type="checkbox"></label>
                            </div>
                        </div> -->

                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-title">이름</label>
                                <input class="inputModal" type="text" name="edit-title" id="edit-title"
                                    required="required" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-type">부서명</label>
                                <select class="inputModal" type="text" name="edit-type" id="edit-type">
                                    <option value="카테고리1">카테고리1</option>
                                    <option value="카테고리2">카테고리2</option>
                                    <option value="카테고리3">카테고리3</option>
                                    <option value="카테고리4">카테고리4</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-start">휴가 시작일</label>
                                <input class="inputModal" type="text" name="edit-start" id="edit-start" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-end">휴가 종료일</label>
                                <input class="inputModal" type="text" name="edit-end" id="edit-end" />
                            </div>
                        </div>
                        
                        <!-- <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-color">색상</label>
                                <select class="inputModal" name="color" id="edit-color">
                                    <option value="#D25565" style="color:#D25565;">빨간색</option>
                                    <option value="#9775fa" style="color:#9775fa;">보라색</option>
                                    <option value="#ffa94d" style="color:#ffa94d;">주황색</option>
                                    <option value="#74c0fc" style="color:#74c0fc;">파란색</option>
                                    <option value="#f06595" style="color:#f06595;">핑크색</option>
                                    <option value="#63e6be" style="color:#63e6be;">연두색</option>
                                    <option value="#a9e34b" style="color:#a9e34b;">초록색</option>
                                    <option value="#4d638c" style="color:#4d638c;">남색</option>
                                    <option value="#495057" style="color:#495057;">검정색</option>
                                </select>
                            </div>
                        </div> -->
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-desc">휴가 형태</label>
                                <textarea rows="4" cols="50" class="inputModal" name="edit-desc"
                                    id="edit-desc"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer modalBtnContainer-addEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary" id="save-event">저장</button>
                    </div>
                    <div class="modal-footer modalBtnContainer-modifyEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
                        <button type="button" class="btn btn-primary" id="updateEvent">저장</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
        </div><!-- /.container -->    
    </div>
    <script src="vendor/js/jquery.min.js"></script>
    <script src="vendor/js/bootstrap.min.js"></script>
    <script src="vendor/js/moment.min.js"></script>
    <script src="vendor/js/fullcalendar.min.js"></script>
    <script src="vendor/js/ko.js"></script>
    <script src="vendor/js/select2.min.js"></script>
    <script src="vendor/js/bootstrap-datetimepicker.min.js"></script>
    <script src="js/main.js"></script>
    <script src="js/addEvent.js"></script>
    <script src="js/editEvent.js"></script>
    <script src="js/etcSetting.js"></script>
</body>

</html>