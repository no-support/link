<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Bootstrap</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="/link/resources/css/blog/bootstrap.css">
<link rel="stylesheet" href="/link/resources/css/blog/blog.css">
<link rel="stylesheet" href="/link/resources/css/blog/beautymain.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

</head>

<body>
	<%@include file="../../common/nav.jsp"%>
	<div class="container blog_beauty_con">
		<!-- 헤더 시작  -->
		<!-- 헤더 끝  -->
		<div class="row">
			<!-- 왼쪽 navi 시작  -->
			<!-- 왼쪽 navi 끝 -->
			<div class="col-sm-12 blog_manage_right_row">
				<div class="row">
					<div class="col-sm-4">
						<span class="blog_manage_title">블로그 생성하기</span>
					</div>
					<div class="col-sm-12">
						<hr class="blog_manage_hr1" />
					</div>
				</div>
				<form id="makeBlogForm" runat="server" action="makeblog.do" method="post" enctype="multipart/form-data">
					<div class="row blog_manage_right_row2">
						<div class="col-sm-2">
							<strong>블로그명</strong>
						</div>
						<div class="col-sm-5">
							<input class="form-control col-sm-12 blog_manage_input" type="text" name="title" />
						</div>
						<div class="col-sm-5">
							<span>한글,영문,숫자 혼용가능(한글 기준 25자 이내)</span>
						</div>
						<div class="col-sm-12">
							<hr>
						</div>
					</div>

					<div class="row blog_manage_right_row2">
						<div class="col-sm-2">
							<strong>별명</strong>
						</div>
						<div class="col-sm-5">
							<input id="blogNickName" class="form-control col-sm-12" type="text" value="${LOGIN_USER.nickName }" name="nickName" />
						</div>
						<div class="col-sm-5">
							<span>한글,영문,숫자 혼용가능(한글 기준 10자 이내)</span>
						</div>
						<div class="col-sm-12">
							<hr>
						</div>
					</div>
					<div class="row blog_manage_right_row2">
						<div class="col-sm-2">
							<strong>소개글</strong>
						</div>
						<div class="col-sm-5">
							<textarea class="form-control col-sm-12" name="description" id="blogDescription" rows="6"></textarea>
						</div>
						<div class="col-sm-5">
							<span>블로그 프로필 영역의<br> 프로필 이미지 아래에 반영됩니다. <br> (한글 기준 200자 이내)
							</span>
						</div>
						<div class="col-sm-12">
							<hr>
						</div>
					</div>
					<div class="row blog_manage_right_row2">
						<div class="col-sm-2 blog_beauty_subjectSelect">
							<strong>내 블로그 주제</strong>
						</div>
						<div class="col-sm-5">
							<select class="form-control blog_beauty_subject" name="topic" id="">
								<option value="movie">영화</option>
								<option value="literature">문학</option>
								<option value="game">게임</option>
								<option value="travle">여행</option>
								<option value="programming">프로그래밍</option>
								<option value="streamming">스트리밍</option>
							</select>
						</div>
						<div class="col-sm-5 blog_beauty_subjectSelect2">
							<span>한글,영문,숫자 혼용가능(한글 기준 10자 이내)</span>
						</div>
						<div class="col-sm-12">
							<hr>
						</div>
					</div>
					<div class="row blog_manage_right_row2">
						<div class="col-sm-2">
							<strong style="font-size: 14px; letter-spacing: -1px;">블로그 프로필 이미지</strong>
						</div>
						<div class="col-sm-3">
							<img id="blogImg" src="/link/resources/images/profile.jpg">
						</div>
						<div class="col-sm-3">
							<span>블로그 프로필 사진에 등록됩니다.</span> <input style="margin-top: 10px;" class="form-control" type="file" id="mainImg" name="mainImg" />
						</div>
						<div class="col-sm-12">
							<hr class="blog_beauty_boldhr">
						</div>
					</div>
					<div class="row ">
						<div class="col-sm-12 text-center blog_beauty_bottombtndiv">
							<button type="button" class="btn blog_beuaty_submit_button">다음</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script>
		$(function() {
			function readURL(input) {
				if (input.files && input.files[0]) {
					var reader = new FileReader();

					reader.onload = function(e) {
						$('#blogImg').attr('src', e.target.result);
					}

					reader.readAsDataURL(input.files[0]);
				}
			}

			$("#mainImg").change(function() {
				readURL(this);
			});
			
			$('.blog_beuaty_submit_button').click(function(){
				if($('.blog_manage_input').val()==""){
					alert('블로그명은 필수입력 사항입니다.');
					return false;
				}
				if($('#blogNickName').val()==""){
					alert('별명을 입력해야 합니다.');
				}
				if($('#blogDescription').val()==""){
					alert('소개글을 적어주세요.');
				}
				var result = confirm('생성하시겠습니까?');
				if(result){
					$('#makeBlogForm').submit();
				}
			})
		})
	</script>
</body>
</html>

