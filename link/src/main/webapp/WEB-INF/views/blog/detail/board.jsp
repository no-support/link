<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../../common/blog/blogColorHeader.jsp"%>

<body>
	<%@include file="../../common/nav.jsp"%>
	<%@include file="../../common/blog/blogtitle.jsp"%>
	
	<div class="container blog_detail_con">
		<div class="row">
			<!--  헤더 시작         -->
			<%@include file="../../common/blog/blogheader.jsp"%>
			<!--  헤더 끝     -->
			<!--좌측 nav 시작-->
			<%@include file="../../common/blog/blogLayoutForInfo.jsp"%>
			<!--좌측 nav 끝-->
			<%@include file="../../common/blog/blogLayout.jsp"%>
			<!--  우측 공통부분 헤더 시작-->
			<%@include file="../../common/blog/blogright.jsp"%>
			<!--  우측 공통부분 헤더 끝-->
			<!--                    우측 게시판 두번째 nav 시작-->
			<div class="col-sm-12 blog_detail_right_row1" style="margin-top: 0px;">
				<!--  우측 게시판 글 하나 시작-->
				<div class="col-sm-12">
					<div class="row">
						<div class="col-sm-12 blog_detail_main_board_contents">
							<div class="page-header">
								<h2>${board.title }</h2>
								<div class="row">
									<div class="col-sm-12 text-right">
										<span>작성일: ${board.createDate }</span>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-sm-12" style="word-wrap:break-word;">
								${board.contents }
								</div>
							</div>

						</div>
					</div>
				</div>
				<!--  우측 게시판 글 하나 끝-->
			</div>
			<!-- 우측 게시판 두번째 nav 끝-->
			<%@ include file="../../common/blog/blogGongGam.jsp" %>
		</div>
	</div>
	</div>

</body>
</html>