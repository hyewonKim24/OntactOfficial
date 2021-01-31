function getmap() {
    // gelocation을 지원하는지 확인한다.
    if (!navigator.geolocation)
        throw "위치 정보가 지원되지 않습니다.";
 
    // 결과를 표시할 새로운 <img> 요소를 생성한 다음 반환
    // var image = document.createElement("img");
 
    // geolocation 요청
    navigator.geolocation.getCurrentPosition(setMapURL, showError);
 
    return image;
 
    // geolocation 요청이 성공하면 호출되는 콜백 함수 :
    function setMapURL(pos) {
 
        // 전달된 인자 객체로부터 위치 정보를 가져온다.
        var latitude = pos.coords.latitude;   // 적도의 북쪽 기준 각도인 위도
        var longitude = pos.coords.longitude; // 그리니치 천문대의 동쪽 기준 각도인 경도
        var accuracy = pos.coords.accuracy;   // 미터 단위의 정확도
 
        // // 해당 위치의 구글 지도에 대한 정적 이미지 URL을 생성한다.
        // var map_url = "http://maps.google.com/maps/api/staticmap" 
        //     + "?center=" + latitude + "," + longitude + "&size=640x640&sensor=true";
 
        // // 대략적으로 지도 줌 레벨을 계산하여 설정한다.
        // var zoomlevel = 20; // 대부분 최대한 확대하여 시작한다.
        // if (accuracy > 80)  // 위치가 부정확할 경우 축소한다.
        //     zoomlevel -= Math.round(Math.log(accuracy / 50) / Math.LN2);
        
        // map_url += "&zoom=" + zoomlevel; // 줌 레벨을 URL에 추가한다.
 
        // // API key 추가 ( 키 발급 필요, 키가 없으면 지도 요청시 응답 상태 코드가 403 (Forbidden) 떨어짐.) 
        // map_url += "&key=AIzaSyCmrAEkltMaNaMNxOZiM9pQxbMGy9j9RyI";
 
        // // 이제 이미지 객체에 지도를 출력한다.
        // image.src = map_url;
    }
    
    // geolocation 요청이 실패하면 호출되는 콜백 함수 :
    function showError(err) {
        
        var errors = [
                       err.message, 
                       "사용자가 권한 거부",
                       "위치를 찾을 수 없음",
                       "요청 응답 시간 초과"
                ];
        alert("["+err.code+"] "+errors[err.code]); 
    }
}

