<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>    
<link rel="stylesheet" href="${ path }/resources/css/main.css" />
<!-- 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
		
			<script src="${path}/resources/js/jquery-3.6.0.min.js"></script>
			<script src="${path}/webjars/popper.js/1.16.1/dist/popper.min.js"></script>
			<script src="${path}/webjars/bootstrap/4.6.0-1/js/bootstrap.min.js"></script>
			
			
			<script src="${ path }/resources/js/jquery.min.js"></script>
			<script src="${ path }/resources/js/jquery.scrolly.min.js"></script>
			<script src="${ path }/resources/js/skel.min.js"></script>
			<script src="${ path }/resources/js/util.js"></script>
			<script src="${ path }/resources/js/main.js"></script>


</head>
<body>

<html>
	<head>
		<title>모두의영화</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="${ path }/resources/css/main.css" />
	</head>
	<body>

			<header id="header">
				<h1><a href="#">Moyeong</a></h1>
				<a href="#menu">Menu</a>
			</header>

			<nav id="menu">
				<ul class="links">
					<li><a href="${ path }/">홈</a></li>
					<li><a href="${ path }/signin">로그인</a></li>
					<li><a href="">기능</a></li>
				</ul>
			</nav>
 -->    

			<!-- 배너 -->
			<!--
				비디오 백그라운드 사용시 data-video속성을 다음과 같이 설정해야함 (ex. images/banner).  .mp4 와 .webm 파일 둘 다 있어야함
			-->
				<section id="banner" data-video="images/banner">
					<div class="inner">
						<header>
							<h1>모두의 영화</h1>
							<p>여러 OTT를 한 곳에서 찾아보는 모두의 영화<br />
								지금 모두의 영화를 시작하세요.</p>
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
							<h2>관심있는 영화를 확인하세요!</h2>
							<p>Cras sagittis turpis sit amet est tempus, sit amet consectetur purus tincidunt.</p>
						</header>
						<!-- 2개의 비디오섹션 if 문 이용하여 추가하면 될듯 -->
							<div class="flex flex-2">
								<div class="video col">
									<div class="image fit">
										<img src="images/pic07.jpg" alt="" />
										<div class="arrow">
											<div class="icon fa-play"></div>
										</div>
									</div>
									<p class="caption">
										Pellentesque at nunc vitae urna suscipit mollis nec in arcu
									</p>
									<a href="generic.html" class="link"><span>Click Me</span></a>
								</div>
								<div class="video col">
									<div class="image fit">
										<img src="images/pic08.jpg" alt="" />
										<div class="arrow">
											<div class="icon fa-play"></div>
										</div>
									</div>
									<p class="caption">
										Morbi mattis ligula ut eros ipsum aliquam iaculis dictum suscipit
									</p>
									<a href="generic.html" class="link"><span>Click Me</span></a>
								</div>
							</div>
					</div>
				</section>

			<!-- 두번째 탭 -->
				<section class="wrapper style2">
					<div class="inner">
						<header>
							<h2>여러 사이트의 영화들</h2>
							<p>Fusce fringilla enim sit amet lectus sollicitudin, eu tincidunt odio semper.</p>
						</header>
						<!-- 비디오섹션 여러개 -->
							<div class="flex flex-tabs">
								<ul class="tab-list">
									<li><a href="#" data-tab="tab-1" class="active">Netfilx</a></li>
									<li><a href="#" data-tab="tab-2">Watcha</a></li>
									<li><a href="#" data-tab="tab-3">Wavve</a></li>
								</ul>
								<div class="tabs">

									<!-- Tab 1 -->
										<div class="tab tab-1 flex flex-3 active">
											<!-- 썸네일 -->
												<div class="video col">
													<div class="image fit">
														<img src="images/pic01.jpg" alt="" />
														<div class="arrow">
															<div class="icon fa-play"></div>
														</div>
													</div>
													<a href="generic.html" class="link"><span>Click Me</span></a>
												</div>
											<!-- 썸네일 -->
												<div class="video col">
													<div class="image fit">
														<img src="images/pic02.jpg" alt="" />
														<div class="arrow">
															<div class="icon fa-play"></div>
														</div>
													</div>
													<a href="generic.html" class="link"><span>Click Me</span></a>
												</div>
											<!-- 썸네일 -->
												<div class="video col">
													<div class="image fit">
														<img src="images/pic03.jpg" alt="" />
														<div class="arrow">
															<div class="icon fa-play"></div>
														</div>
													</div>
													<a href="generic.html" class="link"><span>Click Me</span></a>
												</div>
											<!-- 썸네일 -->
												<div class="video col">
													<div class="image fit">
														<img src="images/pic04.jpg" alt="" />
														<div class="arrow">
															<div class="icon fa-play"></div>
														</div>
													</div>
													<a href="generic.html" class="link"><span>Click Me</span></a>
												</div>
											<!-- 썸네일 -->
												<div class="video col">
													<div class="image fit">
														<img src="images/pic05.jpg" alt="" />
														<div class="arrow">
															<div class="icon fa-play"></div>
														</div>
													</div>
													<a href="generic.html" class="link"><span>Click Me</span></a>
												</div>
											<!-- 썸네일 -->
												<div class="video col">
													<div class="image fit">
														<img src="images/pic06.jpg" alt="" />
														<div class="arrow">
															<div class="icon fa-play"></div>
														</div>
													</div>
													<a href="generic.html" class="link"><span>Click Me</span></a>
												</div>
										</div>

									<!-- 두번째 탭 -->
										<div class="tab tab-2 flex flex-3">
											<!-- 썸네일 -->
												<div class="video col">
													<div class="image fit">
														<img src="images/pic06.jpg" alt="" />
														<div class="arrow">
															<div class="icon fa-play"></div>
														</div>
													</div>
													<a href="generic.html" class="link"><span>Click Me</span></a>
												</div>
											<!-- 썸네일 -->
												<div class="video col">
													<div class="image fit">
														<img src="images/pic05.jpg" alt="" />
														<div class="arrow">
															<div class="icon fa-play"></div>
														</div>
													</div>
													<a href="generic.html" class="link"><span>Click Me</span></a>
												</div>
											<!-- 썸네일 -->
												<div class="video col">
													<div class="image fit">
														<img src="images/pic04.jpg" alt="" />
														<div class="arrow">
															<div class="icon fa-play"></div>
														</div>
													</div>
													<a href="generic.html" class="link"><span>Click Me</span></a>
												</div>
											<!-- 썸네일 -->
												<div class="video col">
													<div class="image fit">
														<img src="images/pic03.jpg" alt="" />
														<div class="arrow">
															<div class="icon fa-play"></div>
														</div>
													</div>
													<a href="generic.html" class="link"><span>Click Me</span></a>
												</div>
											<!-- 썸네일 -->
												<div class="video col">
													<div class="image fit">
														<img src="images/pic02.jpg" alt="" />
														<div class="arrow">
															<div class="icon fa-play"></div>
														</div>
													</div>
													<a href="generic.html" class="link"><span>Click Me</span></a>
												</div>
											<!-- 썸네일 -->
												<div class="video col">
													<div class="image fit">
														<img src="images/pic01.jpg" alt="" />
														<div class="arrow">
															<div class="icon fa-play"></div>
														</div>
													</div>
													<a href="generic.html" class="link"><span>Click Me</span></a>
												</div>
										</div>

									<!-- Tab 3 -->
										<div class="tab tab-3 flex flex-3">
											<!-- 썸네일 -->
												<div class="video col">
													<div class="image fit">
														<img src="images/pic03.jpg" alt="" />
														<div class="arrow">
															<div class="icon fa-play"></div>
														</div>
													</div>
													<a href="generic.html" class="link"><span>Click Me</span></a>
												</div>
											<!-- 썸네일 -->
												<div class="video col">
													<div class="image fit">
														<img src="images/pic02.jpg" alt="" />
														<div class="arrow">
															<div class="icon fa-play"></div>
														</div>
													</div>
													<a href="generic.html" class="link"><span>Click Me</span></a>
												</div>
											<!-- 썸네일 -->
												<div class="video col">
													<div class="image fit">
														<img src="images/pic01.jpg" alt="" />
														<div class="arrow">
															<div class="icon fa-play"></div>
														</div>
													</div>
													<a href="generic.html" class="link"><span>Click Me</span></a>
												</div>
											<!-- 썸네일 -->
												<div class="video col">
													<div class="image fit">
														<img src="images/pic06.jpg" alt="" />
														<div class="arrow">
															<div class="icon fa-play"></div>
														</div>
													</div>
													<a href="generic.html" class="link"><span>Click Me</span></a>
												</div>
											<!-- 썸네일 -->
												<div class="video col">
													<div class="image fit">
														<img src="images/pic05.jpg" alt="" />
														<div class="arrow">
															<div class="icon fa-play"></div>
														</div>
													</div>
													<a href="generic.html" class="link"><span>Click Me</span></a>
												</div>
											<!-- 썸네일 -->
												<div class="video col">
													<div class="image fit">
														<img src="images/pic04.jpg" alt="" />
														<div class="arrow">
															<div class="icon fa-play"></div>
														</div>
													</div>
													<a href="generic.html" class="link"><span>Click Me</span></a>
												</div>
										</div>

								</div>
							</div>
					</div>
				</section>

			<!-- Three -->
				<section class="wrapper ">
					<div class="inner">
						<header class="align-center">
							<h2>파티를 모집중입니다.</h2>
							<p>원하는 사이트의 파티원을 구하는 파티들을 찾아보세요</p>
						</header>

						<!-- 3 Column Video Section -->
							<div class="flex flex-3">
								<div class="video col">
									<div class="image fit">
										<img src="images/pic09.jpg" alt="" />
										<div class="arrow">
											<div class="icon fa-play"></div>
										</div>
									</div>
									<p class="caption">
										Cras eget lacus sed mauris scelerisque tincidunt
									</p>
									<a href="generic.html" class="link"><span>Click Me</span></a>
								</div>
								<div class="video col">
									<div class="image fit">
										<img src="images/pic10.jpg" alt="" />
										<div class="arrow">
											<div class="icon fa-play"></div>
										</div>
									</div>
									<p class="caption">
										Vivamus vulputate lacus non massa auctor lobortis
									</p>
									<a href="generic.html" class="link"><span>Click Me</span></a>
								</div>
								<div class="video col">
									<div class="image fit">
										<img src="images/pic11.jpg" alt="" />
										<div class="arrow">
											<div class="icon fa-play"></div>
										</div>
									</div>
									<p class="caption">
										Nam eu nisi non ante sodales interdum a vitae neque
									</p>
									<a href="generic.html" class="link"><span>Click Me</span></a>
								</div>
							</div>
					</div>
				</section>

			</div>

		