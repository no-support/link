<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Bootstrap</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/link/resources/css/blog/blog.css">
<link rel="stylesheet" href="/link/resources/css/main.css">
<script src="/link/resources/js/returnUrl.js"></script>
<link href="https://fonts.googleapis.com/css?family=Jura|Marck+Script|Russo+One|Sacramento&display=swap" rel="stylesheet">
<style>
.pagination>li>a, .pagination>li>span {
		position: relative;
		float: left;
		padding: 6px 12px;
		margin-left: -1px;
		line-height: 1.42857143;
		color: black !important;
		text-decoration: none;
		background-color: #fff !important;
		border: 0.5px solid lightgray !important;
}

.pagination>li>a:hover, .pagination>li>span:hover, .pagination>li>a:focus, .pagination>li>span:focus {
		z-index: 2;
		color: black !important;
		background-color: #fff !important;
		border-color: lightgray !important;
}
</style>
</head>

<body>
	<%@include file="../common/nav.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-sm-9">
				<div class="row blog-row-1">
					<div class="col-sm-12">
						<span class="blog-hot-topic">Hot topics</span>
					</div>
					<c:forEach var="eblog" items="${blogsByVisit }">
						<a href="detail.do?blogNo=${eblog.no }">
							<div class="col-sm-4 blog-row-2 text-center">
								<img src="/link/resources/images/${eblog.mainImg }" alt="">
								<div class="row text-center">
									<div class="col-sm-6 blog-hottopic-info" style="height: 74px;">${eblog.title }</div>
								</div>
							</div>
						</a>
					</c:forEach>
				</div>
				<div class="row blog-main-row-2">
					<c:if test="${not empty LOGIN_USER }">
						<div class="col-sm-12">
							<div class="row">
								<div class="col-sm-9 blog-neighbor-col">
									<span class="blog-neighbor">이웃새글</span>
								</div>
								<div class="col-sm-3">
									<div class="form-group">
										<select class="form-control" name="" id="">
											<option value=""selected;>전체이웃</option>
											<option value="">새 그룹</option>
										</select>
									</div>
								</div>
							</div>
						</div>
					</c:if>
					<div class="blog-neighbor-div">
						<!--     이웃 새글 시작    -->
						<c:if test="${not empty LOGIN_USER }">
							<c:choose>
								<c:when test="${isHaveBlog eq 'yes' }">
									<c:if test="${not empty blogList}">
										<div class="blog_neighbor_list_main_1">
											<c:forEach var="blog" items="${blogList}">
												<div class="blog-hrdiv">
													<hr class="blog-row-hr-2" />
												</div>
												<div class="row blog-main-col-2-1 blog-main-col-2-1-1">
													<div class="col-sm-9">
														<div class="row">
															<div class="col-sm-1 blog-neighbor-col1">
																<img class="blog-row-2-profile-img" src="/link/resources/images/${blog.BLOGMAINIMG }" alt="">
															</div>
															<div class="col-sm-2 blog-neighbor-col2">
																<div class="row">
																	<div class="col-sm-12">
																		<a href="">${blog.NICKNAME }</a>
																	</div>
																	<div class="col-sm-12">${blog.howLongDate}</div>
																</div>
															</div>
														</div>
														<a href="/link/blog/board.do?blogNo=${blog.NO }&categoryNo=${blog.CATEGORYNO }&boardNo=${blog.BOARDNO}">
															<div class="row blog-neighbor-box">
																<div class="col-sm-12">
																	<p class="blog-neighbor-title">${blog.TITLE }</p>
																</div>
																<div class="col-sm-12 blog-neighbor-contents3">
																	<div class="blog-neighbor-contents">${blog.CONTENTS }</div>
																</div>
															</div>
														</a>
													</div>
													<!--  -->
													<div class="col-sm-3">
														<a href="/link/blog/board.do?blogNo=${blog.NO }&categoryNo=${blog.CATEGORYNO }&boardNo=${blog.BOARDNO}"> <img style="max-width: 100%;" class="blog-neighbor-img "
															src="/link/resources/images/userblogimgs/${blog.BOARDMAINIMG }" alt=""
														>
														</a>
													</div>

												</div>
											</c:forEach>
											<div class="blog-hrdiv">
												<hr class="blog-row-hr-2" />
											</div>
										</div>
										<div class="row blog_pagination_row">
											<div class="col-sm-12 text-center">
												<ul class="pagination" id="pagination-box">
													<c:choose>
														<c:when test="${pagination.first }">
															<li class="disabled"><span>&laquo;</span></li>
														</c:when>
														<c:otherwise>
															<li><a href="" data-pno="${pagination.page-1 }"><span>&laquo;</span></a></li>
														</c:otherwise>
													</c:choose>

													<c:forEach var="num" begin="${pagination.begin }" end="${pagination.end }">
														<c:choose>
															<c:when test="${num eq pagination.page }">
																<li><a class="blog_detail_page_1_selected" data-pno="${num }">${num }</a></li>
															</c:when>
															<c:otherwise>
																<li><a href="#" data-pno="${num }">${num }</a></li>
															</c:otherwise>
														</c:choose>
													</c:forEach>

													<c:choose>
														<c:when test="${pagination.last }">
															<li class="disabled"><span>&raquo;</span></li>
														</c:when>
														<c:otherwise>
															<li><a href="" data-pno="${pagination.page+1 }"><span>&raquo;</span></a></li>
														</c:otherwise>
													</c:choose>
												</ul>
											</div>
										</div>
									</c:if>

									<c:if test="${empty blogList }">
										<div class="blog-hrdiv">
											<hr class="blog-row-hr-2" />
										</div>
										<div class="row blog-main-col-2-1 blog-main-col-2-1-1">
											<div class="col-sm-12 text-center">
												<p>업데이트된 이웃의 새 글이 없습니다.</p>
												<p>아래 주제별 블로거 추천을 통해 관심 주제의 블로그 이웃을 만들어보세요.</p>
											</div>
										</div>
										<div class="blog-hrdiv">
											<hr class="blog-row-hr-2" />
										</div>
									</c:if>
								</c:when>
								<c:otherwise>
									<!--     이웃 새글 끝     -->
									<div class="blog-hrdiv">
										<hr class="blog-row-hr-2" />
									</div>
									<div class="row blog-main-col-2-1 blog-main-col-2-1-1">
										<div class="col-sm-12 text-center">
											<p>아직 블로그가 생성되지 않았습니다.</p>
											<p>블로그를 생성해보세요!</p>
										</div>
									</div>
									<!--     이웃 새글 끝  -->
								</c:otherwise>
							</c:choose>
						</c:if>
						<c:if test="${empty LOGIN_USER }">
							<div class="blog-hrdiv">
								<hr class="blog-row-hr-2" />
							</div>
							<div class="row blog-main-col-2-1 blog-main-col-2-1-1">
								<div class="col-sm-12 text-center">
									<p>로그아웃 상태입니다.</p>
									<p>로그인하여 이웃 새글을 확인해보세요.</p>
								</div>
							</div>
							<div class="blog-hrdiv">
								<hr class="blog-row-hr-2" />
							</div>
						</c:if>
						<!--     이웃 새글 끝     -->
					</div>
					<div class="blog-hrdiv">
						<div class="page-header">
							<span style="font-size:20px;">이런 블로그는 어떠세요?</span>
						</div>
					</div>
					<div class="blog-hrdiv">
						<hr class="blog-row-hr-3" />
					</div>
					<div class="row blog-hr-row">
						<div class="col-sm-12 blog_topics">
							<span data-topic="all" id="all" class="blog_topic_selected">전체</span>
							<span data-topic="movie" class="">영화</span>
							<span data-topic="literature" class="">문학</span>
							<span data-topic="travel" class="">여행</span>
							<span data-topic="game" class="">게임</span>
							<span data-topic="programming" class="">프로그래밍</span>
							<span data-topic="streamming" class="">스트리밍</span>
						</div>
					</div>
					<div class="blog-hrdiv">
						<hr class="blog-row-hr-4" />
					</div>

					<div class="blog3topic">
						<c:forEach var="blog3" items="${blogsList }">
							<!--                  추천 새글 시작  -->
							<div class="row blog-main-col-2-1">
								<div class="col-sm-9">
									<div class="row">
										<div class="col-sm-1 blog-neighbor-col1">
											<img class="blog-row-2-profile-img" src="/link/resources/images/${blog3.BLOGMAINIMG }" alt="">
										</div>
										<div class="col-sm-2 blog-neighbor-col2">
											<div class="row">
												<div class="col-sm-12">
													<a href="board.do?blogNo=${blog3.NO }&categoryNo=${blog3.CATEGORYNO}&boardNo=${blog3.BOARDNO}">${blog3.NICKNAME }</a>
												</div>
												<div class="col-sm-12">${blog3.howLongDate }</div>
											</div>
										</div>
										<c:if test="${blog3.isNeighbor eq 'Y' }">
											<div class="col-sm-2 col-sm-offset-7">
												<div class="blog-addneighbordiv text-center">이웃</div>
											</div>
										</c:if>

										<c:if test="${blog3.isNeighbor eq 'N' }">
											<div class="col-sm-2 col-sm-offset-7">
												<span class="blog-addneighbor">
													<a href="addNeighbor.do?blogNo=${blog3.NO }">+이웃추가</a>
												</span>
											</div>
										</c:if>

									</div>
									<div class="row blog-neighbor-box">
										<a href="board.do?blogNo=${blog3.NO }&categoryNo=${blog3.CATEGORYNO}&boardNo=${blog3.BOARDNO}">
											<div class="col-sm-12">
												<p class="blog-neighbor-title">${blog3.TITLE }</p>
											</div>
											<div class="col-sm-12">
												<div class="blog-neighbor-contents ">${blog3.CONTENTS }</div>
											</div>
										</a>
									</div>
								</div>
								<div class="col-sm-3">
									<a href="board.do?blogNo=${blog3.NO }&categoryNo=${blog3.CATEGORYNO}&boardNo=${blog3.BOARDNO}"><img class="blog-neighbor-img " src="/link/resources/images/userblogimgs/${blog3.BOARDMAINIMG }" alt=""></a>
								</div>
							</div>
							<div class="blog-hrdiv">
								<hr class="blog-row-hr-2" />
							</div>
							<!--                  추천 새글 끝  -->
						</c:forEach>
					</div>
					<div class="blog3topic-2">
						<div class="row">
							<div class="col-sm-12 text-center">
								<nav>
									<ul class="pagination">
										<li><a href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a></li>
										<c:forEach begin="1" end="${totalBlocks }" var="status">
											<li><a id="${status }" class="blog_pagenation_num ${status eq pno? 'blog_detail_page_1_selected' : '' }" href="">${status }</a></li>
										</c:forEach>
										<li><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span></a></li>
									</ul>
								</nav>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--오른쪽 네브 시작-->
			<c:if test="${not empty LOGIN_USER }">
				<div class="col-sm-3 blog-col-3">
					<div class="row">
						<div class="col-sm-3 text-center">
							<img class="blog-row-2-profile-img" src="/link/resources/images/${LOGIN_USER.img }" alt="">
						</div>
						<div class="col-sm-7 blog-right-col-1">
							<div class="row" style="margin-bottom: 40px;">
								<div class="col-sm-6">
									<span>
										<a style="font-size: 15px; position: relative; top: 5px;" href="">${LOGIN_USER.id }</a>
									</span>
								</div>
								<div class="col-sm-6 text-right">
									<span style="position: relative; top: 5px;" class="blog-rigbt-col-logout">
										<a class="blognav_logout_btn" href="/link/logout.do">로그아웃</a>
									</span>
								</div>

							</div>
							<c:if test="${isHaveBlog eq 'yes' }">
								<div class="row">
									<span class="blog-right-col-info">총 ${myblog.visits }명 방문</span>
								</div>
							</c:if>
						</div>
					</div>
					<c:choose>
						<c:when test="${isHaveBlog eq 'no' }">
							<div class="row"">
								<div class="col-sm-12 text-center">
									<img style="width: 290.511px;" src="/link/resources/images/bloghome1.jpg" alt="" />
								</div>
							</div>
							<a id="makeBlogButton" href="/link/blog/makeblog.do">
								<div class="row blog-col-4" style="padding: 20px !important;">
									<div style="font-size: 15px; font-weight: bold; color: white;" class="col-sm-12 text-center">블로그 생성하러 가기</div>
								</div>
							</a>
						</c:when>
						<c:otherwise>
							<div class="row blog-col-4">
								<a id="goMyBlogButton" href="/link/blog/mydetail.do">
									<div class="col-sm-6 text-center">내 블로그</div>
								</a> <a id="writeBlogBoard" href="mywrite.do">
									<div class="col-sm-6 text-center">
										<span class="glyphicon glyphicon-pencil"></span>
										글쓰기
									</div>
								</a>
							</div>
							<div class="row blog-col-5 text-center">
								<div class="col-sm-6 blog-col-5-selected">
									<a href="main.do">내 소식</a>
								</div>
								<div class="col-sm-6" id="neighborLists">이웃 목록</div>
							</div>

							<div class="row blog-col-6 text-center" id="myInfoform">
								<div class="col-sm-12">
									<c:if test="${not empty requestList }">
										<c:forEach var="request" items="${requestList}">
											<div class="row blog-alarm">
												<div class="col-sm-12">
													<img class="blog-row-3-profile-img" src="/link/resources/images/${request.BLOGMAINIMG }" alt=""> <a href="eachNeighbor.do">${request.NICKNAME }님이 서로이웃을 신청했습니다.</a> <a href=""><span class="glyphicon glyphicon-remove"></span></a>
												</div>
											</div>
										</c:forEach>
									</c:if>
									<c:if test="${empty requestList }">
										<div class="row blog-alarm" style="margin-top: 10px;">
											<div class="col-sm-12">새로운 소식이 없습니다.</div>
										</div>
									</c:if>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</c:if>
			<c:if test="${empty LOGIN_USER }">
				<div class="col-sm-3 blog-col-3" style="padding-top: 0px;">
					<div class="row">
						<div class="col-sm-12 text-center">
							<img style="width: 290.511px;" src="/link/resources/images/bloghome1.jpg" alt="" />
						</div>
					</div>
					<a class="blogmain_login" style="color: white; font-size: 15px;" href="/link/loginform.do">
						<div class="row blog-col-4 text-center" style="padding: 15px;">
							<span>
								<strong>Link</strong>로그인
							</span>
						</div>
					</a>
				</div>
			</c:if>
			<!--오른쪽 네브 끝-->
		</div>
	</div>
	<%@ include file="../common/bottom.jsp"%>
	<script>
		$(function() {
			$('.blog-neighbor-contents3 img').hide();
			$('.blog-neighbor-contents img').hide();
			$('#1').addClass('blog_detail_page_1_selected');

			// 캐러샐
			$('.carousel').carousel({
				interval : false
			})

			$('.carousel-inner .item:first').addClass('active');

			// 나의이웃 페이지네이션
			$("body").on(
					'click',
					'#pagination-box a',
					function(event) {
						event.preventDefault();
						$(this).addClass('blog_detail_page_1_selected').parent().siblings().find('a').removeClass('blog_detail_page_1_selected');

						var pageNo = $(this).attr("data-pno");

						$.ajax({
							type : "GET",
							url : "neighborAjax.do",
							data : {
								pageNo : pageNo
							},
							success : function(result) {
								$('.blog_neighbor_list_main_1').empty();
								$('.blog_pagination_row').empty();

								$.each(result.blogLists, function(index, blog) {
									var row = ' <div class="blog-hrdiv">';
									row += '		<hr class="blog-row-hr-2" />';
									row += '	</div>';
									row += '	<div class="row blog-main-col-2-1 blog-main-col-2-1-1">';
									row += '		<div class="col-sm-9">';
									row += '			<div class="row">';
									row += '				<div class="col-sm-1 blog-neighbor-col1">';
									row += '					<img class="blog-row-2-profile-img" src="/link/resources/images/'+blog.BLOGMAINIMG+'" alt="">';
									row += '				</div>';
									row += '				<div class="col-sm-2 blog-neighbor-col2">';
									row += '					<div class="row">';
									row += '						<div class="col-sm-12">';
									row += '							<a href="">' + blog.NICKNAME + '</a>';
									row += '						</div>';
									row += '						<div class="col-sm-12">' + blog.howLongDate + '</div>';
									row += '					</div>';
									row += '				</div>';
									row += '			</div>';
									row += '			<a href="/link/blog/board.do?blogNo=' + blog.NO + '&categoryNo=' + blog.CATEGORYNO + '&boardNo=' + blog.BOARDNO + '">';
									row += '				<div class="row blog-neighbor-box">';
									row += '					<div class="col-sm-12">';
									row += '						<p class="blog-neighbor-title">' + blog.TITLE + '</p>';
									row += '					</div>';
									row += '					<div class="col-sm-12 blog-neighbor-contents3">';
									row += '						<div class="blog-neighbor-contents">' + blog.CONTENTS + '</div>';
									row += '					</div>';
									row += '				</div>';
									row += '			</a>';
									row += '		</div>';
									row += '	<div class="col-sm-3">';
									row += '		<a href="/link/blog/board.do?blogNo=' + blog.BLOGNO + '&categoryNo=' + blog.CATEGORYNO + '&boardNo=' + blog.BOARDNO
											+ '"> <img style="max-width: 100%;" class="blog-neighbor-img" src="/link/resources/images/userblogimgs/' + blog.BOARDMAINIMG + '">';
									row += '		</a>';
									row += '	</div>';
									row += '</div>';

									$('.blog_neighbor_list_main_1').append(row);
									$('.blog-neighbor-contents3 img').hide();
									$('.blog-neighbor-contents img').hide();
								});

								var pagination = result.pagination;

								var row2 = '';
								row2 += '<div class="col-sm-12 text-center">';
								row2 += '	<ul class="pagination" id="pagination-box">';

								if (pagination.first) {
									row2 += '<li class="disabled"><span>&laquo;</span></li>';
								} else {
									row2 += '<li><a href="" data-pno="' + (pagination.page - 1) + '"><span>&laquo;</span></a></li>';
								}
								for (var i = pagination.begin; i <= pagination.end; i++) {
									if (pagination.page == i) {
										row2 += '<li><a class="blog_detail_page_1_selected" data-pno="'+i+'">' + i + '</a></li>';
									} else {
										row2 += '<li><a href="#" data-pno="'+i+'">' + i + '</a></li>';
									}
								}
								if (pagination.last) {
									row2 += '<li class="disabled"><span>&raquo;</span></li>';
								} else {
									row2 += '<li><a href="" data-pno="' + (pagination.page + 1) + '"><span>&raquo;</span></a></li>';
								}
								row2 += '</ul>';
								row2 += '</div>';

								$('.blog_pagination_row').append(row2);

							}
						});
					});

			// 추천이웃 페이지네이션
			$('body').on(
					'click',
					'.blog_pagenation_num',
					function() {
						var blogType = $('.blog_topic_selected').attr('data-topic');
						var pno = $(this).text();
						$(this).addClass('blog_detail_page_1_selected').parent().siblings().find('a').removeClass('blog_detail_page_1_selected');
						$.ajax({
							type : "GET",
							url : "topicAjax.do",
							data : {
								blogType : blogType,
								pno : pno
							},
							success : function(result) {
								$('.blog3topic').empty();
								$.each(result.blogsList, function(index, blog) {
									var row = "";
									row += '<div class="row blog-main-col-2-1">';
									row += '	<div class="col-sm-9">';
									row += '		<div class="row">';
									row += '			<div class="col-sm-1 blog-neighbor-col1">';
									row += '				<img class="blog-row-2-profile-img" src="/link/resources/images/'+blog.BLOGMAINIMG+'" alt="">';
									row += '			</div>';
									row += '			<div class="col-sm-2 blog-neighbor-col2">';
									row += '				<div class="row">';
									row += '					<div class="col-sm-12">';
									row += '						<a href="">' + blog.NICKNAME + '</a>';
									row += '					</div>';
									row += '					<div class="col-sm-12">' + blog.howLongDate + '</div>';
									row += '				</div>';
									row += '			</div>';
									row += '			<c:if test="${isHaveBlog eq \'yes\' }">'
									row += '				<div class="col-sm-2 col-sm-offset-7">';
									row += '					<span class="blog-addneighbor"><a href="">+이웃추가</a></span>';
									row += '				</div>';
									row += '			</c:if>';
									row += '		</div>';
									row += '		<div class="row blog-neighbor-box">';
									row += '			<a href="board.do?blogNo=' + blog.NO + '&categoryNo=' + blog.CATEGORYNO + '&boardNo=' + blog.BOARDNO + '">';
									row += '		<div class="col-sm-12">';
									row += '<p class="blog-neighbor-title">' + blog.TITLE + '</p>';
									row += '</div>';
									row += '<div class="col-sm-12">';
									row += '<div class="blog-neighbor-contents ">' + blog.CONTENTS + '</div>';
									row += '</div>';
									row += '</a>';
									row += '</div>';
									row += '</div>';
									row += '<div class="col-sm-3">';
									row += '<a href="board.do?blogNo=' + blog.NO + '&categoryNo=' + blog.CATEGORYNO + '&boardNo=' + blog.BOARDNO
											+ '"><img class="blog-neighbor-img" src="/link/resources/images/userblogimgs/'+blog.BOARDMAINIMG+'" alt=""></a>';
									row += '</div>';
									row += '</div>';
									row += '<div class="blog-hrdiv">';
									row += '<hr class="blog-row-hr-2" />';
									row += '</div>';

									$('.blog3topic').append(row);
									$('.blog-neighbor-contents3 img').hide();
									$('.blog-neighbor-contents img').hide();

								});
							}
						})
						return false;
					});

			// 이웃목록 ajax
			$('#neighborLists').click(function() {
				$(this).addClass('blog-col-5-selected').siblings().removeClass('blog-col-5-selected');
				$.ajax({
					type : "GET",
					url : "getNeighborsMain.do",
					success : function(result) {
						$('#myInfoform').empty();
						if (0 == result.length) {
							var row = '';
							row += '<div class="col-sm-12 text-center" style="padding:5px;">';
							row += '	<p>이웃 목록이 없습니다.</p>';
							row += '</div>';
							$('#myInfoform').append(row);
						} else {
							$.each(result, function(index, neighBor) {
								var row = '';
								row += '<div class="col-sm-6" style="padding:5px;">';
								row += '	<div class="text-left">';
								row += '		<a href="detail.do?blogNo=' + neighBor.NO + '">';
								row += '			<img class="blog-row-33-profile-img" src="/link/resources/images/'+neighBor.MAINIMG+'" alt="">' + neighBor.NICKNAME;
								row += '		</a>';
								row += '	</div>';
								row += '</div>';
								$('#myInfoform').append(row);
							});
						}
					}
				})
			});

			// 토픽별 ajax
			$('.blog_topics span').click(
					function() {
						$(this).addClass('blog_topic_selected').siblings().removeClass('blog_topic_selected');
						var blogType = $(this).attr('data-topic');
						$.ajax({
							type : "GET",
							url : "topicAjax.do",
							data : {
								blogType : blogType,
								pno : 1
							},
							dataType : "json",
							success : function(data) {
								$('.blog3topic').empty();
								$('.blog3topic-2').empty();
								var length = data.blogsList.length;
								console.log(length);
								if (length == 0) {
									var row = "";
									row += '<div class="row"><div class="col-sm-12 text-center" style="padding:150px; "><p style="font-size:15px;">등록된 글이 없습니다.</p></div></div>';
									$('.blog3topic').append(row);
									var row2 = "";
									$('.blog3topic-2').append(row2);
								} else {
									$.each(data.blogsList, function(index, blog) {
										var row = "";
										row += '<div class="row blog-main-col-2-1">';
										row += '	<div class="col-sm-9">';
										row += '		<div class="row">';
										row += '			<div class="col-sm-1 blog-neighbor-col1">';
										row += '				<img class="blog-row-2-profile-img" src="/link/resources/images/'+blog.BLOGMAINIMG+'" alt="">';
										row += '			</div>';
										row += '			<div class="col-sm-2 blog-neighbor-col2">';
										row += '				<div class="row">';
										row += '					<div class="col-sm-12">';
										row += '						<a href="">' + blog.NICKNAME + '</a>';
										row += '					</div>';
										row += '					<div class="col-sm-12">' + blog.howLongDate + '</div>';
										row += '				</div>';
										row += '			</div>';
										row += '			<c:if test="${isHaveBlog eq \'yes\' }">'
										row += '				<div class="col-sm-2 col-sm-offset-7">';
										row += '					<span class="blog-addneighbor"><a href="">+이웃추가</a></span>';
										row += '				</div>';
										row += '			</c:if>';
										row += '		</div>';
										row += '		<div class="row blog-neighbor-box">';
										row += '			<a href="board.do?blogNo=' + blog.NO + '&categoryNo=' + blog.CATEGORYNO + '&boardNo=' + blog.BOARDNO + '">';
										row += '		<div class="col-sm-12">';
										row += '<p class="blog-neighbor-title">' + blog.TITLE + '</p>';
										row += '</div>';
										row += '<div class="col-sm-12">';
										row += '<div class="blog-neighbor-contents ">' + blog.CONTENTS + '</div>';
										row += '</div>';
										row += '</a>';
										row += '</div>';
										row += '</div>';
										row += '<div class="col-sm-3">';
										row += '<a href="board.do?blogNo=' + blog.NO + '&categoryNo=' + blog.CATEGORYNO + '&boardNo=' + blog.BOARDNO
												+ '"><img class="blog-neighbor-img" src="/link/resources/images/userblogimgs/'+blog.BOARDMAINIMG+'" alt=""></a>';
										row += '</div>';
										row += '</div>';
										row += '<div class="blog-hrdiv">';
										row += '<hr class="blog-row-hr-2" />';
										row += '</div>';

										$('.blog3topic').append(row);
										$('.blog-neighbor-contents3 img').hide();
										$('.blog-neighbor-contents img').hide();

									});
									var totalBlocks = data.totalBlocks;

									var row2 = '';
									row2 += '<div class="row">';
									row2 += '	<div class="col-sm-12 text-center">';
									row2 += '		<nav>';
									row2 += '			<ul class="pagination">';
									row2 += '				<li><a href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a></li>';
									for (var i = 1; i <= totalBlocks; i++) {
										if (i == data.pno) {
											row2 += '<li><a href="" id="'+i+'" class="blog_pagenation_num blog_detail_page_1_selected">' + i + '</a></li>';
										} else {
											row2 += '<li><a href="" id="'+i+'" class="blog_pagenation_num">' + i + '</a></li>';
										}
									}
									row2 += '				<li><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span></a></li>';
									row2 += '			</ul>';
									row2 += '		</nav>';
									row2 += '	</div>';
									row2 += '</div>';

									$('.blog3topic-2').append(row2);
								}
							}
						})
					})
		})
	</script>
</body>
</html>
