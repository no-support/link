<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="row">
	<div class="col-sm-9 blog_board_comment_box11">
		<span class="blog_board_comment1">
			<span class="glyphicon glyphicon-heart heart1" style="color: ${isLiked eq 'Y' ? 'red;' : ''}"></span>
			<span class="blog_likes1">
				<span data-isLiked="${isLiked }" data-boardNo="${board.no }" data-categoryNo="${board.categoryNo }" data-blogNo="${param.blogNo }" id="blog_addBoardLike">공감 ${boardLikes}</span>
			</span>
			<span id="blog_menu_down1" class="glyphicon glyphicon-menu-down down1"></span>
		</span>
		<span class="blog_board_comment2">
			<span class="glyphicon glyphicon-pencil heart1"></span>
			<span class="blog_likes1 blog_comments_span">댓글(${commentsCount})</span>
			<span class="glyphicon glyphicon-menu-down down1"></span>
		</span>
	</div>
	<c:if test="${param.blogNo eq myBlog.no }">
		<div class="col-sm-3 blog_board_comment_box1 text-right">
			<button id="blog_board_update_btn" class="btn btn-default btn-sm">수정</button>
			<button id="blog_board_delete_btn" class="btn btn-default btn-sm">삭제</button>
		</div>
	</c:if>
	<div class="col-sm-12">
		<div class="col-sm-12 blog_likes_box1" style="border: 1px solid lightgray; padding: 15px;">
			<div class="row" style="margin-bottom: 20px;">
				<div class="col-sm-12">
					<span style="font-size: 15px;">이 글에 공감한 블로거</span>
				</div>
			</div>
			<c:if test="${empty blogBoardLikes }">
				<div class="row">
					<div class="col-sm-12 text-center">
						<p>아직 공감한 블로거가 없습니다.</p>
						<p>제일먼저 공감해 보세요 ~!!</p>
					</div>
				</div>
			</c:if>
			<div class="row">
				<c:forEach var="like" items="${blogBoardLikes }">
					<div class="col-sm-6" style="margin-bottom: 20px;">
						<div class="row">
						<a href="detail.do?blogNo=${like.BLOGNO }">
							<div class="col-sm-2">
								<img class="blog-row-2-profile-img" src="/link/resources/images/${like.MAINIMG }" alt="" />
								<span></span>
							</div>
							<div class="col-sm-6">
								<div class="row">
									<div class="col-sm-12">${like.BLOGTITLE }</div>
								</div>
								<div class="row">
									<div class="col-sm-12" style="height: 40px; overflow: hidden;">${like.BLOGDESCRIPTION }</div>
								</div>
							</div>
						</a>
							<c:choose>
								<c:when test="${myBlog.no eq like.BLOGNO }">
									<div class="col-sm-4 text-center">
										<div style="border: 1px solid lightgray; padding: 5px; position: relative; top: 10px; width: 76.27px; height: 28px;">
											<span style="">나</span>
										</div>
									</div>
								</c:when>
								<c:when test="${like.isNeighbor eq 'Y' }">
									<div class="col-sm-4 text-center">
										<div style="border: 1px solid lightgray; padding: 5px; position: relative; top: 10px; width: 76.27px; height: 28px;">
											<span style="">이웃</span>
										</div>
									</div>
								</c:when>
								<c:otherwise>
									<div class="col-sm-4 text-center">
										<span style="border: 1px solid lightgray; padding: 5px; position: relative; top: 10px;">
											<span data-blogNo="${like.BLOGNO }" class="blog_addNeighbor_a">+이웃추가</span>
										</span>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<div class="col-sm-12" style="margin-bottom: 20px;">
		<div class="row">
			<div class="col-sm-12" style="padding: 15px;">
				<div class="blog_board_comment_box2" style="padding: 15px;">
					<div class="row">
						<div class="col-sm-12">
							<span id="blog_comment_write" style="border:0.5px solid lightgray; padding:5px;">댓글쓰기</span>
						</div>
						<div class="col-sm-12">
							<hr style="border: 0.5px solid lightgray;" />
						</div>
					</div>
					<c:if test="${empty blogBoardComments }">
						<div class="row">
							<div class="col-sm-12 text-center">
								<p>아직 작성된 댓글이 없습니다.</p>
								<p>제일먼저 댓글을 작성해 보세요!</p>
							</div>
						</div>
					</c:if>
					<!-- 댓글 작성 칸 시작  -->
					<form id="commentForm" action="addNewComment.do" method="post">
						<input type="hidden" name="boardNo" value="${param.boardNo }" />
						<input type="hidden" name="categoryNo" value="${param.categoryNo }" />
						<input type="hidden" name="blogNo" value="${param.blogNo }" />
						<div class="row form-group blog_comment_textarea_box">
							<div class="col-sm-12" style="margin-bottom: 20px;">
								<img class="blog-row-2-profile-img" src="/link/resources/images/${myBlog.mainImg }" alt="" />
								<span style="font-size: 15px; font-weight: bold;">${myBlog.userId }</span>
							</div>
							<div class="col-sm-12">
								<div class="blog_colordiv1" style="border: 0.5px solid lightgray; margin-bottom: 15px;">
									<textarea class="form-control blog_txt_1_1" name="contents" id="" cols="20" rows="5"></textarea>
								</div>
							</div>
							<div class="col-sm-12 text-right">
								<button id="blog_comment_btn" type="button" class="btn btn-default btn-sm">등록</button>
							</div>
						</div>
					</form>
					<!-- 댓글 작성 칸 끝  -->

					<!-- 댓글 시작  -->
					<c:forEach var="comment" items="${blogBoardComments }" varStatus="status">
						<div class="row">
							<div class="col-sm-12">
								<div class="blog_colordiv1">
									<div class="row">
										<div class="col-sm-12">
											<img class="blog-row-2-profile-img" src="/link/resources/images/${comment.BLOGMAINIMG }" alt="" />
											<span></span>
											<span>${comment.NICKNAME }</span>
										</div>
									</div>
									<div class="row" style="margin-top: 10px; margin-bottom: 5px;">
										<div class="col-sm-12">${comment.CONTENTS }</div>
									</div>
									<div class="row">
										<div class="col-sm-12">
											<fmt:formatDate value="${comment.CREATEDATE }" pattern="yyyy-MM-dd HH:mm:ss" />
										</div>
									</div>
									<div class="row" style="margin-top: 10px;">
										<div class="col-sm-1">
											<button data-status="${status.count }" class="btn btn-default btn-sm blog-cmt-replybtn">답글</button>
										</div>
										<div class="col-sm-11 text-right">
											<button class="btn btn-default">
												<span class="glyphicon glyphicon-heart"></span>
												&nbsp;${comment.LIKES }
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12">
								<hr style="border: 0.5px solid lightgray;" />
							</div>
						</div>
						<!-- 대댓글 작성 폼 시작  -->
						<form class="commentReplyForm_${status.count }" action="addNewComment.do" method="post">
							<input type="hidden" name="boardNo" value="${param.boardNo }" />
							<input type="hidden" name="categoryNo" value="${param.categoryNo }" />
							<input type="hidden" name="blogNo" value="${param.blogNo }" />
							<input type="hidden" name="parentCommentNo" value="${comment.NO }" />

							<div class="row form-group blog_comment_textarea_box_${status.count } blog_comment_textarea">
								<div class="col-sm-12" style="margin-bottom: 20px;">
									<img class="blog-row-2-profile-img" src="/link/resources/images/${myBlog.mainImg }" alt="" />
									<span style="font-size: 15px; font-weight: bold;">${myBlog.userId }</span>
								</div>
								<div class="col-sm-12">
									<div class="blog_colordiv1" style="border: 0.5px solid lightgray; margin-bottom: 15px;">
										<textarea class="form-control blog_txt_${status.count }" name="contents" id="" cols="20" rows="5"></textarea>
									</div>
								</div>
								<div class="col-sm-12 text-right">
									<button data-status="${status.count }" class="blog_comment_btn2 btn btn-default btn-sm" type="button">등록</button>
								</div>
							</div>
						</form>
						<!-- 끝  -->
						<c:forEach var="reply" items="${comment.replies }">
							<!-- 대댓글 시작  -->
							<div class="row">
								<div class="col-sm-12">
									<div class="blog_colordiv2">
										<div class="row">
											<div class="col-sm-1 text-right">┗</div>
											<div class="col-sm-10">
												<div class="row">
													<div class="col-sm-12">
														<img class="blog-row-2-profile-img" src="/link/resources/images/${reply.BLOGMAINIMG }" alt="" />
														<span></span>
														<span>${reply.NICKNAME }</span>
													</div>
												</div>
												<div class="row" style="margin-top: 10px; margin-bottom: 5px;">
													<div class="col-sm-12">${reply.CONTENTS }</div>
												</div>
												<div class="row">
													<div class="col-sm-12">
														<fmt:formatDate value="${reply.CREATEDATE }" pattern="yyyy-MM-dd HH:mm:ss" />
													</div>
												</div>
												<div class="row" style="margin-top: 10px;">
													<div class="col-sm-12 text-right">
														<button class="btn btn-default">
															<span class="glyphicon glyphicon-heart"></span>
															&nbsp;${reply.LIKES }
														</button>
													</div>
												</div>
											</div>
										</div>

									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-12">
									<hr style="border: 0.5px solid lightgray;" />
								</div>
							</div>
						</c:forEach>
						<!-- 대댓글 끝  -->
					</c:forEach>
					<!-- 댓글 끝 -->
				</div>
			</div>
		</div>
	</div>
</div>