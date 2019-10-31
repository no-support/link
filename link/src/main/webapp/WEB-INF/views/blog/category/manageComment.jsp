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
<style>
	.blog_table input{
		margin-right: 3px;
	}
	
	.blog_table input:last-child{
		margin-right: 6px;
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
			<%@include file="../../common/blog/beautyleftnav3.jsp"%>
			<!-- 왼쪽 navi 끝 -->
			<div class="col-sm-10 blog_manage_right_row">
				<div class="row">
					<div class="col-sm-4">
						<span class="blog_manage_title">댓글 관리</span>
					</div>
					<div class="col-sm-12">
						<hr class="blog_manage_hr1" />
					</div>
				</div>
				<div class="row blog_manage_right_row2">
					<div class="col-sm-12">
						<ul class="nav nav-tabs blog_nav_tabs">
							<li role="presentation" class="active"><a href="#">댓글목록</a></li>
						</ul>
					</div>
					<div class="col-sm-12">
						<c:if test="${not empty blogComments}">
							<table class="table blog_table">
								<colgroup>
									<col width="30%">
									<col width="30%">
									<col width="20%">
									<col width="20%">
								</colgroup>
								<thead>
									<tr>
										<th class="text-center">유저아이디</th>
										<th class="text-center">게시글제목</th>
										<th class="text-center">추가일</th>
										<th class="text-center">관리</th>
									</tr>
								</thead>
								<tbody>
								<form id="neighbordeleteForm" action="manageComment.do" method="post">
									<c:forEach var="comment" items="${blogComments }">
										<tr>
											<td>
												<input type="checkbox" name="neighborBlogNo" value="${comment.COMMENTNO }"/>
												<a href="detail.do?blogNo=${comment.NO }"><img style="width: 30px; height: 30px; border-radius: 50%; margin-right: 5px;" src="/link/resources/images/${comment.MAINIMG }"/> ${comment.NICKNAME }(${comment.USERID  })</a>
											</td>
											<td class="text-center">${comment.TITLE }</td>
											<td class="text-center">
												<fmt:formatDate value="${comment.CREATEDATE}" pattern="yyyy-MM-dd HH:mm" />
											</td>
											<td class="text-center">
												<button id="singo" type="button" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-exclamation-sign"></span>신고</button>
											</td>
										</tr>
									</c:forEach>
									</form>
									<tr class="blogselectAllTd">
										<td class="blogselectAllTd">
											<span class="blog_selectAll_span"><input type="checkbox" id="blog_select_all"></input>전체선택</span>
											<button class="btn btn-default btn-sm blog_neigh_delete_btn">삭제</button>
										</td>
									</tr>
								</tbody>
							</table>
						</c:if>
						<c:if test="${empty blogComments }">
							<p class="text-center" style="padding:60px 60px 0px 60px;">
								댓글이 없습니다.
							</p>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(function() {
			$('#singo').click(function(){
				var result = confirm('신고하시겠습니까?');
				if(result){
					alert('신고되었습니다.');
				}
			});
			
			$('.blog_neigh_delete_btn').click(function(){
				
				var isChecked = false;
				$.each($('tbody input[type=checkbox]'), function(index,item){
					if($(this).prop('checked') == true){
						isChecked = true;
					}
				});
				
				if(isChecked == true){
					var result = confirm('정말 연을 끊으시겠습니까?');
					if(result){
						$('#neighbordeleteForm').submit();
					}
					
				} else{
					alert('삭제할 항목을 선택해주세요');
					return false;
				}
			});
			
			
			$('#blog_select_all').change(function() {
				$('table input[type=checkbox]').prop('checked', $(this).prop('checked'));
			});
			$('#blog_whoApply').change(function() {
				$('table input[type=checkbox]').prop('checked', $(this).prop('checked'));
			});
			
		})
	</script>
</body>
</html>

