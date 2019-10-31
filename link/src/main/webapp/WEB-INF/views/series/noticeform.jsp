<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>Link : 시리즈</title>
	<link rel="shortcut icon" type="image/x-icon" href="../../../resources/images/shortcut-icon.PNG">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="blog.css" type="text/css" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/link/resources/js/njw_se2/js/HuskyEZCreator.js"></script>
	<style type="text/css">
	    /*div {border: 1px dotted red}*/
	</style>
</head>
<body>
<c:set var="menu" value="noticelist"></c:set>
<%@ include file="common/jstl.jsp" %>
<%@ include file="common/nav.jsp" %>
<div class="container">
    <div class="page-header">
        <h1>새 글쓰기</h1>
    </div>
    
    <div class="row">
        <div class="col-sm-12">
            <form id="notice-form" action="addnotice.do" method="post" class="well">
                <div class="form-group">
                    <label>제목</label>
                    <input type="text" class="form-control" name="title" />
                </div>
                <div>
                    <label>내용</label>
                    <textarea cols="60" class="form-control" name="contents" id="notice-contents"></textarea>
                </div>
                <div class="text-right">
					<button type="submit" class="btn btn-primary" id="btn-add-form">등록</button>
				</div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript">

	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
	   oAppRef : oEditors,
	   elPlaceHolder : "notice-contents",
	   sSkinURI : "/link/resources/js/njw_se2/SmartEditor2Skin.html",
	   fCreator : "createSEditor2",
	   htParams : {
	      fOnBeforeUnload : function() {
	      }
	   }
	// 이 페이지 나오기 alert 삭제
	});
	/* var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
			elPlaceHolder: "notice-contents",
			sSkinURI: "/link/resources/js/njw_se2/SmartEditor2Skin.html",
		fCreator: "createSEditor2"
	}); */
	
	
	$('#btn-add-form').click(function() {	
		oEditors.getById["notice-contents"].exec("UPDATE_CONTENTS_FIELD", [ ]);
		$("#notice-form").submit();
	});
	// textArea에 이미지 첨부
	/* function pasteHTML(filepath){
		setTimeout(function() {
	    	var sHTML = '<img src="/link/resources/images/'+filepath+'">';
	    	oEditors.getById["notice-contents"].exec("PASTE_HTML", [sHTML]);
		}, 5000);
	} */
</script>
</body>