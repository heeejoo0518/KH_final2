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
<title>신고관리</title>
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
			<p id="p-3">신고관리</p>
		
		</div>
		<div id="div-03">
			<p id="p-list">리뷰 신고</p>
			<table id="table-R">
		      <thead>
		        <tr>
		          <th>이름</th><th>전화번호</th><th>신고 날짜</th>
		        </tr>
		      </thead>
		      <tbody>
		        <tr>
		          <td>홍길동</td><td>010-1111-1111</td><td>2021-07-07</td>
		        </tr>
		        <tr>
		          <td>김길동</td><td>010-2222-3333</td><td>2021-07-06</td>
		        </tr>
		      </tbody>
    		</table>
    		<hr>
    		<p id="p-list">회원 신고</p>
			<table id="table-R">
		      <thead>
		        <tr>
		          <th>이름</th><th>전화번호</th><th>신고 날짜</th>
		        </tr>
		      </thead>
		      <tbody>
		        <tr>
		          <td>홍길동</td><td>010-1111-1111</td><td>2021-07-07</td>
		        </tr>
		        <tr>
		          <td>김길동</td><td>010-2222-3333</td><td>2021-07-06</td>
		        </tr>
		      </tbody>
		     </table>
		     <hr>
		     <p id="p-list">파티모집 신고</p>
			<table id="table-R">
		      <thead>
		        <tr>
		          <th>이름</th><th>전화번호</th><th>신고 날짜</th>
		        </tr>
		      </thead>
		      <tbody>
		        <tr>
		          <td>홍길동</td><td>010-1111-1111</td><td>2021-07-07</td>
		        </tr>
		        <tr>
		          <td>김길동</td><td>010-2222-2222</td><td>2021-07-06</td>
		        </tr>
		        <tr>
		          <td>김길동</td><td>010-3333-3333</td><td>2021-07-06</td>
		        </tr>
		      </tbody>
    		</table>
		</div>
	</div>
</div>
</body>
</html>