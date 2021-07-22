<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<style>
h2 {color: white; margin-top:50px; margin-bottom:30px;}
#preloader {background-color: #020d18; color: white;}
textarea{resize:none;}

/* 작성 폼 영역 스타일 */
#sub-button{text-align: center;}
#party-form {margin:auto;}

#type-bt {border:none; border-radius:10px; background-color:#4280bf; margin:15px;}
#type-bt:hover {background-color:#dcf836;}
#type-bt-img {width:70px; height:70px;}
#party-form input{margin:auto;}
</style>


<script>
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

	/*OTT TYPE 버튼 클릭 */
	function txInput(Obj,Str){
	  document.getElementById(Obj).value = Str;
	}
	
</script>

<body>

<div class="row">

<div class="center-block">				
	<form id="party-form" class="form-horizontal" action="${path }/party/partyWrite" method="POST" enctype="multipart/form-data" >

<div id="ott-type" class="center-block">
		<button type="button"  id="type-bt"  value="넷플릭스" onclick="txInput('ottType',this.value)">
		<img id="type-bt-img" src="${path}/resources/images/icon_netflix.png"/></button>
		
		<button type="button"  id="type-bt"  value="왓챠" onclick="txInput('ottType',this.value)">
		<img id="type-bt-img" src="${path}/resources/images/icon_watcha.png"/></button>
		
		<button type="button"  id="type-bt"  value="웨이브" onclick="txInput('ottType',this.value)">
		<img id="type-bt-img" src="${path}/resources/images/icon_wavve.png"/></button>
		
		<button type="button"  id="type-bt"  value="티빙" onclick="txInput('ottType',this.value)">
		<img id="type-bt-img" src="${path}/resources/images/logo_tving.png"/></button>
</div>

	<div class="form-group">
		<div class="col-sm-12">
			<label>스트리밍 사이트</label>
			<input class="form-control"  id="ottType" type="text" name="ott_type" placeholder="아이콘을 선택하세요" readonly required>
		</div>
	</div>
	
	<div class="form-group">
		 <div class="col-sm-12">
		 	<label>제목</label>
		      <input type="text" class="form-control" id="inputTitle" name="name" placeholder="제목을 입력하세요" required>
		    </div>
	</div>
	
	<div class="form-group">		    
		<div class="col-sm-12">
			<label>작성자 아이디</label>
      			<input class="form-control"  id="readOnlyInput"  type="text" name="writer_id" value="${ signinMember.u_id }" readonly required>
    	</div>
    </div>
    
    <div class="form-group">
		    <div class="col-sm-12">
		    <label>오픈채팅방 주소</label>
		      <input type="url" class="form-control" id="inputLink" name="link" placeholder="오픈채팅방 주소 입력"  required>
		    </div>
	</div>

	<div class="form-group">
	    <div class="col-sm-12">
	    		<textarea id="sh-con" class="form-control" name="content" rows="3" placeholder="내용을 입력하세요."></textarea>
	    		<p id="con-num">( 0 / 100 )</p>
	    </div>
	 </div>
	    
	 <div id="sub-button" class="form-group">
	    <input type="submit"  class="btn btn-secondary" value="등록">
	  </div>
	</form>
</div>
</div>



</body>
