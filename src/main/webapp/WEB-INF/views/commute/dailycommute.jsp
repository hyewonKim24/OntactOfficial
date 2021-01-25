<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ include file="../main/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ontact, 서로 연결되는 온라인 공간</title>
<link href="${pageContext.request.contextPath}/resources/css/reset.css"
	rel="stylesheet" type="text/css">

<!-- 현재시간 및 위치 , QR 생성 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"
	type="text/javascript" charset="utf-8"></script>
<script src="http://code.jquery.com/jquery-1.11.0.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/getmap.js"></script>

<!-- 스캐너 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jsQr.js"></script>

<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">

<style>
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
        color: rgb(17,17,17);
        background-color : #f2f2f2;
    }
    a {
		text-decoration: none;
		color: #111111;
	}
    .headersection {
	position: relative;
	width: 100%;
	height: 60px;
	}
	
	.headersection div {
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
        background-color : #f2f2f2;
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
    padding: 25px 20px 19px 60px;
    z-index: 2;  
    cursor: pointer;
    font-weight: 700;
    text-decoration: none;
    }
    
    .sidenav ul ul li{
        /* background-color: #e7e7e7; */
    }
    .sidenav ul ul li a {
    cursor: pointer;
    padding: 20px 0;
    padding-left: 60px;
    z-index: 1;
    text-decoration: none;
    font-size: 13px;
    }
    .sidenav ul ul li:hover{
    	background-color : #e7e7e7;
    	color : #5A3673;
    }
/* 콘텐츠 */
.contents {
	position: absolute;
	width: 1000px;
	height: 860px;
	left: 210px;
	padding: 40px 0 40px 40px;
	border-left: 1px solid #e7e7e7;
	box-sizing: border-box;
	background-color : white;
}

.conTitle {
	width: 930px;
	height: 40px;
	line-height: 40px;
	padding-bottom: 20px;
	font-size: 32px;
	border-bottom: 1px solid #e7e7e7;
	text-align: left;
}

.commuteBtn {
	width: 930px;
	height: 40px;
	line-height: 40px;
	padding: 36px 0;
	text-align: center;
	border-bottom: 1px solid #e7e7e7;
}

#qrcreate, #qrenter, #qrleave {
	width: 100px;
	height: 32px;
	margin-right: 20px;
	background-color: #5A3673;
	color: #F2F2F2;
	border: none;
	border-radius: 3px;
}

.option {
	width: 930px;
	height: 150px;
	padding: 30px 0;
	text-align: left;
}

.option input:nth-child(1), input:nth-child(2) {
	border: 1px solid #e7e7e7;
}

.option table {
	width: 930px;
	height: 150px;
}

.option table td {
	height: 50px;
	line-height: 50px;
}

.option table td:nth-child(1) {
	width: 150px;
}

.option table tr:nth-child(3) {
	text-align: center;
}

.option table button {
	width: 100px;
	height: 32px;
	background-color: #5A3673;
	color: #F2F2F2;
	border: none;
	border-radius: 3px;
}

.list {
	width: 930px;
	height: 360px;
}

.list table {
	width: 930px;
	min-height: 95px;
	font-size: 14px;
	text-align: center;
}

.list table tr {
	height: 30px;
	line-height: 30px;
	border-bottom: 1px solid #e7e7e7;
}

.list table thead {
	font-weight: 700;
}

/* QR스캐너 */
/* .main {
	width: 100%;
	height: 100%;
	text-align: center;
} */

.frame_wrap, .info {
	width: 95%;
}

div#output {
	background-color: #BDBEBD;
	margin: 0 10px;
	padding: 8px;
}

div#frame {
	border: 1px solid #005666;
	background-color: #FFFFFF;
	padding: 8px;
}

div#outputLayer {
	text-align: left;
}

canvas {
	width: 100%;
}
/* 출근, 퇴근, qr 스캐너 모달 */
#gomodal {
	display: none;
	position: relative;
	width: 100%;
	height: 0px;
	float: left;
	z-index: 9999;
}

.modalTitle {
	font-size: 28px;
	font-weight: 700;
	padding-bottom: 20px;
}

.modal_content {
	position: relative;
	width: 300px;
	height: 270px;
	padding: 20px 0;
	margin: 100px auto;
	background: #fefefe;
}

.modal_content_scanner {
	position: relative;
	width: 500px;
	height: 400px;
	padding: 20px 0;
	margin: 100px auto;
	background: #fefefe;
}

.close {
	width: 100px;
	height: 32px;
	background-color: #5A3673;
	color: #F2F2F2;
	border: none;
	border-radius: 3px;
}

.modal_layer {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
}
</style>
<script>
    $(document).ready(function() {
        // 세로드롭다운
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
        
        //모달생성
        $("#qrcreate").click(function(){
        $("#gomodal").attr("style", "display:block");
        });
        
        $(".close").click(function(){
        $("#gomodal").attr("style", "display:none");
        $("#leavemodal").attr("style", "display:none");
        $("#scannermodal").attr("style", "display:none");
        });
        
          
		// 현재 시간 구하기
		  //구글API URL
		  var gqrapi = "http://chart.apis.google.com/chart?cht=qr&chs=144x144&choe=UTF-8&chld=H|0";
		  function getTimeStamp() {
		    var d = new Date();
		    var s =
		      leadingZeros(d.getFullYear(), 4) + '-' +
		      leadingZeros(d.getMonth() + 1, 2) + '-' +
		      leadingZeros(d.getDate(), 2) + ' ' +
		        
		      leadingZeros(d.getHours(), 2) + ':' +
		      leadingZeros(d.getMinutes(), 2) + ':' +
		      leadingZeros(d.getSeconds(), 2);
		    return s;
		  }
		        
		  function leadingZeros(n, digits) {
		    var zero = '';
		    n = n.toString();
		    if (n.length < digits) {
		      for (i = 0; i < digits - n.length; i++)
		        zero += '0';
		    }
		    return zero + n;
		  }
		//현재 위치 구하기
		    function getLocation() {
		    if (navigator.geolocation) {
		        var value = navigator.geolocation.getCurrentPosition(showPosition);
		        console.log(value);
		   	} else { 
		        x.innerHTML = "Geolocation is not supported by this browser.";
		    }
		    }
		    function showPosition(position) {
			    var a = position.coords.latitude;
			    var b = position.coords.longitude;
			    return a;
		    }  
		// function init(){
		//     window.navigator.geolocation.getCurrentPosition(current_position);
		//   }
		//   function current_position(position){
		//     var msg;
		//     msg = "위도: " + position.coords.latitude + ", " + "경도: " + position.coords.longitude;
		//   }
		
		//QR생성
		  $("#qrcreate").click(function () {
			var uno = $("#uno").val();
			var dno = $("#dno").val();	
		    let today = getTimeStamp() + "," + dno + "," + uno;
	 
		    $text = today;
		    //입력한 내용 있는지 체크
		    if ($text !== "") {
		      var imgsrc = gqrapi+"&chl="+encodeURIComponent($text); //입력 데이터 인코딩해서 구글 API에 파라메터로 붙이고...
		      //이미지 객체를 생성해서 구글API URL을 "src="로 지정
		      var img = new Image();
		      $(img).load(function (){
		        var $this = $(this);
		        $this.hide();
		        $("#qrout1").empty().append(this); //<div>에 이미지 객체 추가
		        $this.fadeIn(); //QR코드 화면에 보이게
		      }).attr({"src" : imgsrc, "width" : 144, "height" : 144, "alt" : "QR CODE: "+ today }); 
		      //이미지 객체의 속성 지정 "src"에 구글API URL 지정
		    } else {
		    $("#qrout1").empty().text("인코딩할 데이터를 입력하세요.");
		    }
		  });
		  
		//출퇴근 스캐너호출 
		  $('#qrenter').click(function() {
				popupOpen('qrenter');
			});
		  function popupOpen(url){
			  	var name="enter";
			    var specs = 'width=510, height=700, menubar=no,status=no,toolbar=no';
			    var newWindow = window.open(url,name,specs);
			    newWindow.focus();
			}
		$('#qrleave').click(function() {
				popupOpen('qrleave');
		});
		
		function popupOpen(url){
			  	var name="leave";
			    var specs = 'width=510, height=700, menubar=no,status=no,toolbar=no';
			    var newWindow = window.open(url,name,specs);
			    newWindow.focus();
		}
		
		/* $("#search").click(function(){
		    $(this).prop("checked", true);
		    $("form").submit();
		}) */
		/* function checkboxArr() {
		    var checkArr = [];     // 배열 초기화
		    $("input[name='cstate']:checked").each(function(i) {
		        checkArr.push($(this).val());     // 체크된 것만 값을 뽑아서 배열에 push
		    $.ajax({
		        url: '/commute/dailylist'
		        , type: 'get'
		        , dataType: 'text'
		        , data: {
		            valueArrTest: checkArr
		        }
		    })
            });
        } */
    });
</script>
</head>
<body>
	<div class="headersection">
		<div>헤더 들어갈 자리</div>
	</div>
	<div class="main">
		<div class="sidenav">
			<ul>
				<li class="menu"><a href="">근태 관리</a>
					<ul class="hide">
						<li class="hover"><a href="${pageContext.request.contextPath}/commute/dailylist">출퇴근 관리</a></li>
						<li class="hover"><a href="${pageContext.request.contextPath}/commute/monthlylist">월 근무내역</a></li>
						<li class="hover"><a href="${pageContext.request.contextPath}/overwork/owlist">시간외 근무신청</a></li>
					</ul></li>
				<li class="menu"><a href="">휴가 관리</a>
					<ul class="hide">
						<li><a href="${pageContext.request.contextPath}/dayoff/dflist">휴가 신청</a></li>
						<li><a href="${pageContext.request.contextPath}/dayoff/calendarlist">휴가 현황</a></li>
					</ul></li>
				<li><a href="${pageContext.request.contextPath}/commute/organlist">조직도</a></li>
			</ul>
		</div>
		<div class="contents">
			<div class="article">
				<div class="conTitle">출퇴근 관리</div>
				<div class="commuteBtn">
					<input type="hidden" id="uno" value="<sec:authentication property="principal.uno" var="uno"/>${uno}">
					<input type="hidden" id="dno" value="<sec:authentication property="principal.dno" var="dno"/>${dno}">
					<button name="go" id="qrcreate">QR생성</button>
					<button name="go" id="qrenter">출근하기</button>
					<button value="" id="qrleave">퇴근하기</button>
					<div id="gomodal">
						<div class="modal_layer"></div>
						<div class="modal_content">
							<div class="modalTitle">QR</div>
							<div id="qrout1"></div>
							<button class="close">닫기</button>
						</div>
					</div>
				</div>
				<div class="option">
					<form name="search_frm">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<table>
							<tr>
								<td>기간 선택</td>
								<td>
								<input type="Date" id="startdate" name="startdate" autocomplete="off" style="width:170px; height:30px; padding : 0 10px; color : #787878;"/>
									&nbsp;&nbsp;&nbsp; ~ &nbsp;&nbsp;&nbsp; 
								<input type="Date" id="enddate" name="enddate" autocomplete="off"   style="width:170px; height:30px; padding : 0 10px; color : #787878;"/>
								</td>
							</tr>
							<tr>
								<td>출퇴근 여부</td>
								<td><input type="radio" id="nomalcommute" name="cstate"
									value="0"> <label for="nomal">정상</label>&nbsp;&nbsp;&nbsp;
									<input type="radio" id="abnomalEnter" name="cstate"
									value="1"> <label for="nomal">지각</label>&nbsp;&nbsp;&nbsp;
									<input type="radio" id="abnomalLeave" name="cstate"
									value="2"> <label for="nomal">기타</label></td>
							</tr>
							<tr>
								<td colspan="2"><button value="" id="search">조회</button></td>
							</tr>
						</table>
					</form>
				</div>
				<div class="list">
					<table>
						<thead>
							<tr>
								<td colspan="6" style="text-align: left;">조회결과 <span>${listCount}</span>건</td>
							</tr>
							<tr>
								<th>날짜</th>
								<th>근무상태</th>
								<th>출근시간</th>
								<th>퇴근시간</th>
								<th>근무시간</th>
								<th>사유</th>
							</tr>
						</thead>
						<c:if test="${listCount eq 0}">
							<tr>
								<td colspan="6" align="center">
								<br> 출퇴근 내역이 없습니다.<br> <br></td>
							</tr>
						</c:if> 
						<c:if test="${listCount ne 0}">
						<%-- <c:if test="${not empty list}"> --%>
							<c:forEach var="cm" items="${list}" varStatus="status">
								<tr>
									<td>${cm.cdate}</td>
									<td>${cm.cstate}</td>
									<td>${cm.cstarttime}</td>
									<td>${cm.cendtime}</td>
									<td>${cm.cworktime}</td>
									<td>${cm.creason}</td>
								</tr>
							</c:forEach>
						</c:if>
						<!-- 앞 페이지 번호 처리 -->
						<tr>
							<td colspan="6"><c:if test="${currentPage <= 1}">
						&lt; &nbsp;
						</c:if> <c:if test="${currentPage > 1}">
									<c:url var="dailyprev" value="/commute/dailylist">
										<c:param name="page" value="${currentPage-1}" />
									</c:url>
									<a href="${dailyprev}">&lt; &nbsp; </a>
								</c:if> <!-- 끝 페이지 번호 처리 --> <c:set var="endPage" value="${maxPage}" />
								<c:forEach var="p" begin="${startPage+1}" end="${endPage}">
									<!-- eq : == / ne : != -->
									<c:if test="${p eq currentPage}">
										<font color ="#5A3673"><b>${p} &nbsp; </b></font>
									</c:if>
									<c:if test="${p ne currentPage}">
										<c:url var="dailychk" value="/commute/dailylist">
											<c:param name="page" value="${p}" />
										</c:url>
										<a href="${dailychk}">${p} &nbsp;</a>
									</c:if>
								</c:forEach> <c:if test="${currentPage >= maxPage}"> &gt;
							</c:if> <c:if test="${currentPage < maxPage}">
									<c:url var="dailynext" value="/commute/dailylist">
										<c:param name="page" value="${currentPage+1}" />
									</c:url>
									<a href="${dailynext}">&gt;</a>
								</c:if></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
    $('#search').on('click', function(){
		if(fnMemberValidation() == false) {
            return;
            console.log("false로 들어옴");
      }else if(fnMemberValidation() == true){
         console.log("true로 들어옴");
			
 	   var frm = document.search_frm;
 	   frm.action = "${pageContext.request.contextPath}/commute/dailylist";
 	   frm.method = "post";
 	   frm.submit();
	}else{
 	   return;
 	}
	});
		
	 
function fnMemberValidation(){
	 	 if($('#startdate').val() == '' || $('#startdate').val() == 0){
		   alert("시작 날짜를 선택해주세요");
	 	   return false;
	 	 }
	 	 if($('#enddate').val() == '' || $('#enddate').val() == 0){
	 	   alert("종료 날짜를 선택해주세요");
	  	   return false;
	  	 }
		 if($('input[name=cstate]:radio:checked').length < 1){
	 	   alert("상태를 선택해주세요");
	 	   $('#uname').focus();
	 	   return false;
		 }
 	   
 	  return true;
 	 };
	</script>
</body>
</html>