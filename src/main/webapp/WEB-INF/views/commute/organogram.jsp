<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ontact, 서로 연결되는 온라인 공간</title>
    <link href="./reset.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>    
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
    .contents{
        position: absolute;
        width: 970px;
        height: 950px;
        left: 210px;
        padding : 40px 0 40px 40px;
        border-left: 1px solid #e7e7e7;
        box-sizing: border-box;
    }
    .conTitle{
        width: 930px;
        height: 40px;
        line-height: 40px;
        padding-bottom: 20px;
        font-size: 32px;
        border-bottom: 1px solid #e7e7e7;
    }
    .team{
        position: absolute;
        width: 200px;
        height: 480px;
        margin-top: 30px;
        
        border: 1px solid #e7e7e7;
        box-sizing: border-box;
        float: left;
    }
    .team ul li:nth-child(1){
        width: 180px;
        height: 30px;
        padding: 10px;
        margin-bottom: 15px;;
        background-color: #e7e7e7;
    }
    .team ul li{
        width: 170px;
        height: 30px;
        padding: 0 15px;    
    }    
    .team input{
        width: 150px;
        height: 30px;
        border: 1px solid #e7e7e7;
        box-sizing: border-box;
        float: left;
    }
    .team button{
        width: 27px;
        height: 30px;
        background-color: #5A3673;
        color:#F2F2F2;
        border : none;
        
    }
    .detail{
        position: absolute;
        width: 710px;
        height: 480px;
        left: 260px;
        margin-top: 30px;
        padding: 15px;
        border: 1px solid #e7e7e7;
        box-sizing: border-box;
    }
    .title{
        height: 35px;
        margin-bottom: 15px;
        border-bottom: 1px solid #e7e7e7;
        font-size: 18px;
        font-weight: 700;
    }
    .title span{
        margin-left: 10px;
        font-size: 12px;
        font-weight: 400;
    }
    .detail table{
        width: 678px;
        font-size: 12px;
    }
    .detail table tr{
        height: 30px;
        line-height: 30px;
        border-bottom: 1px solid #e7e7e7;
    }
    .detail table tr td{
        padding-left: 10px;
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
    <div class="contents">
        <div class="conTitle">조직도</div>
            <div class="article">
                <div class="team">
                    <ul>
                        <li><input type="text"><button>검</button></li>
                        <li style="font-weight: 700;">ONTACT<span>(5)</span></li>
                        <li>경영팀</li>
                        <li>인사팀</li>
                        <li>개발팀</li>
                        <li>영업팀</li>
                        <li>디자인팀</li>
                        <li>마케팅팀</li>
                    </ul>
                </div>
                <div class="detail">
                    <div class="title">경영팀<span>총 0명</span></div>
                    <div>
                        <table>
                            <tr>
                                <th>사원번호</th>
                                <th>이메일</th>
                                <th>이름</th>
                                <th>직급</th>
                            </tr>
                            <tr>
                                <td>001089</td>
                                <td>gildong123@ontact.co.kr</td>
                                <td>홍길동</td>
                                <td>팀장</td>
                            </tr>
                            <tr>
                                <td>001089</td>
                                <td>gildong123@ontact.co.kr</td>
                                <td>홍길동</td>
                                <td>팀장</td>
                            </tr>
                            <tr>
                                <td>001089</td>
                                <td>gildong123@ontact.co.kr</td>
                                <td>홍길동</td>
                                <td>팀장</td>
                            </tr>
                            <tr>
                                <td>001089</td>
                                <td>gildong123@ontact.co.kr</td>
                                <td>홍길동</td>
                                <td>팀장</td>
                            </tr>
                            <tr>
                                <td>001089</td>
                                <td>gildong123@ontact.co.kr</td>
                                <td>홍길동</td>
                                <td>팀장</td>
                            </tr>
                            <tr>
                                <td>001089</td>
                                <td>gildong123@ontact.co.kr</td>
                                <td>홍길동</td>
                                <td>팀장</td>
                            </tr>
                            <tr>
                                <td>001089</td>
                                <td>gildong123@ontact.co.kr</td>
                                <td>홍길동</td>
                                <td>팀장</td>
                            </tr>
                            <tr>
                                <td>001089</td>
                                <td>gildong123@ontact.co.kr</td>
                                <td>홍길동</td>
                                <td>팀장</td>
                            </tr>
                            <tr>
                                <td>001089</td>
                                <td>gildong123@ontact.co.kr</td>
                                <td>홍길동</td>
                                <td>팀장</td>
                            </tr>
                            <tr>
                                <td>001089</td>
                                <td>gildong123@ontact.co.kr</td>
                                <td>홍길동</td>
                                <td>팀장</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
    </div>
</div>
<script>
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
            $('#startDate').datepicker(); 
            $('#endDate').datepicker(); 
            //초기값을 오늘 날짜로 설정
            $('#startDate').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)  
            $('#endDate').datepicker('setDate', 'today');          
        });
    
</script>
</body>
</html>