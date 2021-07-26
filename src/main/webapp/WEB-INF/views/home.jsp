<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet" href="${ path }/resources/css/main.css" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<style>
img#ott-img {
	width: 558px;
	height: 171px;
	-webkit-box-reflect: below -2vw
		-webkit-gradient(linear, left top, left bottom, from(transparent),
		color-stop(0.45, transparent), to(rgba(255, 255, 255, 0.25)));
}

#pt-1 {
	margin-bottom: 0px;
	padding-bottom: 0px;
	text-align: center;
}

#pt-2 {
	color: #abb7c4;
	font-size: 13pt;
	margin-top: 20px;
	margin-bottom: 40px;
	text-align: center;
}

input#pt-button {
	float: right;
}
</style>
<!-- 배너 -->
<!--
				비디오 백그라운드 사용시 data-video속성을 다음과 같이 설정해야함 (ex. images/banner).  .mp4 와 .webm 파일 둘 다 있어야함
			-->
<style>
img#ott-img {
	width: 558px;
	height: 171px;
	-webkit-box-reflect: below -2vw
		-webkit-gradient(linear, left top, left bottom, from(transparent),
		color-stop(0.45, transparent), to(rgba(255, 255, 255, 0.25)));
}

#pt-1 {
	margin-bottom: 0px;
	padding-bottom: 0px;
	text-align: center;
}

#pt-2 {
	color: #abb7c4;
	font-size: 13pt;
	margin-top: 20px;
	margin-bottom: 40px;
	text-align: center;
}

input#pt-button {
	float: right;
}

* {
	box-sizing: border-box
}
</style>

<section id="banner" data-video="images/banner">
	<div class="inner">
		<header>
			<h1>모두의 영화</h1>
			<p>
				여러 OTT를 한 곳에서 찾아보는 모두의 영화<br /> 지금 모두의 영화를 시작하세요.
			</p>
		</header>
		<a href="#main" class="button big alt scrolly">시작하기</a>
	</div>

</section>

<!-- 메인 -->
<div id="main">

	<!-- 첫번째 탭 -->
	<section class="wrapper style1">
		<div class="inner">
			<header class="align-center">
				<h2>모영 픽 Top5 확인하세요!</h2>
				<div class="container">
					<br>
					<div class="card-deck">
						<c:forEach var="movie" items="${ list }">
							<div class="card bg-secondary" style="width: 10%">
								<a href="${ path }/movie/view?no=${ movie.movieNo }"> <c:out
										value="${ movie.title_kor }" />
								</a> <img src="${ movie.m_poster }" alt="">
							</div>
						</c:forEach>
					</div>
				</div>
				<br>
			</header>

		</div>
	</section>

	<!-- 두번째 탭 -->
	<div class="w3-container">
		<h2>플랫폼 별 영화리스트</h2>
	</div>
		<div class="w3-bar w3-black">
			<button class="w3-bar-item w3-button" onclick="openCity('Netflix')">Netflix</button>
			<button class="w3-bar-item w3-button" onclick="openCity('Watcha')">Watcha</button>
			<button class="w3-bar-item w3-button" onclick="openCity('Wavve')">Wavve</button>
			<button class="w3-bar-item w3-button" onclick="openCity('Tving')">Tving</button>
		</div>

		<div id="Netflix" class="w3-container city">
			<h2>넷플릭스</h2>
			<c:forEach var="netflix" items="${ netflix }">
				<br>
				<span style="font-size: xx-large;"><c:out value="${ netflix.title_kor }" /></span>
				<br> <br>
				<img src="${ netflix.m_poster }" alt="" style="width: 300px; height: 360px;">
			</c:forEach>
		</div>

		<div id="Watcha" class="w3-container city" style="display: none">
			<h2>왓챠</h2>
			<c:forEach var="watcha" items="${ watcha }">
				<br>
				<span style="font-size: xx-large;"><c:out value="${ watcha.title_kor }" /></span>
				<br> <br>
				<img src="${ watcha.m_poster }" alt="" style="width: 300px; height: 360px;">
			</c:forEach>
		</div>

		<div id="Wavve" class="w3-container city" style="display: none">
			<h2>웨이브</h2>
			<c:forEach var="wavve" items="${ wavve }">
				<br>
				<span style="font-size: xx-large;"><c:out value="${ wavve.title_kor }" /></span>
				<br> <br>
				<img src="${ wavve.m_poster }" alt="" style="width: 300px; height: 360px;">
			</c:forEach>
		</div>

		<div id="Tving" class="w3-container city" style="display: none">
			<h2>티빙</h2>
			<c:forEach var="tving" items="${ tving }">
				<br>
				<span style="font-size: xx-large;"><c:out value="${ tving.title_kor }" /></span>
				<br> <br>
				<img src="${ tving.m_poster }" alt="" style="width: 300px; height: 360px;">
			</c:forEach>
		</div>


</div>

<br>
<br>
<br>

<!-- Three -->
<section class="wrapper ">
	<div class="inner">

		<header class="align-center"> </header>
		<!-- 3 Column Video Section -->

		<div class="row">

			<div class="col-sm-4">
				<img id="ott-img" src="${path }/resources/images/ott_logo.png"
					alt="ottimg" />
			</div>

			<div class="col-sm-2"></div>

			<div class="col-sm-4">
				<h2 id="pt-1">파티를 모집중입니다</h2>
				<p id="pt-2">원하는 OTT를 함께 볼 사람을 간편하게 찾아보세요</p>

				<input type="button" id="pt-button" class="btn btn-lg btn-dark"
					onClick="location.href='${path}/party/party'" value="파티 구하러가기" />
			</div>

		</div>
	</div>
</section>

<script>
	function openCity(cityName) {
		var i;
		var x = document.getElementsByClassName("city");
		for (i = 0; i < x.length; i++) {
			x[i].style.display = "none";
		}
		document.getElementById(cityName).style.display = "block";
	}
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
