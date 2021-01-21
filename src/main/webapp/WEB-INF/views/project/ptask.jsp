<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
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

        .contents {
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
            width: 930px;
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
                <li class="menu"><input type="radio" name="chk" value="1" id="id1"><label
                        for="id1">내 업무</label></li>
                <li class="menu"><input type="radio" name="chk" value="2" id="id2"><label
                        for="id2">요청한 업무</label></li>
                <li class="menu"><input type="radio" name="chk" value="3" id="id3"><label
                        for="id3">전체 업무</label></li>


                <li class="menu">상태</li>
                <li class="menu"><input type="checkbox" name="chk" class="task" value="4"  id="id4"><label
                        for="id4"> 요청</label></li>
                <li class="menu"><input type="checkbox" name="chk" class="task" value="5" id="id5"><label
                        for="id5"> 진행</label></li>
                <li class="menu"><input type="checkbox" name="chk" class="task" value="6" id="id7"><label
                        for="id7"> 완료</label></li>
                <li class="menu"><input type="checkbox" name="chk" class="task" value="7" id="id8"><label
                        for="id8"> 보류</label></li>
            </ul>

        </div>
 <script type="text/javascript">
 var checkArr = [];     // 배열 초기화
	$("input[name='chk']").change(function(){
		$("input:checkbox[name=chk]:checked").each(function(i) {
	        checkArr.push($(this).val());// 체크된 것만 값을 뽑아서 배열에 push
	        console.log("뭐야 : " + checkArr);
	    });
		var allData = {"valueChk": checkArr};
		console.log(allData);				
	    $.ajax({
	    	contentType : 'application/json; charset:UTF-8',
	        url: '${pageContext.request.contextPath}/ptask',
	        type: 'get',
	        dataType : 'json',
	        data: allData,
	        success : function(result) {
	        	alert("성공");
				console.log(result);
					var events = [];
					if (result != null) {
						$.each(result, function(index, element) {
							console.log(element);
							var sstart = element.sstart;
							var send = element.send;
							var bname = element.bname;
							
							var startdate = moment(sstart).format('YYYY-MM-DD');
							var enddate = moment(send).format('YYYY-MM-DD'); 
							
							var aaa = startdate + "/" + bname;
							console.log("확인 event" + startdate + "," + bname);
							events.push({
									title : aaa,
									start : startdate,
									end : enddate,
									/* url: "${pageContext.request.contextPath }/detail.do?seq="+element.seq,
									color:"#ff3399"   */
							}); //.push()
							console.log(event); 
						}); //.each()
						console.log(events);
					}//if end  
					successCallback(events);
				}//success: function end   
	    });
	});
    </script>
    
<style>
.icon_task1{
	background-color: #4aaefb;
}
.icon_task2{
	background-color: #50b766;
}
.icon_task3{
	background-color: #2e417e;
}
.icon_task4{
	background-color: #d2d3d6;
}

.icon_task1, .icon_task2, .icon_task3, .icon_task4{
    display: inline-block;
    width: 68px;
    height: 18px;
    line-height: 16px;
    font-size: 12px;
    color: #fff;
    font-weight: 700;
    text-align: center;
    border-radius: 2px;
}


</style>

        <div class="contents">
             	  <input type="hidden" name="pno" id="pno" value="${pno}">
            <div class="ptask_section">
                <div class="task_title">전체 업무(${listCount})</div>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"
                    onclick="location.href=''">닫기</button>
                <div class="atask_list">
                    <table width="100%" class="board-listheader" cellpadding="0" cellspacing="0">
                        
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>상태</th>
                                <th>우선순위</th>
                                <th width="40%;">제목</th>
                                <th>담당자</th>
                                <th>수정일</th>
                            </tr>
                        </thead>
                          <c:forEach var="tasklist" items="${tasklist}" varStatus="status">
                            <tr>
                                <th>${tasklist.bno }</th>
                                <th>
                                <c:choose>
                                <c:when test="${tasklist.tstate  eq '1' }"><span class="icon_task1">요청</span></c:when>
                                <c:when test="${tasklist.tstate  eq '2' }"><span class="icon_task2">진행</span></c:when>
                                <c:when test="${tasklist.tstate  eq '3' }"><span class="icon_task3">완료</span></c:when>
                                <c:when test="${tasklist.tstate  eq '4' }"><span class="icon_task4">보류</span></c:when>
                                </c:choose>
                                </th>
                                <th>${tasklist.tpriority }</th>
                                <th style="text-align: left;"><a href="${pageContext.request.contextPath}/project/ptask?pno=${pno}&bno=${tasklist.bno}">
                                ${tasklist.bname}</a></th>
                                <th>${tasklist.taskmanager}</th>
                                <th>${tasklist.bdate }</th>
                            </tr>
                            </c:forEach>
							<td colspan="6">
							<c:if test="${currentPage <= 1}">
						&lt; &nbsp;
						</c:if> <c:if test="${currentPage > 1}">
									<c:url var="dailyprev" value="/ptask">
										<c:param name="page" value="${currentPage-1}" />
									</c:url>
									<a href="${dailyprev}">&lt; &nbsp; &nbsp; &nbsp; </a>
								</c:if> <!-- 끝 페이지 번호 처리 --> <c:set var="endPage" value="${maxPage}" />
								<c:forEach var="p" begin="${startPage+1}" end="${endPage}">
									<!-- eq : == / ne : != -->
									<c:if test="${p eq currentPage}">
										<font color="red" size="4"><b>${p} &nbsp; &nbsp;
												&nbsp;</b></font>
									</c:if>
									<c:if test="${p ne currentPage}">
										<c:url var="dailychk" value="/ptask">
											<c:param name="page" value="${p}" />
										</c:url>
										<a href="${dailychk}">${p} &nbsp; &nbsp; &nbsp;</a>
									</c:if>
								</c:forEach> <c:if test="${currentPage >= maxPage}"> &nbsp; &gt;
							</c:if> <c:if test="${currentPage < maxPage}">
									<c:url var="dailynext" value="/ptask">
										<c:param name="page" value="${currentPage+1}" />
									</c:url>
									<a href="${dailynext}">&nbsp; &gt;</a>
								</c:if></td>
                </table>
                </div>

            </div>
        </div>

    </div>
</body>

</html>