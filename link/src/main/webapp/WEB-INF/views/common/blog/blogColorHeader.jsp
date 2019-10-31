<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Bootstrap</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Jura|Marck+Script|Russo+One|Sacramento&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/link/resources/css/blog/blog.css">
<link rel="stylesheet" href="/link/resources/css/blog/blogdetail.css">
<link rel="stylesheet" href="/link/resources/css/blog/bootstrap.css">
<script type="text/javascript" src="/link/resources/js/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script>
	$(function() {
		var isComment = '${param.isComment}';
		if(isComment == 'Y'){
			var offset = $('.blog_board_comment1').offset(); //선택한 태그의 위치를 반환
			$('html').animate({scrollTop : offset.top}, 400);
		}
		
		
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
		
		$('.blog_likes_box1').hide();
		$('.blog_comment_textarea_box').hide();
		$('.blog_comment_textarea').hide();
		
		$('#blog_menu_down1').click(function() {
			$('.blog_likes_box1').toggle();
			$('.blog_board_comment_box2').hide();
		})
		$('#blog_addBoardLike').click(function() {
			if ('${LOGIN_USER}' == "") {
				var result = confirm('로그인이 필요한 서비스입니다. 로그인 페이지로 이동하시겠습니까?');
				var host = location.host;
				var returnUrl = location.pathname;
				var queryString = location.search.substr(1).replace(/&/g, ',');

				if (result) {
					location.href = '/link/loginform.do?returnUrl=' + returnUrl + '&queryString=' + queryString;
					return false;
				}
				return false;
			}
			var boardNo = $(this).attr('data-boardNo');
			var categoryNo = $(this).attr('data-categoryNo');
			var blogNo = $(this).attr('data-blogNo');
			var isLiked = $(this).attr('data-isLiked');

			if (isLiked == 'Y') {
				var result = confirm('공감을 취소하시겠습니까?');
				if (result) {
					location.href = 'addNewBlogLike.do?boardNo=' + boardNo + '&categoryNo=' + categoryNo + '&blogNo=' + blogNo + '&action=cancel';
					return false;
				}
			} else {
				var result = confirm("공감하시겠습니까?");
				if (result) {
					location.href = 'addNewBlogLike.do?boardNo=' + boardNo + '&categoryNo=' + categoryNo + '&blogNo=' + blogNo + '&action=add';
					return false;
				}
			}
		})
		$('.blog_board_comment2').click(function(){
			$('.blog_likes_box1').hide();
			$('.blog_board_comment_box2').toggle();
		});
		
		$('#blog_comment_write').click(function(){
			if ('${LOGIN_USER}' == "") {
				var result = confirm('로그인이 필요한 서비스입니다. 로그인 페이지로 이동하시겠습니까?');
				var host = location.host;
				var returnUrl = location.pathname;
				var queryString = location.search.substr(1).replace(/&/g, ',');

				if (result) {
					location.href = '/link/loginform.do?returnUrl=' + returnUrl + '&queryString=' + queryString;
					return false;
				}
				return false;
			}
			$('.blog_comment_textarea_box').toggle();
		});
		
		$('.blog-cmt-replybtn').click(function(){
			var status = $(this).attr('data-status');
			if ('${LOGIN_USER}' == "") {
				var result = confirm('로그인이 필요한 서비스입니다. 로그인 페이지로 이동하시겠습니까?');
				var host = location.host;
				var returnUrl = location.pathname;
				var queryString = location.search.substr(1).replace(/&/g, ',');

				if (result) {
					location.href = '/link/loginform.do?returnUrl=' + returnUrl + '&queryString=' + queryString;
					return false;
				}
				return false;
			}
			$('.blog_comment_textarea_box_'+status).show();
		});
		
		$('.blog_addNeighbor_a').click(function(){
			var blogNo = $(this).attr('data-blogNo');
			if ('${LOGIN_USER}' == "") {
				var result = confirm('로그인이 필요한 서비스입니다. 로그인 페이지로 이동하시겠습니까?');
				var host = location.host;
				var returnUrl = location.pathname;
				var queryString = location.search.substr(1).replace(/&/g, ',');

				if (result) {
					location.href = '/link/loginform.do?returnUrl=' + returnUrl + '&queryString=' + queryString;
					return false;
				}
				return false;
			}
			location.href = 'addNeighbor.do?blogNo='+blogNo;
			return false;
		});
		
		$('#blog_comment_btn').click(function(){
			var contents = $('.blog_txt_1_1').val();
			if(contents == ""){
				alert('내용을 작성해 주세요');
				return false;
			}
			var result = confirm('댓글을 등록하시겠습니까?');
			if(result){
				$('#commentForm').submit();
			}
		});
		
		$('.blog_comment_btn2').click(function(){
			var status = $(this).attr('data-status');
			var contents = $('.blog_txt_'+status).val();
			
			if(contents == ""){
				alert('내용을 작성해 주세요');
				return false;
			}
			var result = confirm('댓글을 등록하시겠습니까?');
			if(result){
				$('.commentReplyForm_'+status).submit();
			}
		});
		$('#blog_board_update_btn').click(function(){
			var boardNo = $('#blog_addBoardLike').attr('data-boardNo');
			var categoryNo = $('#blog_addBoardLike').attr('data-categoryNo');
			var blogNo = $('#blog_addBoardLike').attr('data-blogNo');
			var pno = '${param.pno}';
			
			location.href ='boardUpdate.do?boardNo='+boardNo+'&categoryNo='+categoryNo+'&blogNo='+blogNo+'&pno='+pno;
		});
		$('#blog_board_delete_btn').click(function(){
			var boardNo = $('#blog_addBoardLike').attr('data-boardNo');
			var categoryNo = $('#blog_addBoardLike').attr('data-categoryNo');
			var blogNo = $('#blog_addBoardLike').attr('data-blogNo');
			var pno = '${param.pno}';
			
			var result = confirm('정말 삭제하시겠습니까?');
				if(result){
					location.href = 'deleteBoard.do?boardNo='+boardNo+'&categoryNo='+categoryNo+'&blogNo='+blogNo+'&pno='+pno;
				}
		});
	})
</script>
<style>
@charset "UTF-8";

.blog_main_header_maintitle{
	font-size:25px;
    font-weight: bold;
    font-family: 'Jura', sans-serif;
    font-family: 'Marck Script', cursive;
    font-family: 'Sacramento', cursive;
    font-family: 'Russo One', sans-serif;
}


#blog_comment_write,
.blog_board_comment3,
.blog_addNeighbor_a{
	cursor: pointer;
}
a {
	color: ${blog.atagColor};
}
a:hover {
	text-decoration: none;
}

#blog_board_list5:hover {
	text-decoration: none;
}

body {
	background: linear-gradient(145deg, #edc7be 5%, ${blog.bodyColor} 20% ,rgba(255,0,0,0) 50% ,white 90.71%),
	            linear-gradient(10deg, #f7f6da 3%, #bff5ec 30%, #a1b8ed 55%, #f5f4e9 90.71%),
	            linear-gradient(20deg, #bff5ec 40%, rgba(0,0,255,0) 50%,blue 70.71%);
}
.pagination li a {
	color: ${blog.pageNumColor};
	background-color: ${blog .pageNumBackgroundColor} !important;	
	border-color: ${blog .pageNumBorderColor};
}
.pagination li a.blog_detail_page_1_selected {
	font-weight: bold;
	color: black !important;
}

.pagination li a:hover, .pagination li a:focus {
	color: ${blog.pageNumColor};
	background-color:${blog.pageNumBackgroundColor}!important;
	border-color:${blog.pageNumBorderColor};
}
hr {
	border-color: ${blog.hrColor};
}
.blog_detail_neighborplus {
	border: 1px solid gray;
}

.blog-detail-subtitle {
	color: ${blog.atagColor};
}
.blog_detail_con {
	background: no-repeat center/100% 100% url("/link/resources/images/blogthemes/${blog.theme}");
	min-height: 1500px;
	padding-bottom: 100px;
	border-radius: 20px;
}

.blog_main_left_row {
	border: 1px solid #ccc;
	padding-bottom: 100px;
	background-color: rgba(${ blog.backgroundColor},${blog.opacity});
	color:${blog.fontColor};
}
.blog_main_left_row_bottom {
	border: 1px solid #ccc;
	padding-bottom: 30px;
	background-color: rgba(${ blog.backgroundColor},${blog.opacity});
	color:${blog.fontColor};
}
.blog_detail_right_row, .blog_detail_right_row1, .blog_board_comment1, .blog_board_comment2, .blog_likes_box1, .blog_board_comment_box2,
.blog_board_comment3 {
	background-color: rgba(${ blog.backgroundColor},${blog.opacity});
	color:${blog.fontColor};
}
.blog_board_selected {
	font-weight: bold;
	text-decoration: underline;
}
.blog_board_comment2{
	cursor: pointer;
}
</style>

</head>