<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<title>모두의영화 상세보기</title>
<meta charset="UTF-8">

<!--Google Font-->
<link rel="stylesheet"
	href='http://fonts.googleapis.com/css?family=Dosis:400,700,500|Nunito:300,400,600' />
<!-- Mobile specific meta -->
<meta name=viewport content="width=device-width, initial-scale=1">
<meta name="format-detection" content="telephone-no">

<!-- CSS files -->
<link rel="stylesheet" href="${ path }/css/plugins.css">
<link rel="stylesheet" href="${ path }/css/style.css">
</head>
<!--preloading-->
<div id="preloader">
	<img class="logo" src="${ path }/images/logo1.png" alt="" width="119"
		height="58">
	<div id="status">
		<span></span> <span></span>
	</div>
</div>
<!--end of preloading-->

<!-- top search form -->
<header class="ht-header" style="background-color: #020d18;">
	<div class="container">
		<div class="top-search">
			<select>
				<!-- 추후에 보고 수정할 것  -->
				<option value="united">영화</option>
				<option value="saab">드라마/예능/기타</option>
			</select> <input type="text" placeholder="검색을 원하시는 컨텐츠의 제목을 입력하세요">
		</div>
	</div>
</header>
<!-- END | Header -->

<div class="hero common-hero" style="background-color: #020d18;">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="hero-ct"></div>
			</div>
		</div>
	</div>
</div>

<div class="page-single movie-single movie_single" style="background-color: #020d18;">
	<div class="container">
		<div class="row ipad-width2">
			<div class="col-md-4 col-sm-12 col-xs-12">
				<div class="movie-img sticky-sb">
					<img src="${ movie.m_poster }" alt="">
					<div class="movie-btn">
						<div class="btn-transform transform-vertical red">
							<div>
								<a href="#" class="item item-1 redbtn"> 
								<i class="ion-play"></i>
									예고편 보기
								</a>

							</div>
							<div>
								<a href="${movie.trailer}"
									class="item item-2 redbtn fancybox-media hvr-grow"><i
									class="ion-play"></i></a>
							</div>
						</div>
						<div class="social-btn" style="margin-bottom: 10px">
							<a href="#" class="parent-btn">봤어요<i class="ion-checkmark"></i></a>
							<a href="#" class="parent-btn">찜하기<i class="ion-heart"></i></a> <a
								href="#" class="parent-btn">리뷰쓰기<i class="ion-edit"></i></a>

						</div>
					</div>
				</div>

			</div>
			<div class="col-md-8 col-sm-12 col-xs-12">
				<div class="movie-single-ct main-content"
					style="padding-top: 280px;">

					<h1 class="bd-hd">
						<c:out value="${ movie.title_kor }" /><span><c:out value="${ movie.product_year }" /></span>
					</h1>
					<h3 class="bd-hd">
						<span><c:out value="${ movie.title }" /></span>
					</h3>

					<div class="movie-rate">
						<div class="rate-star">
							<p>모영 별점</p>
						</div>
						<div class="rate">
							<i class="ion-android-star"></i>
							<p>
								<span><c:out value="${ movie.vote }" /></span> /5 <br> <span class="rv">56개의 리뷰</span>
							</p>
						</div>
						<br>
					</div>

					<div class="movie-rate" style="height: 100px">
						<div class="rate-star">
						<c:if test="${ not empty movie.netflix }">
											<a href="${ movie.netflix }">
												<img src="${ path }/images/netflix.jpg" alt="netflixlogo" style="width: 50px; height: 50px">
											</a> 
										</c:if>
										<c:if test="${ not empty movie.watcha }">
											<a href="${ movie.watcha }">
												<img src="${ path }/images/watcha.jpg" alt="watchalogo" style="width: 50px; height: 50px">
											</a> 
										</c:if>
										<c:if test="${ not empty movie.tving }">
											<a href="${ movie.tving }">
												<img src="${ path }/images/tving.jpg" alt="tvinglogo" style="width: 50px; height: 50px">
											</a> 
										</c:if>
										<c:if test="${ not empty movie.wavve }">
											<a href="${ movie.wavve }">
												<img src="${ path }/images/wavve.jpg" alt="neflogo" style="width: 50px; height: 50px">
											</a> 
										</c:if>
<!-- 							<a href="https://www.netflix.com/"><img class="slogo" -->
<%-- 								src="${ path }/images/netflix.jpg"></a> <img class="slogo" --%>
<%-- 								src="${ path }/images/watcha.jpg" alt=""> <img --%>
<%-- 								class="slogo" src="${ path }/images/tving.jpg" alt=""> <img --%>
<%-- 								class="slogo" src="${ path }/images/wavve.jpg" alt=""> --%>
						</div>
					</div>
					<div class="movie-tabs">
						<div class="tabs">
							<ul class="tab-links tabs-mv">
								<li class="active"><a href="#overview">작품정보</a></li>
								<li><a href="#reviews"> 리뷰</a></li>
							</ul>
							<div class="tab-content">
								<div id="overview" class="tab active">
									<div class="row">
										<div class="col-md-8 col-sm-12 col-xs-12">
											<p><c:out value="${ movie.story }"/></p>

											<div class="title-hd-sm">
												<h4>출연진</h4>
											</div>
											<!-- movie cast -->
											<div class="mvcast-item">
												<div class="cast-it">
													<div class="cast-left">
														<img src="${ path }/images/uploads/cast1.jpg" alt="">
														<a href="#">Robert Downey Jr.</a>
													</div>
													<p>... Robert Downey Jr.</p>
												</div>
												<div class="cast-it">
													<div class="cast-left">
														<img src="${ path }/images/uploads/cast2.jpg" alt="">
														<a href="#">Chris Hemsworth</a>
													</div>
													<p>... Thor</p>
												</div>
												<div class="cast-it">
													<div class="cast-left">
														<img src="${ path }/images/uploads/cast3.jpg" alt="">
														<a href="#">Mark Ruffalo</a>
													</div>
													<p>... Bruce Banner/ Hulk</p>
												</div>
											</div>
											<div class="title-hd-sm">
												<h4>모영 리뷰</h4>
												<a href="#" class="time">모든 모영 리뷰 보기<i
													class="ion-ios-arrow-right"></i></a>
											</div>
											<!-- movie user review -->
											<div class="mv-user-review-item">

												<div class="user-review-likeAndReport" style="color:white; float:right;">
													<i class="ion-heart"></i>
													<i class="ion-flag"></i>					
												</div>
												
												
												<div class="no-star">
													<i class="ion-android-star"></i> <i
														class="ion-android-star"></i> <i class="ion-android-star"></i>
													<i class="ion-android-star"></i> <i
														class="ion-android-star"></i> <i
														class="ion-android-star last"></i>
												</div>
												<p class="time">
													17 December 2016 by <a href="#"> hawaiipierson</a>
												</p>
												<p>This is by far one of my favorite movies from the
													MCU. The introduction of new Characters both good and bad
													also makes the movie more exciting. giving the characters
													more of a back story can also help audiences relate more to
													different characters better, and it connects a bond between
													the audience and actors or characters. Having seen the
													movie three times does not bother me here as it is as
													thrilling and exciting every time I am watching it. In
													other words, the movie is by far better than previous
													movies (and I do love everything Marvel), the plotting is
													splendid (they really do out do themselves in each film,
													there are no problems watching it more than once.</p>
											</div>
											<br><br>
											<div class="user-review-summary">
												<div class="mv-user-review-item">

													<!--  신고하기 / 좋아요 버튼 이정도에 들어오면 될거같은데.. -->
													<div class="no-star">
														<i class="ion-android-star"></i> <i
															class="ion-android-star"></i> <i class="ion-android-star"></i>
														<i class="ion-android-star"></i> <i
															class="ion-android-star"></i> <i
															class="ion-android-star last"></i>
													</div>
													<p class="time">
														17 December 2016 by <a href="#"> hawaiipierson</a>
													</p>
													<p>This is by far one of my favorite movies from the
														MCU. The introduction of new Characters both good and bad
														also makes the movie more exciting. giving the characters
														more of a back story can also help audiences relate more
														to different characters better, and it connects a bond
														between the audience and actors or characters. Having seen
														the movie three times does not bother me here as it is as
														thrilling and exciting every time I am watching it. In
														other words, the movie is by far better than previous
														movies (and I do love everything Marvel), the plotting is
														splendid (they really do out do themselves in each film,
														there are no problems watching it more than once.</p>
												</div>
											</div>
										
										

										</div>
										<div class="col-md-4 col-xs-12 col-sm-12">
											<div class="sb-it">
												<h6>Director:</h6>
												<p>
													<a href="#">Joss Whedon</a>
												</p>
											</div>
											<div class="sb-it">
												<h6>Writer:</h6>
												<p>
													<a href="#">Joss Whedon,</a> <a href="#">Stan Lee</a>
												</p>
											</div>
											<div class="sb-it">
												<h6>Stars:</h6>
												<p>
													<a href="#">Robert Downey Jr,</a> <a href="#">Chris
														Evans,</a> <a href="#">Mark Ruffalo,</a><a href="#">
														Scarlett Johansson</a>
												</p>
											</div>
											<div class="sb-it">
												<h6>Genres:</h6>
												<p>
													<a href="#">Action, </a> <a href="#"> Sci-Fi,</a> <a
														href="#">Adventure</a>
												</p>
											</div>
											<div class="sb-it">
												<h6>Release Date:</h6>
												<p>May 1, 2015 (U.S.A)</p>
											</div>
											<div class="sb-it">
												<h6>Run Time:</h6>
												<p>141 min</p>
											</div>
											<div class="sb-it">
												<h6>MMPA Rating:</h6>
												<p>PG-13</p>
											</div>
											<div class="ads">
												<img src="${ path }/images/uploads/ads1.png" alt="">
											</div>
										</div>
									</div>
								</div>
								<div id="reviews" class="tab review">
									<div class="row">
										<div class="rv-hd">
											<div class="div">
												<h2>Skyfall: Quantum of Spectre</h2>
											</div>
											<a href="#" class="redbtn">리뷰 작성</a>
										</div>
										<div class="topbar-filter">
											<p>
												총 <span>56</span>개의 리뷰가 있습니다.
											</p>

										</div>
										<div class="mv-user-review-item">
											<div class="user-infor">
												<img src="${ path }/images/uploads/userava1.jpg" alt="">
												<div>
													<h3>Best Marvel movie in my opinion</h3>
													<div class="no-star">
														<i class="ion-android-star"></i> <i
															class="ion-android-star"></i> <i class="ion-android-star"></i>
														<i class="ion-android-star"></i> <i
															class="ion-android-star"></i> <i
															class="ion-android-star last"></i>
													</div>
													<p class="time">
														17 December 2016 by <a href="#"> hawaiipierson</a>
													</p>
												</div>
											</div>
											<p>This is by far one of my favorite movies from the MCU.
												The introduction of new Characters both good and bad also
												makes the movie more exciting. giving the characters more of
												a back story can also help audiences relate more to
												different characters better, and it connects a bond between
												the audience and actors or characters. Having seen the movie
												three times does not bother me here as it is as thrilling
												and exciting every time I am watching it. In other words,
												the movie is by far better than previous movies (and I do
												love everything Marvel), the plotting is splendid (they
												really do out do themselves in each film, there are no
												problems watching it more than once.</p>
										</div>
										<div class="mv-user-review-item">
											<div class="user-infor">
												<img src="${ path }/images/uploads/userava2.jpg" alt="">
												<div>
													<h3>Just about as good as the first one!</h3>
													<div class="no-star">
														<i class="ion-android-star"></i>
														<i class="ion-android-star"></i>
														<i class="ion-android-star"></i>
														<i class="ion-android-star last"></i>
														<i class="ion-android-star last"></i>
													</div>
													<p class="time">
														17 December 2016 by <a href="#"> hawaiipierson</a>
													</p>
												</div>
											</div>
											<p>Avengers Age of Ultron is an excellent sequel and a
												worthy MCU title! There are a lot of good and one thing that
												feels off in my opinion.</p>

											<p>THE GOOD:</p>

											<p>First off the action in this movie is amazing, to
												buildings crumbling, to evil blue eyed robots tearing stuff
												up, this movie has the action perfectly handled. And with
												that action comes visuals. The visuals are really good, even
												though you can see clearly where they are through the movie,
												but that doesn't detract from the experience. While all the
												CGI glory is taking place, there are lovable characters that
												are in the mix. First off the original characters, Iron Man,
												Captain America, Thor, Hulk, Black Widow, and Hawkeye, are
												just as brilliant as they are always. And Joss Whedon fixed
												my main problem in the first Avengers by putting in more
												Hawkeye and him more fleshed out. Then there is the new
												Avengers, Quicksilver, Scarletwich, and Vision, they are
												pretty cool in my opinion. Vision in particular is pretty
												amazing in all his scenes.</p>

											<p>THE BAD:</p>

											<p>The beginning of the film it's fine until towards the
												second act and there is when it starts to feel a little
												rushed. Also I do feel like there are scenes missing but
												there was talk of an extended version on Blu-Ray so that's
												cool.</p>
										</div>
										<div class="mv-user-review-item">
											<div class="user-infor">
												<img src="${ path }/images/uploads/userava3.jpg" alt="">
												<div>
													<h3>One of the most boring exepirences from watching a
														movie</h3>
													<div class="no-star">
														<i class="ion-android-star"></i> 
														<i class="ion-android-star last"></i>
														<i class="ion-android-star last"></i> 
														<i class="ion-android-star last"></i>
													</div>
													<p class="time">
														26 March 2017 by<a href="#"> christopherfreeman</a>
													</p>
												</div>
											</div>
											<p>I can't right much... it's just so forgettable...Okay,
												from what I remember, I remember just sitting down on my
												seat and waiting for the movie to begin. 5 minutes into the
												movie, boring scene of Tony Stark just talking to his "dead"
												friends saying it's his fault. 10 minutes in: Boring scene
												of Ultron and Jarvis having robot space battles(I dunno:/).
												15 minutes in: I leave the theatre.2nd attempt at watching
												it: I fall asleep. What woke me up is the next movie on
												Netflix when the movie was over.</p>

											<p>Bottemline: It's boring...</p>

											<p>10/10 because I'm a Marvel Fanboy</p>
										</div>
										<div class="mv-user-review-item ">
											<div class="user-infor">
												<img src="${ path }/images/uploads/userava4.jpg" alt="">
												<div>
													<h3>That spirit of fun</h3>
													<div class="no-star">														
														<i class="ion-android-star"></i>
														<i class="ion-android-star"></i>
														<i class="ion-android-star"></i>
														<i class="ion-android-star last"></i>
														<i class="ion-android-star last"></i>
													</div>
													<p class="time">
														26 March 2017 by <a href="#"> juliawest</a>
													</p>
												</div>
											</div>
											<p>If there were not an audience for Marvel comic heroes
												than clearly these films would not be made, to answer one
												other reviewer although I sympathize with him somewhat. The
												world is indeed an infinitely more complex place than the
												world of Marvel comics with clearly identifiable heroes and
												villains. But I get the feeling that from Robert Downey, Jr.
												on down the organizer and prime mover as Iron Man behind the
												Avengers these players do love doing these roles because
												it's a lot of fun. If they didn't show that spirit of fun to
												the audience than these films would never be made.</p>

											<p>So in that spirit of fun Avengers: Age Of Ultron comes
												before us and everyone looks like they're having a good time
												saving the world. A computer program got loose and took form
												in this dimension named Ultron and James Spader who is
												completely unrecognizable is running amuck in the earth. No
												doubt Star Trek fans took notice that this guy's mission is
												to cleanse the earth much like that old earth probe NOMAD
												which got its programming mixed up in that classic Star Trek
												prime story. Wouldst Captain James T. Kirk of the Enterprise
												had a crew like Downey has at his command.</p>
											<p>My favorite is always Chris Evans because of the whole
												cast he best gets into the spirit of being a superhero. Of
												all of them, he's already played two superheroes, Captain
												America and Johnny Storm the Human Torch. I'll be before
												he's done Evans will play a couple of more as long as the
												money's good and he enjoys it.</p>

											<p>Pretend you're a kid again and enjoy, don't take it so
												seriously.</p>
										</div>
										<div class="mv-user-review-item last">
											<div class="user-infor">
												<img src="${ path }/images/uploads/userava5.jpg" alt="">
												<div>
													<h3>Impressive Special Effects and Cast</h3>
													<div class="no-star">
														<i class="ion-android-star"></i>
														<i class="ion-android-star"></i> 
														<i class="ion-android-star"></i>
														<i class="ion-android-star"></i> 
														<i class="ion-android-star"></i> 
														<i class="ion-android-star"></i>
														<i class="ion-android-star"></i>
														<i class="ion-android-star"></i>
														<i class="ion-android-star last"></i>
														<i class="ion-android-star last"></i>
													</div>
													<p class="time">
														26 March 2017 by <a href="#"> johnnylee</a>
													</p>
												</div>
											</div>
											<p>The Avengers raid a Hydra base in Sokovia commanded by
												Strucker and they retrieve Loki's scepter. They also
												discover that Strucker had been conducting experiments with
												the orphan twins Pietro Maximoff (Aaron Taylor-Johnson), who
												has super speed, and Wanda Maximoff (Elizabeth Olsen), who
												can control minds and project energy. Tony Stark (Robert
												Downey Jr.) discovers an Artificial Intelligence in the
												scepter and convinces Bruce Banner (Mark Ruffalo) to
												secretly help him to transfer the A.I. to his Ultron defense
												system. However, the Ultron understands that is necessary to
												annihilate mankind to save the planet, attacks the Avengers
												and flees to Sokovia with the scepter. He builds an armature
												for self-protection and robots for his army and teams up
												with the twins. The Avengers go to Clinton Barton's house to
												recover, but out of the blue, Nick Fury (Samuel L. Jackson)
												arrives and convinces them to fight against Ultron. Will
												they succeed?</p>

											<p>"Avengers: Age of Ultron" is an entertaining adventure
												with impressive special effects and cast. The storyline
												might be better, since most of the characters do not show
												any chemistry. However, it is worthwhile watching this film
												since the amazing special effects are not possible to be
												described in words. Why Pietro has to die is also not
												possible to be explained. My vote is eight.</p>
										</div>
										<div class="topbar-filter">
											<label>Reviews per page:</label> <select>
												<option value="range">5 Reviews</option>
												<option value="saab">10 Reviews</option>
											</select>
											<div class="pagination2">
												<span>Page 1 of 6:</span> <a class="active" href="#">1</a> <a
													href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a
													href="#">5</a> <a href="#">6</a> <a href="#"><i
													class="ion-arrow-right-b"></i></a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
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