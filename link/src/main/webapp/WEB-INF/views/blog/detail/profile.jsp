<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../../common/blog/blogColorHeader.jsp"%>
<body>
	<!-- 네비게이션 시작  -->
	<%@include file="../../common/nav.jsp"%>
	<!-- 네비게이션 끝  -->
	<div class="container blog_detail_con">
		<div class="row">
		<div class="col-sm-12">
			<div class="col-sm-10 col-sm-offset-1">
			<!-- 우측 프로필 시작-->
			<div class="col-sm-12">
				<div class="row">
					<div class="col-sm-12">
						<span class="glyphicon glyphicon-menu-right blog_usernickNameGlyphycon"></span>
						<span class="blog_usernickName">${user.nickName }</span>
						<span class="blog_nickNameBlog">님의 블로그</span>
					</div>
				</div>
			</div>
			<div class="col-sm-12 ">
				<div class="blog_detail_right_row1 blog_detail_right_row1_1">
						<div class="col-sm-12">
							<span style="color: gray">${blog.description }</span>
						</div>
				</div>
			</div>
			<div class="col-sm-12" style="margin-bottom: 5px;">
				<span style="font-size: 13px; color: #ccc;" class="glyphicon glyphicon-menu-right"></span>
				<span style="font-weight: bold;">기본정보</span>
			</div>
			<div class="col-sm-12">
				<table class="table table-bordered">
					<tbody>
						<tr>
							<th>이름</th>
							<c:choose>
								<c:when test="${user.nameVisibility eq 'Y' }">
									<td>${user.name }</td>
								</c:when>
								<c:otherwise>
									<td>비공개</td>
								</c:otherwise>
							</c:choose>

							<th>성별</th>
							<c:choose>
								<c:when test="${user.genderVisibility eq 'Y' }">
									<td>${user.gender }</td>
								</c:when>
								<c:otherwise>
									<td>비공개</td>
								</c:otherwise>
							</c:choose>
						</tr>
						<tr>
							<th>별명</th>
							<td>${user.nickName }</td>
							<th></th>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
			</div>
		</div>
		</div>
	</div>
	</div>

</body>
</html>