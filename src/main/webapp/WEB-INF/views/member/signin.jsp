<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link href="https://fonts.googleapis.com/css?family=Roboto"
	rel="stylesheet" type="text/css">
<script src="https://apis.google.com/js/api:client.js"></script>

<link rel="stylesheet" type="text/css"
	href="${ path }/resources/css/member.css">

<c:set var="saveId" value="${cookie.saveId.value}" />

<section>
	<div class="signin-container">
		<form class="form-signin" action="${ path }/signin" method="POST">
			<div>
				<strong id="title">로그인</strong> <label class="switch"> <input
					type="checkbox" class="success" name="saveId"
					<c:if test='${ saveId != null }'>checked</c:if>> <span
					class="slider round"></span>
				</label> <small id="save-id"><b>로그인 상태 저장하기</b></small>
			</div>

			<div id="signin-info" style="padding-bottom: 45px;">
				<div class="input-with-icon">
					<input type="text" id="inputId" class="form-control" name="userId"
						placeholder="아이디" style="padding: 0;"
						value="<c:if test='${ saveId != null }'><c:out value='${saveId}'/></c:if>"
						autocomplete="off" required autofocus>
					<div class="btn btn-default icon id-icon">
						<button>
							<img src="${path}/images/remove-black.png" />
						</button>
					</div>
				</div>
				<div class="input-with-icon">
					<input type="password" id="inputPassword" class="form-control"
						name="userPwd" placeholder="비밀번호" autocomplete="off" required>
					<div class="btn btn-default icon pw-icon">
						<button>
							<img src="${path}/images/remove-black.png" />
						</button>
					</div>
				</div>
			</div>

			<button class="btn btn-lg btn-primary btn-block btn-signin"
				type="submit">로그인</button>
		</form>

		<div class="row" style="padding-top: 5px;">
			<div class="col-sm-4" style="text-align: left;">
				<a href="${ path }/signup" class="signup">회원가입</a>
			</div>

			<div class="col-sm-8" style="text-align: right;">
				<a href="${path}/member/findId" class="forgot-id">아이디 찾기</a> / <a
					href="${path}/member/findPw" class="forgot-password">비밀번호 찾기</a>
			</div>
		</div>
		<hr style="margin: 5px;">
		<p class="row" style="font-size: 0.8em; padding-left: 15px">다른
			방법으로 로그인하기</p>
		<div id="gSignInWrapper">
			<div id="customBtn" class="customGPlusSignIn"></div>
		</div>
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>

<script>
	$(document).ready(function() {
		//엔터 금지
		$(window).keydown(function(event) {
			if (event.keyCode == 13) {
				event.preventDefault();
				return false;
			}
		});

		if ($('#inputId').val().length > 0)
			$('.id-icon').show();
		else
			$('.id-icon').hide();

		if ($('#inputPassword').val().length > 0)
			$('.pw-icon').show();
		else
			$('.pw-icon').hide();
	});

	$('#inputId').on('propertychange change keyup paste input', function() {
		if ($(this).val().length > 0)
			$('.id-icon').show();
		else
			$('.id-icon').hide();
	});

	$('#inputPassword').on('propertychange change keyup paste input',
			function() {
				if ($(this).val().length > 0)
					$('.pw-icon').show();
				else
					$('.pw-icon').hide();
			});

	$('.icon').on('click', function() {
		$(this).prev().val('');
	});
</script>
<script>
	var googleUser = {};
	var startApp = function() {
		gapi.load('auth2', function() {
			auth2 = gapi.auth2.init({
				client_id : '955108501404-e26jfs97pn99soeeco8qoun7am449dt4.apps.googleusercontent.com',
				cookiepolicy : 'single_host_origin',
			// Request scopes in addition to 'profile' and 'email'
			//scope: 'additional_scope'
			});
			attachSignin(document.getElementById('customBtn'));
		});
	};

	function attachSignin(element) {
		//console.log(element.id);
		auth2.attachClickHandler(element, {}, function(googleUser) {
			onSignIn(googleUser);
		}, function(error) {
			alert(JSON.stringify(error, undefined, 2));
		});
	}
	
	function onSignIn(googleUser) {
		var id_token = googleUser.getAuthResponse().id_token;
		var userId = "";
		var snsSignin = true;
/*  		var xhr = new XMLHttpRequest();
		xhr.open('POST', '${path}/member/tokensignin');
		xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		xhr.onload = function() {
		 // console.log('Signed in as: ' + xhr.responseText);
		};
		xhr.send('id_token=' + id_token);  */
		
 		$.ajax({
			type: "post",
			url: "${path}/member/tokensignin",
			dataType: "json",
			async: false,
			data: {
				id_token
			},
			beforeSend: function(xhr){
				xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
			},
			success: function(data) {
				if(data.snsSignin){
					//성공
					location.href = "${path}"; 
				}else{
					alert("로그인에 실패했습니다.");
				}
			},
			error: function(e) {
				console.log(e);
			} 
		}); 
	}
</script>
<script>startApp();</script>