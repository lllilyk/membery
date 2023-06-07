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
#profileContainer {
	position: relative;
	width: 300px;
	height: 300px;
	border-radius: 50%;
	border: 2px;
	border-style: solid;
	border-color: #cccccc;
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

label {
	text-align: left;
}
</style>

</head>
<body>

	<my:navBar></my:navBar>

	<!-- 상단 공백 -->
	<div style="margin-bottom: 15px"></div>

	<!-- 상단 프로필 컨테이너 -->
	<div class="ui container" id="profileContainer">
		<img src="${bucketUrl }/${pet.id }/${pet.photo}">
	</div>

	<!-- 상단 헤더 컨테이너 -->
	<div class="ui center aligned container mt-2">
		<div class="ui huge header">${pet.petName }</div>
	</div>

	<!-- form -->
	<form class="ui form">


		<!-- 하단 컨테이너 -->
		<div class="ui grid container">

			<!-- 왼쪽 컨테이너 항목들 -->
			<div class="eight wide column">
				<div class="ui left aligned container mt-5" id="leftContainer">
					<div class="field">
						<label>품종</label>
						<input type="text" name="type" value="${pet.type }" readonly>
					</div>
					<div class="field mt-5">
						<label>몸무게</label>
						<input type="text" name="weight" value="${pet.weight eq 'small' ? '작은친구 ( 7kg 미만 )' : pet.weight eq 'medium' ? '중간친구 ( 7 ~ 14.9kg)' : '큰친구 ( 15kg 이상 )' }" readonly>
					</div>
					<div class="field mt-5">
						<label>생년월일</label>
						<input type="date" name="birth" value="${pet.birth }" readonly>
					</div>
					<div class="field mt-5">
						<label>함께한날</label>
						<input type="date" name="together" value="${pet.together }" readonly>
					</div>
				</div>
			</div>

			<!-- 오른쪽 컨테이너 항목들 -->
			<div class="eight wide column">
				<div class="ui right aligned container mt-5" id="rightContainer">
					<div class="field">
						<label>성별</label>
						<input type="text" name="gender" value="${pet.gender eq 'male' ? '남아' : '여아'}" readonly>
					</div>
					<div class="field mt-5">
						<label>중성화 유무</label>
						<input type="text" name="neutered" value="${pet.neutered eq 'yes' ? '했어요' : '안했어요'}" readonly>
					</div>
					<div class="field mt-5">
						<label>반려동물 등록 번호</label>
						<input type="text" name="registrationNum" value="${pet.registrationNum}" readonly>
					</div>
				</div>
				<div style="margin-top: 65px">
					<div class="ui toggle right floated large button" style="background-color:#cc6666" onclick="location.href='/petDelete'">삭제하기</div>
					<div class="ui toggle right floated large button" style="background-color:#6699cc" onclick="location.href='/petModify/${pet.id}'">수정하기</div>
					<div class="ui right floated large button" style="background-color:#cccccc" onclick="location.href='/petList'">목록보기</div>
				</div>
			</div>


		</div>
	</form>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.5.0/dist/semantic.min.js"></script>
</body>
</html>