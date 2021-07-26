<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<!--Google Font-->
<link rel="stylesheet"
	href='http://fonts.googleapis.com/css?family=Dosis:400,700,500|Nunito:300,400,600' />
<!-- Mobile specific meta -->
<meta name=viewport content="width=device-width, initial-scale=1">
<meta name="format-detection" content="telephone-no">
<!-- CSS files -->
<link rel="stylesheet" href="${ path }/css/plugins.css">
<link rel="stylesheet" href="${ path }/css/style.css">
<!--preloading-->
<div id="preloader">
	<img class="logo" src="${ path }/images/logo1.png" alt="" width="119"
		height="58">
	<div id="status"></div>
</div>
<!--end of preloading-->

<div class="hero common-hero" style="background-color: #020d18;">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="hero-ct"></div>
			</div>
		</div>
	</div>
</div>

<div class="page-single movie-single movie_single"
	style="background-color: #020d18;">
	<div class="container">
		<div class="row ipad-width2">
			<div class="col-md-4 col-sm-12 col-xs-12">
				<div class="movie-img sticky-sb">
					<img src="${ movie.m_poster }" alt="">
					<div class="movie-btn">
						<div class="btn-transform transform-vertical red">
							<div>
								<a href="#" class="item item-1 redbtn"> <i class="ion-play"></i>
									예고편 보기
								</a>
							</div>
							<div>
								<a href="${movie.trailer}"
									class="item item-2 redbtn fancybox-media hvr-grow"><i
									class="ion-play"></i></a>
							</div>
						</div>
						<form action="${ path }/review/write" method="POST">
							<input type="hidden" name="no" value="${ movie.movieNo }">
						</form>
						<div class="social-btn" style="margin-bottom: 10px">
						
<%-- 						 	<c:if test="${empty signinMember }"> --%>
<!-- 						 		<p>로그인 후 리뷰 작성이 가능합니다.</p> -->
<%-- 						 	</c:if> --%>
<%-- 							<c:if test="${! empty signinMember }"> --%>
							<a href="#" class="parent-btn" style="padding-left: 10px">찜하기<i
								class="ion-heart"></i></a> <a
								href="${ path }/review/write?no=${movie.movieNo}"
								class="parent-btn">리뷰쓰기<i class="ion-edit"></i></a>
<%-- 							</c:if>	 --%>
						</div>
					</div>
				</div>

			</div>
			<div class="col-md-8 col-sm-12 col-xs-12">
				<div class="movie-single-ct main-content"
					style="padding-top: 280px;">

					<h1 class="bd-hd">
						<c:out value="${ movie.title_kor }" />
						<span><c:out value="${ movie.product_year }" /></span>
					</h1>
					<h3 class="bd-hd">
						<span><c:out value="${ movie.title }" /></span>
					</h3>

					<div class="movie-rate" style="height: 80px;">
						<div class="rate-star">
							<p style="font-family: 'Nunito', sans-serif; font-size: 14px">네이버
								별점</p>
						</div>
						<div class="rate">
							<i class="ion-android-star"></i>
							<p>
								<span><c:out value="${ movie.vote }" /></span> /5 <br>
								<!-- 								<span class="rv">56개의 리뷰</span> -->
							</p>
						</div>

						<div class="rate-star">
							<p style="font-family: 'Nunito', sans-serif; font-size: 14px">모영리뷰별점</p>
						</div>
						<div class="rate">
							<i class="ion-android-star"></i>
							<p>
								<span><c:out value="${ movie.vote }" /></span> /5 <br>
								<!-- 								<span class="rv">56개의 리뷰</span> -->
							</p>
						</div>
						<br>
					</div>

					<div class="movie-rate" style="height: 80px;">
						<div class="rate-star">
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
						</div>
					</div>
					<div class="movie-tabs">
						<div class="tabs">
							<ul class="tab-links tabs-mv">
								<li class="active"><a href="#overview">작품정보</a></li>
							</ul>
							<div class="tab-content">
								<div id="overview" class="tab active">
									<div class="row">
										<div class="col-md-8 col-sm-12 col-xs-12">
											<p style="font-family: 'Nunito', sans-serif; font-size: 14px">
												<c:out value="${ movie.story }" />
											</p>

											<div class="title-hd-sm">
												<h4>출연진</h4>
											</div>
											<!-- movie cast -->
											<div class="mvcast-item">
												<div class="cast-it">
													<div class="cast-left">
														<img src="${ path }/images/uploads/cast1.jpg" alt="">
														<a href="#" style="font-family: 'Nunito', sans-serif; font-size: 14px"><c:out value="${ movie.actor }" /></a>
													</div>
												</div>
											</div>
											<div class="title-hd-sm">

												<h4>모영 리뷰</h4>
												<a href="${ path }/review/list?no=${movie.movieNo}"
													class="time">모든 모영 리뷰 보기<i class="ion-ios-arrow-right"></i></a>
											</div>
											<!-- movie user review -->
											<c:if test="${!empty list }">
												<c:forEach var="review" items="${ list }">

													<div class="mv-user-review-item">

														<div class="no-star">
															<c:choose>
																<c:when test="${ review.rate == 0 }">
																	<img src="${ path }/images/noStar_img.png" width="20"
																		height="20">
																</c:when>
																<c:when test="${ review.rate == 1}">
																	<img src="${ path }/images/oneStar_img.png" width="20"
																		height="20">
																</c:when>
																<c:when test="${ review.rate == 2 }">
																	<img src="${ path }/images/twoStar_img.png" width="40"
																		height="20">
																</c:when>
																<c:when test="${ review.rate == 3 }">
																	<img src="${ path }/images/threeStar_img.png"
																		width="60" height="20">
																</c:when>
																<c:when test="${ review.rate == 4 }">
																	<img src="${ path }/images/fourStar_img.png" width="80"
																		height="20">
																</c:when>
																<c:when test="${ review.rate == 5 }">
																	<img src="${ path }/images/fiveStar_img.png"
																		width="100" height="20">
																</c:when>
															</c:choose>
														</div>
														<p class="time">
															<fmt:formatDate value="${ review.writeDate }"
																pattern="yyyy-MM-dd" />

															<c:out value="${review.nickname}" />
															님이 작성하신 리뷰입니다.
														</p>
														<c:choose>
															<c:when test="${ review.spoiler eq '0' }">
																<div id="div-user-content">
																	<p style="font-weight: bold;">
																		<c:out value="${ review.content }" />
																	</p>
																</div>
															</c:when>
															<c:when test="${ review.spoiler eq '1' }">
																<p
																	style="text-align: center; text-shadow: 6px 2px 2px gray;">
																	스포일러가 포함된 리뷰입니다 <br> 내용을 보시려면 모든 리뷰 보기를 이용해 주세요!
																</p>
																<div id="div-user-spoilerContent"
																	class="div-user-spoilerContent"></div>
															</c:when>
														</c:choose>
													</div><br><br>
												</c:forEach>
											</c:if>
										</div>

										<div class="col-md-4 col-xs-12 col-sm-12">
											<div class="sb-it">
												<h6>감독:</h6>
												<p>
													<a href="#"><c:out value="${ movie.director }" /></a>
												</p>
											</div>
											<div class="sb-it">
												<h6>출연진:</h6>
												<p>
													<a href="#"><c:out value="${ movie.actor }" /></a>
												</p>
											</div>
											<div class="sb-it">
												<h6>장르:</h6>
												<p>
													<a href="#"><c:out value="${ movie.genre }" /></a>
											</div>
											<div class="sb-it">
												<h6>개봉일</h6>
												<a href="#">
													<fmt:formatDate value="${ movie.open_date }"
														pattern="yyyy-MM-dd" />
												</a>
											</div>
											<div class="sb-it">
												<h6>런타임:</h6>
												<a href="#">${ movie.run_time }분</a>
											</div>
											<div class="sb-it">
												<h6>시청연령:</h6>
												<a href="#">${ movie.viewing_age }</a>
											</div>
											<div class="sb-it">
												<img src="${ path }/images/uploads/ads1.png" alt="">
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
<%@ include file="/WEB-INF/views/common/footer.jsp"%>

<script src="${ path }/js/jquery-3.6.0.min.js"></script>
<script src="${ path }/js/plugins.js"></script>
<script src="${ path }/js/plugins2.js"></script>
<script src="${ path }/js/custom.js"></script>
