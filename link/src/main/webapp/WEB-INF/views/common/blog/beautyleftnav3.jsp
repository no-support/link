<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="col-sm-2 blog_beauty_left_col">
	<div class="row">
		<div class="col-sm-12 blog-manage-bigbox">
		<div class="blog_open_neighbor">
			<span class="blog-manage-title"><a href="">메뉴 관리</a></span>
		</div>
			<div class="col-sm-12 blog-manage-smallbox ${left3 eq 'category' ? 'blog_beauty_selected' : '' }">
				<span><a href="alterCategory.do">카테고리 설정</a></span>
			</div>
			<div class="col-sm-12">
				<hr class="blog-beauty-left-hr"/>
			</div>
		</div>
		<div class="col-sm-12 blog-manage-bigbox">
		<div class="blog_open_neighbor">
			<span class="blog-manage-title"><a href="">글 관리</a></span>
		</div>
			<div class="col-sm-12 blog-manage-smallbox ${left3 eq 'manageComment' ? 'blog_beauty_selected' : '' }">
				<span><a href="manageComment.do">댓글</a></span>
			</div>
			<div class="col-sm-12">
				<hr class="blog-beauty-left-hr"/>
			</div>
		</div>


	</div>
</div>