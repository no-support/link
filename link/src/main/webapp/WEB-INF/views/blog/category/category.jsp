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
<link rel="stylesheet" href="/link/resources/css/blog/blogcategory.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

</head>

<body>
	<%@include file="../../common/nav.jsp"%>
	<div class="container blog_beauty_con">
		<!-- 헤더 시작  -->
		<%@include file="../../common/blog/beautyheader.jsp"%>
		<!-- 헤더 끝  -->
		<div class="row">
			<!-- 왼쪽 navi 시작  -->
			<%@include file="../../common/blog/beautyleftnav3.jsp"%>
			<!-- 왼쪽 navi 끝 -->
			<div class="col-sm-10 blog_manage_right_row">
				<div class="row blog_manage_right_row2">
					<div class="col-sm-4">
						<span class="blog_manage_title">카테고리 설정</span>
					</div>
					<div class="col-sm-12">
						<hr class="blog_manage_hr1" />
					</div>
				</div>
				<form action="alterCategory.do" method="post" class="form-horizontal" id="blogApplyCategoryForm">
					<div class="row">
						<div class="col-sm-12">
							<span><strong>카테고리 관리 · 설정</strong></span>
						</div>
						<div class="col-sm-12">
							<hr />
						</div>
						<div class="col-sm-12 blog_category_buttoncol">
							<button type="button" id="blogAddCategoryBtn" class="btn btn-sm btn-default">+ 카테고리 추가</button>
							<button type="button" id="" class="btn btn-sm btn-default">+ 구분선 추가</button>
							<button type="button" id="blogDeleteCategoryBtn" class="btn btn-sm btn-default">- 삭제</button>
						</div>
						<div class="col-sm-4">
							<div class="blog_category_div">
								<div class="row blogCatShowAllDiv">
									<div class="col-sm-12">
										<span style="cursor: pointer;" id="blogCatShowAll">카테고리 전체보기(${categorySize })</span>
									</div>
									<div class="col-sm-12">
										<hr class="blog_category_hr1" />
									</div>
								</div>
								<div class="row blog_category_showRow">
									<c:forEach var="subCat" items="${subCategories }" varStatus="subCatStatus">
										<div class="col-sm-12 blog-detail-showlist blog_category_row1">
											<div class="row blog_category_catdiv">
												<div class="col-sm-12 blog_category_cat2">
													<div class="blogSubCat" data-subCategoryPublic="${subCat.visibility }" data-subCategoryNo="${subCat.no }">
														<span class="glyphicon glyphicon-list-alt"></span> <span class="blog-detail-showall">${subCat.title }</span> <span
															class="blog_category_1"
														>${subCat.visibility eq 'N' ? '(비공개)' : ''}</span>
														<input type="hidden" name="subCatNo" id="sub-cat" value="${subCat.no }" />
														<input type="hidden" name="subCatTitle" id="sub-title" value="${subCat.title }" />
														<input type="hidden" id="blog_subCat_show" name="show" value="${subCat.visibility }" />
													</div>
												</div>
												<c:forEach var="cat" items="${subCat.blogCategory}" varStatus="catStatus">
													<div class="col-sm-12 blog_category_cat1">
														<div class="blogCat" data-categoryPublic="${cat.visibility }" data-categoryNo="${cat.no }">
															&nbsp;┗ <span class="blog-detail-showall">${cat.title }</span> <span class="blog_category_1"> ${cat.visibility eq 'N' ? '(비공개)' : ''}</span>
															<input type="hidden" name="catSubCatNo" id="sub-cat" value="${subCat.no }" />
															<input type="hidden" name="catNo" value="${cat.no }" />
															<input type="hidden" name="catTitle" id="cat-title" value="${cat.title }" />
															<input type="hidden" id="blog_cat_show" name="show" value="${cat.visibility }" />
														</div>
													</div>
												</c:forEach>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
						<div class="col-sm-7">
							<div class="row">
								<div class="form-inline form-group">
									<label class="col-sm-3 control-label" id="blogCategoryName">카테고리명</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="blog_name" name="blogName" disabled="disabled">
									</div>
								</div>
								<div class="form-inline form-group">
									<label for="phone_num" class="col-sm-3 control-label">공개설정</label>
									<div class="col-sm-9" style="padding-top: 7px;">
										<span style="margin-right: 5px;"> <input id="blogPublic" type="radio" name="show2" disabled="disabled" />공개
										</span> <span> <input id="blogPrivate" type="radio" name="show2" disabled="disabled" />비공개
										</span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-12">
							<hr />
						</div>
						<div class="col-sm-12 text-center">
							<button type="button" id="applyCategory" class="btn btn-default">적용</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script>
		$(function() {
			var autoSubCatNo = -1;
			var autoCatNo = -1;
			$('#applyCategory').click(function() {
				var result = confirm('적용하시겠습니까?');
				if (result) {
					$('#blogApplyCategoryForm').submit();
					alert('적용되었습니다');
				}
			});
			$('#blogPublic').click(function() {
				var result = confirm("공개로 설정하시겠습니까??");
				if (result) {
					var subCatNo = $('.blog_category_showRow').find('.blogCategoryselected').attr('data-subCategoryNo');
					var catNo = $('.blog_category_showRow').find('.blogCategoryselected').attr('data-categoryNo');

					if (subCatNo != undefined) {
						$.ajax({
							type : "GET",
							url : "changeCatPublic.do?subCatNo=" + subCatNo,
							success : function() {
								$('.blog_category_showRow').find('.blogCategoryselected').find('#blog_subCat_show').val('Y');

							}
						})
					} else if (catNo != undefined) {
						$.ajax({
							type : "GET",
							url : "changeCatPublic.do?catNo=" + catNo,
							success : function() {
								$('.blog_category_showRow').find('.blogCategoryselected').find('#blog_cat_show').val('<y></y>');
							}
						})
					} else if (catNo == undefined && subCatNo == undefined) {
						$('.blog_category_showRow').find('.blogCategoryselected').find('#blog_cat_show').val('Y');
						$('.blog_category_showRow').find('.blogCategoryselected').find('#blog_subCat_show').val('Y');
					}
					location.href = "alterCategory.do";
				}
			});

			$('#blogPrivate').click(function() {
				var result = confirm("카테고리를 비공개로 하면 검색에서 제외됩니다.");
				if (result) {
					var subCatNo = $('.blog_category_showRow').find('.blogCategoryselected').attr('data-subCategoryNo');
					var catNo = $('.blog_category_showRow').find('.blogCategoryselected').attr('data-categoryNo');

					if (subCatNo != undefined) {
						$.ajax({
							type : "GET",
							url : "changeCatPrivate.do?subCatNo=" + subCatNo,
							success : function() {
								$('.blog_category_showRow').find('.blogCategoryselected').find('#blog_subCat_show').val('N');
							}
						})
					} else if (catNo != undefined) {
						$.ajax({
							type : "GET",
							url : "changeCatPrivate.do?catNo=" + catNo,
							success : function() {
								$('.blog_category_showRow').find('.blogCategoryselected').find('#blog_cat_show').val('N');
							}
						})
					} else if (catNo == undefined && subCatNo == undefined) {
						$('.blog_category_showRow').find('.blogCategoryselected').find('#blog_cat_show').val('N');
						$('.blog_category_showRow').find('.blogCategoryselected').find('#blog_subCat_show').val('N');
					}
					location.href = "alterCategory.do";
				}
			});

			$('#applyCategory').click(function() {
				$('input[name="blogNewCat"]').attr('value', $('#blogNewCat').text());
				$('input[name="blogNewSubCat"]').attr('value', $('#blogNewSubCat').text());
			});

			$('#blogCatShowAll').click(function() {
				$(this).parents('.blog_category_div').find('.blogCategoryselected').removeClass('blogCategoryselected');
				$(this).addClass('blogCategoryselected');

				$('#blog_name').val("").prop("disabled", true);
				$('#blogPublic').prop('disabled', true);
				$('#blogPrivate').prop('disabled', true);
			});

			$('.blog_category_showRow').on('click', '.blogSubCat', function() {
				$(this).parents('.blog_category_showRow').find('.blogCategoryselected').removeClass('blogCategoryselected');
				$(this).addClass('blogCategoryselected');
				/* 				var visibility = $(this).attr('data-subCategoryPublic'); */
				var visibility = $(this).find('#blog_subCat_show').val();
				console.log(visibility);
				if (visibility == 'N') {
					$('#blogPublic').prop('checked', false);
					$('#blogPrivate').prop('checked', true);
				} else {
					$('#blogPrivate').prop('checked', false);
					$('#blogPublic').prop('checked', true);
				}

				$('#blogCatShowAll').removeClass('blogCategoryselected');

				$('#blog_name').prop('disabled', false);
				$('#blog_name').val($('.blog_category_catdiv').find('.blogCategoryselected').find('.blog-detail-showall').text());
				$('#blogPublic').prop('disabled', false);
				$('#blogPrivate').prop('disabled', false);
			});

			$('.blog_category_showRow').on('click', '.blogCat', function() {
				$(this).parents('.blog_category_showRow').find('.blogCategoryselected').removeClass('blogCategoryselected');
				$(this).addClass('blogCategoryselected');

				/* var visibility = $(this).attr('data-categoryPublic'); */
				var visibility = $(this).find('#blog_cat_show').val();
				console.log(visibility);
				if (visibility == 'N') {
					$('#blogPublic').prop('checked', false);
					$('#blogPrivate').prop('checked', true);
				} else {
					$('#blogPublic').prop('checked', true);
					$('#blogPrivate').prop('checked', false);
				}
				$('#blogCatShowAll').removeClass('blogCategoryselected');

				$('#blog_name').prop('disabled', false);
				$('#blog_name').val($('.blog_category_catdiv').find('.blogCategoryselected').find('.blog-detail-showall').text());
				$('#blogPublic').prop('disabled', false);
				$('#blogPrivate').prop('disabled', false);
			});

			// 삭제
			$('#blogDeleteCategoryBtn').click(
					function() {
						if ($('.blog_category_showRow').find('.blogCategoryselected input[name="catNo"]').val() < 0
								|| $('.blog_category_showRow').find('.blogCategoryselected input[name="subCatNo"]').val() < 0) {
							$('.blog_category_div').find('.blogCategoryselected').parent().remove();
						} else {

							var catType = $('.blog_category_div').find('.blogCategoryselected').attr('class');

							// 카테고리 일때
							if (catType == "blogCat blogCategoryselected") {
								var catNo = $('.blog_category_showRow').find('.blogCategoryselected').attr('data-categoryNo');
								var result = confirm("정말 삭제하시겠습니까?");
								if (result) {
									location.href = "deleteCategory.do?catNo=" + catNo;
								}
							} else if (catType == "blogSubCat blogCategoryselected") {
								// 서브카테고리 일때
								var subCatNo = $('.blog_category_div').find('.blogCategoryselected').attr('data-subCategoryNo');
								var result = confirm("정말 삭제하시겠습니까?");
								if (result) {
									location.href = "deleteCategory.do?subCatNo=" + subCatNo;
								}
							}
						}
					});

			$('#blogAddCategoryBtn').click(function() {
				var categoryNo = $('.blog_category_showRow').find('.blogCategoryselected').attr('data-categoryNo');
				var subCatNo = $('.blog_category_div').find('.blogCategoryselected').attr('data-subCategoryNo');
				var subCat = $('.blog_category_showRow').find('.blogCategoryselected');
				var catType = $('.blog_category_div').find('.blogCategoryselected').attr('class');
				var isShow = $('#blog_subCat_show').prop('checked');
				console.log(isShow);

				if (catType == "blogCat blogCategoryselected") {
					alert('카테고리는 2차 분류까지 만드실 수 있습니다');
					// 카테고리 추가하기
				} else if (catType == "blogSubCat blogCategoryselected") {
					var row = '';

					row += '<div class="col-sm-12 blog_category_cat1">';
					row += '<div class="blogCat" data-categoryPublic="Y">';
					row += '&nbsp;┗ <span class="blog-detail-showall"><span id="blogNewCat">카테고리</span></span>';
					row += '<input type="hidden" name="catSubCatNo" id="sub-cat" value="'+subCatNo+'" />';
					row += '<input type="hidden" name="catTitle" id="cat-title" value="카테고리" />';
					row += '<input type="hidden" name="catNo" value="'+autoCatNo+'" />';
					row += '<input type="hidden" id="blog_cat_show" name="show" value="Y" />';
					row += '</div>';
					row += '</div>';
					subCat.parents('.blog_category_catdiv').append(row);
					autoCatNo -= 1;
					// 서브카테고리 추가하기
				} else if (catType == "blogCategoryselected") {
					var row = '<div class="row blog_category_catdiv">';
					row += '<div class="col-sm-12 blog_category_cat2">';
					row += '<div class="blogSubCat" data-categoryPublic="Y" data-subCategoryNo="'+autoSubCatNo+'">';
					row += '<span class="glyphicon glyphicon-list-alt"></span> <span id="blogNewSubCat" class="blog-detail-showall">서브카테고리</span>';
					row += '<input type="hidden" name="subCatTitle" id="sub-title" value="서브카테고리" />';
					row += '<input type="hidden" name="subCatNo" id="sub-cat" value="'+autoSubCatNo+'" />';
					row += '<input type="hidden" id="blog_subCat_show" name="show" value="Y" />';
					row += '</div>';
					row += '</div>';
					row += '</div>';
					$('.blog_category_row1:last').append(row);
					autoSubCatNo -= 1;
				}
			});

			$('#blog_name').keyup(function() {
				$('.blogCategoryselected').find('.blog-detail-showall').text($(this).val());
				$('.blogCategoryselected').find('#sub-title').val($(this).val());
				$('.blogCategoryselected').find('#cat-title').val($(this).val());
			});
			$('#blog_name').focusout(function() {
				if ($(this).val() == "") {
					$(this).val('카테고리');
				}
				$('.blogCategoryselected').find('.blog-detail-showall').text($(this).val());
				$('.blogCategoryselected').find('#sub-title').val($(this).val());
				$('.blogCategoryselected').find('#cat-title').val($(this).val());
			})

		});
	</script>
</body>
</html>

