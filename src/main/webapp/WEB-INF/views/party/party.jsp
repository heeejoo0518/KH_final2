<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="${ path }/js/jquery-3.6.0.min.js"></script>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link rel="stylesheet" href="/resources/bootstrapDarkly.css">

<style>
h2 {color: white; margin-top:50px; margin-bottom:30px;}
#preloader {background-color: #020d18; color: white;}
textarea{resize:none;}

/* 작성 폼 영역 스타일 */
#sub-button{text-align: center;}
#party-form {display: none; background:#071829; border-radius:10px; margin-top:10px; padding: 15px;}
	
/* 모집 게시글 카드 스타일 */
#pt-card{background:#071829; margin:0 auto; margin-bottom: 30px; padding:15px;}
#pt-title{color:#4280bf; padding-left:10px; font-size:13pt; font-weight: bold;}
#pt-logo{width:30px;height:30px;}
p#pt-writer {color: #abb7c4;	font-size:10pt; margin-top:5px;	margin-bottom:5px;}




</style>



<script>
	$("#selectBox option:selected").val();
	$("select[name=selectBox]").val();
	$("#selectBox option").index($("#selectBox option:selected"));
	
	/* 처음에 form 숨기고 플랫폼 클릭시에 form 뜨게함 */
	$(document).ready(function() {
		  $('#selectBox').change(function() {
		    var result = $('#selectBox option:selected').val();
		    if (result == 'none-select') {
		      $('#party-form').slideUp();
		    } else {
		      $('#party-form').slideDown();
		    }
		  }); 
		}); 
	
	/*100자 이내 작성*/
	$(document).ready(function() {
	    $('#sh-con').on('keyup', function() {
	        $('#con-num').html("("+$(this).val().length+" / 100)");
	 
	        if($(this).val().length > 100) {
	            $(this).val($(this).val().substring(0, 100));
	            $('#con-num').html("(100 / 100)");
	        }
	    });
	});

</script>

<body  id="preloader">

	<section >
		<div class ="container" >

		<div class="row">
		<div class="col-sm-12">
			<h2>파티 모집</h2>
		</div>
		
			<div class="row">
				<div class="col-sm-12">
				
					<select id="selectBox" class="form-control">
						  <option value="none-select" selected="selected">플랫폼을 선택하세요</option>
						  <option value="netflix">넷플릭스</option>
						  <option value="watcha">왓챠</option>
						  <option value="tving">티빙</option>
						  <option value="wavve">웨이브</option>
					</select>
					</div>
				</div>
				
<div class="row">				
	<form id="party-form" class="form-horizontal" action="${ path }/party/party" method="POST" >
	
	<div class="form-group">
		<div class="col-sm-10">
			<input class="form-control" id="readOnlyInput" type="text" placeholder="Site name" readonly>
		</div>
	</div>
	
	<div class="form-group">
		 <div class="col-sm-10">
		      <input type="text" class="form-control" id="inputTitle" placeholder="제목을 입력하세요">
		    </div>
	</div>
	
	<div class="form-group">		    
		<div class="col-sm-10">
      			<input class="form-control"  id="readOnlyInput"  type="text" placeholder="WriterID" readonly>
    	</div>
    </div>
    
    <div class="form-group">
		    <div class="col-sm-10">
		      <input type="url" class="form-control" id="inputLink"  placeholder="오픈채팅방 주소 입력">
		    </div>
	</div>
		    
	<div class="form-group">
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="inputTag" placeholder="해쉬태그">
		    </div>
	</div>
	
	<div class="form-group">
	    <div class="col-sm-10">
	    		<textarea id="sh-con" class="form-control" rows="3" placeholder="내용을 입력하세요."></textarea>
	    		<p id="con-num">( 0 / 100 )</p>
	    </div>
	 </div>
	    
	 <div id="sub-button" class="form-group">
	    <input type="submit"  class="btn btn-outline-light" value="등록">
	  </div>
	</form>
</div>
		
<div class="row">
		<div class="col-sm-12">
			<h2>모집 중인 파티</h2>
		</div>
		

<div id="party-list" class="row">
		
			<div id="pt-card" class="col-sm-5">
				  <div><img id="pt-logo" alt="로고" src="${path}/resources/images/netflix_logo.png"/>
				  			<span id="pt-title" class="card-title">같이 넷플릭스 보실 분</span>
				  			<p id="pt-writer">WriterId</p>
				  </div>
				<div>
				   	<p>#해시태그 #해시태그</p>
		  		 	 <p>Some quick example text to build on the card title and make up the bulk of the card's content.</p>
		 			<button  class="btn btn-outline-warning">오픈채팅방 참가하기</button>
				 </div>
			</div>
			
			<div id="pt-card" class="col-sm-5" >
				  <div><img id="pt-logo" alt="로고" src="${path}/resources/images/wavve_logo.png"/>
						  <span id="pt-title" class="card-title">제목입니다.</span>
						  <p id="pt-writer">WriterId</p>
				  </div>
				<div>
				   	<p>#해시태그 #해시태그</p>
		  		 	 <p>Some quick example text to build on the card title and make up the bulk of the card's content.</p>
		 			<button  class="btn btn-outline-warning">오픈채팅방 참가하기</button>
				 </div>
			</div>
			
</div>





					<div class="col-sm-12">
						<button class="btn btn-outline-light btn-lg btn-block" >더보기</button>
					</div>
					</div>


</div>
</div>
</section>
	
</body>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>