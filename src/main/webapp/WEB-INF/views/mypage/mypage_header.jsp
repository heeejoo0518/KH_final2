<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link rel="stylesheet" type="text/css" href="${ path }/resources/css/mypage.css">
 
 <section style="min-height: calc(100vh - 50px);min-width: 350px;">
 	<div class="d-flex" id="wrapper">
 		<!-- Sidebar-->
        <div class="border-end bg-black" id="sidebar-wrapper">
        	<div class="border-bottom bg-black sidebar-heading">마이페이지</div>
            <div class="list-group list-group-flush">
                <a id="update-list-item" class="list-group-item list-group-item-action list-group-item-light p-3" onclick="activeFnc(1);return false;" href="#">내 정보 수정</a>
                <a id="review-list-item" class="list-group-item list-group-item-action list-group-item-light p-3" onclick="activeFnc(2);return false;" href="#">내가 쓴 리뷰</a>
                <a id="like-list-item" class="list-group-item list-group-item-action list-group-item-light p-3" onclick="activeFnc(3);return false;" href="#">내가 찜한 영화</a>
            </div>
        </div>
        <div id="page-content-wrapper">
 			<div class="container-fluid" style="text-aglin:center;">
 				<button class="btn" id="sidebarToggle"><img src="${ path }/images/menu.png" id="img_sidebar"/></button>