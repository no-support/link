<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Bootstrap</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="/link/resources/css/blog/blog.css">
<link rel="stylesheet" href="/link/resources/css/blog/blogdetail.css">
<link rel="stylesheet" href="/link/resources/css/blog/bootstrap.css">
<script type="text/javascript" src="/link/resources/js/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script>
	$(function() {
		$('.blog_page_bum2').click(event, function() {
			event.preventDefault();
			var page = $(this).text();
			var blogNo = $('#blog_board_title1').attr('data-blogNo');
			var categoryNo = $('#blog_board_title1').attr('data-categoryNo');

			$.ajax({
				type : "GET",
				url : "paginationAjax10.do",
				data : {
					pno10 : page,
					categoryNo : categoryNo
				},
				success : function(result) {
					console.log(result.pno10);
					$('#' + result.pno10 + "_2").addClass('blog_detail_page_1_selected').parent().siblings().find('a').removeClass('blog_detail_page_1_selected');
					$('#blog_board_imgs').empty();
					$.each(result.blogboardsByRange10, function(index, board) {
						var row = '<div class="col-sm-3 blog_detail_right_col4">';
						row += '		<div class="row">';
						row += '			<div class="col-sm-12">';
						row += '				<a href="/link/blog/board.do?boardNo=' + board.no + '&blogNo=' + blogNo + '&categoryNo=' + categoryNo + '"> <img';
						row += '				style="width: 100%; height: 173.88px;" src="/link/resources/images/userblogimgs/' + board.mainImg + '" alt=""></a>';
						row += '			</div>';
						row += '		</div>';
						row += '		<div class="row blog_detail_board_title_row">';
						row += '			<div class="col-sm-12">';
						row += '				<span class="blog_detail_board_title">' + board.title + '</span>';
						row += '			</div>';
						row += '		</div>';
						row += '		<div class="row">';
						row += '			<div class="col-sm-12 blog_detail_full">';
						row += '				<a href=""> <span class="blog_detail_board_date">' + board.createDate + '</span>';
						row += '				</a> <a href=""> <span class="glyphicon glyphicon-tag blog_detail_tag"></span> <span class="blog_detail_comments">댓글 4</span>';
						row += '				</a>';
						row += '			</div>';
						row += '		</div>';
						row += '</div>';

						$('#blog_board_imgs').append(row);
					})
				}
			})
			return false;
		});
	})
</script>
</head>
<body>
	<!-- 네비게이션 시작  -->
	<%@include file="../../common/nav.jsp"%>
	<!-- 네비게이션 끝  -->
	<div class="container blog_detail_con">
		<c:if test="${isNeighbor eq 'N' }">
			<div class="row">
				<div class="col-sm-3"></div>
				<div class="col-sm-6">
					<div class="row text-center">
						<div class="col-sm-12 blog_add_neighbor_row_1">
							<strong>${user.nickName }</strong>님에게 이웃을 신청합니다.
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<hr />
						</div>
					</div>
					<form id="neighborApplyingForm" action="addNeighbor.do" method="post">
						<input type="hidden" name="neighborBlogNo" value="${blog.no }" />
						<div class="row">
							<div class="col-sm-12 blog_neighbor_apply_div1 text-center">
								<span class="blog_request_div1">이웃을 신청합니다.</span>
								<span class="blog_request_div2">서로이웃을 신청합니다.</span>
								<!-- hidden value each or oneway  -->
								<input id="blog_neighborType" type="hidden" name="eachNeighbor" value="oneway" />
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12 form-group">
								<label for="">서로이웃 메세지 보내기</label>
								<textarea id="blog_neighbor_textarea" class="form-control" name="neighborMessage" id="" cols="30" rows="5">우리 서로이웃 해요~</textarea>
							</div>
						</div>
					</form>
					<div class="row">
						<div class="col-sm-12 text-center">
							<button type="button" class="btn btn-sm blog-btn-apply1">신청</button>
							<button type="button" class="btn btn-default btn-sm blog-btn-apply2">취소</button>
						</div>
					</div>
				</div>
			</div>
		</c:if>
		<c:if test="${isNeighbor eq 'Y' }">
			<div class="row">
				<div class="col-sm-3"></div>
				<div class="col-sm-6">
					<div class="row text-center">
						<div class="col-sm-12 blog_add_neighbor_row_1">
							<strong>${user.nickName }</strong>님과는 이미 이웃입니다.
						</div>
					</div>
				</div>
			</div>
		</c:if>
	</div>
	<script>
		$(function() {
			$('#blog_neighbor_textarea').hide();
			$('.blog_request_div1').addClass('blog_neighbor_selected1');
			$('.blog_request_div1, .blog_request_div2').click(function() {
				$(this).addClass('blog_neighbor_selected1').siblings().removeClass('blog_neighbor_selected1');
			});

			$('.blog_request_div1').click(function() {
				$('#blog_neighbor_textarea').val('우리 서로이웃 해요~').hide();
				$('#blog_neighborType').val('oneway');
			});
			$('.blog_request_div2').click(function() {
				$('#blog_neighbor_textarea').show();
				$('#blog_neighborType').val('each');
			});

			$('.blog-btn-apply1').click(function() {
				if ($('#blog_neighborType').val() == 'oneway') {
					var result = confirm('이웃을 추가하시겠습니까?');
					if (result) {
						$('#neighborApplyingForm').submit();
					}
				} else if ($('#blog_neighborType').val() == 'each') {
					var result = confirm('서로이웃을 신청하시겠습니까?');
					if (result) {
						$('#neighborApplyingForm').submit();
					}
				}

			});
			$('.blog-btn-apply2').click(function() {
				var result = confirm('취소하시겠습니까? 내용은 저장되지 않습니다.');

				if (result) {
					history.back();
				}
			});
		})
	</script>
</body>
</html>