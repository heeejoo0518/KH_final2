<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
 
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<title>영화 검색 결과입니다</title>
	<meta charset="UTF-8">
	<meta name="description" content="">
	<meta name="keywords" content="">
	<meta name="author" content="">
	<link rel="profile" href="#">
    <!--Google Font-->
    <link rel="stylesheet" href='http://fonts.googleapis.com/css?family=Dosis:400,700,500|Nunito:300,400,600' />
	<!-- Mobile specific meta -->
	<meta name=viewport content="width=device-width, initial-scale=1">
	<meta name="format-detection" content="telephone-no">
	<!-- CSS files -->
	<link rel="stylesheet" href="${ path }/css/plugins.css">
	<link rel="stylesheet" href="${ path }/css/style.css">
</head>
<body>
<div id="preloader">
    <img class="logo" src="${ path }/images/logo1.png" alt="" width="119" height="58">
    <div id="status">
        <span></span>
        <span></span>
    </div>
</div>
<!--end of preloading-->

<!-- BEGIN | Header -->
<header class="ht-header" style="background-color: #020d18;">
	<div class="container">
	
	    <!-- top search form -->
	    <div class="top-search">
	    	<select>
	    		<!-- 추후에 보고 수정할 것  -->
				<option value="united">영화</option>
				<option value="saab">드라마/예능/기타</option>
			</select>
			<input type="text" placeholder="검색을 원하시는 컨텐츠의 제목을 입력하세요">
	    </div>
	</div>
</header>
<!-- END | Header -->

<div class="hero common-hero" style="background-color: #020d18;">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="hero-ct">
					<h1>검색한 영화명의 검색 결과</h1>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="page-single movie_list" style="background-color: #020d18;">
	<div class="container">
		<div class="row ipad-width2">
			<div class="col-md-8 col-sm-12 col-xs-12">
				<div class="topbar-filter">
					<p>총 <span>1,608</span> 개의 검색 결과</p>
					<label>정렬기준:</label>
					<select>
						<option value="date">최신순</option>
						<option value="popularity">인기순</option>
						<option value="rating">리뷰많은순</option>
					</select>
				</div>
				<div class="movie-item-style-2">
					<img src="${ path }/images/uploads/mv1.jpg" alt="">
					<div class="mv-item-infor">
						<h6><a href="movieDetail">영화명 <span>(개봉년도)</span></a></h6>
						<p class="rate"><i class="ion-android-star"></i>모영별점: <span>8.0</span> /10</p>
						<p class="review"><i class="ion-edit"></i><span class="rv"> 56개의 리뷰</span>
						<br><br>
						<a href="https://www.netflix.com/"><img src="${ path }/images/netflix.jpg" alt="neflogo" style="width:50px; height:50px"></a>
						<img src="${ path }/images/watcha.jpg" alt="watlogo" style="width:50px; height:50px">
						<img src="${ path }/images/tving.jpg" alt="tvlogo" style="width:50px; height:50px">
						<img src="${ path }/images/wavve.jpg" alt="wavlogo" style="width:50px; height:50px">	
						<br><br>
						<p class="describe">Earth's mightiest heroes must come together and learn to fight as a team if they are to stop the mischievous Loki and his alien army from enslaving humanity...</p>
						</div>
				</div>
				<div class="movie-item-style-2">
					<img src="${ path }/images/uploads/mv2.jpg" alt="">
					<div class="mv-item-infor">
						<h6><a href="moviesingle.html">into the wild <span>(2014)</span></a></h6>
						<p class="rate"><i class="ion-android-star"></i><span>7.8</span> /10</p>
						<p class="describe">As Steve Rogers struggles to embrace his role in the modern world, he teams up with a fellow Avenger and S.H.I.E.L.D agent, Black Widow, to battle a new threat...</p>
						<p class="run-time"> Run Time: 2h21’    .     <span>MMPA: PG-13 </span>    .     <span>Release: 1 May 2015</span></p>
						<p>Director: <a href="#">Anthony Russo,</a><a href="#">Joe Russo</a></p>
						<p>Stars: <a href="#">Chris Evans,</a> <a href="#">Samuel L. Jackson,</a> <a href="#">  Scarlett Johansson</a></p>
					</div>
				</div>
					<div class="movie-item-style-2">
					<img src="${ path }/images/uploads/mv2.jpg" alt="">
					<div class="mv-item-infor">
						<h6><a href="moviesingle.html">into the wild <span>(2014)</span></a></h6>
						<p class="rate"><i class="ion-android-star"></i><span>7.8</span> /10</p>
						<p class="describe">As Steve Rogers struggles to embrace his role in the modern world, he teams up with a fellow Avenger and S.H.I.E.L.D agent, Black Widow, to battle a new threat...</p>
						<p class="run-time"> Run Time: 2h21’    .     <span>MMPA: PG-13 </span>    .     <span>Release: 1 May 2015</span></p>
						<p>Director: <a href="#">Anthony Russo,</a><a href="#">Joe Russo</a></p>
						<p>Stars: <a href="#">Chris Evans,</a> <a href="#">Samuel L. Jackson,</a> <a href="#">  Scarlett Johansson</a></p>
					</div>
				</div>	<div class="movie-item-style-2">
					<img src="${ path }/images/uploads/mv2.jpg" alt="">
					<div class="mv-item-infor">
						<h6><a href="moviesingle.html">into the wild <span>(2014)</span></a></h6>
						<p class="rate"><i class="ion-android-star"></i><span>7.8</span> /10</p>
						<p class="describe">As Steve Rogers struggles to embrace his role in the modern world, he teams up with a fellow Avenger and S.H.I.E.L.D agent, Black Widow, to battle a new threat...</p>
						<p class="run-time"> Run Time: 2h21’    .     <span>MMPA: PG-13 </span>    .     <span>Release: 1 May 2015</span></p>
						<p>Director: <a href="#">Anthony Russo,</a><a href="#">Joe Russo</a></p>
						<p>Stars: <a href="#">Chris Evans,</a> <a href="#">Samuel L. Jackson,</a> <a href="#">  Scarlett Johansson</a></p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script src="${ path }/js/jquery-3.6.0.min.js"></script>
<script src="${ path }/js/plugins.js"></script>
<script src="${ path }/js/plugins2.js"></script>
<script src="${ path }/js/custom.js"></script>
</body>
</html>
