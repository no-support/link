<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="col-sm-2 blog_beauty_left_col">
	<div class="row">
		<div class="col-sm-12 blog-manage-bigbox">
		<div class="blog_open_neighbor">
			<span class="blog-manage-title"><a href="">디자인 설정</a></span>
		</div>
			<div class="col-sm-12 blog-manage-smallbox ${left2 eq 'layout' ? 'blog_beauty_selected' : '' }">
				<span><a href="beautifyblog.do">레이아웃 & 위젯 설정</a></span>
			</div>
			<div  class="col-sm-12 blog-manage-smallbox ${left2 eq 'theme' ? 'blog_beauty_selected' : '' }">
				<span><a href="blogtheme.do">내 테마 관리</a></span>
			</div>
			<div  class="col-sm-12 blog-manage-smallbox ${left2 eq 'color' ? 'blog_beauty_selected' : '' }">
				<span><a href="blogcolor.do">내 색상 관리</a></span>
			</div>
			<div class="col-sm-12">
				<hr class="blog-beauty-left-hr"/>
			</div>
			
		</div>
	</div>
</div>