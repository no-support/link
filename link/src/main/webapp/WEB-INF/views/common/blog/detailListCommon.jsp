<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="row">
	<div class="col-sm-12 text-center">
		<nav>
			<ul class="pagination">
				<li><a href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
				<c:forEach var="status" begin="1" end="${totalCount10 }">
					<li><a id="${status }_2" class="blog_page_bum2 ${status eq pno10? 'blog_detail_page_1_selected' : '' }" href="">${status }</a></li>
				</c:forEach>
				<li><a href="" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</ul>
		</nav>
	</div>
</div>