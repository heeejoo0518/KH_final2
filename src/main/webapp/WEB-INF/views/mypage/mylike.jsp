<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/mypage/mypage_header.jsp"%>

<c:set var="currentPage" value="${pageInfo.currentPage}"/>

<div class="myLike-container">
	<h2><strong>내가 찜한 영화</strong></h2>
	<div id="movie-list">
		<c:if test="${mylikeList == null}">
			<div class="row">
				<div class="col"> 찜한 영화가 없습니다. </div>
			</div>
		</c:if>
		<c:if test="${mylikeList != null}">
			<c:forEach var="mv" items="${mylikeList}" varStatus = "i">
				<c:if test="${i.index%5 == 0}">
					<div class="row"  style="padding-bottom:20px;">
				</c:if> 
				<div class="col">
					<span>${mv.title_kor}</span><br>
					<button><img src="${mv.m_poster}" style="height:150px;"/></button>
				</div>
				<c:if test="${i.index%5==4 or i.last}">
					</div>
				</c:if> 
			</c:forEach>
		</c:if>
	</div>
	<c:if test="${currentPage != pageInfo.getMaxPage()}">
		<button id="moreBtn" class="btn" style="width:100%;" onclick="more();">더보기</button>
	</c:if>
</div>
	
<%@ include file="/WEB-INF/views/mypage/mypage_footer.jsp"%>

<script>
	var pageNo = ${currentPage};
	
	function more(){
		pageNo = pageNo+1;
		alert(pageNo);
		$.ajax({
			type: "post",
			url: "${path}/mypage/mylikeList",
			dataType: "json",
			async: false,
			data: {pageNo},
			success: function(data) {
				appendMovie(data.mylikeList);
			},
			error: function(e) {
				console.log(e);
			} 
		});
		
	}
	
	function appendMovie(likelist){
		var row;
		for(var i=0;i<likelist.length;i++){
			if(i%5==0){
				//row 생성
				row = document.createElement('div');
				row.setAttribute("class","row");
			}
			
			//col 생성&추가
			var col = document.createElement('div');
			col.setAttribute("class","col");
			var span = document.createElement('span');
			span.innerHTML = likelist[i].title_kor;
			
			var img = document.createElement('img');
			img.setAttribute("src",likelist[i].m_poster);
			img.style.height="150px";
			
			col.appendChild(span);
			col.appendChild(document.createElement('button').appendChild(img));
			
			row.appendChild(col);
			
			if(i%5==4){
				//row 끝, movie-list에 추가
				document.getElementById('movie-list').appendChild(row);
			} else if(i+1 == likelist.length){
				//5개 안채웠는데 끝났을 때
				for(i=i+1;i%5==4;i++){
					var col = document.createElement('div');
					col.setAttribute("class","col");
					row.appendChild(col);
				}
				
				document.getElementById('movie-list').appendChild(row);
			}
		}
		
		
		if(likelist.length!=20){
			//더보기 버튼 숨기기
			$('#moreBtn').hide();
		}
		
	}
</script>