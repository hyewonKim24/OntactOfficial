# ONTACT, 새롭게 일하는 방식 그룹웨어 서비스 
### [**시연 영상 바로 보기**](https://youtu.be/ijIUGMm0Rfw) ![Youtube Badge](https://img.shields.io/badge/Youtube-ff0000?style=flat-square&logo=youtube&link=https://youtu.be/ijIUGMm0Rfw)
##### 팀원 : 김혜원(조장), 김봉영, 오은실, 이윤진, 이혜림
## Contetns
1. [개요](#소개)
2. [설계의 주안점](#설계의-주안점)
3. [사용기술 및 개발환경](#사용기술-및-개발환경)
4. [프로젝트 기능 구현](#프로젝트-기능-구현)
5. [주요기능](#주요기능)
6. [Document](#Document)
___
## 개요
- 비대면 업무 진행에 필요한 전반적인 기능을 지원하는 업무협업 툴 제작
- 언택트 시대, 새롭게 일하는 방식 그룹웨어 서비스 ONTACT
___
## 설계의 주안점
1. **스프링 시큐리티**를 이용한 로그인으로 유저 인증과 권한 검사, 비밀번호 암호화, 보안성 강화
2. 회원가입시 **validation, hiberate** 라이브러리를 활용하여 백엔드단의 데이터 검사로 보안성 강화
3. 회원가입과 비밀번호 재설정에서 **mailsender**를 통해 인증번호, 임시 비밀번호 발송함
4. **Apache Commons FileUpload**를 통한 파일업로드와 이미지파일은 **imgscalr**을 이용해 썸네일 생성
5. **jQuery lightbox** 플러그인을 이용하여 레이어팝업의 이미지 슬라이드 구현
6. **WebSocket**과 **WebSocketConfigurer**를 이용하여 채팅방 및 실시간 채팅 구현.
7. 헤더에 **WebSocket**을 설정해주면서 글 작성 알림을 실시간으로 구현.
8. **Lombok**을 이용하여 어노테이션 설정으로 간단하게 Dto의 메소드를 생성함으로써 작성 코드를 줄여줌.
9. **Chart.js**를 사용해 실시간으로 변경되는 그래프를 구현
10. **QR** 생성 라이브러리, **jsQR 스캐너** 라이브러리를 이용해 출퇴근 인증 구현
11. **Fullcalendar** 라이브러리를 이용한 휴가 현황 및 프로젝트 전체 일정, 업무 캘린더 구현
12. **카카오 장소 검색 api**를 이용해 프로젝트 일정 글 등록시 장소를 지정해 인서트 할 수 있도록 구현
13. **AJAX**를 통해 프로젝트 상세 페이지를 한 페이지에 구현
___
## 사용기술 및 개발환경
<p align="center">
    <img src = "ForREADME/use.png", width="100%">
</p>

|Category|Detail|
|:--:|:--:|
|FrontEnd|HTML5, JS, CSS3, JQuery|
|BackEnd|Java(JDK 1.8), Servlet, Spring(4.2.4), Mybatis|
|OS|Windows 10, MacOS|
|Libray&API|Spring Security, Validation, Hiberate, MailSender, Apache Commons FileUpload, Imgscalr, Jquery lightbox, WebSocket, WebSocketConfigurer, Lombok, Chart.js, jsQR Scanner, Fullcalendar, Kakaomap, FontAwesome|
|IDE|STS(3.9.12.RELEASE), VisualStudio|
|Server|Tomcat(v8.5)|
|Document|Google Drive, KakaoOven, ERDCloud, diagrams.net|
|CI|Github|
|DateBase|AWS RDS, Oracle(11g)|
___
## 프로젝트 기능 구현
- 김혜원
  - 채팅
    - 1대1채팅, 그룹채팅, 프로젝트 채팅 구현
    - 채팅 실시간 알림
  - 알림
    - 미확인 알림, 전체 알림 기능
    - 읽지 않은 알림 모두 읽음
    - 헤더와 사이드바에 소켓 연결하여 실시간 알림 구현
  - 연락처를 통한 메신저 기능
    - 회사 사람들의 정보를 조회
  - 프로젝트
    - 업무 글 등록
      - 업무 상태 지정
      - 담당자 추가
      - 시작일시, 마감일시 추가
      - 업무 진행률 추가
      - 우선순위 추가
    - 업무 글 수정
      - 실시간으로 업무 상태를 변경
      - 업무 상태, 담당자, 시작일시, 마감일시, 진행률, 우선순위 변경
      - 업무의 상태가 변경될 때 실시간 그래프 
    - 업무 글 삭제
    - 업무 현황 그래프 구현
    - 댓글 작성, 수정, 삭제
    - 프로젝트 멤버 초대
- 오은실
  - 메인 페이지
    - 회원 가입
      - 비즈니스, 게스트 가입
      - BCrypt 해시 함수로 비밀번호 암호화
      - 메일 인증번호 발송
    - 로그인
      - 스프링 시큐리티로 계정 권한부여 및 계정 잠금
    - 비밀번호 재설정
  - 마이 페이지
    - 권한에 따른 회원정보 수정
    - 프로필 사진 설정
    - 비밀번호 변경
  - 일반글
    - 일반글 작성
    - 일반글 & 업무 파일첨부
    - 일반글 삭제
  - 파일함
    - 파일 리스트형, 썸네일형
    - 파일 선택삭제
    - 파일 다중 다운로드
    - 파일명, 크기, 등록자, 최근업로드순 파일정렬
    - 프로젝트별 파일 확인
  - 내 게시물
  - 업무 리스트
    - 업무 구분, 상태별 업무 조회
- 이윤진
  - 프로젝트
    - 프로젝트 생성
      - 부서별 지정
    - 프로젝트 조건별 목록 조회
      - 전체, 미보관, 읽지않음, 부서별보관함
    - 프로젝트 상세 내용 조회
      - 글, 유형별, 최근순 정렬
  - 할일
    - 할일 등록
      - 할일 목록 추가
      - 마감일 지정
      - 담당자 지정
    - 할일 수정
      - 마감일 변경
      - 체크 여부 변경
    - 담당자 hover 표시
    - 체크 여부에 따른 진행도
- 이혜림
  - 근태관리
    - 출퇴근 관리
      - 출퇴근 QR인증(QRcode, jsQR 사용)
      - 출퇴근 기간별 조회
      - 월 근무내역 조회(Chart.js 사용)
    - 시간 외 근무관리
      - 시간외 근무 등록
      - 시간외 근무 기간별 조회
    - 휴가 관리
      - 휴가 등록
      - 휴가 기간별조회
      - 부서별 휴가 현황 조회(FullCalendar 사용)
    - 조직도
      - 부서 생성 및 삭제
      - 부서별 사원 조회
      - 사원의 부서이동
  - 프로젝트
    - 일정
      - 일정 글 등록(Kakao Map 장소 검색API 활용)
      - 일정 글 삭제
      - 일정 글 수정(참석자 변경)
    - 전체 일정
      - 프로젝트별 전체 일정 및 업무 조회(FullCalendar 사용)
- 김봉영
  - 전자결재
    - 전자결재 기안함
        - 상세페이지
    - 전자결재 기안작성
    - 전자결재 결재함
        - 상세페이지
        - 반려, 결재완료 선택 가능
___
## 주요기능
**1. 회원가입**
<p align="center">
    <img src = "ForREADME/01.png", width="100%">
</p>

**2. 마이페이지**
<p align="center">
    <img src = "ForREADME/02.png", width="100%">
</p>

**3. 프로젝트 목록**
<p align="center">
    <img src = "ForREADME/03.png", width="100%">
</p>
<p align="center">
    <img src = "ForREADME/04.png", width="100%">
</p>

**4. 프로젝트 생성**
<p align="center">
    <img src = "ForREADME/05.png", width="100%">
</p>

**5. 프로젝트 상세(일반글)**
<p align="center">
    <img src = "ForREADME/06.png", width="100%">
</p>

**6. 프로젝트 상세(업무)**
<p align="center">
    <img src = "ForREADME/07.png", width="100%">
</p>

**7. 프로젝트 상세(일정)**
<p align="center">
    <img src = "ForREADME/08.png", width="100%">
</p>

**8. 프로젝트 상세(할일)**
<p align="center">
    <img src = "ForREADME/09.png", width="100%">
</p>

**9. 프로젝트 상세 : 프로젝트 채팅**
<p align="center">
    <img src = "ForREADME/10.png", width="100%">
</p>

**10. 전체 업무**
<p align="center">
    <img src = "ForREADME/11.png", width="100%">
</p>

**11. 전체 일정**
<p align="center">
    <img src = "ForREADME/12.png", width="100%">
</p>

**12. 파일함**
<p align="center">
    <img src = "ForREADME/13.png", width="100%">
</p>

**13. 채팅**
<p align="center">
    <img src = "ForREADME/14.png", width="100%">
</p>

**14. 사용자 정보**
<p align="center">
    <img src = "ForREADME/15.png", width="100%">
</p>

**15. 알림**
<p align="center">
    <img src = "ForREADME/16.png", width="100%">
</p>

**16. 근태관리**
<p align="center">
    <img src = "ForREADME/17.png", width="100%">
</p>
<p align="center">
    <img src = "ForREADME/18.png", width="100%">
</p>

**17. 전자결재**
<p align="center">
    <img src = "ForREADME/19.png", width="100%">
</p>
<p align="center">
    <img src = "ForREADME/20.png", width="100%">
</p>

___
## Document
### 1. 유스케이스
<p align="center">
    <img src = "ForREADME/usecase.jpg", width="100%">
</p>

### 2. ERD
<p align="center">
    <img src = "ForREADME/erd.png", width="100%">
</p>
