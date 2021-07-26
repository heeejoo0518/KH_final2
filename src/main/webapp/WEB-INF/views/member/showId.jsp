<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link rel="stylesheet" type="text/css" href="${ path }/resources/css/member.css">

<section>
	<div class="showId-container" >
		<strong id="title">아이디는 <span style="color:blue">${tmpId}</span>입니다.</strong>
		<button class="btn btn-lg btn-primary btn-block" onclick="location.href='${path}/signin'" style="margin-top:45px;">로그인 하러가기</button>
	</div>
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>