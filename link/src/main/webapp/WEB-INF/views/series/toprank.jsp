<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	    
	    .margin-top {margin-top: 30px;}
	    .img-thumbnail{width: 115px; height: 161px;}
	    .price {color: #649dfa;}
	</style>
</head>
<body style="background-color: #ddd;">
<c:set var="menu" value="toprank"></c:set>
<%@ include file="common/jstl.jsp" %>
<%@ include file="common/nav.jsp" %>
<div class="container" style="background-color: white; margin-top: 15px;">
    <div class="row text-center">
        <div class="col-sm-12">
            <ul class="nav nav-tabs nav-justified">
              <li class="active"><a data-toggle="tab" href="#daily">일간</a></li>
              <li><a data-toggle="tab" href="#weekly">주간</a></li>
              <li><a data-toggle="tab" href="#monthly">월간</a></li>
            </ul>
            
            <div class="tab-content margin-top">                                <!-- 콘텐츠가 적히는 부분 -->
              <div id="daily" class="tab-pane fade in active">        <!-- 일간 -->
                <div class="row">
					<c:forEach varStatus="loop" var="vod" items="${dailyVods }">
					<div class="col-sm-2">                             
						<div class="row">
							<div class="col-sm-2">${loop.count }</div>
							<div class="col-sm-10">
								<a href="detail.do?vodno=${vod.no }"><img src="/link/resources/images/series/vods/${vod.img }" class="img-thumbnail"></a>
								<a href="detail.do?vodno=${vod.no }">
									<c:choose>
										<c:when test="${fn:length(vod.title) > 6}">
											<c:out value="${fn:substring(vod.title,0,6)}"/>…
										</c:when>
										<c:otherwise>
											<c:out value="${vod.title}"/>
										</c:otherwise> 
									</c:choose>
								
								<p class="price"><fmt:formatNumber type="number" maxFractionDigits="3" value="${vod.price }"></fmt:formatNumber>원</p>
							</div>
						</div>
					</div> 
				</c:forEach>
              </div>
             </div>
             
              <div id="weekly" class="tab-pane fade ">                <!-- 주간 -->
				<c:forEach varStatus="loop" var="vod" items="${weeklyVods }">
					<div class="col-sm-2">                             
						<div class="row">
							<div class="col-sm-2">${loop.count }</div>
							<div class="col-sm-10">
								<a href="detail.do?vodno=${vod.no }"><img src="/link/resources/images/series/vods/${vod.img }" class="img-thumbnail"></a>
								<a href="detail.do?vodno=${vod.no }">
									<c:choose>
										<c:when test="${fn:length(vod.title) > 6}">
											<c:out value="${fn:substring(vod.title,0,6)}"/>…
										</c:when>
										<c:otherwise>
											<c:out value="${vod.title}"/>
										</c:otherwise> 
									</c:choose>
								</a>
								<p class="price"><fmt:formatNumber type="number" maxFractionDigits="3" value="${vod.price }"></fmt:formatNumber>원</p>
							</div>
						</div>
					</div> 
				</c:forEach>
              </div>
              
              <div id="monthly" class="tab-pane fade">                <!-- 월간 -->
					<c:forEach varStatus="loop" var="vod" items="${monthlyVods }">
						<div class="col-sm-2">                             
							<div class="row">
								<div class="col-sm-2">${loop.count }</div>
								<div class="col-sm-10">
									<a href="detail.do?vodno=${vod.no }"><img src="/link/resources/images/series/vods/${vod.img }" class="img-thumbnail"></a>
									<a href="detail.do?vodno=${vod.no }">
										<c:choose>
											<c:when test="${fn:length(vod.title) > 8}">
												<c:out value="${fn:substring(vod.title, 0, 7)}"/>…
											</c:when>
											<c:otherwise>
												<c:out value="${vod.title}"/>
											</c:otherwise> 
										</c:choose>
									</a>
									<p class="price"><fmt:formatNumber type="number" maxFractionDigits="3" value="${vod.price }"></fmt:formatNumber>원</p>
								</div>
							</div>
						</div> 
					</c:forEach>
                
                	<%-- <c:forEach varStatus="loop" var="vod" items="${monthlyVods }">
						<c:if test="${loop.index mod 5 eq 0 }" >
							<div class="col-sm-1"></div>
						</c:if>
						<div class="col-sm-2">
							<div class="row">
								<div class="col-sm-2">${loop.count }</div>
								<div class="col-sm-10">
									<a href="#"><img src="/link/resources/images/series/vods/${vod.img }" class="img-thumbnail"></a>
									<h4>${vod.title }</h4>
									<p><span><fmt:formatNumber type="number" maxFractionDigits="3" value="${vod.price }"></fmt:formatNumber>원</span></p>
								</div>
							</div>
						</div>
						<c:if test="${loop.index mod 5 eq 4 }" >
							<div class="col-sm-1"></div>
						</c:if>
					</c:forEach> --%>
                
              </div>
              
            </div>
       </div>
    </div>
</div>
</body>