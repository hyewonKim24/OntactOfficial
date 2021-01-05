<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<link href='../packages/core/main.css' rel='stylesheet' />
<link href='../packages/daygrid/main.css' rel='stylesheet' />
<link href='../packages/timegrid/main.min.css' rel="stylesheet"/>
<script src='../packages/core/main.js'></script>
<script src='../packages/interaction/main.js'></script>
<script src='../packages/daygrid/main.js'></script>
<script src='../packages/timegrid/main.min.js'></script>
<script src='../packages/daygrid/main.js'></script>
<script>

  document.addEventListener('DOMContentLoaded', function() {

    var calendarEl = document.getElementById('calendar');
    
    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'interaction', 'dayGrid' ],
      header: {
        left: 'prevYear,prev,next,nextYear today',
        center: 'title',
        right: 'dayGridMonth,dayGridWeek,dayGridDay'
      },
      local : "ko",
      navLinks: true, // can click day/week names to navigate views
      editable: true,
      eventLimit: true, // allow "more" link when too many events
      events: function(start, end, callback) { 
	   		$.ajax({
	   			url: '/myPlan', 
	   			dataType: 'json', 
	   			success: function(plan) {
	   				var events = [];
	   				//여기서 0번째로 테스트 중입니다.
	   				$.each(plan,function(){
	   					events.push({title:"hi",start:plan.plan[0].date})

	   				});
	   				console.log(plan);//배열로 잘 나옵니다.
	   				console.log(plan.plan[0].title);//여기도 잘 나옵니다.
// 	   				var events = eval(plan.jsonTxt); 
	   				callback(events); //여기서 오류 나더라구요
	   				} 
	   		}); 
   		}, 	
      
      // [
      //   {
      //     title: '안녕하세요',
      //     start: '2021-01-01'
      //   },
      //   {
      //     title: 'Long Event',
      //     start: '2020-01-07',
      //     end: '2021-01-10'
      //   },
      //   {
      //     groupId: 999,
      //     title: 'Repeating Event',
      //     start: '2021-02-09T16:00:00'
      //   },
      //   {
      //     groupId: 999,
      //     title: 'Repeating Event',
      //     start: '2021-02-16T16:00:00'
      //   },
      //   {
      //     title: 'Conference',
      //     start: '2020-02-11',
      //     end: '2020-02-13'
      //   }
      // ]
    });

    calendar.render();
  
    var arrTest = getCalendarDataInDB();
    $.each(arrTest, function(index, item){
        console.log('outer loop_in_cal' + index + ' : ' + item);
        $.each(item, function(iii, ttt){
            console.log('inner loop_in_cal => ' + iii + ' : ' + ttt);
        });
  });

  function getCalendarDataInDB(){
    var arr = [{title: 'evt1', start:'ssssss'}, {title: 'evt2', start:'123123123'}];
    
    //배열 초기화
    var viewData = {};
    //data[키] = 밸류
    viewData["id"] = $("#currId").text().trim();
    viewData["title"] = $("#title").val();
    viewData["content"] = $("#content").val();
    
    $.ajax({
        contentType:'application/json',
        dataType:'json',
        url:'calendar/getall',
        type:'post',
        async: false,
        data:JSON.stringify(viewData),
        success:function(resp){
            //alert(resp.f.id + ' ggg');     
            $.each(resp, function(index, item){
                console.log(index + ' : ' + item);
                $.each(item, function(iii, ttt){
                    console.log('inner loop => ' + iii + ' : ' + ttt);
                });
            });
            arr = resp;
        },
        error:function(){
            alert('저장 중 에러가 발생했습니다. 다시 시도해 주세요.');
        }
    });
    
    return arr;
}

$("#btnAddTest").click(function(){
      //var arr = getCalendarEvent();
      var arr = getCalendarDataInDB();
      //console.log('arr[0].size : ' +  Object.keys( arr[0] ).length );
      $.each(arr, function(index, item){
          calendar.addEvent( item );
          console.log('click evt loop_in_cal' + index + ' : ' + item);
          $.each(item, function(iii, ttt){
                console.log('click evt inner loop_in_cal => ' + iii + ' : ' + ttt);
          });
      });
      
      //calendar.addEvent( {'title':'evt4', 'start':'2019-09-04', 'end':'2019-09-06'});
      calendar.render();
  });  
  //alert( '캘린더에서 알린다!!! 잘 받았다! ' + (arrTest.0.id) );
});

</script>
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 900px;
    margin: 0 auto;
  }

</style>
</head>
<body>

  
<div id='calendar'></div>
<input type="button" id="btnAddTest" value="추가">

</body>
</html>