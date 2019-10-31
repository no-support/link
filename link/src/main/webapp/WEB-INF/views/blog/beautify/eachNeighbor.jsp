<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			<%@include file="../../common/blog/beautyleftnav.jsp"%>
			<!-- 왼쪽 navi 끝 -->
			<div class="col-sm-10 blog_manage_right_row">
				<div class="row">
					<div class="col-sm-4">
						<span class="blog_manage_title">서로이웃 맺기</span>
					</div>
					<div class="col-sm-12">
						<hr class="blog_manage_hr1" />
					</div>
				</div>
				<div class="row blog_manage_right_row2">
					<div class="col-sm-12">
						<ul class="nav nav-tabs blog_nav_tabs">
							<li role="presentation" class="active"><a href="#">받은신청</a></li>
							<li role="presentation"><a href="#">보낸신청</a></li>
							<li role="presentation"><a href="#">안내메시지</a></li>
						</ul>
					</div>
					<div class="col-sm-12">
						
							<table class="table blog_table">
								<colgroup>
									<col width="25%">
									<col width="35%">
									<col width="20%">
									<col width="20%">
								</colgroup>
								<thead>
									<tr>
										<th><input type="checkbox" id="blog_whoApply" name=""></input>신청한 사람</th>
										<th class="text-center">메시지</th>
										<th class="text-center">신청일</th>
										<th class="text-center">관리</th>
									</tr>
								</thead>
								<tbody>
								<form id="neighborForm" action="eachNeighbor.do" method="post">
									<input type="hidden" name="reply" id="hiddenInput1" />
									<c:forEach var="neighbor" items="${neighbors }">
										<tr>
											<td>
												<input type="checkbox" name="neighborBlogNo" value="${neighbor.BLOGNO }"/><a href="detail.do?blogNo=${neighbor.BLOGNO }">${neighbor.NICKNAME }(${neighbor.USERID  })</a>
											</td>
											<td>${neighbor.MESSAGE}</td>
											<td class="text-center">
												<fmt:formatDate value="${neighbor.CREATEDATE}" pattern="yyyy-mm-dd HH:mm" />
											</td>
											<td class="text-center">
												<button id="singo" type="button" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-exclamation-sign"></span>신고</button>
											</td>
										</tr>
									</c:forEach>
									</form>
									<tr class="blogselectAllTd">
										<td class="blogselectAllTd">
											<span class="blog_selectAll_span"><input type="checkbox" id="blog_select_all"></input>전체선택</span>
											<button class="btn btn-default btn-sm blog_neigh_accept_btn">수락</button>
											<button class="btn btn-default btn-sm blog_neigh_deny_btn">거절</button>
										</td>
									</tr>
								</tbody>
							</table>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(function() {
			$('#singo').click(function(){
				var result = confirm('신고하시겠습니까?');
				if(result){
					alert('신고되었습니다.');
				}
			});
			$('.blog_neigh_accept_btn').click(function(){
				var isChecked = false;
				$.each($('tbody input[type=checkbox]'), function(index,item){
					console.log(item);
					if($(this).prop('checked') == true){
						isChecked = true;
						console.log('each 안: '+isChecked);
					}
				});
				
				if(isChecked == true){
					$('#hiddenInput1').val('accept');
					neighborForm.submit();
				} else{
					alert('수락할 항목을 선택해주세요');
					return false;
				}
			});
			
			$('.blog_neigh_deny_btn').click(function(){
				var isChecked = false;
				$.each($('tbody input[type=checkbox]'), function(){
					if($(this).prop('checked') == true){
						isChecked = true;
					}
				});
				if(isChecked == true){
					$('#hiddenInput1').val('deny');
					neighborForm.submit();
				} else{
					alert('거절할 항목을 선택해주세요');
					return false;
				}
				
			});
			
			$('#blog_select_all').change(function() {
				$('table input[type=checkbox]').prop('checked', $(this).prop('checked'));
			});
			$('#blog_whoApply').change(function() {
				$('table input[type=checkbox]').prop('checked', $(this).prop('checked'));
			});

			$('.blog_beuaty_submit_button').click(function() {
				if ($('.blog_manage_input').val() == "") {
					alert('블로그명은 필수입력 사항입니다.');
					return false;
				}
				if ($('#blogNickName').val() == "") {
					alert('별명을 입력해야 합니다.');
					return false;
				}
				if ($('#blogDescription').val() == "") {
					alert('소개글을 적어주세요.');
					return false;
				}
				var result = confirm('적용하시겠습니까?');
				if (result) {
					$('#updateBlogForm').submit();
				}
			})
			function readURL(input) {
				if (input.files && input.files[0]) {
					var reader = new FileReader();

					reader.onload = function(e) {
						$('#blogImg').attr('src', e.target.result);
					}

					reader.readAsDataURL(input.files[0]);
				}
			}

			$("#mainImg").change(function() {
				readURL(this);
			});
		})
	</script>
</body>
</html>

