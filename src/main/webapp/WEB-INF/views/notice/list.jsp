<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<head>
<title>공지사항</title>
<link rel="stylesheet"
	href='http://fonts.googleapis.com/css?family=Dosis:400,700,500|Nunito:300,400,600' />
<meta name=viewport content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="${ path }/css/style.css">

<style>
#board-container {
	width: 80%;
	margin: 10px auto;
	padding: auto;
}

#board-content {
	width: 700px;
	padding: 20px;
	margin-bottom: 20px;
	float: left;
	border: 1px solid #bcbcbc;
}

#board-content {
	text-align: center;
}

table#tbl-board {
	width: 80%;
	margin: 0 auto;
	border-collapse: collapse;
}

table#tbl-board th, table#tbl-board td {
	text-align: center;
}
/*글쓰기버튼*/
input#btn-add {
	float: right;
	margin: 0 0 15px;
}

div#pageBar {
	margin-top: 10px;
	text-align: center;
}
</style>
</head>

<body>
	<div class="hero common-hero">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="hero-ct">
						<h1>공지사항</h1>
							<c:if test="${ signinMember.u_id eq 'admin'}">
		<button type="button" id="btn-add"
			onclick="location.href='${ path }/notice/write'">
			<h3>글쓰기</h3>
		</button>
	</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>

	<table id="tbl-board">
		<tr style="background-color: #062038">
			<th style="width: 10%">
				<h3>번호</h3>
			</th>
			<th style="width: 70%"><h3>제목</h3></th>
			<th style="width: 10%"><h3>작성자</h3></th>
			<th style="width: 10%"><h3>작성일</h3></th>
		</tr>
		<c:if test="${ list == null }">
			<tr>
				<td colspan="6">조회된 게시글이 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${ list != null }">
			<c:forEach var="notice" items="${ list }">
				<tr>
					<td><c:out value="${ notice.no }" /></td>
					<td><a href="${ path }/notice/view?no=${notice.no }"> <c:out
								value="${ notice.title }" />
					</a></td>
					<td><c:out value="${ notice.writerId }" /></td>
					<td><fmt:formatDate type="date" value="${ notice.createDate }" /></td>
				</tr>
			</c:forEach>
		</c:if>
	</table>

	<div id="pageBar" style="align-self: center;">
		<!-- 맨 처음으로 -->
		<button onclick="location.href='${ path }/notice/list?page=1'">&lt;&lt;</button>

		<!-- 이전 페이지로 -->
		<button
			onclick="location.href='${ path }/notice/list?page=${ pageInfo.prvePage }'">&lt;</button>

		<!--  10개 페이지 목록 -->
		<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }"
			step="1" varStatus="status">
			<c:if test="${ pageInfo.currentPage == status.current}">
				<button disabled>
					<c:out value="${ status.current }" />
				</button>
			</c:if>
			<c:if test="${ pageInfo.currentPage != status.current}">
				<button
					onclick="location.href='${ path }/notice/list?page=${ status.current }'">
					<c:out value="${ status.current }" />
				</button>
			</c:if>
		</c:forEach>

		<!-- 다음 페이지로 -->
		<button
			onclick="location.href='${ path }/notice/list?page=${ pageInfo.nextPage }'">&gt;</button>

		<!-- 맨 끝으로 -->
		<button
			onclick="location.href='${ path }/notice/list?page=${ pageInfo.maxPage }'">&gt;&gt;</button>
	</div>

	<script src="${ path }/js/jquery.js"></script>
	<script src="${ path }/js/plugins.js"></script>
	<script src="${ path }/js/plugins2.js"></script>
	<script src="${ path }/js/custom.js"></script>
</body>
</html>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
