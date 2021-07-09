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
<!-- 
			<script src="${ path }/resources/js/jquery.min.js"></script>
 -->
			<script src="${ path }/resources/js/jquery-3.6.0.min.js"></script>
			<script src="${ path }/resources/js/jquery.scrolly.min.js"></script>
			<script src="${ path }/resources/js/skel.min.js"></script>
			<script src="${ path }/resources/js/util.js"></script>
			<script src="${ path }/resources/js/main.js"></script>
		
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
				<h1><a href="#">Moyeong</a></h1>
				<a href="#menu">Menu</a>
			</header>

		<!-- 네비게이션 -->
			<nav id="menu">
				<ul class="links">
					<li><a href="index.html">홈</a></li>
                    <li>
                        <c:if test="${ loginMember == null }">
                            <a href="#">로그인</a>
                        </c:if>

                        <c:if test="${ loginMember != null }">
                            <a href="${ path }/member/view">
                                ${ loginMember.name }
                            </a>님, 안녕하세요.
                            <button onclick="location.replace('${path}/logout')">로그아웃</button>
                        </c:if>

                    </li>
					<li><a href="generic.html">로그인</a></li>
					<li><a href="elements.html">Elements</a></li>
				</ul>
			</nav>
