<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<link rel="stylesheet" href="${ path }/resources/css/main.css" />
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>게시판 </h2>
	<div id="board-list-container">
		<c:if test="${ loginMember != null }">
			<button type="button" id="btn-add"
				onclick="location.href='${ path }/notice/write'">글쓰기</button>
		</c:if>
		<table id="tbl-board">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
			<c:if test="${ list == null }">
				<tr>
					<td colspan="6">
						조회된 게시글이 없습니다.
					</td>
				</tr>
			</c:if>
			<c:if test="${ list != null }">
				<c:forEach var="notice" items="${ list }">
					<tr>
						<td><c:out value="${ notice.no }"/></td>
						<td>
							<a href="${ path }/notice/view?no=${notice.no }">
								<c:out value="${ notice.title }"/>
							</a>
						</td>
						<td><c:out value="${ notice.writerId }"/></td>
						<td><fmt:formatDate type="date" value="${ notice.createDate }"/></td>					
					</tr>				
				</c:forEach>
			</c:if>
		</table>
		<div id="pageBar">
			<!-- 맨 처음으로 -->
			<button onclick="location.href='${ path }/board/list?page=1'">&lt;&lt;</button>
			
			<!-- 이전 페이지로 -->
			<button onclick="location.href='${ path }/board/list?page=${ pageInfo.prvePage }'">&lt;</button>

			<!--  10개 페이지 목록 -->
			<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" step="1" varStatus="status">
				<c:if test="${ pageInfo.currentPage == status.current}">
					<button disabled><c:out value="${ status.current }"/></button>
				</c:if>
				<c:if test="${ pageInfo.currentPage != status.current}">
					<button onclick="location.href='${ path }/notice/list?page=${ status.current }'">
						<c:out value="${ status.current }"/>
					</button>
				</c:if>
			</c:forEach>
			
			<!-- 다음 페이지로 -->
			<button onclick="location.href='${ path }/notice/list?page=${ pageInfo.nextPage }'">&gt;</button>
			
			<!-- 맨 끝으로 -->
			<button onclick="location.href='${ path }/notice/list?page=${ pageInfo.maxPage }'">&gt;&gt;</button>
		</div>
	</div>
</body>
</html>