<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../../common/blog/blogColorHeader.jsp"%>
<body>
	<!-- 네비게이션 시작  -->
	<%@include file="../../common/nav.jsp"%>
	<!-- 네비게이션 끝  -->
	<div class="container blog_detail_con">
		<div class="row">
			<!--  헤더 시작         -->
			<%@include file="../../common/blog/blogheader.jsp"%>
			<!--  헤더 끝     -->
			<!--좌측 nav 시작-->
			<%@include file="../../common/blog/blogLayoutForInfo.jsp"%>
			<!--좌측 nav 끝-->
			<!-- 우측 게시판 시작-->
			<%@include file="../../common/blog/blogLayout.jsp"%>



			<!--                    우측 게시판 두번째 nav 시작-->
			<div class="col-sm-12 blog_detail_right_row1">
				<!--  우측 게시판 글 하나 시작-->
				<%@ include file="../../common/blog/detailPageCommon.jsp"%>
				<!--  우측 게시판 글 하나 끝-->

				<!--우측 두번째 페이지네이션 시작-->
				<%@ include file="../../common/blog/detailListCommon.jsp"%>
				<!--우측 두번째 페이지네이션 끝-->
			</div>
			<!--                    우측 게시판 두번째 nav 끝-->
			<!--  우측 공통부분 헤더 시작-->
				<%@include file="../../common/blog/blogrightForLayout4.jsp"%>
				<!--  우측 공통부분 헤더 끝-->
		</div>
		<!--                    우측 게시판 끝-->
		
	</div>
	</div>

</body>
</html>