<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="col-sm-2 blog_beauty_left_col">
	<div class="row">
		<div class="col-sm-12 blog-manage-bigbox">
			<span class="blog-manage-title"><a href="">기본 정보 관리</a></span>
			<div class="col-sm-12 blog-manage-smallbox ${left eq 'blogmain' ? 'blog_beauty_selected' : '' }">
				<span><a href="beauty.do">블로그 정보</a></span>
			</div>
			<div  class="col-sm-12 blog-manage-smallbox ${left eq 'updateProfile' ? 'blog_beauty_selected' : '' }">
				<span><a href="updateProfile.do">프로필 정보</a></span>
			</div>
			
		</div>
		<div class="col-sm-12 blog-manage-bigbox">
			<span class="blog-manage-title"><a href="">열린이웃</a></span>
			<div class="col-sm-12 blog-manage-smallbox ${left eq 'manageNeighbor' ? 'blog_beauty_selected' : '' }">
				<span ><a href="manageNeighbor.do">이웃 관리</a></span>
			</div>
			<div class="col-sm-12 blog-manage-smallbox ${left eq 'addMeNeighbor' ? 'blog_beauty_selected' : '' }">
				<span><a href="addMeNeighbor.do">나를 추가한 이웃</a></span>
			</div>
			<div class="col-sm-12 blog-manage-smallbox ${left eq 'eachneighbor' ? 'blog_beauty_selected' : '' }">
				<span ><a href="eachNeighbor.do">서로이웃 맺기</a></span>
			</div>
		</div>


	</div>
</div>