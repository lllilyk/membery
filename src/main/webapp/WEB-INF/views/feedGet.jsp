<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

.body {
	height:1000px;
}
.pageName {
	height: 120px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.wrapper {
	display: flex;
	justify-content: space-around;
	align-items: center;
	min-height: 100vh;
	background-color: #EEEEEE;
	margin-right: 10%;
	margin-left: 10%;
	border-radius: 1.5rem;
	position: relative;
}

.bx-wrapper {
	/* flex-grow: 3; */
	margin-left: 1rem;
}

/* .bxslider {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
} */

#textContentt {
	/* flex-grow: 2;  */
	margin-right: 10rem;
	margin-left: 10rem;
}

#drop {
	/* flex-grow: 0.5;  */
	/* position: absolute;  */
	
}

#my-card {
	width: 100%;
	/* height: 80vh; */
}

#profilImage {
	border-radius: 50%;
	height: 50px;
	width: 50px;
}

#inserted {
	margin-top: 15px;
}

</style>
<body id="body" style="background-color: #FFF2F2">

	<my:navBar />

	<div class="pageName">
		<h1>${feed.id }번게시물</h1>
	</div>

	<div class="wrapper">

		<div class="d-flex">
			<!-- card -->
			<div class="ui card" id="my-card">
				<div class="content"">
					<div id="inserted" class="right floated meta">${feed.inserted }</div>
					<img id="profilImage" class="ui avatar image" src="/images/또복이 (1).jpg"> 또복언니
				</div>
				<div class="content">
					<div class="right floated meta">
						<img class="ui avatar image" src="/images/scrap.png">
					</div>
				</div>

				<div class="content">
					<!-- 이미지 파일 출력 -->
					<br />
					<ul class="bxslider">
						<c:forEach items="${feed.fileName }" var="fileName">
							<li><img class="ui medium rounded imager" src="${bucketUrl }/${feed.id }/${fileName }" alt="" /></li>
						</c:forEach>
					</ul>
				</div>

				<div class="content">
					<span class="right floated"> <i class="fa-solid fa-bone"></i> 17 likes
					</span> <i class="comment icon"></i> 3 comments
				</div>
				<div class="extra content">
					<div class="ui large transparent right icon input">
						<input size=42 type="text" placeholder="Add Comment..."><img class="" src="/images/comment.png">
					</div>
				</div>
			</div>

		</div>

		<div class="d-flex">



			<!-- text content -->
			<div class="textContent">
				<div class="ui segment" style="font-weight: 700;">제목 : ${feed.title }</div>
				<div class="ui segment" style="font-weight: 700;">본문 : ${feed.content }</div>
				<div class="ui segment" style="font-weight: 700;">작성자 : ${feed.writer }</div>
				<div class="ui segment" style="font-weight: 700;">작성일시 : ${feed.inserted }</div>
				<div class="ui segment" style="font-weight: 700;">장소 태그 : ${feed.location }</div>
			</div>

			<!-- 수정/삭제 버튼 드랍다운 -->
			<div class="drop">
				<button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
					<i class="fa-solid fa-ellipsis-vertical"></i>
				</button>

				<ul class="dropdown-menu">
					<!-- Dropdown menu links -->
					<div style="text-align: center">
						<a href="/modify/${feed.id }">수정하기</a>
					</div>
					<div style="text-align: center">
						<a href="#" onclick="javascript:document.removeForm.submit();">삭제하기</a>
					</div>
				</ul>

				<!-- 삭제하기 기능 -->
				<div class="d-none">
					<form action="/remove" method="post" name="removeForm">
						<input type="text" name="id" value="${feed.id }" />
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- wrapper div -->

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.5.0/dist/semantic.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			let slider = $('.bxslider').bxSlider({
				slideWidth : 400
			});
		});
	</script>
</body>
</html>