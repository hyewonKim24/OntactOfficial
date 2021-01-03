<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="_csrf_header" content="${_csrf.headerName}" />
<meta name="_csrf" content="${_csrf.token}" />
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>

<style>
.id_input_re_1 {
	color: green;
	display: none;
}
/* 중복아이디 존재하는 경우 */
.id_input_re_2 {
	color: red;
	display: none;
}
</style>
</head>

<body>

	<h1>Register</h1>
	<form action="${pageContext.request.contextPath}/busjoin" method="post">
		<div>
			id <input type="text" class="form_input" name="uemail" id="uemail"
				required>
		</div>
		<span class="id_input_re_1">사용 가능한 아이디입니다.</span> <span
			class="id_input_re_2">아이디가 이미 존재합니다.</span>
		<div>
			pw <input type="password" class="form_input" name="upwd" id="upwd">
		</div>
		<div>
			name <input type="text" class="form_input" name="uname" id="uname"
				required>
		</div>
		<div>
			회사명 <input type="text" class="form_input" name="cname" id="cname"
				required>
		</div>
		<div>
			회사url <input type="text" class="form_input" name="curl" id="curl"
				required>
		</div>
		<div>
			회사직종<select class="form_select" name="ccate" id="ccate" required>
				<option value="제조">제조</option>
			</select>
		</div>
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
		<div>
			<input type="submit" value="회원가입" id="submit" disabled="disabled"/>
		</div>
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
	</form>

	<script>
var header = $("meta[name='_csrf_header']").attr("content");
var token = $("meta[name='_csrf']").attr("content");

$(document).ready(function(){
	$('#uemail').blur(function(){
		var userEmail = $('#uemail').val();// .id_input에 입력되는 값
		var data = {uemail : userEmail}// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
		
		$.ajax({
			method : "POST",
			url : "${pageContext.request.contextPath}/emailChk",
			data : data,
			beforeSend: function(xhr){
				xhr.setRequestHeader(header, token);	// 헤드의 csrf meta태그를 읽어 CSRF 토큰 함께 전송
			},
			success : function(result){
				if(result != 'fail'){
					$('.id_input_re_1').css("display","inline-block");
					$('.id_input_re_2').css("display", "none");		
					$("#submit").removeAttr("disabled");
				} else {
					$('.id_input_re_2').css("display","inline-block");
					$('.id_input_re_1').css("display", "none");	
					$("#submit").attr("disabled","disabled")
				}		
			}
		}); // ajax 종료
	});// function 종료
});

</script>

</body>
</html>