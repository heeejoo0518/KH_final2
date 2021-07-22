<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/mypage/mypage_header.jsp"%>

<div class="myReview-container">
	<h2><strong>내가 쓴 리뷰</strong></h2>
	<table class="table table-dark table-hover">
	    <thead>
	      <tr>
	        <th>번호</th>
	        <th>영화제목</th>
	        <th>리뷰내용</th>
	        <th>별점</th>
	        <th>추천수</th>
	        <th>등록일</th>
	      </tr>
	    </thead>
	    <tbody>
	    <c:choose>
	      <c:when test="${myReviewList eq null or fn:length(myReviewList) == 0}">
	      	<tr>
	      		<td colspan="5" style="text-align:center;">내가 쓴 리뷰가 없습니다.</td>
	      	</tr>
	      </c:when>
	      <c:otherwise>
		    <c:forEach var="review" items="${myReviewList}" varStatus="i">
		    	<tr>
		      		<td>${pageInfo.getListCount() - pageInfo.getStartList() - i.index + 1}</td>
		      		<td><a href="${path}/movie/view?no=${review.movieNo}">${review.movieTitle_kor}</a></td>
		      		<td><a href="#">${review.content}</a></td>
		      		<td>${review.rate}</td>
		      		<td>${review.likeCount}</td>
		      		<td><fmt:formatDate value="${review.writeDate}" pattern="yyyy-MM-dd" /></td>
		      	</tr>	      
		      </c:forEach>
	      </c:otherwise>
	    </c:choose>
	    </tbody>
 	</table>
 		<ul class="pagination" id="pageBar">
			<li class="page-item"><a class="page-link" href="${path}/mypage/myreview?page=1">&laquo;</a></li>
			<li class="page-item"><a class="page-link" href="${path}/mypage/myreview?page=${pageInfo.getPrvePage()}">&lt;</a></li>
			<c:forEach var="p" begin="${pageInfo.getStartPage()}" end="${pageInfo.getEndPage()}">
				<c:choose>
					<c:when test="${p eq pageInfo.getCurrentPage()}">
						<li class="page-item active"><a class="page-link">${p}</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="${path}/mypage/myreview?page=${p}">${p}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<li class="page-item"><a class="page-link" href="${path}/mypage/myreview?page=${pageInfo.getNextPage()}">&gt;</a></li>
			<li class="page-item"><a class="page-link" href="${path}/mypage/myreview?page=${pageInfo.getMaxPage()}">&raquo;</a></li>
		</ul> 	
</div>
<%@ include file="/WEB-INF/views/mypage/mypage_footer.jsp"%>