<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<%@ include file="/WEB-INF/views/common/header.jsp"%>


<style>
h2 {color:white; margin-top:50px; margin-bottom:30px;}
#preloader {background-color:#020d18; color: white;}
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
img {width:40px; height:40px;}
#select-type{display:flex; justify-content:center; margin:auto; padding:30px;}
#party-list {display:flex; justify-content:space-evenly;}

/*신고하기 버튼 */
#siren{width:15px; height:15px; margin-left:10px; opacity:0; transition:0.5s all;}
#ott-logo{display:inline;}
#pt-card:hover #siren{opacity:1;}
#pt-card:hover {background:#071829; transition:0.5s all;}
#open-bt{
	display:flex;
	justify-content:center;
	align-content:flex-end;
	padding-top:10px;
}
</style>

<%@ include file="/WEB-INF/views/common/modal.jsp"%>

<script>
	function openModal(){
		
			title="파티원 모집하기";
			$( "#modal-body" ).load('${ path }/party/partyWrite');
		$('#modal-title').text(title);
		$('#modal').modal('show');
	}
	
</script>


	<section id="preloader">
		<div class ="container" >

<div class="row">
		<div class="col-sm-12">
			<h3 style="text-align:center;">파티원 모집하기</h3>
			<h5 style="text-align:center;">파티원 구하기로<br>스트리밍을 쉽고 빠르게!</h5>
		</div>
	
		
<div id="select-type" class="center-block">
		<div id="ottBt">
		<img src="${path}/resources/images/icon_netflix.png" onclick="openModal();return false;"/>
		</div>
		
		<div id="ottBt">
		<img src="${path}/resources/images/icon_watcha.png" onclick="openModal();return false;"/>
		</div>
		
		<div id="ottBt">
		<img src="${path}/resources/images/icon_wavve.png" onclick="openModal();return false;"/>
		</div>
		
		<div id="ottBt">
		<img src="${path}/resources/images/icon_tving.png" onclick="openModal();return false;"/>
		</div>
</div>

	<button type="button"  class="btn btn-outline-info btn-lg" onclick="openModal();return false;"
					style="width: 40%; margin: auto;">파티원 모집하기</button>
							
			
<div id="party-pt" class="row">
		<div class="col-sm-12" style="text-align:center; margin-top:50px;">
			<h3 style="display:inline;">모집 중인 파티</h3>
					<p style="color:lightgrey; text-align:center; padding-bottom:20px;"> 모집 중인 파티에 참가해보세요</p>
		</div>
		
		
<div id="party-list" class="row">

	<div class="row" style="justify-content:center;">
<!--  
<form name="form1" method="GET" action="party">

    <select name="search_option">
        <option value="ott_type"
				<c:if test="${ott_type eq '넷플릭스'}">selected</c:if>
  > 넷플릭스</option>

        <option value="ott_type" 
				<c:if test="${ott_type eq '왓챠'}">selected</c:if>
        >왓챠</option>

        <option value="ott_type" 
				<c:if test="${ott_type eq '웨이브'}">selected</c:if>
        >웨이브</option>

        <option value="ott_type" 
				<c:if test="${ott_type eq '티빙'}">selected</c:if>
        >티빙</option>

    </select>
    <input name="keyword" value="${map.keyword}">
    <input type="submit" value="조회">
</form>
 -->

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
														<img id="pt-logo" alt="로고" src="${path}/resources/images/icon_tving.png"/>
													</c:otherwise>
											</c:choose> 
										 	
										 	</div>
												<span id="pt-title" class="card-title"><c:out value="${party.name }"/></span>
										 <div>
									  		<span id="pt-writer"><c:out value="${party.writer_id }"/></span>
									  		<a href="/">
									  		<img id="siren" src="${path}/resources/images/siren.png"/>
									  		</a>								  		
									  	</div>
									  	<div>
										  	<p id="pt-date" style="font-size:10pt; color:grey;"><c:out value="${party.create_date}"/></p>
									   		<p style="padding-right:5px;"><c:out value="${party.content }"/></p>
									   	</div>
									 </div>
									 
									 <div id="open-bt">
							 			<button style="padding:10px;" class="btn btn-outline-warning" onclick="location.href='${party.link}' ">오픈채팅방 참여하기</button>
							 		</div>
								</div> 
		</c:forEach>
	</c:if>			
</div>

				<div class="col-sm-12">
						<button id="pt_more" onclick="moreList();" class="btn btn-outline-light btn-lg btn-block" >더보기</button>
					</div>
					

</div>
					
		 		
</div>
</div>
</div>
</section>



<%@ include file="/WEB-INF/views/common/footer.jsp"%>

