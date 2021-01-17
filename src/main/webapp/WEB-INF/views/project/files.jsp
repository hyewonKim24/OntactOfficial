<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <sec:csrfMetaTags />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ontact, 서로 연결되는 온라인 공간</title>
    <link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
        rel="stylesheet">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>

<style>
    * {
        margin: 0;
    }

    html,
    body {
        width: 100%;
        height: 100%;
        position: relative;
        font-size: 14px;
        font-family: Noto Sans KR;
        line-height: 1.15;
        background-color: rgb(242, 242, 242);
    }

    a {
        text-decoration: none;
        color: #333333;
    }

    .header {
        position: relative;
        width: 100%;
        height: 60px;
        background-color: #fff;
    }

    .header div {
        width: 1200px;
        height: 60px;
        margin: 0 auto;
    }

    input:focus {
        outline: none;
    }

    /* 본문 */
    .main {
        position: relative;
        width: 1200px;
        height: 100%;
        margin: 0 auto;
    }

    /*위 메뉴*/
    .title {
        width: 100%;
        height: 33px;
        margin: 7px 0;
        background-color: rgb(242, 242, 242);
        position: relative;
        padding:10px 0;
    }
    .title_cate{
    position: relative;
    display: inline-block;
    font-size: 17px;
    line-height: 33px;
    font-weight: bold;
    color: #111;
    cursor: pointer;
    }

    .title_func {
        float: right;
        vertical-align: middle;
    }

    .contents{
        width:100%;
        height:100%;
        display:flex;
    }
    .title_close{
        width: 70px;
        background: #555;
        color: #fff;
        border-radius: 3px;
        border-color: #555;
        text-align: center;
        display: inline-block;
        box-sizing: border-box;
        border: 1px solid #d4d4d4;
    }
    .title_down{
        display: inline-block;
        background: #fff;
        border-radius: 3px;
        box-sizing: border-box;
        border: 1px solid #d4d4d4;
        position: relative;
    }
    .title_down img{
        width:24px;
        left:6px;
        top:2.5px;
        position:absolute;
    }
    .btn{
        display: inline-block;
        height: 31px;
        line-height: 31px;
        font-weight: bold;
        color:#b9b9b9;
    }
    .title_down span{
        padding: 0 8px 0 34px;
        /* background: url(../img/chat-04.png) no-repeat -40% center; */
    }


    /* 왼쪽 메뉴 */
    .file_menu {
        width: 250px;
        height: 100%;
        overflow-x:hidden;
        overflow-y: hidden;
        background-color: #fff;
        border: 1px solid #e2e2e2;
        border-radius: 5px 0 0 5px;
    }

    /* .file_format_sub {
        padding: 0 19px;
        height: 49px;
        line-height: 49px;
        font-weight: bold;
        border-bottom: 1px solid #e2e2e2;
        box-sizing: border-box;
    } */

    .file_tree_sub {
        padding: 0 19px;
        height: 49px;
        line-height: 49px;
        font-weight: bold;
        border-bottom: 1px solid #e2e2e2;
        box-sizing: border-box;
    }

    .file_tree_search {
        margin: 14px 14px 10px 14px;
        padding: 4px 8px;
        background: #f5f5f5;
    }

    .file_tree_search_input {
        width: 100%;
        font-size: 14px;
        border: none;
        background-color: #f5f5f5;
    }

    .project_all a {
        position: relative;
        height: 38px;
        line-height: 38px;
    }

    .project_all>a::after {
        display: block;
        content: "";
        position: absolute;
        bottom: 0;
        left: 19px;
        width: 200px;
        height: 1px;
        background: #e2e2e2;
    }

    /* .project_all a em{
        position: relative;
        width: 14px;
        height: 14px;
        margin-top: 13px;
        border-radius: 2px;
        background: #5f5ab9;
    } */
    .project_list a {
        padding-left: 9px;
    }

    .project_all a {
        padding: 0 20px 0 20px;
    }

    .project_list_sub {
        position: relative;
        padding: 0 20px 0 20px;
        height: 28px;
        line-height: 28px;
        cursor:pointer;
    }

    .project_all:hover,
    .project_list_sub:hover {
        background-color: #f5f5f5;
    }

    /*오른쪽 메뉴*/
    .file_list {
        width:944px;
        padding: 0;
        height: 100%;
        background: #fff;
        border: 1px solid #e2e2e2;
        border-left: none;
        border-radius: 0 5px 5px 0;
        -moz-border-radius: 0 5px 5px 0;
        -webkit-border-radius: 0 5px 5px 0;
        margin-left:4px;
    }

    .file_list_index {
         /* width: 988.31px; */
        display: flex;
        padding: 0 9px 0 20px;
        height: 49px;
        line-height: 49px;
        font-weight: bold;
        color: #888;
        text-align: center;
        border-bottom: 1px solid #e2e2e2;
        position: relative;
    }
    .filetable{
    	cursor:pointer;
    }
    .arrow{
        font-size:11px;
        font-weight: bolder;
    }
    input[type="checkbox"]{
        display:none;
    }
    input[type="checkbox"] + label{
        display:inline-block;
        width:20px;
        height:48px;
        background:url('${pageContext.request.contextPath}/resources/img/checked-2-01.png') no-repeat 0 50%;
        background-size:20px 20px;
    }
    input[type="checkbox"]:checked + label{
        background:url('${pageContext.request.contextPath}/resources/img/checked-2-02.png') no-repeat center / contain;
    }
    .file_list_tr:hover{
    	background-color: rgb(242, 242, 242);
    }
    .file_list_fname{
        width:644.31px;
    }
    .file_tr_fname{
        padding-left:54px;
        width:577px;
    }
    .file_list_fsize,
    .file_tr_fsize{
        width:87px;
    }
    .file_list_uname,
    .file_tr_uname{
        width:93px;
    }
    .file_list_fdate,
    .file_tr_fdate{
        width:163px;
    }
    .file_list_tr{
        position: relative;
        padding: 0 9px 0 20px;
        height: 49px;
        line-height: 49px;
        display:flex;
        cursor:pointer;
        border-bottom: 1px solid #e2e2e2;
        color:#333;
    }
    .center{
        text-align: center;
    }
    .listfname{
        /* background-color:gray; */
        padding-left: 6%;
        position: relative;
    /* background-repeat: no-repeat;
    background-size: 27px 27px;
    background-position: 20px 50%; */
    }
    .ficon{
        position:absolute;
        left:20px;
        top:10px;
        width:27px;
        height:27px;
    }
    .notfile{
    margin: 34vh 0;
    padding-top: 10px;
    height: 100%;
    text-align: center;
    }
    .notfile h2{
    margin-top:20px;
    font-size: 20px;
    font-weight: bold;
    color: #777;
    }

</style>

<body>
    <div class="header">
        <div>헤더 들어갈 자리</div>
    </div>
    <div class="main">
        <div class="title">
            <div class="title_cate">전체</div>
            <div class="title_func">
                <a class="title_down" style="cursor:default">
                    <img src="${pageContext.request.contextPath}/resources/img/download-02.png" id="down_img">
                    <span class="title_down_btn btn">다운로드</span>
                </a>
            	<a class="title_down" style="cursor:default">
                    <img src="${pageContext.request.contextPath}/resources/img/download-02.png" id="del_img">
                    <span class="title_del_btn btn">선택삭제</span>
                </a>
                <a class="title_close" style="cursor:pointer">
                    <span class="title_close_btn btn">닫기</span>
                </a>
            </div>
        </div>
        <div class="contents">
            <div class="file_menu">
                <ul>
                    <!-- <li class="file_format">
                        <div class="file_format_sub">파일 형태</div>
                    </li> -->
                    <li class="file_tree">
                        <div class="file_tree_sub">프로젝트</div>
                        <div class="file_tree_search">
                            <input type="text" placeholder="프로젝트 검색" class="file_tree_search_input" maxlength="50">
                        </div>
                        <ul class="project_list">
                            <li class="project_all">
                                <a href="${pageContext.request.contextPath}/files/list" style="cursor:pointer; display:block;">
                                    <span>전체 프로젝트</span>
                                </a>
                            </li>
                            <c:forEach items="${listpj}" var="pj">
                            <li class="project_list_sub">
                                <a class="pjlist" style="cursor:pointer;">
                                    <span>${pj.pname }</span>
                                    <input type="hidden" value="${pj.pno}" class="pno">
                                </a>
                            </li>
                            </c:forEach>
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="file_list">
                <div class="file_list_index">
                    <div class="file_chk">
                        <input type="checkbox" id="file_list_all">
                        <label for="file_list_all" class="file_list_all" style="cursor:pointer;"></label>
                    </div>
                    <div class="file_list_fname filetable">파일명 <span class="arrow">↓</span></div>
                    <div class="file_list_fsize filetable">크기 <span class="arrow">↓</span></div>
                    <div class="file_list_uname filetable">등록자 <span class="arrow">↓</span></div>
                    <div class="file_list_fdate filetable" style="text-decoration: underline; font-weight:700; color:#111;'">최근 업로드순 <span class="arrow">↓</span></div>
                </div>
                
                <c:if test="${empty flist}" >
                <div class="notfile">
                    <img src="${pageContext.request.contextPath}/resources/img/important.png" style="width:50px">
                    <h2>해당 경로에 파일이 존재하지 않습니다.</h2>
                </div>
                </c:if>
                
                <c:if test="${not empty flist}" >
                <div class="file_list_wrapper">
	                <c:forEach items="${flist}" var="file" varStatus="e">
	                <div class="file_list_tr">
	                    <div class="file_chk">
	                        <input type="checkbox" id="file_list_all${e.count}" class="file_list_chk" name="fname" value="${file.fname}">
	                        <label for="file_list_all${e.count}" class="file_list_chk" style="cursor:pointer;"></label>
	                    </div>
	                    <div class="file_tr_fname listfname">
	                        <img src="${pageContext.request.contextPath}/resources/img/download-03.png" class="ficon">
	                        ${file.foriginalname}
	                    </div>
	                    <div class="file_tr_fsize center">${file.fsize }</div>
	                    <div class="file_tr_uname center">${file.uname}</div>
	                    <div class="file_tr_fdate center">${file.fdate}</div>
	                    <input type="hidden" value="${file.fname }" class="file_list_fname">
	                </div>
					</c:forEach>
				</div>
				</c:if>
            </div>
        </div>
    </div>
    
    <script>
    imageChange();
    let header = $("meta[name='_csrf_header']").attr("content");
    let token = $("meta[name='_csrf']").attr("content");
    
    // 업로드 된 파일 이미지 설정 변경
	function imageChange(){
	    $(".file_list_chk").each(function(index){
	        let fname = $(this).val();
	        let parent = $(this).parents('.file_list_tr');
	        if(fname.substr(12,2)==="s_"){
	            parent.find(".ficon").attr("src", "${pageContext.request.contextPath}/resources/img/image.png");
	        }
	    })
	}	
    		//전체선택
    		var input=$("input[type=checkbox]");
    		var allLength = input.length;
            $(document).on("click","#file_list_all",function(){
    		//$("#file_list_all").on('click',function(){
				if($("#file_list_all").is(":checked")){
					$(".file_list_chk").prop("checked", true);
					$(".file_list_tr").css("background-color","#f0ecf8")
					$(".title_down_btn").css("color","#333");
					$("#down_img").attr("src","${pageContext.request.contextPath}/resources/img/download-01.png");
				}
				else{
					$(".file_list_chk").prop("checked", false);
					$(".file_list_tr").removeAttr("style");
					$("#down_img").attr("src","${pageContext.request.contextPath}/resources/img/download-02.png")
					$(".title_down_btn").removeAttr("style");
				}
			});
         // 클릭시 색상 변경+선택
          $(document).on("click",".file_list_tr",function(e){
			//$(".file_list_tr").on('click',function(e){
				 e.stopPropagation()
				let check = $(this).find(".file_list_chk");
				
				if(check.is(":checked")){
					console.log("li누르는애")
					check.prop("checked",false);
					$(this).removeAttr("style");
				} else {
					console.log("뭐가nnb")
					check.prop("checked", true);
					$(this).css("background-color","#f0ecf8");
				}
				
				var checkedinput = $("input:checked").length;
				if(allLength != checkedinput){
					$("#file_list_all").prop("checked",false);
				}
				if(checkedinput!=0){
					console.log(checkedinput+"ㅠㅠ")
					$(".title_down_btn").css("color","#333");
					$("#down_img").attr("src","${pageContext.request.contextPath}/resources/img/download-01.png")
				} else {
					console.log(checkedinput+"0일때")
					$(".title_down_btn").removeAttr("style");
					$("#down_img").attr("src","${pageContext.request.contextPath}/resources/img/download-02.png")
				}
			})
			
			// 다중파일 다운로드
			$(document).on("click",".title_down",function(){
			//$(".title_down").click(function(){
				var interval = 1000;
				var checkedinput = $("input:checked").length;
				if(checkedinput!=0){
					let check = $("input[class=file_list_chk]:checked");

					$(check).each(function (index) {
						let fname = $(this).parents(".file_list_tr").find(".file_list_fname").val();
							setTimeout(function(){
								window.location = "${pageContext.request.contextPath}/files/download?fileName=" + fname;
							}, interval * (index +1));
					})
				}
			})
			
			// 프로젝트 검색
	            $(".file_tree_search_input").keyup(function() {
	                var k = $(this).val();
	                $(".project_list_sub").hide();
	                var temp = $(".project_list_sub a span:contains('" + k + "')");
						
	                $(temp).parents('.project_list_sub').show();
	                
	                if(k==="")
	                	$(".project_list_sub").show();
	            })
			
	        //파일 이름 정렬
			$(".file_list_fname").click(function(){
				let arrow = $(this).children().html();
				if(arrow==="↓"){
					$.ajax({
						url: "${pageContext.request.contextPath}/files/fnameasc",
						type: "POST",
						beforeSend: function (xhr) {
							xhr.setRequestHeader(header, token);	// 헤드의 csrf meta태그를 읽어 CSRF 토큰 함께 전송
						},
						success: function (list) {
						    console.log(list);
						    $(".arrow").html("↓");
						    $(".file_list_fname").children().html("↑");
						    $(".file_list_fname").css({'text-decoration':'underline', 'font-weight':'700', 'color':'#111'});
						    $(".file_list_fsize").removeAttr("style");
						    $(".file_list_uname").removeAttr("style");
						    $(".file_list_fdate").removeAttr("style");
						    printFiles(list);
						}
					})
				} else {
					$.ajax({
						url: "${pageContext.request.contextPath}/files/fnamedesc",
						type: "POST",
						beforeSend: function (xhr) {
							xhr.setRequestHeader(header, token);	// 헤드의 csrf meta태그를 읽어 CSRF 토큰 함께 전송
						},
						success: function (list) {
						    console.log(list);
						    $(".arrow").html("↓");
						    $(".file_list_fname").children().html("↓");
						    $(".file_list_fname").css({'text-decoration':'underline', 'font-weight':'700', 'color':'#111'});
						    $(".file_list_fsize").removeAttr("style");
						    $(".file_list_uname").removeAttr("style");
						    $(".file_list_fdate").removeAttr("style");
						    printFiles(list);
						}
					})				
				}
			}); 
			
			//파일 사이즈 정렬
			$(".file_list_fsize").click(function(){
				let arrow = $(this).children().html();
				if(arrow==="↓"){
					$.ajax({
						url: "${pageContext.request.contextPath}/files/fsizeasc",
						type: "POST",
						beforeSend: function (xhr) {
							xhr.setRequestHeader(header, token);	// 헤드의 csrf meta태그를 읽어 CSRF 토큰 함께 전송
						},
						success: function (list) {
						    console.log(list);
						    $(".arrow").html("↓");
						    $(".file_list_fsize").children().html("↑");
						    $(".file_list_fsize").css({'text-decoration':'underline', 'font-weight':'700', 'color':'#111'});
						    $(".file_list_fname").removeAttr("style");
						    $(".file_list_uname").removeAttr("style");
						    $(".file_list_fdate").removeAttr("style");
						    printFiles(list);
						}
					})
				} else {
					$.ajax({
						url: "${pageContext.request.contextPath}/files/fsizedesc",
						type: "POST",
						beforeSend: function (xhr) {
							xhr.setRequestHeader(header, token);	// 헤드의 csrf meta태그를 읽어 CSRF 토큰 함께 전송
						},
						success: function (list) {
						    console.log(list);
						    $(".arrow").html("↓");
						    $(".file_list_fsize").children().html("↓");
						    $(".file_list_fsize").css({'text-decoration':'underline', 'font-weight':'700', 'color':'#111'});
						    $(".file_list_fname").removeAttr("style");
						    $(".file_list_uname").removeAttr("style");
						    $(".file_list_fdate").removeAttr("style");
						    printFiles(list);
						}
					})				
				}
			})        
			
			//파일 등록자 정렬
			$(".file_list_uname").click(function(){
				let arrow = $(this).children().html();
				if(arrow==="↓"){
					$.ajax({
						url: "${pageContext.request.contextPath}/files/unameasc",
						type: "POST",
						beforeSend: function (xhr) {
							xhr.setRequestHeader(header, token);	// 헤드의 csrf meta태그를 읽어 CSRF 토큰 함께 전송
						},
						success: function (list) {
						    console.log(list);
						    $(".arrow").html("↓");
						    $(".file_list_uname").children().html("↑");
						    $(".file_list_uname").css({'text-decoration':'underline', 'font-weight':'700', 'color':'#111'});
						    $(".file_list_fname").removeAttr("style");
						    $(".file_list_fsize").removeAttr("style");
						    $(".file_list_fdate").removeAttr("style");
						    printFiles(list);
						}
					})
				} else {
					$.ajax({
						url: "${pageContext.request.contextPath}/files/unamedesc",
						type: "POST",
						beforeSend: function (xhr) {
							xhr.setRequestHeader(header, token);	// 헤드의 csrf meta태그를 읽어 CSRF 토큰 함께 전송
						},
						success: function (list) {
						    console.log(list);
						    $(".arrow").html("↓");
						    $(".file_list_uname").children().html("↓");
						    $(".file_list_uname").css({'text-decoration':'underline', 'font-weight':'700', 'color':'#111'});
						    $(".file_list_fname").removeAttr("style");
						    $(".file_list_fsize").removeAttr("style");
						    $(".file_list_fdate").removeAttr("style");
						    printFiles(list);
						}
					})				
				}
			})        
			
			//파일 등록자 정렬
			$(".file_list_fdate").click(function(){
				let arrow = $(this).children().html();
				if(arrow==="↓"){
					$.ajax({
						url: "${pageContext.request.contextPath}/files/fdateasc",
						type: "POST",
						beforeSend: function (xhr) {
							xhr.setRequestHeader(header, token);	// 헤드의 csrf meta태그를 읽어 CSRF 토큰 함께 전송
						},
						success: function (list) {
						    console.log(list);
						    $(".arrow").html("↓");
						    $(".file_list_fdate").children().html("↑");
						    $(".file_list_fdate").css({'text-decoration':'underline', 'font-weight':'700', 'color':'#111'});
						    $(".file_list_fname").removeAttr("style");
						    $(".file_list_fsize").removeAttr("style");
						    $(".file_list_uname").removeAttr("style");
						    printFiles(list);
						}
					})
				} else {
					$.ajax({
						url: "${pageContext.request.contextPath}/files/fdatedesc",
						type: "POST",
						beforeSend: function (xhr) {
							xhr.setRequestHeader(header, token);	// 헤드의 csrf meta태그를 읽어 CSRF 토큰 함께 전송
						},
						success: function (list) {
						    console.log(list);
						    $(".arrow").html("↓");
						    $(".file_list_fdate").children().html("↓");
						    $(".file_list_fdate").css({'text-decoration':'underline', 'font-weight':'700', 'color':'#111'});
						    $(".file_list_fname").removeAttr("style");
						    $(".file_list_fsize").removeAttr("style");
						    $(".file_list_uname").removeAttr("style");
						    printFiles(list);
						}
					})				
				}
			})        
			
	    // 정렬시 파일리스트 append
		function printFiles(list){
        	 $(".file_list_wrapper").text("");
        	 let html="";
        	 for(let i=0; i<list.length; i++){
        		html += "<div class='file_list_tr'>  <div class='file_chk'>";
        		html += "<input type='checkbox' id='file_list_all"+i+"' class='file_list_chk' name='fname' value='"+list[i].fname+"'>";
        		html += "<label for='file_list_all"+i+"' class='file_list_chk' style='cursor:pointer;'></label></div>";
        		html += "<div class='file_tr_fname listfname'>";
        		if(list[i].fname.substr(12,2)==="s_"){
        			html += "<img src='${pageContext.request.contextPath}/resources/img/image.png' class='ficon'>"+list[i].foriginalname+"</div>"
        		} else {
	        		html += "<img src='${pageContext.request.contextPath}/resources/img/download-03.png' class='ficon'>"+list[i].foriginalname+"</div>";
        		}
        		html += "<div class='file_tr_fsize center'>"+list[i].fsize+"</div>"
        		html += "<div class='file_tr_uname center'>"+list[i].uname+"</div>"
        		html += "<div class='file_tr_fdate center'>"+list[i].fdate+"</div>"
        		html += "<input type='hidden' value='"+list[i].fname+"' class='file_list_fname'></div>"
        	 }
        	 $('.file_list_wrapper').append(html);
         };
         
         // 프로젝트 눌렀을 때 이동
         $(".project_list_sub").click(function(){
        	let pno = $(this).find('.pno').val();
        	var $form = $('<form></form>');
        	$form.attr('action','${pageContext.request.contextPath}/files/pjlist');
        	$form.attr('method','post');
        	$form.appendTo($(this));
        	
        	let csrf = $('<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />');
        	let pjlink = $('<input type="hidden" name="pno" value="'+pno+'">');
        	
        	$form.append(csrf).append(pjlink);
        	$form.submit();
        	//let a = $(this).children();
        	//a.attr("href","${pageContext.request.contextPath}/files/pjlist?pno=" + pno);
			//a.get(0).click();
        })
			
   </script>
</body>

</html>