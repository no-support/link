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
			<%@include file="../../common/blog/blogleft.jsp"%>
			<!--좌측 nav 끝-->
			<!--                    우측 게시판 시작-->
			<%@include file="../../common/blog/blogLayout.jsp"%>
				<!-- 우측 게시판 글쓰기 시작-->
				<div class="col-sm-12 blog_detail_right_row1">
					<div class="row">
						<form id="update-form" action="boardUpdate.do" method="post" enctype="multipart/form-data">
							<input type="hidden" name="blogNo" value="${blog.no }"></input>
							 <input type="hidden" name="categoryNo" value="${category.no }"></input>
							 <input type="hidden" name="boardNo" value="${param.boardNo }"></input>
							<div class="col-sm-12">
								<div class="form-group">
									<div class="page-header">
										<h2>수정하기</h2>
									</div>
									<label for="">제목</label><input id="blogboard_title" name="title" style="width: 723px;" type="text" class="form-control blog_write_title" value="${blogBoard.title }" />
								</div>
								<div class="form-group">
									<label for="exampleInputFile">메인 이미지 등록</label><input type="file" id="file" name="upfile">
									<p class="help-block">메인에 표시할 이미지를 등록해 주세요.</p>
								</div>
								<div class="form-group">
									<label for="">카테고리</label>
									<div class="row">
										<div class="col-sm-3">
											<select name="categoryNo" id="" class="form-control">
												<c:forEach var="subCat" items="${subCategories}">
													<option value="${subCat.no }" disabled>${subCat.title }</option>
													<c:forEach var="cat" items="${subCat.blogCategory}">
														<option value="${cat.no }" ${blogBoard.categoryNo eq cat.no ? 'selected' : '' }>&nbsp;┗ ${cat.title }</option>
													</c:forEach>
												</c:forEach>
											</select>

										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="">내용</label>
									<textarea name="contents" id="textAreaContent" rows="20" cols="100" placeholder="">${blogBoard.contents }</textarea>
								</div>
								<div class="text-center">
									<button type="button" class="btn btn-default" id="updateBoardButton">수정</button>
								</div>
							</div>
						</form>
					</div>
				</div>
				<!-- 우측 게시판 글쓰기 끝-->
			</div>
			<!--                    우측 게시판 끝-->
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			$('#updateBoardButton').click(function() {
				if ($('#blogboard_title').val() == "") {
					alert('제목을 입력해야 합니다.');
					return false;
				} else {
					var result = confirm("수정하시겠습니까?");
					if (result) {
						submitContents();
					}
					return false;
				}
			});

			/* $('.se2_inputarea').keyup(function() {
				var text = $(this).innerText;
				if (text == "") {
					$(this).val('본문에 #을 이용하여 태그를 사용해보세요!').css('color', 'gray');
				}
			}) */
		})
		/* 	Smart Editor */
		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "textAreaContent",
			sSkinURI : "/link/resources/js/se2/SmartEditor2Skin.html",
			fCreator : "createSEditor2",
			htParams : {
				fOnBeforeUnload : function() {
				}
			}
		// 이페이지 나오기 alert 삭제
		});

		//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
		function submitContents(elClickedObj) {
			// 에디터의 내용이 textarea에 적용된다.
			oEditors.getById["textAreaContent"].exec("UPDATE_CONTENTS_FIELD",
					[]);

			// 에디터의 내용에 대한 값 검증은 이곳에서
			// document.getElementById("textAreaContent").value를 이용해서 처리한다.
			console.log(document.getElementById("textAreaContent").value);
			try {
				$("#update-form").submit();
			} catch (e) {

			}
		}

		// textArea에 이미지 첨부
		function pasteHTML(filepath) {
			setTimeout(
					function() {
						var sHTML = '<img src="/link/resources/images/userblogimgs/'+filepath+'">';
						oEditors.getById["textAreaContent"].exec("PASTE_HTML",
								[ sHTML ]);

					}, 5000);
		}
		/* 
		function submitContents() {
			oEditors.exec("UPDATE_CONTENTS_FIELD");	// 에디터의 내용이 textarea에 적용됩니다.
		
			// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.
			jindo.$("textAreaContent").form.submit();
		} */
	</script>
</body>
</html>