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
</style>
</head>

<body>
	<%@include file="../../common/nav.jsp"%>
	<div class="container blog_beauty_con">
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
								<span class="blog_manage_title">테마 설정</span>
							</div>
							<div class="col-sm-12">
								<hr class="blog_manage_hr1" />
							</div>
						</div>
					</div>
				</div>
				<div class="row blog_theme_images">
					<c:forEach var="theme" items="${blogThemes}" varStatus="status">
						<div class="col-sm-3 thumbnail ${theme.fileName eq blogTheme ? 'blog_theme_selected':'' }" data-num="${theme.fileName }">
							<img style="" src="/link/resources/images/blogthemes/${theme.fileName }" alt="" />
							<div class="caption">
								<h4 class="${themeNo eq status.count ? 'blog_theme_selected_h4':'' }">테마${status.count }</h4>
							</div>
							<div class="row">
								<div class="col-sm-12 text-center">
									<button id="blog_theme_btnid_${status.count }" class="btn btn-default form-control blog_theme_selectbtn">선택</button>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="row">
					<div class="col-sm-12">
						<hr />
					</div>
				</div>
				<div class="row blog_button_div">
					<div class="col-sm-12 text-center">
						<button id="blog_theme_applyButton" class="btn btn-default btn-lg">적용</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(function() {
			$('.blog_theme_selectbtn').click(function() {
				$(this).parents('.thumbnail').addClass('blog_theme_selected').css('background-color', '#aec5eb').siblings().removeClass('blog_theme_selected').css('background-color', 'white');

				$(this).parents('.thumbnail').find('h4').css('color', 'white');
				$(this).parents('.thumbnail').siblings().find('h4').css('color', 'black');
			});
			
			$('#blog_theme_applyButton').click(function() {
				var theme = $(this).parents('.blog_button_div').siblings('.blog_theme_images').find('.blog_theme_selected').attr('data-num')
				if(theme==undefined){
					alert('테마를 선택해주세요');
				} else{
				var result = confirm('적용하시겠습니까?');
				if (result) {
					location.href="blogthemeapply.do?theme="+theme;
				}
				}
			})
		});
	</script>
</body>
</html>

