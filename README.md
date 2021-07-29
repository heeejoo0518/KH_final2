# ![](https://i.imgur.com/fPhEQur.png)모두의 영화

모두의 영화는 우후죽순 늘어나는 플랫폼에서 원하는 콘텐츠를 찾는 데 어려움을 겪는 사용자를 위하여 제작되었다. 사이트 이용자는 OTT 스트리밍 사이트 내 콘텐츠들을 통합하여 검색할 수 있어 편리한 콘텐츠 시청이 가능하다. 또한 소셜 계정을 이용한 회원가입과 로그인 기능 제공으로 사이트 이용을 편리하게 한다.



## 역할

* **김예빈(팀장)** 
  * 영화 리스트 : 데이터 불러오기. 정보 출력, 서비스하는 ott 아이콘 출력, 정렬기능, 페이징
  * 영화 상세정보 : 데이터 불러오기, 예고편보기 클릭시 예고편 유투브 창 팝업. 리뷰쓰기. 상세보기 리뷰목록에서 스포일러 체크한 리뷰일 경우 내용 보이지 않음.
  * 공지사항 게시판 - 로그인한 사용자 id admin인 경우에만 글쓰기/수정/삭제 등 가능.
* **김하린**
  * 파티 구하기 (party) : 파티 구하기 글 작성, 파티 리스트 출력, 게시글 삭제, 파티 참여하기 링크 클릭시 카카오톡 오픈 채팅방 연결
  * 메인페이지
* **김희주**
  * 회원가입(기본, 구글) / 회원탈퇴 / 로그인(기본, 구글) / 로그아웃
  * 아이디찾기 / 비밀번호찾기(이메일 인증)
  * 마이페이지 : 개인정보수정 / 내가 쓴 리뷰 / 내가 찜한 영화
  * 영화 검색
* **이준범**
  * 영화 리뷰 작성기능 , 데이터 불러오기 
  * 영화 리뷰 페이지 페이징 , 정렬 기능
  * 메인페이지



## 사용기술 및 개발환경

* 운영체제 : Windows OS
* DBMS : Oracle
* Languages : Java, Javascript, jsp, css, sql
* Server : Apache Tomcat v9.0
* Tool : Git, sqldeveloper, eclipse
* Framework : BootStrap, Spring, mybatis
* Library : jstl, jdbc, lombok, jQuery, ajax
* API : Google SignIn API



## 구현 기능

#### 클릭하면 영상으로 연결됩니다

1. **회원기능**

   - 회원가입/로그인 : 일반&구글로그인
   - 아이디찾기/비밀번호찾기 : 이메일 이용

   [![이미지 텍스트](https://i9.ytimg.com/vi/sOZuJkkDMmc/mqdefault.jpg?sqp=CLiiiogG&rs=AOn4CLDepIhvSRXwuBA9jjUR6t10YEJBGg)](https://youtu.be/sOZuJkkDMmc)



2. **영화+리뷰**

   - 메인페이지 : 모영픽top5, 플랫폼 별 영화리스트, 파티원모집 소개
   - 영화 검색 : 키워드로 영화 제목 검색 기능. 카테고리별 정렬(최신순/별점순/등록순)
   - 영화 상세 :  OTT 분류, 영화 정보, 리뷰 정보. 
   - 리뷰 : 리뷰 작성,수정,삭제. 스포일러 체크와 별점 등록 가능. 정렬(최신순/별점순/등록순)

   [![이미지 텍스트](https://i9.ytimg.com/vi_webp/z9gq4oyPlg4/mqdefault.webp?sqp=CLypiogG&rs=AOn4CLB3I4cSa5vaomnpmBmrkVRqfZBXQQ)](https://youtu.be/z9gq4oyPlg4)

   

3. **파티구하기**

   - 파티 구하기 글 작성 및 삭제. 오픈카톡 채팅방으로 연결 가능

   [![이미지 텍스트](https://i9.ytimg.com/vi_webp/E-_50AIfiO0/mqdefault.webp?sqp=CLiiiogG&rs=AOn4CLCheFrNOfoP1N5WK_UWxbeiNh0jwQ)](https://youtu.be/E-_50AIfiO0)



4. **마이페이지**

   - 비밀번호 재확인 후 정보 수정(sns로그인의 경우 닉네임, 생일만 수정 가능)
   - 작성한 리뷰, 찜한 영화 조회

   [![이미지 텍스트](https://i9.ytimg.com/vi/5sB13O32q-U/mqdefault.jpg?sqp=CLiiiogG&rs=AOn4CLDpkkcVsPZEMgQzMYouDiTxKNkyZQ)](https://youtu.be/5sB13O32q-U)

   

5. **공지사항**

   - 공지사항 작성,수정, 삭제, 조회

   [![이미지 텍스트](https://i9.ytimg.com/vi/ycaOLReSJpU/mqdefault.jpg?sqp=CLiiiogG&rs=AOn4CLBKkaw11CSSkJ-Kj5-chpq_uqHWrw)](https://youtu.be/ycaOLReSJpU)