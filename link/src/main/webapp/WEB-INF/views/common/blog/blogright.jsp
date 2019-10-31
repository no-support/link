<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="col-sm-12 blog_detail_right_row" style="">
	<div class="col-sm-4">
		<strong style="color: #2f3030;">${category.title }</strong>
		<c:if test="${not empty blogCount }">
			 ${blogCount }개의 글
		</c:if>
	</div>
	<div class="col-sm-8 text-right">
		<span id="blog_right_open">목록 닫기</span>
	</div>
	<div class="row" id="blog_row1">
	<div class="col-sm-12">
		<div class="row">
			<div class="col-sm-12 blog_detail_right_col_1">
				<div class="col-sm-3">
					<span>글 제목</span>
				</div>
				<div class="col-sm-9 text-right">작성일</div>
			<div class="col-sm-12 blog_detail_hr_1">
				<hr class="blog_detail_hr_1">
			</div>
			</div>
		</div>
		<!--   글 제목 시작-->
		<div id="blog_board_title1" data-blogNo = "${blog.no }" data-categoryNo = "${category.no }">
		<c:choose>
			<c:when test="${empty blogboardsByRange}">
				<div class="row">
					<div class="col-sm-12 text-center" style="margin-top:20px;">
						<p>아직 작성된 글이 없습니다.</p>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<c:forEach var="board" items="${blogboardsByRange }">
				<div class="row">
					<div class="col-sm-12 blog_detail_right_row_1">
						<div class="col-sm-9">
							<span id="" style="" class="${board.no eq param.boardNo? 'blog_board_selected' : '' }">
							<a id="blog_board_list5" href="/link/blog/board.do?boardNo=${board.no }&blogNo=${blog.no}&categoryNo=${category.no}&pno=${pno}">${board.title }</a></span>
						</div>
						<div class="col-sm-3 text-right">
							<span class="blog_detail_board_create">${board.createDate }</span>
						</div>
						<div class="col-sm-12 blog_detail-hr-div">
							<hr class="blog_detail_hr_2" />
						</div>
					</div>
				</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		</div>
		<!--                   글 제목 끝-->

		<!--                    페이지네이션 시작-->
		<c:choose>
			<c:when test="${totalCount eq 0 }">
			</c:when>
			<c:otherwise>
				<div class="row">
					<div class="col-sm-12 text-center">
						<nav>
							<ul class="pagination">
								<li><a href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a></li>
								<c:forEach var="status" begin="1" end="${totalCount }">
									<li ><a id="${status }" class="blog_page_bum ${status eq pno? 'blog_detail_page_1_selected' : '' }" href="">${status }</a></li>
								</c:forEach>
								<li><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								</a></li>
							</ul>
						</nav>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
		<!-- 페이지네이션 끝-->
		
	</div>
	</div>
</div>
<script>
	$(function() {
		$('#blog_right_open').click(function() {
			$('#blog_row1').toggle();
			var status = $(this).html();
			if(status == '목록 열기'){
				$(this).html('목록 닫기');
			} else{
				$(this).html('목록 열기');
			}
		})
		
		// 페이지네이션 버튼 클릭시
		$('.blog_page_bum').click(event,function(){
			event.preventDefault();
			var page = $(this).text();
			var blogNo = $('#blog_board_title1').attr('data-blogNo');
			var categoryNo = $('#blog_board_title1').attr('data-categoryNo');
			
			$.ajax({
				type:"GET",
				url:"paginationAjax.do",
				dataType: 'json',
				data :{pno: page, categoryNo: categoryNo},
				success: function(result){
					console.log(result);
					$('#'+result.pno).addClass('blog_detail_page_1_selected').parent().siblings().find('a').removeClass('blog_detail_page_1_selected');
					$('#blog_board_title1').empty();
					$.each(result.blogboardsByRange, function(index,board){
						var row = '';
						row += '<div class="row" data-blogNo = "'+blogNo+'"  data-categoryNo = "'+categoryNo+'">';
						row += '	<div class="col-sm-12 blog_detail_right_row_1">';
						row += '		<div class="col-sm-9">';
						row += '			<span><a href="/link/blog/board.do?boardNo='+board.no+'&blogNo='+blogNo+'&categoryNo='+categoryNo+'&pno='+result.pno+'">'+board.title+'</a></span>';
						row += '		</div>';
						row += '		<div class="col-sm-3 text-right">';
						row += '			<span class="blog_detail_board_create">'+board.createDate+'</span>';
						row += '		</div>';
						row += '		<div class="col-sm-12 blog_detail-hr-div">';
						row += '			<hr class="blog_detail_hr_2" />';
						row += '		</div>';
						row += '	</div>';
						$('#blog_board_title1').append(row);
					})
				}
			})
			return false;
		});
	})
</script>




