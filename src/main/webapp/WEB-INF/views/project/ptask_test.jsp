<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/pjdetail.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <!-- 장소 검색 API -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e8f272dc1ba4f98e1be5c993c17cae5d&libraries=services"></script>
    <!-- date picker -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
     <!-- time picker -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
    <!-- Chart.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js" 
    	integrity="sha512-d9xgZrVZpmmQlfonhQUvTR7lMPtO7NkZMkA0ABN3PHCbKA5nqylQ/yWlFAyY6hYgdF1Qh6nYiuADWwKB4C2WSw==" 
    	crossorigin="anonymous"></script>
    <!-- 파일 -->
	<link href="${pageContext.request.contextPath}/resources/css/lightbox.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/resources/js/lightbox.min.js"></script>
    <script src="https://kit.fontawesome.com/22634e2e1a.js" crossorigin="anonymous"></script>
<meta charset="UTF-8">
    <title>ontact, 서로 연결되는 온라인 공간</title>
    <style>
        body{
            background-color: #f6f6f6;
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

        .main {
            position: relative;
            width: 1200px;
            height: 100%;
            margin: 0 auto;
        }

        .ptask_sidebar {
            position: relative;
            width: 210px;
            height: 100%;
            float: left;
        }

        .menu:hover {
            background-color: #ebebeb;
        }

        .ptask_sidebar ul,
        .ptask_sidebar ul li a {
            display: block;
            color: #111111;
        }

        .ptask_sidebar .menu {
            display: block;
            height: 40px;
            font-size: 14px;
            line-height: 40px;
        }

        .ptask_sidebar ul li input {
            margin-right: 8px;
            vertical-align: middle;
        }

        .ptask_sidebar input[type="checkbox"] {
            width: 18px;
            height: 18px;
            overflow: hidden;
            border: 0;
            background-color: black;
        }

        .pcontents {
            position: absolute;
            width: 970px;
            height: 860px;
  			left: 210px;
            box-sizing: border-box;
            line-height: 15px;
        }

        .task_title {
            width: 830px;
            height: 45px;
            
            font-size: 18px;
            text-align: left;
            float: left;
        }

        .close {
            width: 100px;
            height: 32px;
            background-color: #5A3673;
            color: #F2F2F2;
            border: none;
            border-radius: 3px;
        }

        .atask_list {
            position: absolute;
           /*  width: 930px; */
            /* padding-top: 30px; */
            margin: 0;
            height: 100%;
            background-color: #ffffff;
        }
        .board-listheader {
			font-size: 13px;
			
		}
        .board-listheader th {
			padding: 10px 0;
			vertical-align: middle;
			font-size: 12px;
		}
        .board-listheader thead{
            border-bottom: 1px solid #c0c0c0;
        }
        
        
        
     
    </style>
</head>

<body>
    <div class="header">
        <div>헤더 들어갈 자리</div>
    </div>
    <div class="main">
        <div class="ptask_sidebar">
            <ul>
                <li class="menu">업무 구분</li>
                <li class="menu"><input type="radio" name="sche" value="0" onclick="checkOneS(this)" id="id1"><label
                        for="id1">내 업무</label></li>
                <li class="menu"><input type="radio" name="sche" value="1" onclick="checkOneS(this)" id="id2"><label
                        for="id2">요청한 업무</label></li>
                <li class="menu"><input type="radio" name="sche" value="2" onclick="checkOneS(this)" id="id3"><label
                        for="id3">전체 업무</label></li>


                <li class="menu">상태</li>
                <li class="menu"><input type="checkbox" name="task" value="3" onclick="checkOneT(this)" id="id4"><label
                        for="id4"> 요청</label></li>
                <li class="menu"><input type="checkbox" name="task" value="4" onclick="checkOneT(this)" id="id5"><label
                        for="id5"> 진행</label></li>
                <li class="menu"><input type="checkbox" name="task" value="5" onclick="checkOneT(this)" id="id6"><label
                        for="id6"> 피드백</label></li>
                <li class="menu"><input type="checkbox" name="task" value="6" onclick="checkOneT(this)" id="id7"><label
                        for="id7"> 완료</label></li>
                <li class="menu"><input type="checkbox" name="task" value="7" onclick="checkOneT(this)" id="id8"><label
                        for="id8"> 보류</label></li>
            </ul>

        </div>


        <div class="pcontents">
            <div class="ptask_section">
                <div class="task_title">전체 업무(${listCount })</div>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"
                    onclick="location.href=''">닫기</button>
                <div class="atask_list">
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
                              <li>
                              <a href="${pageContext.request.contextPath}/project/taskdelete?bno=${tlist.bno}&pno=${pno}" class="list_delbtn_task">글 삭제</a>
                                       <input type="hidden" class="bnoval" value="${tlist.bno}">
                              </li>
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
                        <input type="hidden" name="bno" id="bno" value="${bno}">
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
                                 // 업무리포트 그래프 뿌리기 
                                 var ctx = document.getElementById('taskChart').getContext('2d');
                                 var count = ${ e.count };
                                 var pno = ${ pno };
                                 var bno = ${ tlist.bno };
                                 report();
                                 function report() {
                                    $.ajax({
                                       url: "${pageContext.request.contextPath}/project/tstatereport",
                                       data: {
                                          pno: pno
                                       },
                                       dataType: "json",
                                       success: function (data) {
                                          createChart(data[0], data[1], data[2], data[3]);
                                          return false;
                                       },
                                       error: function () {
                                          console.log("update 실패");
                                       }
                                    });
                                 };
                                 function createChart(s1, s2, s3, s4) {
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
                        <!-- 은실 ) 파일뿌리기 -->
                        <div class="uploadFiles">
                                      <ul class="uploadedFileList-real">
                        <c:forEach items="${file}" var="file" varStatus="e">
                        <c:if test="${tlist.bno eq file.bno }">
                                         <li data-src="${file.fname }" class="uploadedFileList-real-li ${tlist.bno}">
                                            <span class="boardimg-real"><img src="${file.imgsrc}" alt="Attachment"></span>
                                            <div class="boardimg-info-real">
                                               <a href="${file.fpath }" class="boardimg-name-real">
                                                  <i class="fa fa-paperclip"></i>${file.foriginalname }
                                               </a>
                                            </div>
                                            <input type="hidden" class="fnamevalue" value="${file.fname }"></input>
                                         </li>
                             </c:if>
                             </c:forEach>
                                      </ul>
                                </div>
                                <!-- 여기까지 -->
                     </div>
                     
                     <!-- 댓글 갯수 출력 -->
                     <c:forEach items="${rclist}" var="clist" varStatus="i">
                        <c:if test="${clist.bno eq tlist.bno}">
                              <div class="replyCount">댓글 <span class="rcount">${clist.rcount}</span>개</div>
                        </c:if>
                     </c:forEach>
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
                                 var parents = $(this).closest('');
                                 var parentDiv = parent.parent();
                                 var rno = parentDiv.find(".rno").val();
                                 var rcount = parents.find(".rcount").val();
                                 console.log("댓글개수"+rcount);
                                 $.ajax({
                                    url: "${pageContext.request.contextPath}/project/replydelete",
                                    data: {
                                       rno: rno
                                    },
                                    dataType: "json",
                                    success: function (data) {
                                       parentDiv.remove();
                                       console.log("댓글개수"+rcount);
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
               </div>
            </c:forEach>
         </div>
<!-- 혜원 업무 글 결과화면 끝 -->
              
                </div>

            </div>
        </div>

    </div>
</body>

</html>