<!--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>-->
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Link : 시리즈</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style type="text/css">
	.img-size {width: 80px; height: 90px;}
	.bold{font-weight: bold;}
	td{vertical-align: middle !important;}
	
</style>
</head>
<body>
<%@ include file="../common/jstl.jsp" %>
<%@ include file="../common/nav.jsp" %>
<div class="container">
    <div class="col-sm-12">
        <h1>${LOGIN_USER.nickName }님의 포인트 <fmt:formatNumber type="number" maxFractionDigits="3" value="${LOGIN_USER.point }"></fmt:formatNumber>원</h1>
        <ul class="nav nav-pills nav-justified">
            <li><a href="orderlist.do">구입내역</a></li>
            <li class="active"><a href="like.do">좋아요 한 작품</a></li>
        </ul>
        <table style="margin-top: 20px; width:100%;" class="table table-bordered" >
           <colgroup>
              <col width="3%">
               <col width="10%">
               <col width="*">
               <col width="10%">
           </colgroup>
           <tbody>
				<c:forEach var="map" items="${maps }">
					  <tr>
					      <td rowspan="2"><span class="glyphicon glyphicon-heart-empty" aria-hidden="true"></span></td>
					      <td rowspan="2"><a href="detail.do?vodno=${map.no }"><img class="img-size" src="/link/resources/images/series/vods/${map.img }"></a></td>
					      <td><span class="bold">${map.title }</span> | <fmt:formatDate value="${map.start }"/>  ~ <fmt:formatDate value="${map.finish }"/></td>
					      <td rowspan="2"><fmt:formatDate value="${map.date }"/></td>
					  </tr>
					  <tr>
					      <td><span class="bold">주연</span> ${map.actor }</td>
					  </tr>
				</c:forEach>
           </tbody>
        </table>
    </div>
</div>
</body>