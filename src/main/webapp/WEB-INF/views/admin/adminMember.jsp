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
<title>회원관리</title>
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
			<p id="p-3">회원관리</p>
		
		</div>
		<div id="div-03">
			<p id="p-list">회원리스트</p>
			<table id="table-M">
		      <thead>
		        <tr>
		          <th>이름</th><th>전화번호</th><th>가입 날짜</th>
		        </tr>
		      </thead>
		      <tbody>
		        <tr>
		          <td>홍길동</td><td>010-1111-1111</td><td>2021-07-07</td>
		        </tr>
		        <tr>
		          <td>김길동</td><td>010-2222-3333</td><td>2021-07-06</td>
		        </tr>
		        <tr>
		          <td>이길동</td><td>010-3333-3333</td><td>2021-07-05</td>
		        </tr>
		        <tr>
		          <td>정길동</td><td>010-4444-4444</td><td>2021-07-04</td>
		        </tr>
		        <tr>
		          <td>최길동</td><td>010-5555-5555</td><td>2021-07-03</td>
		        </tr>
		      </tbody>
    		</table>
    		<div id="pageBar-out">
    			<div id="pageBar-in">
	    		<button onclick="#">&lt;&lt;</button>
	    		<button onclick="#">&lt;</button>
	    		
	    		<button onclick="#">&gt;</button>
	    		<button onclick="#">&gt;&gt;</button>
	    		</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>