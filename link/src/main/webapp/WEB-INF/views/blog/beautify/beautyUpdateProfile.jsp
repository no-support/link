<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Bootstrap</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="/link/resources/css/bootstrap.css">
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
            <%@include file="../../common/blog/beautyleftnav.jsp"%> 
            <!-- 왼쪽 navi 끝 -->
            <div class="col-sm-10 blog_manage_right_row">
                <div class="row">
                    <div class="col-sm-4">
                        <span class="blog_manage_title">프로필 정보</span>
                    </div>
                    <div class="col-sm-12">
                        <hr class="blog_manage_hr1" />
                    </div>
                </div>
                <form action="updateProfile.do" method="post" enctype="multipart/form-data">
                <div class="row blog_manage_right_row2">
                    <div class="col-sm-2">
                        <strong>이름</strong>
                    </div>
                    <div class="col-sm-6">
                    	<span>${user.name } </span>
                    </div>
                    <div class="col-sm-4">
                    	<select class="form-control" name="nameVisibility" id="">
                    		<option value="N" ${user.nameVisibility eq 'N' ? 'selected' : '' }>비공개</option>
                    		<option value="Y" ${user.nameVisibility eq 'Y' ? 'selected' : '' }>전체공개</option>
                    		<option value="L" ${user.nameVisibility eq 'L' ? 'selected' : '' }>이웃공개</option>
                    	</select>
                    </div>
                    <div class="col-sm-12">
                        <hr>
                    </div>
                </div>
                <div class="row blog_manage_right_row2">
                    <div class="col-sm-2">
                        <strong>성별</strong>
                    </div>
                    <div class="col-sm-6">
                    	<span>${user.gender }</span>
                    </div>
                    <div class="col-sm-4">
                    	<select class="form-control" name="genderVisibility" id="">
                    		<option value="N" ${user.genderVisibility eq 'N' ? 'selected' : '' }>비공개</option>
                    		<option value="Y" ${user.genderVisibility eq 'Y' ? 'selected' : '' }>전체공개</option>
                    		<option value="L" ${user.genderVisibility eq 'L' ? 'selected' : '' }>이웃공개</option>
                    	</select>
                    </div>
                    <div class="col-sm-12">
                        <hr>
                    </div>
					<div class="col-sm-2">
						<strong style="font-size: 14px; letter-spacing: -1px;">유저 프로필 이미지</strong>
					</div>
					<div class="col-sm-3">
						<img id="blogImg" src="/link/resources/images/${LOGIN_USER.img }">
					</div>
					<div class="col-sm-4 col-sm-offset-3">
						<span>유저 프로필 사진에 등록됩니다.</span> <input style="margin-top: 10px;" class="form-control" type="file" id="mainImg" name="mainImg" />
					</div>
					<div class="col-sm-12">
						<hr class="blog_beauty_boldhr">
					</div>
                </div>
                
                <div class="row ">
	                <div class="col-sm-12 text-center blog_beauty_bottombtndiv">
		                <button type="submit" class="btn btn-default">확인</button>
	                </div>
                </div>
            </form>
            </div>
        </div>
    </div>
<script>
$(function(){
	function readURL(input) {
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	
	        reader.onload = function (e) {
	            $('#blogImg').attr('src', e.target.result);
	        }
	
	        reader.readAsDataURL(input.files[0]);
	    }
	}
	
	$("#mainImg").change(function(){
	    readURL(this);
	});
})
</script>
</body></html>

