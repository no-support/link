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
.modal.modal-center {
		text-align: center;
}

.modal-dialog.modal-fullsize {
		width: 80%;
		height: 80%;
		margin: 0;
		padding: 0;
}

.modal-content.modal-fullsize {
		height: auto;
		min-height: 80%;
		border-radius: 0;
}

@media screen and (min-width: 768px;) {
		.modal.modal-center:before {
				display: inline-block;
				vertical-align: middle;
				content: "";
				height: 100%;
		}
}

.modal-dialog.modal-center {
		display: inline-block;
		text-align: left;
		vertical-align: middle;
}

.btn:focus, .btn:active:focus, .btn.active:focus, .btn.focus, .btn:active.focus, .btn.active.focus {
		outline: none;
		color: white;
}

#box .col-sm-4 {
		width: 31.33333333%;
		margin: 5px 1.5%;
		padding: 15px;
}

#box .col-sm-4:first-child {
		margin-left: 0px;
}

#box .col-sm-4:last-child {
		margin-right: 0px;
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
				<%@include file="../../common/blog/commonFourLayout.jsp"%>
				<div class="row">
					<div class="col-sm-12">
						<div class="row">
							<div class="col-sm-12">
								<div class="blog_beauty_col1">
									<div class="col-sm-12">
										<div class="col-sm-12 beautify_form" style=" margin-bottom:20px;">
											<div class="text-center">
												<span class="beauty_yellow" style="font-variant: small-caps; font-weight: bold;">마우스로 드래그해서 원하는 위치에 놓으세요.</span>
											</div>
										</div>

										<div class="row">
											<div class="col-sm-10 col-sm-offset-1">
												<div class="row">
													<div class="col-sm-12" id="box">
														<!-- 첫번째  -->
														<c:if test="${blog.firstCol eq 'profile' }">
															<div id="profile" class="col-sm-4 beautify_menu1">프로필영역</div>
														</c:if>
														<c:if test="${blog.firstCol eq 'category' }">
															<div id="category" class="col-sm-4 beautify_menu1">카테고리</div>
														</c:if>
														<c:if test="${blog.firstCol eq 'bloginfo' }">
															<div id="bloginfo" class="col-sm-4 beautify_menu1">블로그정보</div>
														</c:if>
														<!-- 첫번째  -->

														<!-- 두번째  -->
														<c:if test="${blog.secondCol eq 'profile' }">
															<div id="profile" class="col-sm-4 beautify_menu1">프로필영역</div>
														</c:if>
														<c:if test="${blog.secondCol eq 'category' }">
															<div id="category" class="col-sm-4 beautify_menu1">카테고리</div>
														</c:if>
														<c:if test="${blog.secondCol eq 'bloginfo' }">
															<div id="bloginfo" class="col-sm-4 beautify_menu1">블로그정보</div>
														</c:if>
														<!-- 두번째  -->

														<!-- 첫번째  -->
														<c:if test="${blog.thirdCol eq 'profile' }">
															<div id="profile" class="col-sm-4 beautify_menu1">프로필영역</div>
														</c:if>
														<c:if test="${blog.thirdCol eq 'category' }">
															<div id="category" class="col-sm-4 beautify_menu1">카테고리</div>
														</c:if>
														<c:if test="${blog.thirdCol eq 'bloginfo' }">
															<div id="bloginfo" class="col-sm-4 beautify_menu1">블로그정보</div>
														</c:if>
														<!-- 첫번째  -->
													</div>
												</div>
											</div>
											<div class="col-sm-10 col-sm-offset-1">
												<div class="beautify_menu3">글 영역(넓게)</div>
											</div>

										</div>
										<div class="row">
											<div class="col-sm-10 col-sm-offset-1 text-center">
												<div class="beautify_menu2">메뉴형태</div>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-2 col-sm-offset-9 text-center">
												<div class="beautify_menu1">Link메뉴</div>
											</div>
										</div>

									</div>
								</div>
								<div class="row">
									<div class="col-sm-12 text-center blog_beauty_bottombtndiv">
										<button style="margin-right: 20px;" type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal">미리보기</button>
										<button id="layoutApplyButton" data-layNum="4" type="button" class="btn btn-default">적용하기</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal -->
	<div class="modal modal-center fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-center modal-fullsize">
			<div class="modal-content modal-fullsize">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span style="font-size: 35px;" aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">블로그 미리보기</h4>
				</div>
				<div class="modal-body">
					<iframe src="/link/blog/layoutDetail.do?layOutNo=4" width="100%" height="750px;"></iframe>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<script src="/link/resources/js/blogLayout.js"></script>
</body>
</html>

