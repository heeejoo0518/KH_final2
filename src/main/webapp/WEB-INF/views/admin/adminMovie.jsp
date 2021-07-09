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
<title>영화관리</title>
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
			<p id="p-3">영화관리</p>
		
		</div>
		<div id="div-03">
			<p id="p-4">영화 리스트</p>
			<table id="movie-T">
				<tr>
					<td>
						<a href="#">
							<img src="${ path }/images/NEW_WORLD.jpg"/><br>
						</a>
					</td>
					<td>
						<a href="#">
							<img src="${ path }/images/NEW_WORLD.jpg"/><br>
						</a>
					</td>
					<td>
						<a href="#">
							<img src="${ path }/images/NEW_WORLD.jpg"/><br>
						</a>
					</td>
					<td>
						<a href="#">
							<img src="${ path }/images/NEW_WORLD.jpg"/><br>
						</a>
					</td>
				</tr>
				<tr>
					<td>
						<p>신세계</p>
					</td>
					<td>
						<p>신세계</p>
					</td>
					<td>
						<p>신세계</p>
					</td>
					<td>
						<p>신세계</p>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<div>
</div>
</body>
</html>