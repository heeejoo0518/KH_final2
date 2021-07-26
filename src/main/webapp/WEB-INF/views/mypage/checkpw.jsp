<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/mypage/mypage_header.jsp"%>

<div class="checkPw-container">
	<h2><strong>비밀번호 재확인</strong></h2>
	<p>안전을 위해 비밀번호를 다시 한 번 입력해주세요. </p>
	<p>(sns로 회원가입하셨다면 moyoung을 입력해주세요.)</p>
	<form action="${path}/mypage/checkpw" method="POST">
		<div style="margin-bottom:40px;">
			<input type="text" class="form-control" id="u_id" 
				value="<c:if test='${signinMember.signup_type==0}'>${signinMember.u_id}</c:if><c:if test='${signinMember.signup_type != 0}'><c:out value="${fn:substring(signinMember.u_id,0,8)}"/></c:if>" 
				aria-describedby="basic-addon1" readonly required>
			<input type="password" class="form-control"  id="checkPw" name="u_pw" placeholder="비밀번호"/>
		</div>
		<input type="submit" class="btn btn-primary btn-block" id="confirmPw" value="확인" />
	</form>
</div>


<%@ include file="/WEB-INF/views/mypage/mypage_footer.jsp"%>
