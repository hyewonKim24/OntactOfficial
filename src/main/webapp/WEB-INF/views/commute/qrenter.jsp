<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ontact, 서로 연결되는 온라인 공간</title>
<link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jsQr.js"></script>
<style type="text/css">
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
	.contents{
        position: relative;
        width: 510px;
        height: 700px;    
        box-sizing: border-box;
    }
	.article {
		position: absolute;
		width:510px;
		height:700px;
		text-align: center;
	}
	.conTitle{
        width: px;
        height: 40px;
        line-height: 40px;
        padding: 20px 0;
		font-size: 32px;
		font-weight: 700
    }
	.frame_wrap, .info {
		width:100%;
		margin-bottom: 20px;
	}
	#frame canvas{
		width: 510px;
		height: 400px;
	}
	div#output {
		background-color: #e7e7e7;
		height: 80px;
		line-height: 80px;
		font-size: 16px;
		padding:8px;
		margin : 0; 
		text-align: center;
	}
/*     
	div#frame {
		border:1px solid #005666;
		background-color:#FFFFFF;
		padding:8px;
	}
	div#outputLayer {
		text-align:left;
	}
	canvas {
		width:100%;
	} */
</style>
<script>
	/* $(document).ready(function() {
		var info = $("#outputData").val();
		if(info != null && info != ("")) 
			alert('출근이 인증되었습니다'); 						
	}); */
</script>
</head>
<body>

        <div class="contents">
			<div class="article">
				<div class="conTitle">QR스캔</div>
				<div class="frame_wrap">
					<div id="frame">
						<div id="loadingMessage">
							🎥 비디오 스트림에 액세스 할 수 없습니다<br/>웹캠이 활성화되어 있는지 확인하십시오
						</div>
						<canvas id="canvas"></canvas>
					</div>
				</div>
				<div class="info">
					<div id="output">
						<div id="outputMessage">
							QR코드를 카메라에 노출시켜 주세요
						</div>
						<form name="formEnter" id="frm">
						<div class="outputLayer" hidden>
							<textarea id="outputData" style="width: 490px;" name="enterInfo">
							</textarea>
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
</body>
</html>
<script type="text/javascript">	
	//qr스캐너 닫기
	${message}
	${alert}
	
	document.addEventListener("DOMContentLoaded", function() {
		var video = document.createElement("video");		
		var canvasElement = document.getElementById("canvas");
		var canvas = canvasElement.getContext("2d");
		var loadingMessage = document.getElementById("loadingMessage");
		var outputContainer = document.getElementById("output");
		var outputMessage = document.getElementById("outputMessage");
		var outputData = document.getElementById("outputData");
		
		function drawLine(begin, end, color) {
			canvas.beginPath();
			canvas.moveTo(begin.x, begin.y);
			canvas.lineTo(end.x, end.y);
			canvas.lineWidth = 4;
			canvas.strokeStyle = color;
			canvas.stroke()
    	}
		// 카메라 사용시
		navigator.mediaDevices.getUserMedia({ video: { facingMode: "environment" } }).then(function(stream) {
      		video.srcObject = stream;
      		video.setAttribute("playsinline", true);// iOS 사용시 전체 화면을 사용하지 않음을 전달
         	video.play();
      		requestAnimationFrame(tick);
		});

		function tick() {
			loadingMessage.innerText = "⌛ 스캔 기능을 활성화 중입니다."
			if(video.readyState === video.HAVE_ENOUGH_DATA) {
        		      loadingMessage.hidden = true;
        		      canvasElement.hidden = false;
        		      outputContainer.hidden = false;
					  
					  // 읽어들이는 비디오 화면의 크기
        		      canvasElement.height = video.videoHeight;
        	 	      canvasElement.width = video.videoWidth;
        		      canvas.drawImage(video, 0, 0, canvasElement.width, canvasElement.height);
        		      var imageData = canvas.getImageData(0, 0, canvasElement.width, canvasElement.height);
        		      var code = jsQR(imageData.data, imageData.width, imageData.height, {
                                    inversionAttempts : "dontInvert",
					  });
        		      
                    // QR코드 인식에 성공한 경우
                              if(code) {
                                     // 인식한 QR코드의 영역을 감싸는 사용자에게 보여지는 테두리 생성
                                    drawLine(code.location.topLeftCorner, code.location.topRightCorner, "#FF0000");
                                    drawLine(code.location.topRightCorner, code.location.bottomRightCorner, "#FF0000");
                                    drawLine(code.location.bottomRightCorner, code.location.bottomLeftCorner, "#FF0000");
                                    drawLine(code.location.bottomLeftCorner, code.location.topLeftCorner, "#FF0000")
                                    outputMessage.hidden = true;
                                    outputData.parentElement.hidden = false;
                                    // QR코드 메시지 출력
									outputData.innerHTML = code.data;
									// return을 써서 함수를 빠져나가면 QR코드 프로그램이 종료된다.
									if(confirm('출근하시겠습니까?') == true){ //확인
										/* var frm = $("#frm").serialie();
										$.ajax({
											url : "${pageContext.request.contextPath}/enter",
											type : "get",
											data : frm, 
											dataType : "json", 
											success : function(data){
												self.close();
											}	
										}); */
		                            	document.formEnter.action="enter";
		                            	document.formEnter.methood="get";
										document.formEnter.submit();
										/* window.opener.location.reload(); */
									/* alert("출근이 인증되었습니다."); */
		                             } else{
		                            	  return false;
		                             }
									return;
                              }
                              // QR코드 인식에 실패한 경우 
                    		/* else {
                                    outputMessage.hidden = false;
                                    outputData.parentElement.hidden = true;
                              } */
                      }
      		      requestAnimationFrame(tick);
		}
	});
</script>