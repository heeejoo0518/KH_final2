<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link rel="stylesheet" type="text/css" href="${ path }/resources/css/member.css">

<section>
	<div class="signup-container">
		<form name="signupForm" class="form-signup" action="${ path }/signup" method="POST">
			<div style="margin-bottom:5px;">
				<strong id="title">회원가입</strong>
			</div>
			
			<div id="signup-info" style="padding-bottom:15px">
				<div class="input-with-icon">
					<input type="text" id="signup_id" class="form-control" name="u_id" placeholder="아이디(영어,숫자 5자 이상)" required autofocus>
					<div class="btn btn-default icon id-icon">
						<button disabled><img src="#" id="img_id"/></button>
					</div>
				</div>
				
				<div class="input-with-icon">
					<input type="password" id="signup_pw" class="form-control" name="u_pwd" placeholder="비밀번호(영어,숫자,특문 2조합 8자 이상)" required>
					<div class="btn btn-default icon pw-icon">
						<button disabled><img src="#" id="img_pw"/></button>
					</div>
				</div>
				
				<div class="input-with-icon">
					<input type="password" id="signup_pw_check" class="form-control" placeholder="비밀번호 확인" required>
					<div class="btn btn-default icon pw-check-icon">
						<button disabled><img src="#" id="img_pw_check"/></button>
					</div>
				</div>
				
				<div class="input-with-icon">
					<input type="text" id="signup_nickname" class="form-control" name="nickname" placeholder="닉네임(2자 이상)" required>
					<div class="btn btn-default icon nickname-icon">
						<button disabled><img src="#" id="img_nickname"/></button>
					</div>
				</div>
				
				<div class="input-with-icon">
					<input type="email" id="signup_email" class="form-control" name="email" placeholder="이메일" required>
					<div class="btn btn-default icon email-icon">
						<button disabled><img src="#" id="img_email"/></button>
					</div>
				</div>
			</div>
			
			<div id="check-info">
				<p id="id_info" style="display:none;"><b></b></p>
				<p id="pw_info" style="display:none;"><b></b></p>
				<p id="pw_check_info" style="display:none;"><b></b></p>
				<p id="nickname_info" style="display:none;"><b></b></p>
				<p id="email_info" style="display:none;"><b></b></p>
			</div>
			
			<div id="check-permission">
				<label>
					<input type="checkbox" id="signup_cb1" name="signup_checkbox_all" value="" onclick="checkAllPermission();"/>
					<span><b>전체 약관에 동의합니다</b></span>
				</label>
				<label>
					<input type="checkbox" id="signup_cb2" name="signup_checkbox" value=""/>
					<span><b>만 14세 이상입니다</b></span>
				</label>
				<label>
					<input type="checkbox" id="signup_cb3" name="signup_checkbox" value=""/>
					<span><b><a href="#" onclick="openModal(1);return false;">모두의 영화 서비스 이용약관</a>에 동의합니다 (필수)</b></span>
				</label>
				<label>
					<input type="checkbox" id="signup_cb4" name="signup_checkbox" value=""/>
					<span><b><a href="#" onclick="openModal(2);return false;">개인정보 수집 및 이용에 대한 안내</a>에 동의합니다 (필수)</b></span>
				</label>
			</div>
			
			<button type="button" id="signup_button" class="btn btn-lg btn-primary btn-block btn-signin" onclick="signup();">회원가입</button>
		</form>
	</div>
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>

<script>
	var status_id = false;
	var status_pw = false;
	var status_pw_check = false;
	var status_nickname = false;
	var status_email = false;
	
	$('#signup_id').on('propertychange change keyup paste input',function(){
		status_id = checkId($(this).val());
		var src = status_id? "${ path }/images/check.png" : "${ path }/images/remove.png";
		
		document.getElementById('img_id').src = src;
		
		$('.id-icon').show();
	});
	
	$('#signup_pw').on('propertychange change keyup paste input',function(){
		status_pw = checkPw($(this).val());
		var src = status_pw? "${ path }/images/check.png" : "${ path }/images/remove.png";
		document.getElementById('img_pw').src = src;
		$('.pw-icon').show();
	});
	
	$('#signup_pw_check').on('propertychange change keyup paste input',function(){
		status_pw_check = checkPwEquals($(this).val());
		var src = status_pw_check? "${ path }/images/check.png" : "${ path }/images/remove.png";
		document.getElementById('img_pw_check').src = src;
		$('.pw-check-icon').show();
	});
	
	$('#signup_nickname').on('propertychange change keyup paste input',function(){
		status_nickname = checkNickname($(this).val());
		var src = status_nickname? "${ path }/images/check.png" : "${ path }/images/remove.png";
		document.getElementById('img_nickname').src = src;
		$('.nickname-icon').show();
	});
	
	$('#signup_email').on('propertychange change keyup paste input',function(){
		status_email = checkEmail($(this).val());
		var src = status_email? "${ path }/images/check.png" : "${ path }/images/remove.png";
		document.getElementById('img_email').src = src;
		$('.email-icon').show();
	});
	
	function checkId(id){
		var english = /[^a-zA-Z]/;
		var number = /[^0-9]/;
		var symbolCheck = /[^0-9a-zA-Z]/gi;
		var result = true;
		
		if(id.length!=id.replace(symbolCheck,"").length){
			showNotice("아이디는 숫자와 영문으로만 입력해주세요.",'#id_info');
			return false;
		}
		
		if(id.length<5||id.length>10){
			showNotice("아이디는 5글자 이상, 10글자 이하로 입력해주세요.",'#id_info');
			return false;
		}
		
		if(!english.test(id)|| !number.test(id)){
			showNotice("아이디는 영문과 숫자 모두 포함해야 합니다.",'#id_info');
			return false;
		}
		
		$.ajax({
			type: "get",
			url: "${path}/member/idCheck",
			dataType: "json",
			async: false,
			data: {
				id
			},
			success: function(data) {
				result = data.validate;
				if(data.validate) {
					showNotice("이미 사용중인 아이디 입니다.",'#id_info');
				} 
			},
			error: function(e) {
				console.log(e);
			} 
		});
		
		if(!result)	showNotice("",'#id_info');		
		return !result;
	}
	
	function checkPw(pw){
		var check = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{8,16}$/;
		
		if(pw.length<8||pw.length>16){
			showNotice("비밀번호는 8글자 이상 16글자 이하로 입력해주세요.","#pw_info");
			return false;
		}
		
		if(!check.test(pw)){
			showNotice("비밀번호는 영문, 숫자, 특수문자 중 두 조합 이상 포함해야 합니다.","#pw_info");
			return false;
		}
		
		showNotice("","#pw_info");
		return true;
	}
	
	function checkPwEquals(pw_check){
		if(!status_pw){
			showNotice("먼저 올바른 비밀번호를 입력해주세요.","#pw_check_info");
			return false;
		}
		
		var pw = $('#signup_pw').val();
		
		if(pw != pw_check){
			showNotice("비밀번호가 일치하지 않습니다.","#pw_check_info");
			return false;
		}
		
		showNotice("","#pw_check_info");
		return true;
	}
	
	function checkNickname(nickname){
		var result = true;
		
		if(nickname.length < 2){
			showNotice("닉네임은 두 글자 이상 입력해주세요.","#nickname_info");
			return false;
		}
		
		$.ajax({
			type: "get",
			url: "${path}/member/nicknameCheck",
			dataType: "json",
			async: false,
			data: {
				nickname
			},
			success: function(data) {
				result = data.validate;
				if(data.validate) {
					showNotice("이미 사용중인 닉네임입니다.","#nickname_info");
					return false;
				} 
			},
			error: function(e) {
				console.log(e);
			}
		}); 
		
		if(!result)	showNotice("","#nickname_info");		
		return !result;
	}
	
	function checkEmail(email){
		var check = /^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/;
		if(!check.test(email)){
			showNotice("이메일은 형식에 맞게 입력해주세요.","#email_info");
			return false;
		}
		showNotice("","#email_info");
		return true;
	}
	
	function showNotice(notice, tag){
		if(notice!=""){
			$(tag+' b').text(notice);
			$(tag).show();
		}else {
			$(tag).hide();
		}
	}
	
	function signup(){
		var form = document.signupForm;
		if(!status_id){
			document.getElementById("signup_id").focus();
		}
		else if(!status_pw){
			document.getElementById("signup_pw").focus();
		}
		else if(!status_pw_check){
			document.getElementById("signup_pw_check").focus();
		}
		else if(!status_nickname){
			document.getElementById("signup_nickname").focus();
		}
		else if(!status_email){
			document.getElementById("signup_email").focus();
		}
		else {
			form.submit();
		}
	}
	

</script>

<script>
	$(document).ready(function(){
		
	});
</script>

<script>
	function checkAllPermission(){
		var isChecked = $('#signup_cb1').is(":checked");
		$("input[name=signup_checkbox]:checkbox").prop("checked", isChecked);
	}
	
	$('input[name=signup_checkbox]').on('click',function(){
		if($('input[name=signup_checkbox]:checked').length == $('input[name=signup_checkbox]').length){
			$("input[name=signup_checkbox_all]:checkbox").prop("checked", true);
		}else{
			$("input[name=signup_checkbox_all]:checkbox").prop("checked", false);
		}
	});
	
</script>

<%@ include file="/WEB-INF/views/common/modal.jsp"%>
<script>
	function openModal(type){
		if(type==1){
			title="모두의 영화 서비스 이용약관";
			$( "#modal-body" ).load('${ path }/txt/TermsOfService.txt');
		}
		else if(type==2){
			title="개인정보 수집 및 이용에 대한 안내";
			$( "#modal-body" ).load('${ path }/txt/PrivacyPolicy.txt');
		}
		
		$('#modal-title').text(title);
		$('#modal').modal('show');
	}
</script>

