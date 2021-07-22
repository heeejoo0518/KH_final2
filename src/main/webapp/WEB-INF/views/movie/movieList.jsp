<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<title>영화 검색 결과입니다</title>
<meta charset="UTF-8">
<link rel="stylesheet"
	href='http://fonts.googleapis.com/css?family=Dosis:400,700,500|Nunito:300,400,600' />
<!-- Mobile specific meta -->
<meta name=viewport content="width=device-width, initial-scale=1">
<meta name="format-detection" content="telephone-no">
<!-- CSS files -->
<link rel="stylesheet" href="${ path }/css/plugins.css">
<link rel="stylesheet" href="${ path }/css/style.css">
<style>
div#pageBar button {
	text-align: center;
	position: relative;
	height: 40px;
}
</style>
</head>

<body>
	<div id="preloader">
		<img class="logo" src="${ path }/images/logo1.png" alt="" width="119"
			height="58">
		<div id="status">
			<span></span> <span></span>
		</div>
	</div>
	<!--end of preloading-->

	<!-- BEGIN | Header -->
	<header class="ht-header"
		style="background-color: #020d18; padding-top: 50px;">
		<div class="container">
			<!-- top search form -->
			<div class="top-search">
				<select>
					<!-- 추후에 보고 수정할 것  -->
					<option value="united">영화</option>
					<option value="saab">드라마/예능/기타</option>
				</select>
				<!-- search{s} -->
				<input type="text" class="form-control form-control-sm"
					name="keyword" id="keyword" placeholder="검색을 원하시는 컨텐츠의 제목을 입력하세요">
				<button class="btn btn-sm btn-primary" name="btnSearch"
					id="btnSearch">
					<i class="ion-search"></i>
				</button>
			</div>

		</div>
	</header>
	<!-- END | Header -->

	<div class="hero common-hero"
		style="background-color: #020d18; padding-top: 50px;">
		<div class="container" style="height: 50px;">
			<div class="row">
				<div class="col-md-12">
					<div class="hero-ct">
						<h1>검색한 영화명의 검색 결과</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="page-single movie_list"
		style="background-color: #020d18; padding-top: 50px;">
		<div class="container">
			<div class="row ipad-width2">
				<div class="col-md-8 col-sm-12 col-xs-12">
					<div class="topbar-filter">
						<p>
							총 <span>100</span> 개의 검색 결과
						</p>

						<label>정렬기준:</label>
						<form action="${ path }/movie/list" method="GET">
							<select id="sort-select" name="sort"
								onchange="this.form.submit();">
								<option value="">-----</option>
								<option value="b" id=1>최신순</option>
								<option value="c" id=2>평점높은순</option>
								<option value="a" id=3>등록순</option>
							</select>
						</form>
					</div>

					<c:forEach var="movie" items="${ list }">
						<div class="movie-item-style-2">

							<img src="${ movie.m_poster }" alt="">
							<div class="mv-item-infor">
								<h6>
									<a href="${ path }/movie/view?no=${ movie.movieNo }"> <c:out
											value="${ movie.title_kor }" /> <span><c:out
												value="${ movie.product_year }" /></span>
									</a>
								</h6>
								<p class="rate">
									<i class="ion-android-star"></i>네이버별점: <span> <c:out
											value="${ movie.vote }" /></span> /5 <i class="ion-android-star"
										style="padding-left: 10px"></i>모영리뷰별점: <span> <c:out
											value="${ movie.vote }" /></span> /5
								</p>
								<p class="review">
									<i class="ion-edit"></i><span class="rv"><a href="${ path }/review/list?no=${movie.movieNo}" style="font-size:14px">리뷰보기</a></span> <br>
									<br>
									<c:if test="${ not empty movie.netflix }">
										<a href="${ movie.netflix }"> <img
											src="${ path }/images/netflix.jpg" alt="netflixlogo"
											style="width: 50px; height: 50px">
										</a>
									</c:if>
									<c:if test="${ not empty movie.watcha }">
										<a href="${ movie.watcha }"> <img
											src="${ path }/images/watcha.jpg" alt="watchalogo"
											style="width: 50px; height: 50px">
										</a>
									</c:if>
									<c:if test="${ not empty movie.tving }">
										<a href="${ movie.tving }"> <img
											src="${ path }/images/tving.jpg" alt="tvinglogo"
											style="width: 50px; height: 50px">
										</a>
									</c:if>
									<c:if test="${ not empty movie.wavve }">
										<a href="${ movie.wavve }"> <img
											src="${ path }/images/wavve.jpg" alt="neflogo"
											style="width: 50px; height: 50px">
										</a>
									</c:if>
									<br>
									<br>
								<p class="describe"
									style="font-family: 'Nunito', sans-serif; font-size: 14px">
									<c:out value="${ movie.story }" />
								</p>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div id="pageBar"
				style="align-self: center; margin-top: 10px; text-align: center;">
				<button onclick="location.href='${ path }/movie/list?page=1'">&lt;&lt;</button>

				<button
					onclick="location.href='${ path }/movie/list?page=${ pageInfo.prvePage }'">&lt;</button>

				<c:forEach begin="${ pageInfo.startPage }"
					end="${ pageInfo.endPage }" step="1" varStatus="status">
					<c:if test="${ pageInfo.currentPage == status.current}">
						<button disabled>
							<c:out value="${ status.current }" />
						</button>
					</c:if>
					<c:if test="${ pageInfo.currentPage != status.current}">
						<button
							onclick="location.href='${ path }/movie/list?page=${ status.current }'">
							<c:out value="${ status.current }" />
						</button>
					</c:if>
				</c:forEach>

				<button
					onclick="location.href='${ path }/movie/list?page=${ pageInfo.nextPage }'">&gt;</button>

				<button
					onclick="location.href='${ path }/movie/list?page=${ pageInfo.maxPage }'">&gt;&gt;</button>
			</div>
		</div>

	</div>
	<script src="${ path }/js/jquery-3.6.0.min.js"></script>
	<script src="${ path }/js/plugins.js"></script>
	<script src="${ path }/js/plugins2.js"></script>
	<script src="${ path }/js/custom.js"></script>
</body>
</html>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
