<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>



	<section id="banner" data-video="images/banner">
		<div class="inner">
			<header>
				<h1>모두의 영화</h1>
				<p>여러 OTT를 한 곳에서 찾아보는 모두의 영화<br />
				지금 모두의 영화를 시작하세요.</p>
			</header>
			<a href="${ path }/signin" class="button big alt scrolly">시작하기</a>
		</div>

	</section>

	<a href="https://www.w3schools.com/bootstrap4/default.asp">부트스트랩4 튜토리얼</a>
	<button type="button" class="btn">Basic</button>
	<button type="button" class="btn btn-primary">Primary</button>
	<button type="button" class="btn btn-secondary">Secondary</button>
	<button type="button" class="btn btn-success">Success</button>
	<button type="button" class="btn btn-info">Info</button>
	<button type="button" class="btn btn-warning">Warning</button>
	<button type="button" class="btn btn-danger">Danger</button>
	<button type="button" class="btn btn-dark">Dark</button>
	<button type="button" class="btn btn-light">Light</button>
	<button type="button" class="btn btn-link">Link</button>

	<br>
	<c:if test="${ signinMember == null }"><button type="button" class="btn btn-primary" onclick="location.href='${ path }/signin'">로그인</button></c:if>

	<c:if test="${ signinMember != null }">
		<span style="color:white;">${ signinMember.nickname }님, 안녕하세요.</span>
		<button type="button" class="btn btn-primary" onclick="location.replace('${path}/signout')">로그아웃</button>
		<button type="button" class="btn btn-primary" onclick="location.replace('${path}/mypage/checkpw')">마이페이지-정보수정</button>

	</c:if>

</section>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
