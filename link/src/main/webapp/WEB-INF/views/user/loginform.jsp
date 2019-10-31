<!--
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
-->
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Link : 로그인</title>
<link rel="shortcut icon" type="image/x-icon" href="../../../resources/images/shortcut-icon.PNG">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Jura|Marck+Script|Russo+One|Sacramento&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/link/resources/css/user/loginform.css">
<style>
a:hover, a:focus {
	text-decoration: none;
}
</style>
</head>

<body>
	<div class="container login-main">
		<div class="row">
			<div class="col-sm-7 col-sm-offset-2 text-center">
				<span class="main-naver"><a href="home.do"><span style="" class="main-null-img glyphicon glyphicon-link"></span> <span style="">L</span><span style="color: #E62600;">i</span><span style="color: #FCC800;">n</span><span
						style="color: #00B658"
					>k</span> </a></span>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-4 col-sm-offset-4">
				<div>
					<form class="well" method="POST" action="loginform.do">
						<div class="form-group">
							<input class="form-control" type="text" name="userId" placeholder="아이디" value="" />
						</div>
						<div class="form-group">
							<input class="form-control" type="password" name="password" placeholder="패스워드" value="" />
						</div>
						<div class="form-group">
							<button class="btn btn-primary form-control" id="login" type="submit">로그인</button>
						</div>
						<hr />
						<div>
							<a class="border" href="">아이디 찾기</a> <a class="border" href="">비밀번호 찾기</a> <a href="/link/registerAgree.do">회원 가입</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>