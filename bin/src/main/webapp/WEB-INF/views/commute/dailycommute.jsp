<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ontact, 서로 연결되는 온라인 공간</title>
    <link href="./reset.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="./jquery-3.5.1.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
        rel="stylesheet">
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
        height: 860px;
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
    .commuteBtn{
        width: 930px;
        height: 40px;
        line-height: 40px;
        padding: 36px 0;
        text-align: center;
        border-bottom: 1px solid #e7e7e7;
    }
    .commuteBtn button{
        width: 100px;
        height: 32px;
        margin-right: 20px;
        background-color: #5A3673;
        color:#F2F2F2;
        border : none;
        border-radius: 3px;
    }
    .option{
        width: 930px;
        height: 150px;
        padding: 30px 0;
    }
    .option input:nth-child(1), input:nth-child(2){
        border: 1px solid #e7e7e7;
    }
    .option table{
        width: 930px;
        height: 150px;
    }
    .option table td{
        height: 50px;
        line-height: 50px;
    }
    .option table td:nth-child(1){
        width: 150px;
    }
    .option table tr:nth-child(3){
        text-align: center;
    }
    .option table button{
        width: 100px;
        height: 32px;
        background-color: #5A3673;
        color:#F2F2F2;
        border : none;
        border-radius: 3px;
    }
    .list{
        width: 930px;
        height: 360px;
    }
    .list table{
        width: 930px;
        height: 360px;
        font-size: 14px;
        text-align: center;
    }
    .list table tr{
        height: 30px;
        line-height: 30px;
        border-bottom: 1px solid #e7e7e7;
    }
    .list table thead{
        font-weight: 700;
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
        <div class="article">
            <div class="conTitle">출퇴근 관리</div>
            <div class="commuteBtn">
                <button value="">출근하기</button>
                <button value="">퇴근하기</button>
                <button value="">QR 스캐너</button>
            </div>
            <div class="option">
                <table>
                    <tr>
                        <td>기간 선택</td>
                        <td><input type="text" id="startDate"> &nbsp;&nbsp;&nbsp; ~ &nbsp;&nbsp;&nbsp; <input type="text" id="endDate"></td>
                    </tr>
                    <tr>
                        <td>출퇴근 여부</td>
                        <td>
                            <input type="radio" id="nomalcommute">
                            <label for="nomal">정상출퇴근</label>&nbsp;&nbsp;&nbsp;
                            <input type="radio" id="abnomalEnter">
                            <label for="nomal">출근누락</label>&nbsp;&nbsp;&nbsp;
                            <input type="radio" id="abnomalLeave">
                            <label for="nomal">퇴근누락</label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"><button value="">조회</button></td>
                    </tr>
                </table>
            </div>
            <div class="list">
                <table>
                    <thead>
                    <tr>
                        <td colspan="6" style="text-align: left;">조회결과 00건</td>
                    </tr>
                    <tr>
                        <th>날짜</th>
                        <th>근무상태</th>
                        <th>출근시간 </th>
                        <th>퇴근시간</th>
                        <th>지각여부</th>
                        <th>지각사유</th>
                    </tr>
                    </thead>
                    <tr>
                        <td>2020-12-29</td>
                        <td>정상근무</td>
                        <td>8:53</td>
                        <td>18:13</td>
                        <td> 0 </td>
                        <td> - </td>
                    </tr>
                    <tr>
                        <td>2020-12-29</td>
                        <td>정상근무</td>
                        <td>8:53</td>
                        <td>18:13</td>
                        <td> 0 </td>
                        <td> - </td>
                    </tr>
                    <tr>
                        <td>2020-12-29</td>
                        <td>정상근무</td>
                        <td>8:53</td>
                        <td>18:13</td>
                        <td> 0 </td>
                        <td> - </td>
                    </tr>
                    <tr>
                        <td>2020-12-29</td>
                        <td>정상근무</td>
                        <td>8:53</td>
                        <td>18:13</td>
                        <td> 0 </td>
                        <td> - </td>
                    </tr>
                    <tr>
                        <td>2020-12-29</td>
                        <td>정상근무</td>
                        <td>8:53</td>
                        <td>18:13</td>
                        <td> 0 </td>
                        <td> - </td>
                    </tr>
                    <tr>
                        <td>2020-12-29</td>
                        <td>정상근무</td>
                        <td>8:53</td>
                        <td>18:13</td>
                        <td> 0 </td>
                        <td> - </td>
                    </tr>
                    <tr>
                        <td>2020-12-29</td>
                        <td>정상근무</td>
                        <td>8:53</td>
                        <td>18:13</td>
                        <td> 0 </td>
                        <td> - </td>
                    </tr>
                    <tr>
                        <td>2020-12-29</td>
                        <td>정상근무</td>
                        <td>8:53</td>
                        <td>18:13</td>
                        <td> 0 </td>
                        <td> - </td>
                    </tr>
                    <tr>
                        <td>2020-12-29</td>
                        <td>정상근무</td>
                        <td>8:53</td>
                        <td>18:13</td>
                        <td> 0 </td>
                        <td> - </td>
                    </tr>
                    <tr>
                        <td>2020-12-29</td>
                        <td>정상근무</td>
                        <td>8:53</td>
                        <td>18:13</td>
                        <td> 0 </td>
                        <td> - </td>
                    </tr>
                </table>
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