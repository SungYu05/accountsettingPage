<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<head>
<link href="css/accountsetting.css" rel="stylesheet">
</head>
<div id="wrap">
	<div id="as_wrap">
		<div class="as_menu">
			<p class="as_title">계정설정</p>
			<ul>
				<li class="as_position"><a href="/accountsetting">기본정보 수정</a></li>
				<li class="as_proposal"><a href="/profile">프로필 수정</a></li>
				<li class="as_proposal"><a href="/password">비밀번호 설정</a></li>
				<li class="as_proposal"><a href="/delete">회원 탈퇴</a></li>
			</ul>
		</div>
		<!--as_menu-->
		<div class="as_edit">
			<form>
				<input id="id" type="hidden" value="${users.id}" />
				<div>
					<strong>기본정보 수정</strong>
				</div>
				<div>
					<span>지원 결과 또는 추천 포지션 정보를 받아볼 이메일/연락처 정보 입력해주세요.</span>
				</div>
				<div class="as_img">
					<div class="photo">
						<p>
							<img src="" class="input_img">
					</div>
					<!--photo-->
					<div class="img">
						<div class="plus">
							<label for="file" class="input_file">+ </label> <input
								type="file" id="file" onchange='readFile(this)'>
						</div>
						<div class="text">사진 변경하기</div>
					</div>
					<!--img-->
				</div>
				<!--as_img-->
				<div class="as_detail">
					<div class="as_detail_name">
						<h6>이름</h6>
						<p id="userName">${users.userName}</p>
					</div>
					<div class="as_detail_email">
						<h6>이메일</h6>
						<p id="email">${users.email}</p>
					</div>
					<div class="as_detail_phone">
						<h6>전화번호</h6>
						<p id="phoneNumber">${users.phoneNumber}</p>
					</div>
				</div>
				<!--as_detail-->
				<div class="as_button">
					<button id="btnUpdate" type="button">완료</button>
				</div>
			</form>
		</div>
		<!--.as_edit-->
	</div>
	<!--.as_wrap-->
</div>

<script>
	function readFile(input) {
		const file = input.files[0]; // 첨부된 파일을 가져옴

		const reader = new FileReader();

		reader.readAsDataURL(file); // 파일을 base64로 변환

		reader.onload = function() {
			console.log(reader.result); // 읽은 파일 소스단에 출력
			document.querySelector('img').src = reader.result;
		};

		reader.onerror = function() {
			console.log(reader.error);
		};
	}
</script>
<script src="/js/users.js"></script>
<%@ include file="../layout/footer.jsp"%>