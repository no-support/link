<!--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>-->
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>Link : 시리즈</title>
	<link rel="shortcut icon" type="image/x-icon" href="../../../resources/images/shortcut-icon.PNG">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<style type="text/css">
		/* * {font: NanumGothic;} */
	    a {color:black;}
	    a:hover{color:black;}
	    
	</style>
</head>
<body>
<c:set var="menu" value="noticelist"></c:set>
<%@ include file="common/jstl.jsp" %>
<%@ include file="common/nav.jsp" %>
<div class="container">
    <div class="page-header">
        <h1>공지사항</h1>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <table class="table">
            	<colgroup>
            		<col width="5%">
            		<col width="85%">
            		<col width="10%">
            	</colgroup>
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>등록일</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="notice" items="${notices}">
                        <tr>
                            <td>${notice.no}</td>
                            <td><a href="noticedetail.do?no=${notice.no }">${notice.title}</a></td>
                            <td><fmt:formatDate value="${notice.createDate}"/></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    
    
    <div class="row text-right">
        <a href="noticeform.do" class="btn btn-default ${LOGIN_USER.id == 'admin' ? '' : 'hidden' }">글쓰기</a>
    </div>
    
    
    <div class="row">
		<div class="col-sm-12 text-center">
	        <nav class="text-center">
	          <ul class="pagination">
	           <c:if test="${!pagination.first }">
	            <li>
	              <a href="${pagination.page - 1 }" aria-label="Previous">
	                <span aria-hidden="true">&laquo;</span>
	              </a>
	            </li>
	           </c:if>
	            <c:forEach var="p" begin="${pagination.begin }" end="${pagination.end }">
		            <li class="${pagination.page eq p ? 'active' : '' }"><a href="${p }">${p }</a></li>
	            </c:forEach>
	            <c:if test="${!pagination.last }">
		            <li>
		              <a href="${pagination.page + 1 }" aria-label="Next">
		                <span aria-hidden="true">&raquo;</span>
		              </a>
		            </li>
		        </c:if>
	          </ul>
	        </nav>
		</div>
    </div>
    
    
    
    
    <div class="row">
    	<div class="col-sm-12 text-center">
    		<form id="pagination-form" action="noticelist.do" method="get" class="form-inline">
    			<input type="hidden" name="page" value="1" />
    			<label>제목+내용</label>
    			<input name="keyword" value="${param.keyword }" class="form-control" >
    			<button type="submit" class="btn btn-sm btn-primary">검색</button>
    		</form>
    	</div>
    </div>
    
    
</div> 
<script type="text/javascript">
	$(function() {
		$('.pagination a').click(function() {
			var pageNo = $(this).attr('href');
			$("#pagination-form [name=page]").val(pageNo);
			$("#pagination-form").submit();
			return false;
		});
	})
</script>
</body>