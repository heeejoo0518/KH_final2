<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link rel="stylesheet" type="text/css" href="${ path }/resources/css/member.css">

<section>
	<div class="signin-container" >

		<form class="form-signin" action="${ path }/signin" method="POST">
			<div>
				<strong id="title">로그인</strong>
				<label class="switch">
					<input type="checkbox" class="success" checked>
					<span class="slider round"></span>
				</label>
				<small id="save-id"><b>로그인 상태 저장하기</b></small>
			</div>
		
			<div id="signin-info" style="padding-bottom:45px;"> 
				<div class="input-with-icon">
					<input type="text" id="inputId" class="form-control" name="userId" placeholder="아이디" style="padding:0;"required autofocus>
					<div class="btn btn-default icon id-icon">
						<button><img src="${path}/images/remove-black.png"/></button>
					</div>
				</div>
				<div class="input-with-icon">
					<input type="password" id="inputPassword" class="form-control" name="userPwd" placeholder="비밀번호" required>
					<div class="btn btn-default icon pw-icon">
						<button><img src="${path}/images/remove-black.png"/></button>
					</div>
				</div>
			</div>
			
			<button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">로그인</button>
		</form>
		
		<div class="row" style="padding-top:5px;">
			<div class="col-sm-4" style="text-align:left;">
				<a href="${ path }/signup" class="signup">회원가입</a>
			</div>
			
			<div class="col-sm-8" style="text-align:right;">
				<a href="#" class="forgot-id">아이디 찾기</a>
				/
				<a href="#" class="forgot-password">비밀번호 찾기</a>
			</div>
		</div>
		
		<hr>
		<a href="#" class="row" style="font-size:0.8em; padding-left:15px">다른 방법으로 로그인하기</a>
		
    </div>

    
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>

<script>
	$('#inputId').on('propertychange change keyup paste input',function(){
		if($(this).val().length>0) $('.id-icon').show();
		else $('.id-icon').hide();
	});
	
	$('#inputPassword').on('propertychange change keyup paste input',function(){
		if($(this).val().length>0) $('.pw-icon').show();
		else $('.pw-icon').hide();
	});
	
	$('.icon').on('click',function(){
		$(this).prev().val('');
	});
</script>
