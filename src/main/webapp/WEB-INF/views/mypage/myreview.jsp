<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/mypage/mypage_header.jsp"%>

<div class="myReview-container">
	<h2><strong>내가 쓴 리뷰</strong></h2>
	<table class="table table-dark table-hover">
	    <thead>
	      <tr>
	        <th>번호</th>
	        <th>리뷰내용</th>
	        <th>별점</th>
	        <th>추천수</th>
	        <th>등록일</th>
	      </tr>
	    </thead>
	    <tbody>
	      <c:if test="${reviewList eq null}">
	      	<tr>
	      		<td colspan="5" style="text-align:center;">내가 쓴 리뷰가 없습니다.</td>
	      	</tr>
	      </c:if>
	    </tbody>
  </table>
</div>
	
<%@ include file="/WEB-INF/views/mypage/mypage_footer.jsp"%>