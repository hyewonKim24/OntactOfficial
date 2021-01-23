<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
	<%@ include file="../main/header.jsp"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ontact, 서로 연결되는 온라인 공간</title>
<link href="${pageContext.request.contextPath}/resources/css/reset.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script>
    /* 	입력값 가져오기 */

    $(function() {
        //input을 datepicker로 선언
        $.datepicker.setDefaults({
            dateFormat: 'yy-mm-dd' //Input Display Format 변경
            ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
            ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
            ,changeYear: true //콤보박스에서 년 선택 가능
            ,changeMonth: true //콤보박스에서 월 선택 가능                
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
    
    function printName() {
        const name = document.getElementById('startDate').value;
        document.getElementById("result").innerText = name;
    }
    
    
    function show_alert() {
    	swal("기안이 등록되었습니다.");
  	}

    </script>



<style>
a {
	text-decoration: none;
}

/*헤더부분*/
header {
	background-color: #F2F2F2;
	display: flex;
	position: relative;
	height: 60px;
	padding: 0 32px;
	top: 0;
	left: 0;
	right: 0;
}

.container {
	position: relative;
	width: 1200px;
	height: 100%;
	margin: 0 auto;
	    padding-top: 63px;
}

.wrap_title {
	display: flex;
	flex: 1;
}

.doc_title {
	display: flex;
	align-items: center;
	font-size: 20px;
}

.util_user {
	padding-top: 11px;
	line-height: 0;
}

.userinfo {
	display: inline-block;
	font-size: 14px;
	color: #505050;
}

.userprofile {
	vertical-align: middle;
	display: inline-block;
	margin-left: 16px;
}

.userprofile .icon {
	width: 29px;
	height: 29px;
}

/*헤더부분 END*/

/*aside부분*/
#apaside {
	width: 210px;
	height: 100%;
	display: inline-block;
	position: absolute;
	/* padding-top: 24px; */
}

.menu li a {
	padding: 16px 0 16px 19px;
}

.menu_list:hover {
	background-color: #e7e7e7;
}

.link_menu {
	text-decoration: none;
	display: block;
	position: relative;
	min-height: 55px;
	padding: 17px 44px 14px 32px;
	box-sizing: border-box;
	color: #333333;
	font-size: 14px;
	font-weight: 600;
}

/*aside부분 END*/

/*section부분  */
.page_section {
	position: absolute;
	width: 970px;
	height: 860px;
	left: 210px;
	padding: 40px 0 40px 40px;
	border-left: 1px solid #e7e7e7;
	box-sizing: border-box;
}

/*section부분 END */
.main_section {
	padding-top: 30px;
}

.board-listheader {
	font-size: 13px;
	margin-top: 11px;
	line-height: 140%;
}

.board-listheader td {
	padding: 10px 0;
	vertical-align: middle;
	font-size: 12px;
	border: 1px solid #c0c0c0;
}

.board-listheader tbody tr {
	text-align: center;
}

/* .board-listheader tbody tr td {
			padding-top: 20px;
			padding-bottom: 20px;
		} */
.apwrite {
	float: right;
	padding-top: 20px;
}

#apwritebtn {
	width: 100px;
	line-height: 30px;
	text-align: center;
	border: 1px solid #5A3673;
	background-color: #5A3673;
	color: #fff;
	font-size: 12px;
}

.opt_bt {
	width: 200px;
	height: 30px;
	color: #787878;
}
.opt_bt_a {
	width: 200px;
	height: 24px;
	color: #787878;
}
.opt_bt_b {
	width: 330px;
	height: 24px;
	color: #787878;
}
.opt_bt_c{
	height: 30px;
}
.section_a{
	font-weight: 600;
	padding-bottom: 30px;
}
.text{
	padding-right: 10px;
}
</style>
<title>ontact, 서로 연결되는 온라인 공간</title>
</head>

<body>

	<!-- <header>
		<div class="wrap_title">
			<h1 class="doc_title">
				<a href="#" style="color: black;">전자결재</a>
			</h1>
		</div>
		<div class="util_user">
			<div class="userinfo">
				<strong>사용자명</strong>
			</div>
			<div class="userprofile">
				<a href="#"><img src="./img/user3.png" class="icon"></a>
			</div>

		</div>
	</header> -->

	<div class="container">
		<div id="apaside">
			<ul class="menu">
				<li class="menu_list"><a
					href="${pageContext.request.contextPath}/project/driftlist"
					class="link_menu">전자결재 기안함</a></li>
				<li class="menu_list"><a
					href="${pageContext.request.contextPath}/project/lists"
					class="link_menu">전자결재 결재함</a></li>
			</ul>
		</div>


		<form action="${pageContext.request.contextPath}/appinsert"
			method="post" enctype="tmultipart/form-data">
			<div class="page_section">
				<h2>기안 작성하기</h2>
				<hr>

				<div class="main_section">
					<div class="section_a"> <span class="text">문서형식</span>  
						<select class="opt_bt" name="apformat">
							<option value="선택하세요">선택하세요</option>
							<option value="품의서">품의서</option>
							<option value="보고서">보고서</option>
						</select> <span class="text">결제자</span>
						 <select class="opt_bt" name="apperson">
							<option value="선택하세요">선택하세요</option>
							<option value="김혜원">김혜원</option>
							<option value="이혜림">이혜림</option>
						</select>
					</div>

					<div class="section_a">
							<span class="text">기안부서 </span>
						<select class="opt_bt" name="dno">
							<option value="선택하세요">선택하세요</option>
							<option value="1">개발팀</option>
							<option value="2">기획팀</option>
							<option value="3">영업팀</option>
							<option value="4">마케팅팀</option>
						</select> <span class="text">기안자</span>
						 <input type="text" class="opt_bt_a" name="apdrafter">
						<span class="text">기안 일시 </span><input type="text" id="startDate" onchange="printName()"
							name="apdate">
					</div>
					<hr>


					<input type="text" class="opt_bt_b" name="aptitle" placeholder="기안 제목을 입력하세요">
					<!-- <table width="100%" align="center" cellpadding="0" cellspacing="0"> -->
					<table width="100%" class="board-listheader" cellpadding="0"
						cellspacing="0">
						<tr>
							<td>프로젝트</td>
							<td colspan="3"><input type="text" name="apptitle" class="opt_bt_c"
								style="width: 90%; border: 0;"></td>
						</tr>
						<tr>
							<td>장소</td>
							<td><input type="text" name="applace" class="opt_bt_c"
								style="width: 90%; border: 0;"></td>
							<td>일시</td>
							<td id="result"></td>
						</tr>
						<tr>
							<td>참석자</td>
							<td colspan="3"><input type="text" name="apattend" class="opt_bt_c"
								style="width: 90%; border: 0;"></td>
						</tr>
						<tr>
							<td>회의 내용</td>
							<td colspan="3"><textarea name="apcontent" class="opt_bt_c"
									style="resize: none; width: 90%; height: 100%; border: 0;"></textarea>
							</td>
						</tr>
						<tr>
							<td>결정사항</td>
							<td colspan="3"><input type="text" name="apdec" class="opt_bt_c"
								style="width: 90%; border: 0;"></td>
						</tr>
						<tr>
							<td>기타</td>
							<td colspan="3"><input type="text" name="apetc" class="opt_bt_c"
								style="width: 90%; border: 0;"></td>
						</tr>
					</table>

				</div>

				<div class="apwrite">
					<button type="submit" onclick="show_alert();" id="apwritebtn"
						name="apwritebtn">기안등록하기</button>
					<button type="button" onclick="window.location='driftlist'"
						id="apwritebtn" name="apwritebtn">취소</button>
				</div>
			</div>
			<sec:csrfInput />
		</form>
	</div>



</body>

</html>