//<script src="${pageContext.request.contextPath}/resources/js/lightbox.min.js"></script>
var header = $("meta[name='_csrf_header']").attr("content");
var token = $("meta[name='_csrf']").attr("content");

var fileDropDiv = $(".fileDrop");
$("#info_section").on("dragenter dragover drop", function(event) {
	event.preventDefault();
});
fileDropDiv.on("dragenter dragover", function(event) {
	event.preventDefault();
});
fileDropDiv.on("drop", function(event) {
	event.preventDefault();
	// drop 이벤트 발생시 전달된 파일 데이터
	var files = event.originalEvent.dataTransfer.files;
	// 단일 파일 데이터만을 처리하기 때문 첫번째 파일만 저장
	var file = files[0];
	// formData 객체 생성, 파일데이터 저장
	var formData = new FormData();
	formData.append("file", file);
	console.log(formData.get('file'));
	// 파일 업로드 AJAX 통신 메서드 호출
	uploadFile(formData);
});

//파일 업로드 AJAX 통신
function uploadFile(formData){
	$.ajax({
		url:"${pageContext.request.contextPath}/files/upload",
		data:formData,
		dataType:"text",
		processData:false,
		contentType:false,
		type:"POST",
		beforeSend: function(xhr){
			xhr.setRequestHeader(header, token);	// 헤드의 csrf meta태그를 읽어 CSRF 토큰 함께 전송
		},
		success:function(data){
			alert(data);
			printFiles(data);
		}
	})
}

//첨부파일 출력
function printFiles(data) {
    // 파일 정보 처리
    var fileInfo = getFileInfo(data);
    var html = "<li><span class='boardimg'>";
    html += "<img src='" + fileInfo.imgSrc + "' alt='Attachment' class='imgsrc'>";
    html += "</span>"
    html += "<div class='boardimg-info'>"
    html += "<a href='" + fileInfo.originalFileUrl + "' class='boardimg-name'>"
    html += "<i class='fa fa-paperclip'></i>" + fileInfo.originalFileName + "</a>"
    html += "<a href='" + fileInfo.fullName + "' class='boardimg-delbtn'>"
    html += "<i class='fa fa-fw fa-remove'></i></a></div></li>"
    // Handlebars 파일 템플릿 컴파일을 통해 생성된 HTML을 DOM에 주입
    $('.uploadedFileList').append(html);
    // 이미지 파일인 경우 파일 템플릿에 lightbox 속성 추가
    if (fileInfo.fullName.substr(12, 2) === "s_") {
        // 마지막에 추가된 첨부파일 템플릿 선택자
        var that = $('.uploadedFileList li').last();
        // lightbox 속성 추가
        that.find(".boardimg-name").attr("data-lightbox", "uploadImages");
        // 파일 아이콘에서 이미지 아이콘으로 변경
        that.find(".fa-paperclip").attr("class", "fa fa-camera");
    }
}

//게시글 입력/수정 submit 처리시에 첨부파일 정보도 함께 처리
function filesSubmit(that) {
    var str = "";
    $(".uploadedFileList .delBtn").each(function (index) {
        str += "<input type='hidden' name='files[" + index + "]' value='" + $(this).attr("href") + "'>"
    });
    that.append(str);
    that.get(0).submit();
}
// 파일 삭제(입력페이지) : 첨부파일만 삭제처리
function deleteFileWrtPage(that) {
    var url = "${pageContext.request.contextPath}/files/delete";
    deleteFile(url, that);
}
// 파일 삭제 AJAX 통신
function deleteFile(url, that) {
    $.ajax({
        url: url,
        type: "post",
        data: {fileName: that.attr("href")},
        dataType: "text",
        success: function (result) {
            if (result === "DELETED") {
                alert("삭제되었습니다.");
                that.parents("li").remove();
            }
        }
    });
}
// 파일 정보 처리
function getFileInfo(fullName) {

    var originalFileName;   // 화면에 출력할 파일명
    var imgSrc;             // 썸네일 or 파일아이콘 이미지 파일 출력 요청 URL
    var originalFileUrl;    // 원본파일 요청 URL
    var uuidFileName;       // 날짜경로를 제외한 나머지 파일명 (UUID_파일명.확장자)

    // 이미지 파일이면
    if (checkImageType(fullName)) {
        imgSrc = "${pageContext.request.contextPath}/files/display?fileName=" + fullName; // 썸네일 이미지 링크
        uuidFileName = fullName.substr(14);
        var originalImg = fullName.substr(0, 12) + fullName.substr(14);
        // 원본 이미지 요청 링크
        originalFileUrl = "${pageContext.request.contextPath}/files/display?fileName=" + originalImg;
    } else {
        imgSrc = "${pageContext.request.contextPath}/resources/img/attachment.png"; // 파일 아이콘 이미지 링크
        uuidFileName = fullName.substr(12);
        // 파일 다운로드 요청 링크
        originalFileUrl = "${pageContext.request.contextPath}/files/display?fileName=" + fullName;
    }
    originalFileName = uuidFileName.substr(uuidFileName.indexOf("_") + 1);

    return {originalFileName: originalFileName, imgSrc: imgSrc, originalFileUrl: originalFileUrl, fullName: fullName};
}

// 이미지 파일 유무 확인
function checkImageType(fullName) {
    var pattern = /jpg$|gif$|png$|jpge$/i;
    return fullName.match(pattern);
}