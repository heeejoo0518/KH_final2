<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모두의영화</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="stylesheet" href="${ path }/resources/css/main.css" />
<!-- Scripts -->
			<script src="${ path }/resources/js/jquery.min.js"></script>
			<!-- 
			<script src="${ path }/resources/js/jquery-3.6.0.min.js"></script>
			<script src="${ path }/resources/js/main.js"></script>
			 -->
			<script src="${ path }/resources/js/jquery.scrolly.min.js"></script>
			<script src="${ path }/resources/js/skel.min.js"></script>
			<script src="${ path }/resources/js/util.js"></script>
		
			<!-- <script src="${path}/resources/bootstrap-4.6.0-dist/js/popper.min.js"></script> -->
			<!-- <script src="${path}/resources/bootstrap-4.6.0-dist/js/bootstrap.min.js" ></script>-->
			<!-- 
			<script src="${path}/webjars/popper.js/1.16.1/dist/popper.min.js"></script>
			<script src="${path}/webjars/bootstrap/4.6.0-1/js/bootstrap.min.js"></script>
			 -->
			
			
			

	</head>
	<body>

		<!-- 헤더 -->
			<header id="header">
				<h1><a href="${ path }/loginHome">Moyoung</a></h1>
				<a href="#menu">Menu</a>
			</header>

		<!-- 네비게이션 -->
			<nav id="menu">
				<ul class="links">
					<li><a href="${ path }">홈</a></li>
                    <li>
                        <c:if test="${ signinMember == null }">
                            <a href="${ path }/signin">로그인</a>
                        </c:if>

                        <c:if test="${ signinMember != null }">
                            <a href="${ path }/signout">로그아웃</a>
                        </c:if>

                    </li>
					<li>
						<c:if test="${ signinMember != null }">
                            <a href="${ path }/mypage">마이페이지</a>
                        </c:if>
					</li>
				</ul>
			</nav>
			<script>
			(function($) {

				

				$(function() {

					var	$window = $(window),
						$body = $('body');

					// 페이지 로드까지 애니메이션 정지
						$body.addClass('is-loading');

						$window.on('load', function() {
							window.setTimeout(function() {
								$body.removeClass('is-loading');
							}, 100);
						});

					// Fix
						$('form').placeholder();

				

					// 메뉴
						$('#menu')
							.append('<a href="#menu" class="close"></a>')
							.appendTo($body)
							.panel({
								delay: 500,
								hideOnClick: true,
								hideOnSwipe: true,
								resetScroll: true,
								resetForms: true,
								side: 'right'
							});

					// 배너
						var $banner = $('#banner');

						if ($banner.length > 0) {

							// 비디오확인
								var video = $banner.data('video');

								if (video)
									$window.on('load.banner', function() {

										// 로드까지 애니매이션 정지
											$window.off('load.banner');

										// 비디오 있으면 재생
											if (!skel.vars.mobile
											&&	!skel.breakpoint('large').active
											&&	skel.vars.IEVersion > 9)
												$banner.append('<video autoplay loop><source src="' + video + '.mp4" type="video/mp4" /><source src="' + video + '.webm" type="video/webm" /></video>');

									});

							// More 
								$banner.find('.more')
									.addClass('scrolly');

						}

					// 탭

						$('.flex-tabs').each( function() {

							var t 		= jQuery(this),
								tab 	= t.find('.tab-list li a'),
								tabs 	= t.find('.tab');

							tab.click(function(e) {

								var x = jQuery(this),
									y = x.data('tab');

								// 액티브 활성
									tab.removeClass('active');
									x.addClass('active');

								// show/hide 
									tabs.removeClass('active');
									t.find('.' + y).addClass('active');

								e.preventDefault();

							});

						});

					// scrolly
						if ( $( ".scrolly" ).length ) {

							var $height = $('#header').height();

							$('.scrolly').scrolly({
								offset: $height
							});
						}

				});

			})(jQuery);
			</script>
