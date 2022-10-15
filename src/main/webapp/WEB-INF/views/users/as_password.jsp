<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<head>
<link href="css/as_password.css" rel="stylesheet">
</head>
<div id="wrap">
	<div id="as_wrap">
		<div class="as_menu">
			<p class="as_title">계정설정</p>
			<ul>
				<li class="as_proposal"><a href="#">기본정보 수정</a></li>
				<li class="as_proposal"><a href="#">프로필 수정</a></li>
				<li class="as_position"><a href="#">비밀번호 설정</a></li>
				<li class="as_proposal"><a href="#">회원 탈퇴</a></li>
			</ul>
		</div>
		<!--as_menu-->
		<div class="as_edit">
			<div>
				<strong>비밀번호 설정</strong>
			</div>
			<div class="as_password">
				<form class="as_password_form">
					<div class="as_now_password">
						<div class="text">
							<p>현재 비밀번호</p>
						</div>
						<div class="input_password">
							<input type="password" placeholder="비밀번호를 입력해주세요" class="input_text">
						</div>
					</div>
					<div class="as_new_password">
						<div class="text">
							<p>새 비밀번호</p>
						</div>
						<div class="input_password">
							<input type="password" placeholder="비밀번호를 입력해주세요" class="input_text">
						</div>
					</div>
				</form>
			</div>
			<!--.as_password-->
			<div class="as_button">
				<button type="button">수정하기</button>
			</div>
			<!--as_button-->
		</div>
		<!--.as_edit-->
	</div>
	<!--.as_wrap-->
</div>
<%@ include file="../layout/footer.jsp"%>