<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
						<span class="blog_manage_title">블로그</span>
					</div>
					<div class="col-sm-12">
						<hr class="blog_manage_hr1" />
					</div>
					<div class="col-sm-12">
						<div class="row">
							<div class="col-sm-12">
								카테고리 관리 · 설정
							</div>
							<div class="col-sm-4">
								<%@ include file="../../common/blogchangeform/category.jsp"%>
							</div>
						</div>
					</div>
				</div>
				
			</div>
        </div>
    </div>
    <script>
    	$(function(){
    		$('.blog_beuaty_submit_button').click(function(){
   				if($('.blog_manage_input').val()==""){
   					alert('블로그명은 필수입력 사항입니다.');
   					return false;
   				}
   				if($('#blogNickName').val()==""){
   					alert('별명을 입력해야 합니다.');
   					return false;
   				}
   				if($('#blogDescription').val()==""){
   					alert('소개글을 적어주세요.');
   					return false;
   				}
   				var result = confirm('적용하시겠습니까?');
   				if(result){
   					$('#updateBlogForm').submit();
   				}
    		})
    	})
    </script>
</body></html>

