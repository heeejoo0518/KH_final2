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
</head>
<body>
<h2>게시판 수정</h2>
<div id='board-write-container'>
	<form action="${ path }/board/update" method="POST" enctype="multipart/form-data">
		<input type="hidden" name="no" value="${ notice.no }" />
		<input type="hidden" name="originalFileName" value="${ notice.originalFileName }" />
		<input type="hidden" name="renamedFileName" value="${notice.renamedFileName}" />
	
		<table id='tbl-board'>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" id="title" value="${notice.title}"></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="writerId" value="${ notice.writerId }" readonly></td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea name="content" cols="50" rows="15" ><c:out value="${ notice.content }"></c:out></textarea>
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" value="수정">
					<input type="button" onclick="location.replace('${ path }/notice/list')" value="목록으로">
				</th>
			</tr>
		</table>
	</form>
</div>
</body>
</html>