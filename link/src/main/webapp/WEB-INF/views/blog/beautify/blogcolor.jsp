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
<link rel="stylesheet" href="/link/resources/css/blog/beautifyblog.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
.btn:focus, .btn:active:focus, .btn.active:focus, .btn.focus, .btn:active.focus,
	.btn.active.focus {
	outline: none;
}

.blog_beauty_con {
	width: 1905px;
	margin: 0 auto;
	margin-bottom: 60px;
	padding: 0px 15px;
	border: 0px;
}

</style>
</head>

<body>
	<%@include file="../../common/nav.jsp"%>
	<div class="blog_beauty_con">
		<!-- 헤더 시작  -->
		<%@include file="../../common/blog/beautyheader.jsp"%>
		<!-- 헤더 끝  -->
		<div class="row">
			<!-- 왼쪽 navi 시작  -->
			<%@include file="../../common/blog/beautyleftnav2.jsp"%>
			<!-- 왼쪽 navi 끝 -->
			<div class="col-sm-10 blog_manage_right_row">
				<div class="row">
					<div class="col-sm-12">
						<div class="row">
							<div class="col-sm-4">
								<span class="blog_manage_title">블로그 색 설정</span>
							</div>
							<div class="col-sm-12">
								<hr class="blog_manage_hr1" />
							</div>
						</div>
					</div>
				</div>
				<form action="blogcolor.do" method="post">
					<div class="row">
						<div class="col-sm-2" style="">
							<div class="col-sm-12 blog_color_col12">
								<div class="row">
									<div class="col-sm-12">
										<h5>글 색상</h5>
									</div>
									<div class="col-sm-8">
										<input style="" type="color" name="fontColor" value="${blog.fontColor }" />
									</div>
								</div>
							</div>
							<div class="col-sm-12 blog_color_col12">
								<div class="row">
									<div class="col-sm-12">
										<h5>글 배경색상</h5>
									</div>
									<div class="col-sm-8">
										<input style="" type="color" name="backgroundColor" value="${blog.backgroundColor }" />
									</div>
								</div>
							</div>
							<div class="col-sm-12 blog_color_col12">
								<div class="row">
									<div class="col-sm-12">
										<h5>주요기능 색상</h5>
									</div>
									<div class="col-sm-8">
										<input style="" type="color" name="atagColor" value="${blog.atagColor }" />
									</div>
								</div>
							</div>
							<div class="col-sm-12 blog_color_col12">
								<div class="row">
									<div class="col-sm-12">
										<h5>구분선 색상</h5>
									</div>
									<div class="col-sm-8">
										<input style="" type="color" name="hrColor" value="${blog.hrColor }" />
									</div>
								</div>
							</div>
							<div class="col-sm-12 blog_color_col12">
								<div class="row">
									<div class="col-sm-12">
										<h5>전체 배경 색상</h5>
									</div>
									<div class="col-sm-8">
										<input style="" type="color" name="bodyColor" value="${blog.bodyColor }" />
									</div>
								</div>
							</div>
							<div class="col-sm-12 blog_color_col12">
								<div class="row">
									<div class="col-sm-12">
										<h5>페이지 번호 색상</h5>
									</div>
									<div class="col-sm-8">
										<input style="" type="color" name="pageNumColor" value="${blog.pageNumColor }" />
									</div>
								</div>
							</div>
							<div class="col-sm-12 blog_color_col12">
								<div class="row">
									<div class="col-sm-12">
										<h5>페이지 번호 배경 색상</h5>
									</div>
									<div class="col-sm-8">
										<input style="" type="color" name="pageNumBackgroundColor" value="${blog.pageNumBackgroundColor }" />
									</div>
								</div>
							</div>
							<div class="col-sm-12 blog_color_col12">
								<div class="row">
									<div class="col-sm-12">
										<h5>페이지 번호 테두리 색상</h5>
									</div>
									<div class="col-sm-8">
										<input style="" type="color" name="pageNumBorderColor" value="${blog.pageNumBorderColor }" />
									</div>
								</div>
							</div>

							<div class="col-sm-12 blog_color_col12">
								<div class="row">
									<div class="col-sm-12">
										<h5>배경색 투명도</h5>
									</div>
									<div class="col-sm-11">
										<select class="form-control" name="opacity" id="">
											<option value="1.0" ${blog.opacity eq 1.0 ? 'selected' : '' }>100%</option>
											<option value="0.9" ${blog.opacity eq 0.9 ? 'selected' : '' }>90%</option>
											<option value="0.8" ${blog.opacity eq 0.8 ? 'selected' : '' }>80%</option>
											<option value="0.7" ${blog.opacity eq 0.7 ? 'selected' : '' }>70%</option>
											<option value="0.6" ${blog.opacity eq 0.6 ? 'selected' : '' }>60%</option>
											<option value="0.5" ${blog.opacity eq 0.5 ? 'selected' : '' }>50%</option>
										</select>
									</div>
								</div>
							</div>
							<div class="col-sm-12">
								<div class="row blog_button_div">
									<div class="col-sm-12 text-center">
										<button type="submit" id="blog_theme_applyButton" class="btn btn-default btn-lg">적용</button>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-10 blog_color_col9" style="">
							<div class="row">
								<iframe src="/link/blog/colordetail.do" width="1285.41px;" height="1500px;"></iframe>
							</div>
						</div>
					</div>

				</form>
			</div>
		</div>
	</div>



	<script>
		$(function() {
			$('.main-nav').find('.blog_remove_color').removeClass('container').addClass('container-fluid');
			$('.blog-navbar-right').css('margin-right','0px');
		});
	</script>
</body>
</html>

