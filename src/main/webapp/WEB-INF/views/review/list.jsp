<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<!--  
header
   <div-sort>
      <div-list-container>
         <div-user-nickname>
         <div-user-rate>
         <div-user-content>
         <hr>
         <div-like-date>
	<span-btn-count>
	<span-date>
         <hr>
         <div-btn>
            <span-btn-like>
            <span-btn-report>
footer
-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모두의 영화</title>
<script src="${ path }/js/jquery-3.6.0.min.js"></script>
<style>
        body{
            background-color: #404040;
        }
        hr{
        	color:white;
        }
        #div-sort{
        	text-align: right;
        }
        #sort-select{
        	border-radius: 10px;
        	height: 50px;
        	width: 200px;
        	margin-right: 380px;
        }
        #div-list-container{
        	background-color:white;
            border-radius: 10px;
            border: 5px solid;
            border-color: gray;
            width: 60%;
            height: 300px;
            margin: auto;
        }
        #div-user-nickname{
        	padding-left: 10px;
		    padding-top: 20px;
		    padding-bottom: 15px;
        }
        #div-user-rate{
        	padding-left: 10px;
  			padding-bottom: 15px;
        }
        #div-user-content{
        	padding-left: 10px;
    		padding-bottom: 70px;
        }
        .like-count{
        	padding-left: 10px;
    		padding-right: 1000px;
        }
        #div-btn{
        	padding-left: 10px;
    		padding-top: 10px;
        }

    </style>

</head>
    <body>
        <div >
            <h2 style="color: white;">모든 리뷰</h2>  
        </div>
        <div id="div-sort" >
        <select id="sort-select">
            <option>최근 작성한 글</option>
            <option>별점 높은 순</option>
            <option>별점 낮은 순</option>
        </select>
        </div>
        <br>
        <br>
        <div id="div-list-container">
        	<div id="div-user-nickname">
        		nickName
        	</div>
        	<div id="div-user-rate">
        		rate
        	</div>
        	<div id="div-user-content">
        		content
        	</div>
        	<hr>
        	<div id="div-like">
        		<span class="like-count">0개</span>
        		<span class="writeDate" style="text-align: right" >2021-06-21</span>
        	</div>
        	<hr>
        	<div id="div-btn">
        		btn
        		<span class="btn-like" style="padding-right: 400px;">좋아요 버튼</span>
        		<span class="btn-report">신고하기 버튼</span>
        	</div>
        </div>
    </body>
</html>