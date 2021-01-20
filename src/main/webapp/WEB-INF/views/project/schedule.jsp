<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ontact, 서로 연결되는 온라인 공간</title>
<script src='${pageContext.request.contextPath}/resources/packages/core/main.js'></script>
<script src='${pageContext.request.contextPath}/resources/packages/interaction/main.js'></script>
<script src='${pageContext.request.contextPath}/resources/packages/timegrid/main.min.js'></script>
<script src='${pageContext.request.contextPath}/resources/packages/daygrid/main.js'></script>
<link href='${pageContext.request.contextPath}/resources/packages/core/main.css' rel='stylesheet' />
<link href='${pageContext.request.contextPath}/resources/packages/daygrid/main.css' rel='stylesheet' />
<script src='${pageContext.request.contextPath}/resources/js/moment.js'></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
<link href='${pageContext.request.contextPath}/resources/packages/timegrid/main.min.css' rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css">

<style>
* {
   margin: 0;
}

body {
   width: 100%;
   height: 100%;
   position: relative;
   font-size: 14px;
   font-family: Noto Sans KR;
   line-height: 1.15;
   color: #111111;
    background-color: rgb(242, 242, 242);
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
/* 본문 */
.main {
   position: relative;
   width: 1200px;
   height: 100%;
   margin: 0 auto;
}
/* 사이드 체크박스 */
.sidenav {
   position: relative;
   width: 210px;
   height: 100%;
   float: left;
}
.sidenav ul, .sidenav ul li a {
   display: block;
   color: #111111;
}
.sidenav .ttl {
   display: block;
    height: 45px;
   font-size: 14px;
    line-height: 45px;
    color: #787878;
}
.sidenav .menu {
   display: block;
    height: 40px;
   font-size: 14px;
    line-height:40px;
}
.sidenav ul li input{
    margin-right: 8px;
    vertical-align: middle;
}
.sidenav input[type="checkbox"]{
    width : 18px; 
    height: 18px; 
    overflow:hidden; 
    border:0;
    background-color:black;
}
/* 콘텐츠 */
.contents {
   position: absolute;
   width: 970px;
   height: 860px;
   left: 210px;
   box-sizing: border-box;
}

.conTitle {
   width: 850px;
   height: 45px;
   line-height: 45px;
   font-size: 18px;
   text-align: left;
    float: left;
}

#calendar {
   position : absolute;
   width: 930px;
   padding-top: 30px;
   margin: 0;
   
}

/* 출근, 퇴근, qr 스캐너 모달 */
#gomodal {
   display: none;
   position: absolute;
   width: 100%;
   height: 0px;
   float: left;
   z-index: 9999;
   
}
.modal_content {
   position: absolute;
   width: 300px;
   height: 270px;
   padding: 20px 0;
   margin: 180px 315px;
   background: #fefefe;
   z-index: 9999; 
   border : 1px solid gray;
   
}
.close {
   width: 100px;
   height: 32px;
   background-color: #5A3673;
   color: #F2F2F2;
   border: none;
   border-radius: 3px;
}
/* .modal_layer {
   position: fixed;
   top: 0;
   left: 0;
   width: 100%;
   height: 100%;
   background: rgba(0, 0, 0, 0.5);
} */


.fc-license-message {
   display: none;
}


.fc-event {
   cursor: pointer;
}
</style>
<script>

   document.addEventListener('DOMContentLoaded',function() {
                  /* var elems = document.querySelectorAll('.modal');
                  var instances = M.Modal.init(elems); */
                  function test111(){
                	  var test = $(".fc-content-skeleton");
                	  test.find(".fc-content").remove();
                  }
                  $("input[name='chk']").change(function(){
                		$(".result").load(window.location.href + ".result")
                	});
                  
                  var calendarEl = document.getElementById('calendar');
                  
                  var calendar = new FullCalendar.Calendar(calendarEl,{
                           height : 600,
                           plugins : [ 'interaction', 'dayGrid' ],
                           defaultView : 'dayGridMonth',
                           defaultDate : new Date(),
                           header : {
                              left : 'prevYear,prev,next,nextYear today',
                              center : 'title',
                              right : 'dayGridMonth,dayGridWeek,dayGridDay'
                           },
                           locale : 'ko',
                           eventLimit : true,
                           eventLimitText : "more",
                           eventLimitClick : "popover",
                           editable : false,
                           droppable : true,
                           
                           //해당 일정 클릭하면 모달 생성
                 eventClick : function(info) {
                              var eventObj = info.event;
                              console.log(eventObj);
                              alert("클릭함");
                              if $("input:checkbox[name=chk]").is(":checked"){
                            	  var allData = {"valueChk": "1"};
                            	  $(".fc-event-container").click(function(){
                            	      $.ajax({
                                    	  contentType : 'application/json; charset:UTF-8',
                                          url: '${pageContext.request.contextPath}/schedule/list',
                                          type: 'get',
                                          dataType : 'json',
                                          data : allData,
                                         success : function(result) {
                                            var events = [];
                                            if (result != null) {
                                               $.each(result, function(index, element) {
                                                  //모달생성
                                                    $(".fc-event-container").click(function(){
                                                       $("#gomodal").attr("style", "display:block");
                                                       var bname = element.bname;
                                                       var uname = element.uname;
                                                       console.log("글이름 : " + bname);
                                                       console.log("글쓴이 : " + uname);
                                                       for (var i = 0; i < uname.length; i++) {
                                                        console.log("이름 확인 : "+uname[i]);
                                                     }
                                                          /* console.log(index[0].uname); */
                                                       
                                                       
                                                       console.log("확인 render" + element.uname + "," + bname);
                                                     var startdate = moment(eventObj.start).format('YYYY-MM-DD');
                                                     var enddate = moment(eventObj.end).format('YYYY-MM-DD');
                                                     console.log("시작일" + startdate);
                                                     $(".modal_content #title").text(eventObj.title);
                                                     $(".modal_content #pname").text(eventObj.title);
                                                     $(".modal_content #startdate").text(startdate);
                                                     $(".modal_content #enddate").text(enddate);
                                                     
                                                     /* for (var i = 0; i < index.length; i++) {
                                                        $(".modal_content").append('<input type="text" name="uname" value="'+ index[i].uname + '">'+index[i].uname+'<br>');
                                                     } */
                                                     /* $(".modal_content #url").text(uname); */
                                                    });
                                                  /* $("#successModal").modal("show"); */
                                                  $(".close").click(function(){
                                                       $("#gomodal").attr("style", "display:none");
                                                       });
                                                  /* $(".modal_content .modalTitle").text(eventObj.start); */
                                                  /* if (eventObj.url) { 
                                                      alert('Clicked '+ eventObj.title + '.\n'
                                                           + 'Will open ' + eventObj.url + ' in a new tab');
                                                           window.open(eventObj.url);
                                                           info.jsEvent.preventDefault(); // prevents browser from following link in current tab.
                                                  } else {
                                                     alert('Clicked ' + eventObj.title);
                                                  } */
                                                  }); //.each()
                                            }//if end   */
                                      }//success: function end                          
                                }); //ajax end
                            	  }
                              }
                              
                          
                      /*         $(".fc-event-container").click(function(){
                                  $("#gomodal").attr("style", "display:block");
                                  
                        
                      }); */
                     },
                     //달력에 일정 출력
                     events : function (info, callback) {
                              console.log("###########aaa");
                               $("input[name='chk']").click(function(){
                                 var checkArr = $(this).val();     // 배열 초기화
                                 console.log(checkArr); 
                                             
                                  $.ajax({
                                     contentType : 'application/json; charset:UTF-8',
                                      url : '${pageContext.request.contextPath}/schedule/list',
                                      type : 'get',
                                      dataType : 'json',
                                      data: {"valueChk": checkArr},
                                      success : function(result) {
                                    	    alert("출력성공");
                                       		var events = [];
                                       		
                                          	if (result != null) {
                                             $.each(result, function(index, element) {
                                                console.log(element);
                                                var sstart = element.sstart;
                                                var send = element.send;
                                                var bname = element.bname;
                                                var pno = element.pno;
                                                console.log("#######" + pno);
                                                var startdate = moment(sstart).format('YYYY-MM-DD');
                                                var enddate = moment(send).format('YYYY-MM-DD'); 
                                                var aaa = startdate + "/" + bname;
                                                console.log("확인 event" + startdate + "," + bname);
	                                                events.push({
	                                                		id : pno,
	                                                      title : aaa,
	                                                      start : startdate,
	                                                      end : enddate,
	                                                      /* url: "${pageContext.request.contextPath }/detail.do?seq="+element.seq,
	                                                      color:"#ff3399"   */
	                                                }); 
                                                }); //.each()
                                             console.log("each 끝");
                                          }//if end  
                                          console.log("if 끝");
                                          /* failureCallback(" "); */
                                          callback(events);
                                          /* successCallback(events).remove(); */ 
                                       }//success: function end   
                                  });
                              }) 
                           }, //events:function end
                        });//new FullCalendar end
                  		calendar.render();
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
            <li class="menu">일정</li>
            <li class="menu"><input type="checkbox" name="chk" class="sche" value="1" onclick="checkOneS(this)" >전체 일정</li>
            <li class="menu"><input type="checkbox" name="chk" class="sche" value="2" onclick="checkOneS(this)">내가 등록한 일정</li>
            <li class="menu"><input type="checkbox" name="chk" class="sche" value="3" onclick="checkOneS(this)">초대받은 일정</li>
            
            <li class="menu">업무</li>
            <li class="menu"><input type="checkbox" name="chk" class="task" value="4" onclick="checkOneT(this)" >전체 업무</li>
            <li class="menu"><input type="checkbox" name="chk" class="task" value="5" onclick="checkOneT(this)">내가 등록한 업무</li>
            <li class="menu"><input type="checkbox" name="chk" class="task" value="6" onclick="checkOneT(this)">요청 업무</li>
         </ul>
      </div>
      <div class="contents">
         <div class="article">
            <div class="conTitle">일정 : 프로젝트 이름</div>
            <button type="button" class="close" data-dismiss="modal"
                  aria-label="Close" onclick="location.href=''">닫기</button>
            <!-- 달력 -->
            <div id='calendar'></div>
            <!-- 달력 모달 -->
            <div id="gomodal">
            <div class="modal_layer"></div>
            <div class="modal_content">
               <div id="title"></div>
               <div id="pname"></div>
               <div id="startdate"></div>
               <div id="enddate"></div>
               <div id="enddate"></div>
               <div id="people"></div>
               <div id="url"><a href=""></a></div>
               <button type="button" class="close" data-dismiss="modal"
                     aria-label="Close">
                     <span aria-hidden="true">&times;</span>
                  </button> 
            </div>
         </div>   
         </div>
         
      </div>
   </div>
   <script>
   function checkOneS(a){
      console.log("###checkOneS");
      console.log("###this: " +  a);
      var obj1 = document.getElementsByClassName('sche');
      console.log("###obj1.length: " +  obj1.length);
      for (var i = 0; i < obj1.length; i++) {
         console.log("###obj1[i]: " +  obj1[i]);
         if (obj1[i] != a) {
            obj1[i].checked = false;
         }
      }
   }
   function checkOneT(a){
      console.log("checkOneT");
      console.log("this: " +  a);
      var obj2 = document.getElementsByClassName('task');
      console.log("###obj2.length: " +  obj2.length);
      for (var i = 0; i < obj2.length; i++) {
         console.log("###obj2[i]: " +  obj2[i]);
         if (obj2[i] != a) {
            obj2[i].checked = false;
         }
      }
   }
      /* $('input[type='checkbox']') */
      /* $("input[name='chk']").change(function(){
         
      }) */
      
      
   
   </script>
</body>
</html>