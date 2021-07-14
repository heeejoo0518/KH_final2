<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<!--  
header
   <div-sort>
      <div-list-container>
         <div-user-nickname>
         <div-user-rate>
         <div-user-content>
         <hr>
         <div-like-date>
	<span-btn-count>
	<span-date>
         <hr>
         <div-btn>
            <span-btn-like>
            <span-btn-report>
footer
-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모두의 영화</title>
<script src="${ path }/js/jquery-3.6.0.min.js"></script>
<style>
        body{
            background-color: #020d18;
        }
        hr{
        	color:white;
        }
        #div-sort{
        	text-align: right;
        }
        #sort-select{
        	border-radius: 10px;
        	height: 50px;
        	width: 200px;
        	margin-right: 330px;
        }
        #div-list-container{
        	background-color:white;
            border-radius: 10px;
            border: 3px solid;
            border-color: graytext;
            width: 60%;
            height: 350px;
            margin: auto;
            margin-bottom: 30px;
        }
        #div-user-nickname{
        	padding-left: 10px;
		    padding-top: 10px;
		    padding-bottom: 15px;
        }
        #div-user-rate{
        	padding-left: 10px;
  			padding-bottom: 15px;
        }
        #div-user-content{
        	padding-left: 10px;
    		padding-bottom: 70px;
        }
        .like-count{
        	padding-left: 10px;
        	margin-left:10px;
        }
        #div-btn{
        	padding-left: 10px;
    		padding-top: 10px;
        }
        .btn-like{
        	padding-right: 30px;
        	padding-left: 28px;
        	position: inherit;
        }
        .span-nickname{
        	padding-right:10px;
        	padding-left:10px;
        	margin-right:20px;
        	text-align:center;
        	color:black;
        	font-weight:lighter;
        	border-color: buttonface;
        	border-style: outset;
        }

    </style>

</head>
    <body>
        <div >
            <h2 style="color: white;">모든 리뷰</h2>  
        </div>
        <div id="div-sort" >
        <select id="sort-select">
            <option onclick="location.href='${path}/review/write'">최근 작성한 글</option>
            <option>별점 높은 순</option>
            <option>별점 낮은 순</option>
        </select>
        </div>
        <br>
        <br>
        <c:if test="${ list != null }">
        	<c:forEach var="review" items="${ list }">
		        <div id="div-list-container">
		        	<div id="div-user-nickname">
		        		<span class="span-nickname"><c:out value="${review.nickname }"/></span>
		        		<span>
		        			<c:choose>
		        				<c:when test="${ review.rate == 0 }">
			        				<img  src="${ path }/images/noStar_img.png" width="20" height="20">
		        				</c:when>
								<c:when test="${ review.rate == 1}">
									<img  src="${ path }/images/oneStar_img.png" width="20" height="20">
								</c:when>		        			
								<c:when test="${ review.rate == 2 }">
			        				<img  src="${ path }/images/twoStar_img.png" width="40" height="20">
		        				</c:when>
		        				<c:when test="${ review.rate == 3 }">
			        				<img  src="${ path }/images/threeStar_img.png" width="20" height="20">
		        				</c:when>
		        				<c:when test="${ review.rate == 4 }">
			        				<img  src="${ path }/images/fourStar_img.png" width="20" height="20">
		        				</c:when>
		        				<c:when test="${ review.rate == 5 }">
			        				<img  src="${ path }/images/fiveStar_img.png" width="110" height="20">
		        				</c:when>
		        			</c:choose>
			        	</span>
		        	</div>
		        	<div id="div-user-content">
		        		<c:out value="${ review.content }"/>
		        	</div>
		        	<hr>
		        	<div id="div-like">
		        		<span class="like-count"> <c:out value="${ review.likeCount }개"/> 
							<!--  <img src="${ path }/images/grade_img.png" width="20px" height="20px">        			
							-->
		        		</span>
		        		<p class="writeDate" style="text-align: right" > <fmt:formatDate type="date" value="${ review.writeDate }"/> </p>
		        	</div>
		        	<div id="div-btn">
		        		<span><input type="button" value="좋아요"></span> 
		        		<span class="btn-report">신고하기 버튼</span>
		        	</div>
		        </div>
        </c:forEach>
        </c:if>
        
        	<br><br><br><br><br>
        
        <div id="pageBar" style="text-align:center;">
			<!-- 맨 처음으로 -->
			<button onclick="location.href='${ path }/review/list?page=1'">&lt;&lt;</button>
			
			<!-- 이전 페이지로 -->
			<button onclick="location.href='${ path }/review/list?page=${ pageInfo.prvePage }'">&lt;</button>

			<!--  10개 페이지 목록 -->
			<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" step="1" varStatus="status">
				<c:if test="${ pageInfo.currentPage == status.current}">
					<button disabled><c:out value="${ status.current }"/></button>
				</c:if>
				<c:if test="${ pageInfo.currentPage != status.current}">
					<button onclick="location.href='${ path }/review/list?page=${ status.current }'">
						<c:out value="${ status.current }"/>
					</button>
				</c:if>
			</c:forEach>
			
			<!-- 다음 페이지로 -->
			<button onclick="location.href='${ path }/review/list?page=${ pageInfo.nextPage }'">&gt;</button>
			
			<!-- 맨 끝으로 -->
			<button onclick="location.href='${ path }/review/list?page=${ pageInfo.maxPage }'">&gt;&gt;</button>
		</div>
    </body>
</html>