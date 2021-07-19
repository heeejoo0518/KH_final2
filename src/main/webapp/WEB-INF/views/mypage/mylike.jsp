<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/mypage/mypage_header.jsp"%>

<div class="myLike-container">
	<h2><strong>내가 찜한 영화</strong></h2>
	<div class="row">
		<c:if test="${likeList eq null}">
			<div class="col"> 찜한 영화가 없습니다. </div>
		</c:if>
	</div>
</div>
	
<%@ include file="/WEB-INF/views/mypage/mypage_footer.jsp"%>