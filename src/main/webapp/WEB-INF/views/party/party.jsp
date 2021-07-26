<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${path}/resources/css/bootstrapDarkly.css" rel="stylesheet"/>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<style>
@font-face {
    font-family: 'NanumSquareRound';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumSquareRound.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

h2 {color:white; margin-top:50px; margin-bottom:30px;}
#preloader {background-color:#020d18; color: white; font-family: 'NanumSquareRound';}
textarea{resize:none;}

/* 작성 폼 영역 스타일 */
#sub-button{text-align: center;}
	
/* 모집 게시글 카드 스타일 */
#pt-card{border-radius:10px; margin: 20px 20px; padding:20px;
    display: flex;
    flex-direction: column;
    justify-content: space-between;}
    
#pt-title{color:#4280bf; padding-left:10px; font-size:13pt; font-weight: bold;}
#pt-logo{width:20px;height:20px;}
p#pt-writer {color: #abb7c4;	font-size:10pt; margin-top:5px;	margin-bottom:5px;}

/* 상단 로고 이미지 스타일 */
#ottBt {width:64px; height:64px; background-color:white; border-radius:50%; display:flex; justify-content:center; align-items:center ; cursor:pointer; margin:10px; margin-bottom:30px; }
/* #ottBt:hover {background-color:#dcf836;} */
img#listImg {width:40px; height:40px;}
#select-type{display:flex; justify-content:center; margin:auto; padding:30px;}
#party-list {display:flex; justify-content:space-evenly;}

/*신고하기 버튼 */
#dtimg{width:15px; height:15px; margin-left:10px; opacity:0; transition:0.5s all;}
#ott-logo{display:inline;}
#pt-card:hover #dtimg{opacity:1; cursor:pointer;}
#pt-card:hover {background:#071829; transition:0.5s all;}
#open-bt{
	display:flex;
	justify-content:center;
	align-content:flex-end;
	padding-top:10px;
}
</style>

	<section id="preloader">
		<div class ="container" >

<div class="row">
		<div class="col-sm-12">
			<h3 style="text-align:center;">파티원 모집하기</h3>
			<h5 style="text-align:center;">파티원 구하기로<br>스트리밍을 쉽고 빠르게!</h5>
		</div>
	
		
<div id="select-type" class="center-block">
		<div id="ottBt">
		<img id="listImg" src="${path}/resources/images/icon_netflix.png" />
		</div>
		
		<div id="ottBt">
		<img id="listImg" src="${path}/resources/images/icon_watcha.png" />
		</div>
		
		<div id="ottBt">
		<img id="listImg" src="${path}/resources/images/icon_wavve.png" />
		</div>
		
		<div id="ottBt">
		<img id="listImg" src="${path}/resources/images/tving_logo.png" />
		</div>
</div>

	<button id="ptbt" type="button"  class="btn btn-outline-info btn-lg" 
					style="width: 40%; margin: auto;">파티원 모집하기</button>
							
			
<div id="party-pt" class="row">
		<div class="col-sm-12" style="text-align:center; margin-top:50px;">
			<h3 style="display:inline;">모집 중인 파티</h3>
					<p style="color:lightgrey; text-align:center; padding-bottom:20px;"> 모집 중인 파티에 참가해보세요</p>
		</div>
		
		
<div id="party-list" class="row">

	<div class="row" style="justify-content:center;">

			<c:if test="${ list.isEmpty()}">
				<div class="col-sm-12">
						<p>모집 중인 파티가 없습니다.</p>
				</div>
			</c:if>
			

			<c:if test="${ list != null }">
				<c:forEach var="party" items="${list }">
								
							<div id="pt-card" class="col-sm-3">
									 <div >
										 	<div id="ott-logo">
										 	<c:choose> 
													<c:when test="${party.ott_type eq '넷플릭스'}">
														<img id="pt-logo" alt="로고" src="${path}/resources/images/icon_netflix.png"/>
													</c:when> 
													<c:when test="${party.ott_type eq '왓챠'}">
														<img id="pt-logo" alt="로고" src="${path}/resources/images/icon_watcha.png"/>
													</c:when> 
													<c:when test="${party.ott_type eq '웨이브'}">
														<img id="pt-logo" alt="로고" src="${path}/resources/images/icon_wavve.png"/>
													</c:when>
													<c:otherwise>
														<img id="pt-logo" alt="로고" src="${path}/resources/images/tving_logo.png"/>
													</c:otherwise>
											</c:choose> 
										 	
										 	</div>
												<span id="pt-title" class="card-title"><c:out value="${party.name }"/></span>
										 <div>
									  		<span id="pt-writer"><c:out value="${party.writer_id }"/></span>
									  		<c:if test="${ !empty signinMember && (signinMember.u_id == party.writer_id || signinMember.u_role == 1) }">
							 					 <a id="delete" onclick="del(${party.party_no})">
							 					 <img id="dtimg" src="${path}/resources/images/remove.png"/>
							 					</a>
							 				</c:if>
									  	</div>
									  	<div>
										  	<p id="pt-date" style="font-size:10pt; color:grey;"><c:out value="${party.create_date}"/></p>
									   		<p style="padding-right:5px;"><c:out value="${party.content }"/></p>
									   	</div>

									 <div id="open-bt">
							 			<button style="padding:10px;" class="btn btn-outline-warning" onclick="location.href='${party.link}' ">오픈채팅방 참여하기</button>
							 		</div>
								</div> 
							</div>
		</c:forEach>
	</c:if>			
</div>

				<div class="col-sm-12">
						<button id="more" 
						onclick="location.href='${ path }/party/list?page=${ pageInfo.nextPage }'"
						 class="btn btn-outline-light btn-lg btn-block" >더보기</button>
					</div>
					
		<script>
			
		</script>

</div>
					
		 		
</div>
</div>
</div>
</section>



<%@ include file="/WEB-INF/views/common/footer.jsp"%>
<%@ include file="/WEB-INF/views/common/modal.jsp"%>

<script>
(function($){  
	document.getElementById('ptbt').onclick = function () {
		title="파티원 모집하기";
		$( "#modal-body" ).load('${ path }/party/partyWrite');
	$('#modal-title').text(title);
	$('#modal').modal('show');
	
		};
	
})(jQuery);
	
</script>

<script>
function del(party_no) {
	var chk = confirm("정말 삭제하시겠습니까?");
	if (chk) {
		location.href='delete?party_no='+party_no;
	}
}	
</script>