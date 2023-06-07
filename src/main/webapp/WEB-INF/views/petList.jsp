<%@page import="java.time.Period"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.5.0/dist/semantic.min.css">

<style>
.profile {
	width: 300px;
	height: 300px;
	border-radius: 50%;
	overflow: hidden;
	display: flex;
	align-items: center;
	justify-content: center;
	padding: 0px;
}

img {
	width: 100%;
	height: 100%;
}

.item {
	align-items: center;
	justify-content: center;
}
</style>

</head>
<body>

	<my:navBar current="myPetList"></my:navBar>

	<!-- 상단 공백 -->
	<div style="margin-bottom: 15px"></div>

	<!-- 제목 -->
	<div class="ui center aligned container mb-5" id="title">
		<h1>나의 반려동물</h1>
	</div>

	<!-- 내 반려동물 리스트 -->
	<div class="ui center aligned container">
		<div class="ui link divided items">
			<c:forEach items="${petsList }" var="petsList">
				<div class="item" onclick="location.href='/id/${petsList.id }'">
					<div class="profile">
						<img src="${bucketUrl }/${petsList.id }/${petsList.photo}">
					</div>
					<div class="content">
						<div class="ui huge header">${petsList.petName }</div>
						<div class="description">
							<p>${petsList.type }</p>
							<p>${petsList.birth }</p>

							<p>
								<i class="heart icon"></i>${petsList.diff.years}년 ${petsList.diff.months}개월째 함께 하는 중 입니다<i class="heart icon"></i>
							</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="ui center aligned container">
			<button class="ui large button" onclick="location.href='registration'">추가하기</button>
		</div>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.5.0/dist/semantic.min.js"></script>

</body>
</html>