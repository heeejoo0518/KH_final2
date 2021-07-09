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
<title>Insert title here</title>
<link href="${ path }/resources/css/admin.css" rel="stylesheet"/>
</head>
<body>
<div id="div">
	<div id="div-01">
		<p id="p-1"><a href="${ path }/admin/adminPage">관리자페이지</a></p>
		<hr>
		<p id="p-2"><a href="${ path }/admin/adminMember">회원관리</a></p>
		<hr>
		<p id="p-2"><a href="${ path }/admin/adminMovie">영화관리</a></p>
		<hr>
		<p id="p-2"><a href="${ path }/admin/adminReview">리뷰관리</a></p>
		<hr>
		<p id="p-2"><a href="${ path }/admin/adminReport">신고관리</a></p>
		<hr>
		<p id="p-2">회원관리</p>
		<hr>
	</div>
	<div>
		<div id="div-02">
			<p id="p-3">관리자메인</p>
		
		</div>
		<div id="div-03">
			<section>
			<p id="p-4">오늘 가입자 수</p>
			<p id="p-4">월별 통계</p>
			</section>
		</div>
	</div>
</div>
</body>
</html>

