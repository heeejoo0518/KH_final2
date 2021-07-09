<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${ path }/resources/css/admin.css" rel="stylesheet"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰관리</title>
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
			<p id="p-3">리뷰관리</p>
		
		</div>
		<div id="div-03">
			<p id="p-4">리뷰리스트</p>
		</div>
	</div>
</div>
</body>
</html>