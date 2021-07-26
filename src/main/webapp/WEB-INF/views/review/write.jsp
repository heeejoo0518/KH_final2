<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%> 
<script src="${ path }/js/jquery-3.6.0.min.js"></script>

<style>
	body{
		background-color: #020d18;
	}
	#reviewContainer{
		position:absolute;
		top:25%;
		left:30%;
	}
	#input-textarea{
		width: 800px;
		height: 500px;
	}
	#text-area{
		resize: none;
		padding-top: 10px;
		padding-left: 10px;
		height: 500px;
    	width: 700px;
    	color: black;
	}
	#div-spoiler{
		position: absolute;
		margin-top: -100px;
		margin-left: 20px;
	}
	#div-rate{
		position: absolute;
		margin-top: -90px;
	}
	#div-submit{
		margin-left:320px;
	}
	#btn-submit{
		width: 100px;
		height: 50px;
		background-color: buttonshadow;
		color:white;
		border-radius: 8px;
	}
	.star-input>.input,
	.star-input>.input>label:hover,
	.star-input>.input>input:focus+label,
	.star-input>.input>input:checked+label{display: inline-block;vertical-align:middle;background:url('${path}/images/grade_img.png')no-repeat;}
	.star-input{display:inline-block; white-space:nowrap;width:225px;height:40px;padding:10px;line-height:30px;}
	.star-input>.input{display:inline-block;width:150px;background-size:150px;height:28px;white-space:nowrap;overflow:hidden;position: relative;}
	.star-input>.input>input{position:absolute;width:1px;height:1px;opacity:0;}
	star-input>.input.focus{outline:1px dotted #ddd;}
	.star-input>.input>label{width:30px;height:0;padding:28px 0 0 0;overflow: hidden;float:left;cursor: pointer;position: absolute;top: 0;left: 0;}
	.star-input>.input>label:hover,
	.star-input>.input>input:focus+label,
	.star-input>.input>input:checked+label{background-size: 150px;background-position: 0 bottom;}
	.star-input>.input>label:hover~label{background-image: none;}
	.star-input>.input>label[for="p1"]{width:30px;z-index:5;}
	.star-input>.input>label[for="p2"]{width:60px;z-index:4;}
	.star-input>.input>label[for="p3"]{width:90px;z-index:3;}
	.star-input>.input>label[for="p4"]{width:120px;z-index:2;}
	.star-input>.input>label[for="p5"]{width:150px;z-index:1;}
	.star-input>output{display:inline-block;width:40px; font-size:18px;text-align:right; vertical-align:middle;}
</style>
	<div id="reviewContainer"> <!-- 중앙  -->
		<form action="${ path }/review/write" method="POST">
			<input type="hidden" name="no" value="${ no }">
			<input type="hidden" name="nickname" value="${ signinMember.nickname }">
			<div id="formContainer">
				<div id="div-Content"> <!-- 리뷰작성 공간 -->
					<textarea id="text-area" name="content" rows="30" cols="100" placeholder="리뷰를 작성해주세요." required="required"></textarea>		
				
				</div>
				<div id="div-spoiler"> <!-- 스포일러checkBox -->
					리뷰에 스포일러가 포함됩니다.<input type="checkbox" name="spoiler" value="1">
				</div>
				<br>
				<div id="div-rate"> <!-- 평점 -->
					<span class="star-input">
						<span class="input">
					    	<input type="checkbox" name="star-input" value="1" id="p1">
					    	<label for="p1">1</label>
					    	<input type="checkbox" name="star-input" value="2" id="p2">
					    	<label for="p2">2</label>
					    	<input type="checkbox" name="star-input" value="3" id="p3">
					    	<label for="p3">3</label>
					    	<input type="checkbox" name="star-input" value="4" id="p4">
					    	<label for="p4">4</label>
					    	<input type="checkbox" name="star-input" value="5" id="p5">
					    	<label for="p5">5</label>
				  		</span>
				  		<output for="star-input" style="color: black;"><b style="color:black;">0</b>점</output>
					</span>
					<script src="${ path }/js/jquery-1.11.3.min.js"></script>
					<script src="${ path }/js/star.js"></script>
				</div>
			</div>
		<div id="div-submit">
			<input id="btn-submit" type="submit" value="등록">
		</div>
		</form>
	</div>
	<br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br>
	
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
