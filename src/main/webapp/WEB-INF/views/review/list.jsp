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
        	margin-right: 400px;
        	
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
        	height: 230px;
        }
        #div-user-spoilerContent{
        	padding-left: 10px;
        	height: 160px;
        	background-color: black;
        	
        }
        .like-count{
        	padding-left: 10px;
        	padding-right: 10px;
		    text-align: center;
		    color: black;
		    font-weight: lighter;
		    border-color: buttonface;
		    border-style: outset;
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
        	margin-right:10px;
        	text-align:center;
        	color:black;
        	font-weight:lighter;
        	border-color: buttonface;
        	border-style: outset;
        }
        .writeDate{
        	float: right;
        	margin-right: 10px;
        }
        #empty-list{
        	text-align: center;
        	color: white;
        }
        #btn-spoiler{
        	margin-left: 540px;
        	margin-bottom: 5px;
        }
        #spoiler-text{
        	color:white;
        }

    </style>

</head>
    <body>
    
        <div >
            <h2 style="color: white;">모든 리뷰</h2>  
        </div>
        
        <form action="${ path }/review/list" method="GET">
        <input type="hidden" name="no" value="${no}">
        <div id="div-sort" >
        <div id="spoiler-text">
        	스포일러 게시글<input type="checkbox" id="spoBox" class="spoBox">
        </div>
        <select id="sort-select" name="sort" onchange="this.form.submit();">
            <option >정렬 방식을 선택해주세요.</option>
            <option value="a" id="1">최근 작성한 글</option>
            <option value="b" id="2">별점 높은 순</option>
            <option value="c" id="3">별점 낮은 순</option>
        </select>
        </div>
        </form>
        
        
        <br>
        <br>
        <c:if test="${ empty list }">
        		<p id="empty-list">등록된 게시글이 없습니다.</p>
		</c:if>
        <c:if test="${ list != null }">
        	<c:forEach var="review" items="${ list }">
		        <div id="div-list-container">
		        	<div id="div-user-nickname">
		        		<span class="span-nickname"><c:out value="${review.nickname }"/></span>
		        		
		        		<!--  <span class="span-nickname"><c:out value="${ no }"/></span>
		        		-->
		        		
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
			        				<img  src="${ path }/images/threeStar_img.png" width="60" height="20">
		        				</c:when>
		        				<c:when test="${ review.rate == 4 }">
			        				<img  src="${ path }/images/fourStar_img.png" width="80" height="20">
		        				</c:when>
		        				<c:when test="${ review.rate == 5 }">
			        				<img  src="${ path }/images/fiveStar_img.png" width="100" height="20">
		        				</c:when>
		        			</c:choose>
			        	</span>
		        	</div>
		        	
		        	<!-- 스포일러(0)==스포일러 포함X -->
		        	<c:choose>
		        		<c:when test="${ review.spoiler eq '0' }">
				        	<div id="div-user-content">
				        		<c:out value="${ review.content }"/>
				        	</div>
		        		</c:when>
		        		
		        		<c:when test="${ review.spoiler eq '1' }">
		        			<p style="text-align: center">스포일러가 포함된 리뷰를 보려면 버튼 클릭!</p>
		        			<button id="btn-spoiler" onclick="btnSpoiler()">스포일러 리뷰</button>
		        			<div id="div-user-spoilerContent" class="div-user-spoilerContent"> 
		        				<c:out value="${ review.content }"/>
		        				
				        	</div>
		        		</c:when>
		        	</c:choose>
		        	
		        	
		        	<hr>
		        	<div id="div-like" style="padding-left: 10px;">
		        		<span class="writeDate" style="text-align: right" > <fmt:formatDate type="date" value="${ review.writeDate }"/> </span>
		        	</div>
		        	
		        	<c:if test="${!empty loginMember && loginMember.nickname == review.nickname }">
		        	<div id="div-btn"> <!-- 삭제버튼 -->  
		        		<button id="btnDelete" onclick="btnDelete()">게시글 삭제</button>
		        	</div>
		        	</c:if>
		        	
		        	<!--   게시글 번호를 가져오면 삭제 가능,, 현재까지 가져올 방법을 못찾음
		        	<script>
						var reviewNo = '<:cout value="${reviewNo}"/>';
						function btnDelete(){
							if(confirm("리뷰를 삭제하시겠습니까?")){
								location.replace("${ path }/review/delete?reviewNo=${reviewNo}");
								console.log(reviewNo)
							} else{
								alert("취소하셨습니다.");
							}
						}
					</script>
					-->
		
		        </div>
        </c:forEach>
        </c:if>
        
        <script> 
				        var review_content = '<c:out value="${review.content}"/>';
				        var loginNickname = '<c:out value="${loginMember.nickname}"/>';
				        var reviewNickname = '<c:out value="${review.nickname}"/>';
				        	function btnSpoiler(){
				        		if(confirm("스포일러가 포함된 리뷰를 확인하시겠습니까?")){
					        		document.getElementById("div-user-spoilerContent").innerHTML=review_content;
				        		} else{
				        			alert("취소하셨습니다.");
				        		}
				        			
				        		console.log(loginNickname);
				        		console.log(reviewNickname);
				        		console.log(review_content);
				       		}
				    </script>
        
        <script>
        	$(function(){
        		$("#spoBox").on("click", function(){
        			alert("체크박스 클릭");
        			$('.div-user-spoilerContent').css({'background-color' : 'white'});
        		});
        	});
        </script>
        
        
        <!--  <script>
        	$(function(){
        		$("#btn-like").on("click", function(){
/*	review.likecount 변수로 받아오고
 *  데이타에 넣고
 	성공하면 성공 구문안에 데이터를 
 
 */
        			
        			$.ajax({
        				type: "post",
        				url: "${path}/review/like",
        				dataType: "json",
        				async: false,
        				data: 
        				success: function(data) {
        					
        				},
        				error: function(e) {
        					console.log(e);
        					)
        				
        			})
        		});
        	})
        	
        </script>
        -->
			   
		        <div id="pageBar" style="text-align:center;">
					<!-- 맨 처음으로 -->
					<button onclick="location.href='${ path }/review/list?no=${no}&sort=${sort}&page=1'">&lt;&lt;</button>
					
					<!-- 이전 페이지로 -->
					<button onclick="location.href='${ path }/review/list?no=${no}&sort=${sort}&page=${ pageInfo.prvePage }'">&lt;</button>
		
					<!--  10개 페이지 목록 -->
					<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" step="1" varStatus="status">
						<c:if test="${ pageInfo.currentPage == status.current}">
							<button disabled><c:out value="${ status.current }"/></button>
						</c:if>
						<c:if test="${ pageInfo.currentPage != status.current}">
							<button onclick="location.href='${ path }/review/list?no=${no}&sort=${sort}&page=${ status.current }'">
								<c:out value="${ status.current }"/>
							</button>
						</c:if>
					</c:forEach>
					
					<!-- 다음 페이지로 -->
					<button onclick="location.href='${ path }/review/list?no=${no}&sort=${sort}&page=${ pageInfo.nextPage }'">&gt;</button>
					
					<!-- 맨 끝으로 -->
					<button onclick="location.href='${ path }/review/list?no=${no}&sort=${sort}&page=${ pageInfo.maxPage }'">&gt;&gt;</button>
				</div>
				
				
    </body>
</html>