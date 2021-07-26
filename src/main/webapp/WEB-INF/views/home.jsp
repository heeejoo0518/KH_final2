<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet" href="${ path }/resources/css/main.css" />

<style>
img#ott-img {
width:558px;
height:171px;
-webkit-box-reflect: below -2vw -webkit-gradient(linear, left top, left bottom, from(transparent), 
color-stop(0.45, transparent), to(rgba(255, 255, 255, 0.25)));}
#pt-1{margin-bottom:0px; padding-bottom:0px; text-align:center;}
#pt-2{color: #abb7c4;	font-size:13pt; margin-top:20px; margin-bottom:40px; text-align:center;}
input#pt-button {float:right;}

</style>
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
							
						</header>
						<!-- 3 Column Video Section -->
						
						<div class="row">
												
							<div class="col-sm-4">
								<img id="ott-img" src="${path }/resources/images/ott_logo.png"  alt="ottimg"/>
							</div>
							
							<div class="col-sm-2">
							</div>
							
							<div class="col-sm-4">
								<h2 id="pt-1">파티를 모집중입니다</h2>
								<p id="pt-2">원하는 OTT를 함께 볼 사람을 간편하게 찾아보세요</p>
								
								<input type="button" id="pt-button" class="btn btn-lg btn-dark" onClick="location.href='${path}/party/party'" value="파티 구하러가기"/>
							</div>
							
						</div>					
			</div>
</section>



			</div>
			
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
