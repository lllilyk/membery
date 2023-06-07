<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.5.0/dist/semantic.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.css" rel="stylesheet" />
</head>

<style>
		.pageName {
			height: 120px;
			display: flex;
			justify-content: center;
			align-items: center;
		}
		
		.wrapper {
			display: flex;
			justify-content: center;
			align-items: center;
			min-height: 75vh;

		}
		
		.back {
			min-height: 75vh;
			margin-right: 15%;
			margin-left: 15%;
			border-radius: 1.5rem;
		}
		
		#add {
			flex-grow: 2;
			margin-left: 2rem;
		} 
		
		#content {
			flex-grow: 3;
			margin-right: 10rem;
			margin-left: 10rem;
		}
		
		.bxslider {
			width:1000%; 
			position: relative; 
			overflow: hidden;
			transition-duration: 0.2s; 
			transform: translate3d(-390px, 0px, 0px);
		}
		
		/* .bxslider > li > img { 
            position:absolute;
			
         }  */
         
    	.removeFilesBtn {
          	position:absolute; 
          
         } 
		
	</style>
	
<body>

	<my:navBar></my:navBar>
		
	<div class="pageName">
		<h1>${feed.id }번 게시물 수정하기</h1>
	</div>

	<div class="back" style="background-color: #EEEEEE">
		<form class="wrapper" method="post" enctype="multipart/form-data" id="modifyForm">

			<input type="hidden" name="id" value="${feed.id }" />

		<!-- 기존 이미지 파일 보이기 -->
		<div id="add">
			<ul class="bxslider">
				<c:forEach items="${feed.fileName }" var="fileName" varStatus="status">
					<li id="imageList${status.index }">
						<%-- <input type="checkbox" name="removeFiles" value="${fileName }" id="" /><i class="fa-regular fa-circle-trash"></i> --%>
						<%-- <button data-target-list="#imageList${status.index }" type="button" class=" removeFilesBtn btn btn-outline-dark" name="removeFiles" value="${fileName }"><i class="fa-solid fa-trash"></i></button> --%>
						<button type="button" class="removeFilesBtn btn btn-outline-dark" name="removeFiles" value="${fileName }"><i class="trash alternate icon"></i></button>
						<img class="ui medium rounded imager" src="${bucketUrl }/${feed.id }/${fileName }" alt="" />
					</li>
				</c:forEach>
			</ul>
		
			<!-- 새 이미지 파일 추가 input -->
			<div align="center">
				<h3>사진을 추가해보세요! </h3>
				<input type="file" multiple name="files" accept="image/*" />
			</div>
			
		</div>

		
	<!-- 	<div>
			사진을 추가해보세요! <br /> <input type="file" multiple name="files" accept="image/*" />
		</div> -->
		
		<!-- 글 수정 부분 -->
		<div id="content" >
				
					<div class="ui form">
					    <div class="title">
					      <label align="left" style="color: red; font-weight: bolder;">필수</label>
					      	<input placeholder="제목을 입력하세요" type="text" name="title" value="${feed.title }" >
					    </div>
					</div>
					<br />
					
					<div class="ui form">
						  <div class="content">
						   	<label align="left" style="color: red; font-weight: bolder;">필수</label>
						   	<textarea placeholder="내용을 입력하세요" name="content">${feed.content }</textarea>
					 </div>
					 <br />
					
					<div class="ui form">
					    <div class="writer">
					      <label></label>
					      <input placeholder="글쓴이" type="text" name="writer" value="${feed.writer }" />
					    </div>
					</div>
					<br />
					
					<div class="ui form">
					    <div class="location">
					      <label></label>
					      <input placeholder="장소를 태그하세요" type="text" name="location" value="${feed.location }" />
					    </div>
					</div>
					<br />
					
			</form>
			
			<div align="right">
				<button class="btn btn-secondary" type="submit" form="modifyForm" id="modifyButton">수정하기</button>
			</div>
		
	</div>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.5.0/dist/semantic.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.js"></script>
	
	<script type="text/javascript">
		$(document).ready(function(){
		  let slider = $('.bxslider').bxSlider({
			  slideWidth: 400
		  });
		  
		  /* $(".removeFilesBtn").click(function() {
			 const target = $(this).attr("data-target-list");
			 $(target).remove();
			 slider.reloadSlider();
		  }); */
		}); 
	</script>
</body>
</html>