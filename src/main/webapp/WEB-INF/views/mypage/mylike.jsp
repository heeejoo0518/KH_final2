<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/mypage/mypage_header.jsp"%>

<c:set var="currentPage" value="${pageInfo.currentPage}"/>

<div class="myLike-container">
	<h2><strong>내가 찜한 영화</strong></h2>
	<c:if test="${mylikeList == null or fn:length(mylikeList) == 0}">
		<div class="row">
			<div class="col"> 찜한 영화가 없습니다. </div>
		</div>
	</c:if>
						
	<c:if test="${mylikeList != null}">
		<div id="movie-list" class="row">
			<c:forEach var="mv" items="${mylikeList}" varStatus = "i">
				<div class="col" style="padding-bottom:20px;">
					<span>${mv.title_kor}</span><br>
					<button onclick="location.href='${path}/movie/view?no=${mv.movieNo}'"><img src="${mv.m_poster}" style="height:150px;"/></button>
				</div>
			</c:forEach>
		</div>
	</c:if>	

	<c:if test="${currentPage != pageInfo.getMaxPage() and fn:length(mylikeList) != 0}">
		<button id="moreBtn" class="btn" style="width:100%;" onclick="more();">더보기</button>
	</c:if>
</div>
	
<%@ include file="/WEB-INF/views/mypage/mypage_footer.jsp"%>

<script>
	var pageNo = ${currentPage};
	var path = "${path}/movie/view?no=";

	function more(){
		pageNo = pageNo+1;

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
			//col 생성&추가
			var col = document.createElement('div');
			col.setAttribute("class","col");
			var span = document.createElement('span');
			span.innerHTML = likelist[i].title_kor;
			
			var bt = document.createElement('button');
			bt.setAttribute('onclick',"location.href='"+path+likelist[i].movieNo+"'"); //링크추가예정
			var img = document.createElement('img');
			img.setAttribute("src",likelist[i].m_poster);
			img.style.height="150px";
			
			bt.appendChild(img);
			
			col.appendChild(span);
			col.appendChild(document.createElement('br'));
			col.appendChild(bt);
			
			document.getElementById('movie-list').appendChild(col);
		}
		
		if(likelist.length!=20){
			//더보기 버튼 숨기기
			$('#moreBtn').hide();
		}
		
	}
</script>