<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Link : 시리즈</title>
	<link rel="shortcut icon" type="image/x-icon" href="../../../resources/images/shortcut-icon.PNG">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
	<style type="text/css">
	
	</style>
<body>
<c:set var="menu" value="noticelist"></c:set>
<%@ include file="common/jstl.jsp" %>
<%@ include file="common/nav.jsp" %>
<div class="container">
    
    
    <div class="row">
    	<div class="col-sm-12">
    		<div>
    			<h3>제목 : ${notice.title } <small>작성일 : <fmt:formatDate value="${notice.createDate }"/></small></h3>
    		</div>
    		<div class="well">${notice.contents}</div>
    	</div>
    </div>
    <%-- ${notice.title }
    <fmt:formatDate value="${notice.createDate }"/>
    ${notice.contents} --%>
</div>
</body>
</html>