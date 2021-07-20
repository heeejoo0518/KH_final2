<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet"
	href='http://fonts.googleapis.com/css?family=Dosis:400,700,500|Nunito:300,400,600' />
<meta name=viewport content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="${ path }/css/style.css">
</head>
<h2>MYMY</h2>
<style>
    section>div#board-write-container{width:600px; margin:0 auto; text-align:center;}
    section>div#board-write-container h2{margin:10px 0;}
    table#tbl-board{width:80%; margin:0 auto; border-collapse:collapse; clear:both; }
    table#tbl-board th {width: 125px; padding: 5px 0; text-align:center;} 
    table#tbl-board td {padding: 5px 0 5px 10px; text-align:left;} 
</style>
	<div class="hero common-hero">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="hero-ct">
						<h1>${notice.title}</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
<div id="board-write-container">
	<table id="tbl-board">
		<tr>
			<th>글번호</th>
			<td>${notice.no}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>모영운영자</td>
		</tr>
		<tr>
			<th>제 목</th>
			<td>${notice.title}</td>
		</tr>
		<tr>
			<th>내 용</th>
			<td style="background-color: #062038">${ notice.content }</td>
		</tr>
		<%--글작성자/관리자인경우 수정삭제 가능 --%>
		<tr>
			<th colspan="2">
				<c:if test="${ signinMember.u_id eq 'admin'}">
					<button type="button" id="btnUpdate">수정</button>
					<button type="button" id="btnDelete">삭제</button>
				</c:if>

				<button type="button" onclick="location.href='${ path }/notice/list'">목록으로</button>
			</th>
		</tr>
	</table>
</div>


<script>
	$(document).ready(() => {
		$("#btnUpdate").on("click", (e) => {
			location.href = "${path}/notice/update?no=${notice.no}";
});
		
		$("#btnDelete").on("click", (e) => {
			if(confirm("정말로 게시글을 삭제 하시겠습니까?")) {
				location.replace("${path}/notice/delete?noticeNo=${notice.no}");
			}
		});
	});
</script>
</body>
</html>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
