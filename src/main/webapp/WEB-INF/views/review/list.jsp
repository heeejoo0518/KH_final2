<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%
Object sortNum = request.getAttribute("sort");
String sort = (String)sortNum;
 %>
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
        	margin-right: 300px;
        	
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
        	height: 200px;
        }
        #div-user-spoilerContent{
        	padding-left: 10px;
        	height: 130px;
        	filter: blur(3px);
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

    </style>

</head>
    <body>
        <div >
            <h2 style="color: white;">모든 리뷰</h2>  
        </div>
        
        
        <form action="${ path }/review/list" method="GET">
        <input type="hidden" name="no" value="${no}">
        <div id="div-sort" >
        <select id="sort-select" name="sort" onchange="this.form.submit();">
            <option >정렬 방식을 선택해주세요.</option>
            <option value="a" id="1">최근 작성한 글</option>
            <option value="b" id="2">별점 높은 순</option>
            <option value="c" id="3">별점 낮은 순</option>
        </select>
        </div>
        </form>
        
        
<!--  <script >    
     화면 전환 후 select box 고정 (ajax사용시 사용가능) 
    var selectedSort = [[${selectedSort}]]; // 화면전환 하면서 값을 받아온다
    
    if(selectedSort == 1){
        $('#1').attr('selected','selected');
    } else if(selectedYear == 2){
        $('#2').attr('selected','selected');
    } else{
        $('#3').attr('selected','selected');
    }
</script>
    -->
        
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
		        	
		        	<!--  
		        	<script>
			        	$(function(){
			        		$('#btn-spoiler').click(function(){
			        			if($("#div-user-spoilerContent").css("blur")== .removeAttr('style');
			        			
			        			
			        		});
			        	});
		        	</script>
		        	-->
		        	
		        	<c:choose>
		        		<c:when test="${ review.spoiler eq '0' }">
				        	<div id="div-user-content">
				        		<c:out value="${ review.content }"/>
				        	</div>
		        		</c:when>
		        		<c:when test="${ review.spoiler eq '1' }">
		        		
		        			<p style="text-align: center">스포일러를 보려면 버튼 클릭!</p>
		        			<input id="btn-spoiler" type="button" value="리뷰 확인">
		        			<div id="div-user-spoilerContent">
				        		<c:out value="${ review.content }"/>
				        	</div>
				        	
		        		</c:when>
		        	</c:choose>
		        	
		        	<!--  
		        	<script>
		        	$(function(){
		        		$("#btn-spoiler").on("click", function(){
							$("#div-user-spoilerContent").css('filter','');
		        		}
		        	});
		        	
		        	</script>
		        	-->
		        	
		        	<hr>
		        	<div id="div-like" style="padding-left: 10px;">
		        		<span class="like-count"> <c:out value="${ review.likeCount }개"/> </span>
		        		<span class="writeDate" style="text-align: right" > <fmt:formatDate type="date" value="${ review.writeDate }"/> </span>
		        	</div>
		        	
		        	<!--  
		        	<div id="div-btn"> <!-- 좋아요  
			        		<input type="button" value="좋아요!" >
			        		<input type="button" value="test!" id="btn-like" onclick="fun1()">
		        	</div>
		        	-->
		        	
		        </div>
        </c:forEach>
        </c:if>
        
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